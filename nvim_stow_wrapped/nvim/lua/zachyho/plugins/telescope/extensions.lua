-- Load extensions that make use of Telescope
return function(extensions)
	local telescope = require("telescope")

	if table_utils.has_item(extensions, "harpoon") then
		telescope.load_extension("harpoon")
		map("n", "<leader>ht", ":Telescope harpoon marks<CR>")
	end

	if table_utils.has_item(extensions, "fzf") then
		telescope.load_extension("fzf")
	end
end
