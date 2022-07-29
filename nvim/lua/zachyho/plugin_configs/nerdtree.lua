local nerdtree = {
	shortcuts = {
		toggle = "<leader>nt",
		find_current_file = "<leader>nb",
		focus = "<leader>nf",
	},
}

map("n", nerdtree.shortcuts.toggle, ":NERDTreeToggle<CR>")
map("n", nerdtree.shortcuts.find_current_file, ":NERDTreeFind<CR>")
map("n", nerdtree.shortcuts.focus, ":NERDTreeFocus<CR>")

vim.g.NERDTreeShowBookmarks = true

local shortcuts = {}
for _k, v in pairs(nerdtree.shortcuts) do
	table.insert(shortcuts, v)
end

return shortcuts
