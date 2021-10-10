-- > General options and settings <--

local g = vim.g
local o = vim.o
local cmd = vim.api.nvim_command


-- Mapping leader to <SPACE>
-- [[ Firstly, non-recursive map <SPACE> to No-op because it is mapped to right
-- by default ]]
vim.api.nvim_set_keymap('n', ' ', '', {noremap = true})
g.mapleader = ' '

-- Tabs, indents, wraps
o.autoindent = true
o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.softtabstop = 4
o.tabstop = 4
o.textwidth = 0
o.wrap = true

-- Line numbers, highlights, searches and case
o.colorcolumn = '100'
o.cursorline = true
o.ignorecase = true
o.incsearch = true
o.hlsearch = false
o.showmode = false
o.number = true
o.relativenumber = true
o.scrolloff = 8
o.smartcase = true

-- Folds
o.foldmethod = 'manual'

-- Backups
o.backup = false
o.writebackup = false
o.swapfile = false
vim.opt.undodir = vim.fn.stdpath('config') .. '/undo'
o.undofile = true

-- Lazy redraw and update time
o.lazyredraw = true
o.updatetime = 50

-- Errorbells
o.errorbells = false
