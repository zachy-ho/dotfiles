local harpoon = {
	"ThePrimeagen/harpoon",
	config = function()
		local keymaps = safe_require(constants.PLUGINS_DIR .. "harpoon.keymaps")
		if keymaps then
			map(
				"n",
				preconditions.check_exists(keymaps.as_table).toggle,
				':lua require("harpoon.ui").toggle_quick_menu()<CR>'
			)
			map(
				"n",
				preconditions.check_exists(keymaps.as_table).add_file,
				':lua require("harpoon.mark").add_file()<CR>'
			)
		end
		map("n", "<leader>h1", ':lua require("harpoon.ui").nav_file(1)<CR>')
		map("n", "<leader>h2", ':lua require("harpoon.ui").nav_file(2)<CR>')
		map("n", "<leader>h3", ':lua require("harpoon.ui").nav_file(3)<CR>')
		map("n", "<leader>h4", ':lua require("harpoon.ui").nav_file(4)<CR>')
		map("n", "<leader>h5", ':lua require("harpoon.ui").nav_file(5)<CR>')
		map("n", "<leader>h6", ':lua require("harpoon.ui").nav_file(6)<CR>')
	end,
}

return harpoon
