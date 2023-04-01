return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "kyazdani42/nvim-web-devicons", "gruvbox-material" },
	config = function()
		local lualine = safe_require("lualine")
		if not lualine then
			return
		end

		lualine.setup({
			options = {
				theme = "gruvbox-material",
			},
		})
	end,
}
