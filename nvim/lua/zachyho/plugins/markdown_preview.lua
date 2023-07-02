return {
	"iamcco/markdown-preview.nvim",
	build = "cd app && yarn install",
	ft = "markdown",
	keys = {
		{ "<leader>mp", "<Plug>MarkdownPreviewToggle" },
	},
}
