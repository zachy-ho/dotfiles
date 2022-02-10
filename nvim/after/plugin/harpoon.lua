local utils = require('zachyho.utils')
local map = utils.map

-- Telescope support
require("telescope").load_extension('harpoon')

map('n', '<leader>hp', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
map('n', '<leader>hm', ':lua require("harpoon.mark").add_file()<CR>')
map('n', '<leader>h1', ':lua require("harpoon.ui").nav_file(1)<CR>')
map('n', '<leader>h2', ':lua require("harpoon.ui").nav_file(2)<CR>')
map('n', '<leader>h3', ':lua require("harpoon.ui").nav_file(3)<CR>')
map('n', '<leader>h4', ':lua require("harpoon.ui").nav_file(4)<CR>')
map('n', '<leader>h5', ':lua require("harpoon.ui").nav_file(5)<CR>')
map('n', '<leader>h6', ':lua require("harpoon.ui").nav_file(6)<CR>')
