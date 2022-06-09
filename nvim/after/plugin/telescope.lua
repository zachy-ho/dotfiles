local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
	return
end

local actions_ok, actions = pcall(require, "telescope.actions")
if not actions_ok then
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

telescope.load_extension("fzf")

map("n", "<leader>of", ":Telescope find_files<CR>")
map("n", "<leader>og", ":Telescope live_grep<CR>")
map("n", "<leader>ob", ":Telescope buffers<CR>")
map("n", "<leader>oc", ":lua require'telescope.builtin'.command_history{}<CR>")
map("n", "<leader>oj", ":lua require'telescope.builtin'.jumplist{}<CR>")
map("n", "<leader>okm", ":lua require'telescope.builtin'.keymaps{}<CR>")
