return {
	"nvim-treesitter/nvim-treesitter-context",
	requires = "nvim-treesitter/nvim-treesitter",
	config = function()
		local ts_context = safe_require("treesitter-context")
		if not ts_context then
			return
		end

		ts_context.setup()
	end,
}
