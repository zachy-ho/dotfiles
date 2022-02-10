-- Must initialize g:grepper with default values
vim.cmd([[
    runtime plugin/grepper.vim
    let g:grepper.searchreg = 1
    let g:grepper.tools = ['rg', 'git', 'ag', 'ack', 'ack-grep', 'grep', 'findstr', 'pt', 'sift']
    let g:grepper.operator.prompt = 1
]])

-- I didn't use a custom command the :Grepper commands because I wanna be able to add flags
-- (e.g. adding -buffer)

-- Grep with manual query
map('n', '<leader>gq', ':Grepper -noprompt -tool rg -query ')

-- Grep the current word
map('n', '<leader>gw', ':Grepper -noprompt -tool rg -cword<CR>')

-- Grep with operators
map({ 'n', 'x' }, '<leader>gr', '<plug>(GrepperOperator)', { noremap = false})
