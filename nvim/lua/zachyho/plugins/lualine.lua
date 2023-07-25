return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "gruvbox-material" },
	config = function()
		local lualine = safe_require("lualine")
		if not lualine then
			return
		end

		lualine.setup({
			options = {
				theme = "gruvbox-material",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
