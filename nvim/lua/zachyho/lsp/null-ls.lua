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
			-- only_local = "node_modules/.bin"
			-- }),
			formatting.stylua,
		},
	})
end

return M
