return {
	"akinsho/git-conflict.nvim",
	tag = "v1.0.0",
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
}
