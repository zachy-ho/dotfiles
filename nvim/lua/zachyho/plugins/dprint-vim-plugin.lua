return {
	"Canva/dprint-vim-plugin",
	config = function()
		map("n", "<leader>dp", ":DprintFormatFile<CR>")
	end,
	keys = "<leader>dp",
}
