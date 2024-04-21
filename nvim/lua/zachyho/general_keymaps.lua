-- Map leader key
map("n", "<SPACE>", "<Nop>")
vim.g.mapleader = " "

-- Open init.lua from anywhere
map("n", "<leader>nrc", ":e $HOME/.config/nvim/init.lua<CR>:lcd $HOME/.config/nvim<CR>")
map("n", "<leader>rsn", ":source $HOME/.config/nvim/init.lua<CR>")

-- Save and execute current file (stolen from TJ Devries)
map("n", "<leader><leader>x", ":call zachyho#save_and_exec()<CR>")

-- Remove arrow keys
map({ "n", "i" }, "<Up>", "<Nop>")
map({ "n", "i" }, "<Down>", "<Nop>")
map({ "n", "i" }, "<Left>", "<Nop>")
map({ "n", "i" }, "<Right>", "<Nop>")

-- Clipboard copy
map({ "n", "v" }, "<leader>y", '"*y')

-- Netrw
map({ "n" }, "<leader>fe", ":Explore<Cr>")

-- In visual mode, delete the highlighted part out of existence (into the _ register) and paste,
-- effectively keeping the pasted segment for the next paste if needed.
map("x", "<leader>p", '"_dP')

-- Search and replace
map({ "n" }, "<leader>srl", ":s///g<c-b><right><right>")
map({ "n" }, "<leader>sra", ":%s///g<c-b><right><right><right>")

-- Quickfix and location lists (use ',' as secondary leader key for these items)
map("n", "<leader>ll", ":lwindow<CR>")
map("n", "<leader>ln", ":lnext<CR>")
map("n", "<leader>lp", ":lprev<CR>")
map("n", "<leader>qf", ":cwindow<CR>")
map("n", "<leader>qn", ":cnext<CR>")
map("n", "<leader>qp", ":cprev<CR>")

-- Path of current file
map("n", "<leader>pf", "1<C-g>")
map("n", "<leader>pc", ':let @+= expand("%:p")<CR>')

-- Moving lines
map("n", "<C-j>", ":m .+1<CR>==", { silent = true })
map("n", "<C-k>", ":m .-2<CR>==", { silent = true })
map("v", "<C-j>", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "<C-k>", ":m '<-2<CR>gv=gv", { silent = true })

-- Center screen after n/N
-- map("n", "n", "nzz", { noremap = false })
-- map("n", "N", "Nzz", { noremap = false })

map("n", "<leader>=-", ":vertical resize -15<CR>")
map("n", "<leader>==", ":vertical resize +15<CR>")
map("n", "<leader>--", ":resize -5<CR>")
map("n", "<leader>-=", ":resize +5<CR>")

-- Terminal mode
map("t", "<leader><Esc>", "<C-\\><C-n>")
