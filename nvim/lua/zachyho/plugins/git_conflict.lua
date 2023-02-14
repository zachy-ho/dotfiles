return {
	"akinsho/git-conflict.nvim",
	tag = "v1.0.0",
	config = function()
		safe_require("git-conflict").setup()
	end,
}
