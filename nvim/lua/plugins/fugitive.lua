local utils = require 'utils'
local map = utils.map

map('n', '<leader>fh', ':diffget //2<CR>')
map('n', '<leader>fl', ':diffget //3<CR>')
