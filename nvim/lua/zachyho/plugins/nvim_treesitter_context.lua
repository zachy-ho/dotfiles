return {
	"nvim-treesitter/nvim-treesitter-context",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = function()
		local ts_context = safe_require("treesitter-context")
		if not ts_context then
			return
		end

		ts_context.setup({
			multiline_threshold = 2,
		})

		map("n", "[c", function()
			ts_context.go_to_context()
		end)
	end,
}
