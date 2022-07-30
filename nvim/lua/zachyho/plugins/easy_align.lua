return {
	"junegunn/vim-easy-align",
	config = function()
		map({ "n", "x" }, "ga", ":EasyAlign")
	end,
	ft = "markdown",
}
