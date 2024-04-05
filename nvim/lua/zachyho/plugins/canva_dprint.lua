return {
	url = "org-2562356@github.com:Canva/dprint-vim-plugin.git",
	config = function()
		map("n", "<leader>dp", function()
			local file_path = vim.fn.expand("%:p")
			vim.api.nvim_command("DprintFormatFile " .. file_path)
			print("Dprint formatting. This shit takes a while for the first run.")
		end)
	end,
}
