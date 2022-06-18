local M = {}

M.setup = function()
	local null_ls = safe_require("null-ls")
	if not null_ls then
		return
	end

	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	null_ls.setup({
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.formatting_sync()
					end,
				})
			end
		end,
		sources = {
			diagnostics.eslint_d.with({
				prefer_local = "node_modules/.bin",
			}),
			formatting.prettier.with({
				only_local = "node_modules/.bin",
			}),
			formatting.stylua,
		},
	})
end

return M
