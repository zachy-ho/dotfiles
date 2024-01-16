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
			name = "null-ls",
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
	local lspconfig = safe_require("lspconfig")
	if lspconfig then
		return lspconfig[server]
	end
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
local custom_server_config_factories = {
	null_ls = function(on_attach)
		local null_ls = safe_require("null-ls")
		if not null_ls then
			return
		end

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
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
								filter = function(_)
									return vim.bo.filetype == "lua"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
			sources = {
				diagnostics.eslint_d.with({
					prefer_local = "node_modules/.bin",
				}),
				-- formatting.prettierd,
				formatting.stylua,
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
		local typescript_tools = safe_require("typescript-tools")
		if not typescript_tools then
			return
		end

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
			server = typescript_tools,
			config = config,
		}
	end,
}

-- Handles error messagings
local setup_server = function(name, server, config)
	local ok, res = pcall(server.setup, config)
	if not ok then
		error({
			msg = "Server setup call for " .. name .. " failed",
			failure = res,
		})
	end
end

local M = {}

---@return table<string, function> module
M.create_server_setup = function()
	local default_config = {
		on_attach = default_on_attach,
		capabilities = setup_default_capabilities(),
	}

	local server_configs = {}
	for _, name in ipairs(default_server_names) do
		server_configs[name] = function()
			local server = get_default_language_server(name)
			setup_server(name, server, default_config)
		end
	end

	for name, create in pairs(custom_server_config_factories) do
		local module
		if name == "typescript_tools" or name == "lua_ls" then
			module = create(default_config)
		end
		if name == "null_ls" then
			module = create(default_config.on_attach)
		end

		if module ~= nil then
			local server = module.server
			local config = module.config
			server_configs[name] = function()
				setup_server(name, server, config)
			end
		end
	end

	return server_configs
end

return M
