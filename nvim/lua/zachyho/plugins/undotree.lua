return {
	"mbbill/undotree",
	config = function()
		map("n", "<leader>u", ":UndotreeToggle<CR>")
	end,
	event = "BufAdd",
}
