-- > General options and settings <--

local g = vim.g
local opt = vim.opt

-- Mapping leader to <SPACE>
-- [[ Firstly, non-recursive map <SPACE> to No-op because it is mapped to right
-- by default ]]
vim.api.nvim_set_keymap("n", " ", "", { noremap = true })
g.mapleader = " "

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
opt.colorcolumn = "100"
opt.cursorline = true
opt.ignorecase = true
opt.incsearch = true
opt.hlsearch = false
opt.showmode = false
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.smartcase = true

-- Splitting
opt.splitright = true
opt.splitbelow = false

-- Folds (uses Treesitter)
vim.cmd([[
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
]])

-- View options
opt.viewoptions = "cursor,folds"

-- Format options
opt.formatoptions = opt.formatoptions
	- "a" -- Auto formatting is BAD.
	- "t" -- Don't auto format my code. I got linters for that.
	+ "c" -- In general, I like it when comments respect textwidth
	+ "q" -- Allow formatting comments w/ gq
	- "o" -- O and o, don't continue comments
	+ "r" -- But do continue when pressing enter.
	+ "n" -- Indent past the formatlistpat, not underneath it.
	+ "j" -- Auto-remove comments if possible.
	- "2" -- I'm not in gradeschool anymore

-- Backups
opt.backup = false
opt.writebackup = false
opt.swapfile = false
vim.opt.undodir = vim.fn.stdpath("config") .. "/undo"
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

-- Augroup for custom highlights have to be set before colorscheme is set
vim.cmd([[
    function! MyHighlights() abort
        highlight Folded ctermbg=4 guibg=#607887
    endfunction

    augroup MyColors
        autocmd!
        autocmd ColorScheme * call MyHighlights()
    augroup END
]])
