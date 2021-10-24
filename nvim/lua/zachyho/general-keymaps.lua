local utils = require 'zachyho.utils'
local map = utils.map

-- Map leader key
map('n', '<SPACE>', '<Nop>')
vim.g.mapleader = ' '

-- Re-source init.lua
map('n', '<leader>rsn', ':source $HOME/.config/nvim/resource-nvim.lua<CR>')

-- Save and execute current file (stolen from TJ Devries)
map('n', '<leader><leader>x', ':call zachyho#save_and_exec()<CR>')

-- Remove arrow keys
map({'n', 'i'}, '<Up>', '<Nop>')
map({'n', 'i'}, '<Down>', '<Nop>')
map({'n', 'i'}, '<Left>', '<Nop>')
map({'n', 'i'}, '<Right>', '<Nop>')

-- Clipboard copy
map({'n', 'v'}, '<leader>y', '"*y')

-- Quickfix and location lists
map('n', ',ln', ':lnext')
-- map('n', ',')

-- Path of current file
map('n', '<leader>pf', '1<C-g>')
map('n', '<leader>pc', ':let @+= expand("%:p")<CR>')
map('n', '<leader>ph', ':let @+= expand("%:p:h")<CR>')

-- Moving lines
map('n', '<C-j>', ':m .+1<CR>==')
map('n', '<C-k>', ':m .-2<CR>==')
map('v', '<C-j>', ":m '>+1<CR>gv=gv")
map('v', '<C-k>', ":m '<-2<CR>gv=gv")

-- Creating splits
map('n', '<leader>sl', ': wincmd v<CR>')
map('n', '<leader>sj', ': wincmd s<CR>')

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

-- Center screen after n/N
map('n', 'n', 'nzz', { noremap = false })
map('n', 'N', 'Nzz', { noremap = false })


-- Vim tabs
map('n', '<leader>tc', ':tabclose')
map('n', '<leader>tn', ':tabnew')

map('n', '<leader>-', ':vertical resize -5<CR>')
map('n', '<leader>=', ':vertical resize +5<CR>')
