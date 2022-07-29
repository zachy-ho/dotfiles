local shortcuts = require("zachyho.plugin_configs.nvim_tree_shortcuts").as_table

map("n", shortcuts.toggle, ":NvimTreeToggle<CR>")
map("n", shortcuts.find_current_file, ":NvimTreeFindFile<CR>")
map("n", shortcuts.focus, ":NvimTreeFocus<CR>")
