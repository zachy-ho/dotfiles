local map = require'zachyho.utils'.map

-- Mapping <Plug>Prettier cos I don't want <leader>p to trigger this shit
map('n', '<leader>prs', '<Plug>Prettier')
map('n', '<leader>prs', ':Prettier<CR>')
map('n', '<leader>pra', ':PrettierAsync<CR>')
