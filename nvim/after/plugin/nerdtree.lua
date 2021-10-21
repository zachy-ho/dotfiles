local utils = require 'zachyho.utils'
local map = utils.map

map('n', '<leader>nt', ':NERDTreeToggle<CR>')
map('n', '<leader>nb', ':NERDTreeFind<CR>')

vim.g.NERDTreeShowBookmarks = true
