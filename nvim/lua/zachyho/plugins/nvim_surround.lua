return {
	"kylechui/nvim-surround",
	version = "*",
	config = function()
		local surround = safe_require("nvim-surround")
		if not surround then
			return
		end
		surround.setup()
	end,
	event = "BufReadPost",
}
