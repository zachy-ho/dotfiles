return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		local indent_blankline = safe_require("indent_blankline")
		if not indent_blankline then
			return
		end
		indent_blankline.setup({
			show_current_context = true,
			show_current_context_start = true,
		})
	end,
}
