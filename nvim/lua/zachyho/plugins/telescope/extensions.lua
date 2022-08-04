-- Load extensions that make use of Telescope
return function(extensions)
	local telescope = safe_require("telescope")
	if not telescope then
		return
	end

	local table_utils = safe_require("zachyho.table_utils")
	if not table_utils then
		return
	end

	if table_utils.has_item(extensions, "fzf") then
		if safe_require("fzf") then
			telescope.load_extension("fzf")
		end
	end

	if table_utils.has_item(extensions, "harpoon") then
		if safe_require("harpoon") then
			telescope.load_extension("harpoon")
			local harpoon_keymaps = safe_require(constants.PLUGINS_DIR .. "harpoon.keymaps")
			if harpoon_keymaps then
				map(
					"n",
					preconditions.check_exists(harpoon_keymaps.as_table).toggle_telescope,
					":Telescope harpoon marks<CR>"
				)
			end
		end
	end
end