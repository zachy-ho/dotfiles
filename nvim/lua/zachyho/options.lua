-- > General options and settings <--

-- Mapping leader to <SPACE>
-- [[ Firstly, non-recursive map <SPACE> to No-op because it is mapped to right
-- by default ]]
vim.api.nvim_set_keymap("n", " ", "", { noremap = true })
vim.g.mapleader = " "

local opt = vim.opt
-- Tabs, indents, wraps
opt.autoindent = true
opt.wrap = false
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.softtabstop = 4
opt.tabstop = 4
opt.textwidth = 0

-- Line numbers, highlights, searches, case, and cursor look
opt.colorcolumn = "100"
opt.ignorecase = true
opt.incsearch = true
opt.hlsearch = true
opt.showmode = false
opt.number = true
opt.relativenumber = true
opt.scrolloff = 6
opt.smartcase = true
opt.guicursor = "n-v-c-i-sm:block-nCursor,ci-ve:ver25,r-cr-o:hor20"

-- Splitting
opt.splitright = true
opt.splitbelow = true

-- Disable mouse
opt.mouse = ""

-- Folds
opt.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- View options
opt.viewoptions = "cursor"

-- Format options
opt.formatoptions = opt.formatoptions
	- "t" -- Don't auto format my code. I got linters for that.
	+ "r" -- But do continue when pressing enter.
	+ "n" -- Indent past the formatlistpat, not underneath it.
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

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Netrw
-- This gives me relative line numbers in netrw
vim.cmd([[
    let g:netrw_bufsettings='noma nomod nu nowrap ro nobl'
]])
