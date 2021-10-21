local utils = require 'zachyho.utils'
local map = utils.map

map('n', '<leader>dh', ':diffget //2<CR>')
map('n', '<leader>dl', ':diffget //3<CR>')
