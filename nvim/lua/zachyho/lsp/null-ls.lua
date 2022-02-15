local M = {}

M.setup = function()
	local null_ls = safe_require("null-ls")
	if not null_ls then
		return
	end

	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics

	null_ls.setup({
		sources = {
			diagnostics.eslint_d.with({
				prefer_local = "node_modules/.bin",
			}),
			-- formatting.prettier.with({
			-- only_local = "node_modules/.bin",
			-- }),
			formatting.stylua,
		},
		-- on_attach = function(client)
		-- if client.resolved_capabilities.document_formatting then
		-- vim.cmd([[
		-- augroup LspFormatting
		-- autocmd! * <buffer>
		-- autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
		-- augroup END
		-- ]])
		-- end
		-- end,
	})
end

return M
