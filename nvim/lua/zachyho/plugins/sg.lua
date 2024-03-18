return {
	"sourcegraph/sg.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("sg").setup()
		-- Puts the link to the point in cursor in the register
		map("n", "<leader>sggl", ":SourcegraphLink<CR>")
		-- Opens the sourcegraph link under cursor in your browser
		map("n", "<leader>sgol", ":SourcegraphLink<CR> <bar> :execute '!open '.shellescape(@+,1).''<CR>")
	end,
}
