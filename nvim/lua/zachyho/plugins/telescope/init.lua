local telescope_config = {
	"nvim-telescope/telescope.nvim",
	requires = {
		"nvim-lua/plenary.nvim",
		-- telescope-fzf-native for better sorting performance
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make",
		},
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
			map("n", as_table.find_files, ":Telescope find_files<CR>")
			map("n", as_table.live_grep, ":Telescope live_grep<CR>")
			map("n", as_table.buffers, ":Telescope buffers<CR>")
			map("n", as_table.command_history, ":lua require'telescope.builtin'.command_history{}<CR>")
			map("n", as_table.jumplist, ":lua require'telescope.builtin'.jumplist{}<CR>")
			map("n", as_table.keymaps, ":lua require'telescope.builtin'.keymaps{}<CR>")
		end

		local load_extensions = safe_require(constants.PLUGINS_DIR .. "telescope.extensions")
		if load_extensions then
			load_extensions({ "fzf", "harpoon" })
		end
	end,
}

local keymaps = safe_require(constants.PLUGINS_DIR .. "telescope.keymaps")
local harpoon_keymaps = safe_require(constants.PLUGINS_DIR .. "harpoon.keymaps")
local keys = {}
if keymaps then
	vim.list_extend(keys, preconditions.check_exists(keymaps.as_list))
end
if harpoon_keymaps then
	table.insert(keys, preconditions.check_exists(harpoon_keymaps.as_table).toggle_telescope)
end
telescope_config.keys = keys
return telescope_config
