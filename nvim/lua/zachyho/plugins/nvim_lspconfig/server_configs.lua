return {
	null_ls = function(common_on_attach)
		local null_ls = safe_require("null-ls")
		if not null_ls then
			return
		end

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		return {
			debug = true,
			on_attach = function(client, bufnr)
				common_on_attach(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									if vim.bo.filetype == "lua" then
										return client.name == "null-ls"
									end
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
	end,
	bashls = true,
	bufls = true,
	cssls = true,
	cssmodules_ls = true,
	dockerls = true,
	emmet_ls = true,
	-- eslint = true,
	graphql = true,
	html = true,
	jdtls = true,
	jsonls = true,
	kotlin_language_server = true,
	lua_ls = {
		Lua = {
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
		},
	},
	prismals = true,
	pyright = true,
	-- tailwindcss = true,
	tsserver = true, -- We don't want the built-in typescript-language-server
	vimls = true,
	yamlls = true,
}
