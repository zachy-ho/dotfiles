-- I don't want <leader>p to trigger this shit
vim.cmd([[
  :unmap <leader>p
]])
map("n", "<leader>prs", ":Prettier<CR>")
map("n", "<leader>pra", ":PrettierAsync<CR>")
