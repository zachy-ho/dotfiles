local utils = require('zachyho.utils')
local map = utils.map

map('n', '<leader>hm', ':lua require("harpoon.mark").add_file()<CR>')
map('n', '<leader>hp', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
