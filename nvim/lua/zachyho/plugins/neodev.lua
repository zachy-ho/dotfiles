return {
	"folke/neodev.nvim",
	opts = {},
	config = function()
		local ok = check_module("neodev")
		if not ok then
			return
		end
		require("neodev").setup()
	end,
}
