return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		local indent_blankline = safe_require("ibl")
		if not indent_blankline then
			return
		end
		indent_blankline.setup()
	end,
}
