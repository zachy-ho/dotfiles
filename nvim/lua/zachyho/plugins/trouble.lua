return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		map("n", "<leader>tt", ":TroubleToggle ")
		-- can add more keymaps if needed in the future, like finding references
	end,
}
