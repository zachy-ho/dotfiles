return {
	"nvim-lualine/lualine.nvim",
	after = "tokyonight",
	requires = "kyazdani42/nvim-web-devicons",
	config = function()
		local lualine = safe_require("lualine")
		if not lualine then
			return
		end

		lualine.setup({
			options = {
				theme = "tokyonight",
			},
		})
	end,
}
