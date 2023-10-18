return {
	"akinsho/git-conflict.nvim",
	version = "*",
	config = function()
		local conflict = safe_require("git-conflict")
		if not conflict then
			return
		end

		conflict.setup({
			highlights = {
				incoming = "DiffAdd",
				current = "DiffChange",
			},
		})
		map("n", "<leader>gcl", ":GitConflictListQf<CR>")
	end,
	event = "VeryLazy",
}
