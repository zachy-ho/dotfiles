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
	end,
	event = "VeryLazy",
}
