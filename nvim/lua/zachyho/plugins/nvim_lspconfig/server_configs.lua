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
	set_buf_keymap("<leader>gd", vim.lsp.buf.definition)
	set_buf_keymap("<leader>gt", vim.lsp.buf.type_definition)
	set_buf_keymap("<leader>gi", vim.lsp.buf.implementation)
	set_buf_keymap("K", vim.lsp.buf.hover)
	set_buf_keymap("<leader>ca", vim.lsp.buf.code_action)
	set_buf_keymap("<leader>rn", vim.lsp.buf.rename)
	-- set_buf_keymap("<leader>fr", vim.lsp.buf.references) -- Use Trouble.nvim
	set_buf_keymap("<leader>fm", function()
		vim.lsp.buf.format({
			async = false,
			timeout_ms = 5000,
			name = "null-ls", -- formatting with null-ls doesn't work man
		})
	end)
	set_buf_keymap("[d", vim.diagnostic.goto_prev)
	set_buf_keymap("]d", vim.diagnostic.goto_next)
end

local default_config = {
	on_attach = default_on_attach,
	capabilities = setup_default_capabilities(),
}
---@type table<string, fun(): table>
local ls_spec_factories = {
	bashls = function()
		return {
			server = require("lspconfig").bashls,
			config = default_config,
		}
	end,
	bufls = function()
		return {
			server = require("lspconfig").bufls,
			config = default_config,
		}
	end,
	cssls = function()
		return {
			server = require("lspconfig").cssls,
			config = default_config,
		}
	end,
	cssmodules_ls = function()
		return {
			server = require("lspconfig").cssmodules_ls,
			config = default_config,
		}
	end,
	dockerls = function()
		return {
			server = require("lspconfig").dockerls,
			config = default_config,
		}
	end,
	dprint = function()
		return {
			server = require("lspconfig").dprint,
			config = default_config,
		}
	end,
	emmet_ls = function()
		return {
			server = require("lspconfig").emmet_ls,
			config = default_config,
		}
	end,
	eslint = function()
		return {
			server = require("lspconfig").eslint,
			config = default_config,
		}
	end,
	graphql = function()
		return {
			server = require("lspconfig").graphql,
			config = default_config,
		}
	end,
	html = function()
		return {
			server = require("lspconfig").html,
			config = default_config,
		}
	end,
	jdtls = function()
		return {
			server = require("lspconfig").jdtls,
			config = default_config,
		}
	end,
	jsonls = function()
		return {
			server = require("lspconfig").jsonls,
			config = default_config,
		}
	end,
	kotlin_language_server = function()
		return {
			server = require("lspconfig").kotlin_language_server,
			config = default_config,
		}
	end,
	prismals = function()
		return {
			server = require("lspconfig").prismals,
			config = default_config,
		}
	end,
	pyright = function()
		return {
			server = require("lspconfig").pyright,
			config = default_config,
		}
	end,
	vimls = function()
		return {
			server = require("lspconfig").vimls,
			config = default_config,
		}
	end,
	yamlls = function()
		return {
			server = require("lspconfig").yamlls,
			config = default_config,
		}
	end,
	-- customs
	null_ls = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local helpers = safe_require("null-ls.helpers")
		if not helpers then
			error({ msg = "null-ls.helpers could not be required" })
		end
		return {
			server = null_ls,
			config = {
				debug = true,
				on_attach = function(client, bufnr)
					default_on_attach(client, bufnr)
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
					-- require("none-ls.diagnostics.eslint_d"),
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
			},
		}
	end,
	lua_ls = function()
		local server = require("lspconfig").lua_ls
		if not server then
			error({ msg = "lua_ls server config not found" })
		end
		return {
			server = server,
			config = {
				on_init = function(client)
					-- 		local path = client.workspace_folders[1].name
					-- 		if not vim.loop.fs_stat(path .. "/.luarc.json") then
					-- 			client.config.settings.on_attach = default_config.on_attach
					-- 			client.config.settings.capabilities = default_config.capabilities
					client.config.settings.Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
							-- https://github.com/neovim/nvim-lspconfig/issues/1700#issuecomment-1033127328
							checkThirdParty = false,
						},
					}
					-- 			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
					-- 		end
					-- 		return true
				end,
			},
		}
	end,
	typescript_tools = function()
		local config = default_config
		local lspconfig = safe_require("lspconfig")
		if lspconfig then
			-- Set the root_dir in canva/canva so there's only one tsserver client initialised
			-- if
			-- 	string.find(vim.fn.getcwd(), "work/canva") ~= nil
			-- 	or string.find(vim.fn.getcwd(), "work/canva2") ~= nil
			-- then
			config = vim.tbl_extend("force", config, {
				init_options = {
					hostInfo = "neovim",
					maxTsServerMemory = 24576,
				},
				-- root_dir = lspconfig.util.root_pattern("shell.nix", "package.json"),
				root_dir = lspconfig.util.find_node_modules_ancestor,
				single_file_support = false,
			})
			-- end
		end
		return {
			server = require("typescript-tools"),
			config = config,
		}
	end,
}

---@type fun(name: string, spec: table): fun()
local create_ls_initialiser = function(name, spec)
	return function()
		local ok, res = pcall(spec.server.setup, spec.config)
		if not ok then
			error({
				msg = "Error setting up language server " .. name,
				error = res,
			})
		end
	end
end

local M = {}

-- Creates initialisers for each language server and runs each sequentially.
-- Handles and reports errors thrown by server initialisations.
-- Failures creating specs or initialising servers are self-contained (i.e. other servers will still initialise if one fails)
M.setup = function()
	local ls_initialisers = {}
	for name, create in pairs(ls_spec_factories) do
		local create_ok, spec = pcall(create)
		if not create_ok then
			P({ msg = "Something went wrong creating language server spec for " .. name, error = spec })
		else
			ls_initialisers[name] = create_ls_initialiser(name, spec)
		end
	end

	for name, init in pairs(ls_initialisers) do
		local ok, res = pcall(init)
		if not ok then
			P({ msg = "Something went wrong initialising " .. name, error = res })
		end
	end
end

return M
