local setup_default_capabilities = function()
	local cmp_nvim_lsp = safe_require("cmp_nvim_lsp")
	if cmp_nvim_lsp then
		return cmp_nvim_lsp.default_capabilities({
			snippetSupport = false,
		})
	end
end

local default_on_attach = function(_, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true, buffer = 0 }
	local function set_buf_keymap(lhs, rhs)
		vim.keymap.set("n", lhs, rhs, opts)
	end

	-- Key-bindings
	set_buf_keymap(",gD", vim.lsp.buf.declaration)
	set_buf_keymap(",gd", vim.lsp.buf.definition)
	set_buf_keymap(",gt", vim.lsp.buf.type_definition)
	set_buf_keymap(",gi", vim.lsp.buf.implementation)
	set_buf_keymap(",gh", vim.lsp.buf.signature_help)
	set_buf_keymap("K", vim.lsp.buf.hover)
	set_buf_keymap(",ca", vim.lsp.buf.code_action)
	set_buf_keymap(",rn", vim.lsp.buf.rename)
	set_buf_keymap(",gr", vim.lsp.buf.references)
	set_buf_keymap(",fm", function()
		vim.lsp.buf.format({
			async = false,
			timeout_ms = 5000,
			name = "null-ls", -- formatting with null-ls doesn't work man
		})
	end)
	set_buf_keymap(",ds", vim.diagnostic.open_float)
	set_buf_keymap(",dp", vim.diagnostic.goto_prev)
	set_buf_keymap(",dn", vim.diagnostic.goto_next)
	set_buf_keymap(",dl", function()
		vim.diagnostic.setloclist({ open_loclist = true })
		vim.cmd([[:setlocal wrap]])
	end)
end

---@param server string An option from the list of default language servers (https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls)
---@return table | nil language_server
local get_default_language_server = function(server)
	return require("lspconfig")[server]
end

local default_server_names = {
	"bashls",
	"bufls",
	"cssls",
	"cssmodules_ls",
	"dockerls",
	"emmet_ls",
	"graphql",
	"html",
	"jdtls",
	"jsonls",
	"kotlin_language_server",
	"prismals",
	"pyright",
	"vimls",
	"yamlls",
}

---@type table<string, fun(config: any): table | nil>
local custom_config_factories = {
	null_ls = function(on_attach)
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local helpers = safe_require("null-ls.helpers")
		if not helpers then
			return
		end
		local config = {
			debug = true,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									return client.name == "null-ls" and vim.bo.filetype == "lua"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
			sources = {
				require("none-ls.diagnostics.eslint_d"),
				formatting.stylua,
				-- this canva format doesn't freaking work and idk why
				{
					name = "canva_format",
					method = null_ls.methods.FORMATTING,
					filetypes = { "typescript", "typescriptreact" },
					generator = helpers.formatter_factory({
						command = "dprint",
						args = { "fmt", "--stdin", "$FILENAME" },
						to_stdin = true,
					}),
				},
				-- formatting.prettierd,
			},
		}
		return {
			server = null_ls,
			config = config,
		}
	end,
	lua_ls = function(default_config)
		local server = get_default_language_server("lua_ls")
		if not server then
			return
		end
		return {
			server = server,
			config = {
				on_init = function(client)
					local path = client.workspace_folders[1].name
					if not vim.loop.fs_stat(path .. "/.luarc.json") then
						client.config.settings.on_attach = default_config.on_attach
						client.config.settings.capabilities = default_config.capabilities
						client.config.settings.Lua = {
							runtime = {
								-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
								version = "LuaJIT",
								builtin = "enable",
							},
							diagnostics = {
								-- Get the language server to recognize the `vim` global
								globals = { "vim" },
							},
							workspace = {
								-- Make the server aware of Neovim runtime files
								library = {
									vim.env.VIMRUNTIME,
								},
								-- https://github.com/neovim/nvim-lspconfig/issues/1700#issuecomment-1033127328
								checkThirdParty = false,
							},
						}
						client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
					end
					return true
				end,
			},
		}
	end,
	typescript_tools = function(default_config)
		local config = default_config
		local lspconfig = safe_require("lspconfig")
		if lspconfig then
			-- Set the root_dir in canva/canva so there's only one tsserver client initialised
			if
				string.find(vim.fn.getcwd(), "work/canva") ~= nil
				or string.find(vim.fn.getcwd(), "work/canva2") ~= nil
			then
				config = vim.tbl_extend("force", config, {
					init_options = {
						hostInfo = "neovim",
						maxTsServerMemory = 8192,
					},
					root_dir = lspconfig.util.root_pattern("shell.nix", "package.json"),
				})
			end
		end
		return {
			server = require("typescript-tools"),
			config = config,
		}
	end,
}

local setup_server = function(name, server, config)
	local ok, res = pcall(server.setup, config)
	if not ok then
		error({
			msg = "Server setup call for " .. name .. " failed",
			failure = res,
		})
	end
end

-- Creates an initialiser function for each server defined in `default_server_names` and `custom_server_config_factories`.
-- The initialiser:
-- 1. Identifies the server to use
-- 2. Creates the configuration for the server to set up with
-- 3. Run server.setup(config)
local create_server_initialisers = function()
	local default_config = {
		on_attach = default_on_attach,
		capabilities = setup_default_capabilities(),
	}
	-- set up - identify the server, set up the config
	-- set up the defaults
	local initialisers = {}
	for _, name in ipairs(default_server_names) do
		initialisers[name] = function()
			local server = get_default_language_server(name)
			if not server then
				error({ msg = string.format("Language server for %s is not found", name) })
			end
			setup_server(name, server, default_config)
		end
	end
	-- set up the customs
	for name, create in pairs(custom_config_factories) do
		initialisers[name] = function()
			local module
			if name == "typescript_tools" or name == "lua_ls" then
				module = create(default_config)
			end
			if name == "null_ls" then
				module = create(default_config.on_attach)
			end
			if not module then
				error({ msg = string.format("Language server for %s is not found", name) })
			end
			local server = module.server
			local config = module.config
			setup_server(name, server, config)
		end
	end
	return initialisers
end

local M = {}

-- Creates initialisers for each LSP and runs each sequentially.
-- Handles errors thrown by the initialisers
M.setup = function()
	-- setup the initialisers (this is static and shouldn't throw anything)
	local lsp_initialisers = create_server_initialisers()
	-- for each initialiser
	for name, init in pairs(lsp_initialisers) do
		-- -> run the initialiser - create then setup (errors can be thrown and caught here)
		local ok, res = pcall(init)
		if not ok then
			P({ msg = "Something went wrong initialising " .. name, error = res })
		end
	end
end

return M
