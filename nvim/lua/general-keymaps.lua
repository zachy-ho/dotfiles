local utils = require 'utils'
local map = utils.map

-- Map leader key
map('n', '<SPACE>', '<Nop>')
vim.g.mapleader = ' '

-- Re-source init.lua
map('n', '<leader>rsn', ':source $HOME/.config/nvim/resource-nvim.lua<CR>')

-- Remove arrow keys
map({'n', 'i'}, '<Up>', '<Nop>')
map({'n', 'i'}, '<Down>', '<Nop>')
map({'n', 'i'}, '<Left>', '<Nop>')
map({'n', 'i'}, '<Right>', '<Nop>')

-- Path of current file
map('n', '<leader>pp', '1<C-g>')
map('n', '<leader>cp', ':let @+= expand("%:p")<CR>')
map('n', '<leader>ch', ':let @+= expand("%:p:h")<CR>')

-- Moving lines
map('n', '<C-j>', ':m .+1<CR>==')
map('n', '<C-k>', ':m .-2<CR>==')
map('i', '<C-j>', '<Esc> :m .+1<CR>==gi')
map('i', '<C-k>', '<Esc> :m .-2<CR>==gi')
map('v', '<C-j>', ":m '>+1<CR>gv=gv")
map('v', '<C-k>', ":m '<-2<CR>gv=gv")

-- Creating splits
map('n', '<leader>wl', ': wincmd v<CR>')
map('n', '<leader>wj', ': wincmd s<CR>')

-- Moving between panes
map('n', '<leader>h', ': wincmd h<CR>')
map('n', '<leader>j', ': wincmd j<CR>')
map('n', '<leader>k', ': wincmd k<CR>')
map('n', '<leader>l', ': wincmd l<CR>')

-- Moving panes
map('n', '<leader>H', ': wincmd H<CR>')
map('n', '<leader>J', ': wincmd J<CR>')
map('n', '<leader>K', ': wincmd K<CR>')
map('n', '<leader>L', ': wincmd L<CR>')
map('n', '<leader>x', ': wincmd x<CR>')

-- Vim tabs
map('n', '<leader>tc', ':tabclose')
map('n', '<leader>tn', ':tabnew')

map('n', '<leader>-', ':vertical resize -5<CR>')
map('n', '<leader>=', ':vertical resize +5<CR>')
