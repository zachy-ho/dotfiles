return {
	"tzachar/highlight-undo.nvim",
	config = function()
		require("highlight-undo").setup()
	end,
	keys = { "u", "<C-r>" },
}
