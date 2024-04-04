return {
	"Canva/dprint-vim-plugin",
	config = function()
		map("n", "<leader>dp", function()
			local file_path = vim.fn.expand("%:p")
			vim.api.nvim_command("DprintFormatFile " .. file_path)
			print("Dprint formatting. This shit takes a while for the first run.")
		end)
	end,
}
