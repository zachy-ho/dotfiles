local M = {}

M.setup = function(on_attach)
	local null_ls = safe_require("null-ls")
	if not null_ls then
		return
	end

	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	null_ls.setup({
		debug = true,
		on_attach = function(client, bufnr)
			-- common_on_attach
			on_attach(client, bufnr)
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
	})
end

return M
