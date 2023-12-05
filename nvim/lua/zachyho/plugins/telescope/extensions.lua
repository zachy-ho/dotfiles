-- Load extensions that make use of Telescope
return function(extensions)
	local telescope = safe_require("telescope")
	if not telescope then
		return
	end

	if table_utils.has_item(extensions, "harpoon") then
		if safe_require("harpoon") then
			telescope.load_extension("harpoon")
			map("n", "<leader>ht", ":Telescope harpoon marks<CR>")
		end
	end

	if table_utils.has_item(extensions, "fzf") then
		telescope.load_extension("fzf")
	end
end
