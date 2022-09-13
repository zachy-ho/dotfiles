return {
	"renerocksai/telekasten.nvim",
	config = function()
		local telekasten = safe_require("telekasten")
		if not telekasten then
			return
		end
		telekasten.setup({
			home = vim.fn.expand("~/zachyho-gits/zachtelkasten"),
			-- UUID separator
			uuid_sep = "_",
			map("n", "<leader>z", ':lua require("telekasten").panel()<CR>'),
			map("n", "<leader>zf", ':lua require("telekasten").find_notes()<CR>'),
			map("n", "<leader>zg", ':lua require("telekasten").search_notes()<CR>'),
			map("n", "<leader>zT", ':lua require("telekasten").goto_today()<CR>'),
			map("n", "<leader>zn", ':lua require("telekasten").new_note()<CR>'),
			map("n", "<leader>zN", ':lua require("telekasten").new_templated_note()<CR>'),
			map("n", "#", ':lua require("telekasten").show_tags()<CR>'),
		})
	end,
}
