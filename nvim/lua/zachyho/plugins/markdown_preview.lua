return {
	"iamcco/markdown-preview.nvim",
	run = "cd app && yarn install",
	config = function()
		map("n", "<leader>mp", "<Plug>MarkdownPreviewToggle")
	end,
	ft = "markdown",
}
