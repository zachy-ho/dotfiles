-- return telescope_config
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

		map("n", "<leader>te", ":Telescope<CR>")

		local builtin = require("telescope.builtin")
		map("n", "<leader>tff", builtin.find_files)
		map("n", "<leader>tfi", ":Telescope find_files cwd=")
		map("n", "<leader>tlg", builtin.live_grep)
		map("n", "<leader>tb", builtin.buffers)
		map("n", "<leader>tch", builtin.command_history)
		map("n", "<leader>tk", builtin.keymaps)
		-- lsp ones
		map("n", "<leader>tfr", builtin.lsp_references)
		map("n", "<leader>tgd", builtin.lsp_definitions)
		map("n", "<leader>tgi", builtin.lsp_implementations)

		-- IMPORTANT: has to come AFTER telescope.setup
		local load_extensions = require("zachyho.plugins.telescope.extensions")
		if load_extensions then
			load_extensions({ "harpoon", "fzf" })
		end
	end,
}
