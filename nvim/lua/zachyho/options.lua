-- > General options and settings <--

local g = vim.g
local opt = vim.opt


-- Mapping leader to <SPACE>
-- [[ Firstly, non-recursive map <SPACE> to No-op because it is mapped to right
-- by default ]]
vim.api.nvim_set_keymap('n', ' ', '', {noremap = true})
g.mapleader = ' '

-- Tabs, indents, wraps
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.softtabstop = 4
opt.tabstop = 4
opt.textwidth = 0
opt.wrap = false

-- Line numbers, highlights, searches and case
opt.colorcolumn = '100'
opt.cursorline = true
opt.ignorecase = true
opt.incsearch = true
opt.hlsearch = false
opt.showmode = false
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
opt.smartcase = true

-- Splitting
opt.splitright = true
opt.splitbelow = true

-- Folds
opt.foldmethod = 'manual'

-- Backups
opt.backup = false
opt.writebackup = false
opt.swapfile = false
vim.opt.undodir = vim.fn.stdpath('config') .. '/undo'
opt.undofile = true

-- Lazy redraw and update time
opt.lazyredraw = true

-- Errorbells
opt.errorbells = false

vim.cmd([[
    augroup highlight_yank
        autocmd!
        autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
    augroup END
]])

