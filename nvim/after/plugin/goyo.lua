-- Zen mode
map("n", "<leader>zm", ":Goyo<CR>")

vim.cmd([[
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
]])
