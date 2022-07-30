local filetypes = {
	"css",
	"html",
	"scss",
	"lua",
	"vim",
}

return {
	"RRethy/vim-hexokinase",
	run = "make hexokinase",
	config = function()
		vim.g.Hexokinase_ftEnabled = filetypes
	end,
	ft = filetypes,
}
