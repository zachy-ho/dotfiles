return {
	"lukas-reineke/headlines.nvim",
	config = function()
		require("headlines").setup({
			org = {
				headline_pattern = false,
			},
		})
	end,
	ft = "markdown",
}
