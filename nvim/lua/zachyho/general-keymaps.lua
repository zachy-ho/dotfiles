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

-- Quickfix and location lists (use ',' as secondary leader key for these items)
map('n', '<leader>ll', ':lwindow<CR>')
map('n', '<leader>ln', ':lnext<CR>')
map('n', '<leader>lp', ':lprev<CR>')
map('n', '<leader>qf', ':cwindow<CR>')
map('n', '<leader>qn', ':cnext<CR>')
map('n', '<leader>qp', ':cprev<CR>')

-- Path of current file
map('n', '<leader>pf', '1<C-g>')
map('n', '<leader>pc', ':let @+= expand("%:p")<CR>')
map('n', '<leader>ph', ':let @+= expand("%:p:h")<CR>')

-- Moving lines
map('n', '<C-j>', ':m .+1<CR>==', { silent = true })
map('n', '<C-k>', ':m .-2<CR>==', { silent = true })
map('v', '<C-j>', ":m '>+1<CR>gv=gv", { silent = true })
map('v', '<C-k>', ":m '<-2<CR>gv=gv", { silent = true })

-- Creating splits
map('n', '<leader>sv', ':vsplit<CR>', { silent = true })
map('n', '<leader>sh', ':split<CR>', { silent = true })

-- Moving between panes
map('n', ',wh', ': wincmd h<CR>', { silent = true })
map('n', ',wj', ': wincmd j<CR>', { silent = true })
map('n', ',wk', ': wincmd k<CR>', { silent = true })
map('n', ',wl', ': wincmd l<CR>', { silent = true })

-- Moving panes
map('n', '<leader>H', ': wincmd H<CR>', { silent = true })
map('n', '<leader>J', ': wincmd J<CR>', { silent = true })
map('n', '<leader>K', ': wincmd K<CR>', { silent = true })
map('n', '<leader>L', ': wincmd L<CR>', { silent = true })
map('n', '<leader>x', ': wincmd x<CR>', { silent = true })

-- Center screen after n/N
map('n', 'n', 'nzz', { noremap = false })
map('n', 'N', 'Nzz', { noremap = false })

-- Vim tabs
map('n', '<leader>tc', ':tabclose ')
map('n', '<leader>ts', ':tab split<CR>')

map('n', '<leader>=-', ':vertical resize -5<CR>')
map('n', '<leader>==', ':vertical resize +5<CR>')
map('n', '<leader>--', ':resize -5<CR>')
map('n', '<leader>-=', ':resize +5<CR>')

-- Ex mode
map('c', '<C-k>', '<Up>', { noremap = false })
