return {
	"m4xshen/smartcolumn.nvim",
	config = function()
		local smartcolumn = safe_require("smartcolumn")

		if not smartcolumn then
			return
		end

		smartcolumn.setup()
	end,
}
