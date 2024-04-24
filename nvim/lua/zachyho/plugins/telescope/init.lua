--[[
Handles cases:
- when there is only one selection (pressing enter on a selection without anything else selected)
- when there is more than one selection (pressing enter after selecting multiple entries)
]]
local handle_selection = function(prompt_bufnr)
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local current_picker = action_state.get_current_picker(prompt_bufnr)
	local has_multi_selection = (next(current_picker:get_multi_selection()) ~= nil)

	if has_multi_selection then
		actions.smart_send_to_qflist(prompt_bufnr)
		actions.open_qflist(prompt_bufnr)
	else
		actions.file_edit(prompt_bufnr)
	end
end

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				layout_strategy = "vertical",
				mappings = {
					i = {
						["<CR>"] = handle_selection,
					},
					n = {
						["<CR>"] = handle_selection,
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
				find_files = {
					hidden = true,
					follow = true,
				},
			},
		})

		map("n", "<leader>te", ":Telescope<CR>")

		local builtin = require("telescope.builtin")
		map("n", "<leader>tfa", builtin.find_files)
		map("n", "<leader>tfi", ":Telescope find_files cwd=")
		map("n", "<leader>tga", builtin.live_grep)
		map("n", "<leader>tgi", ":Telescope live_grep cwd=")
		map("n", "<leader>tgw", ":Telescope grep_string cwd=")
		map("n", "<leader>tb", builtin.buffers)
		map("n", "<leader>tk", builtin.keymaps)
		-- lsp ones
		map("n", "<leader>tfr", builtin.lsp_references)
		map("n", "<leader>tgd", builtin.lsp_definitions)
		-- map("n", "<leader>tgi", builtin.lsp_implementations)

		-- IMPORTANT: has to come AFTER telescope.setup
		local load_extensions = require("zachyho.plugins.telescope.extensions")
		if load_extensions then
			load_extensions({ "harpoon", "fzf" })
		end
	end,
}
