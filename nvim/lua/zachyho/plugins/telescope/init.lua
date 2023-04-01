-- return telescope_config
return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local telescope = safe_require("telescope")
		local actions = safe_require("telescope.actions")
		if not (telescope and actions) then
			return
		end

		telescope.setup({
			defaults = {
				layout_strategy = "vertical",
				mappings = {
					i = {
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					},
					n = {
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					},
				},
			},
			pickers = {
				buffers = {
					mappings = {
						i = {
							["<C-d>"] = actions.delete_buffer,
						},
						n = {
							["<C-d>"] = actions.delete_buffer,
						},
					},
				},
			},
		})

		local keymaps = safe_require(constants.PLUGINS_DIR .. "telescope.keymaps")
		if keymaps then
			local as_table = preconditions.check_exists(keymaps.as_table)
			local builtin = safe_require("telescope.builtin")
			if builtin then
				map("n", as_table.find_files, builtin.find_files)
				map("n", as_table.live_grep, builtin.live_grep)
				map("n", as_table.buffers, builtin.buffers)
				map("n", as_table.command_history, builtin.command_history)
				map("n", as_table.keymaps, builtin.keymaps)
			end
		end

		-- IMPORTANT: has to come AFTER telescope.setup
		local load_extensions = safe_require(constants.PLUGINS_DIR .. "telescope.extensions")
		if load_extensions then
			load_extensions({ "harpoon", "fzf" })
		end
	end,
}
