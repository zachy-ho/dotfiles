local utils = require 'zachyho.utils'
local map = utils.map

-- Recommended sessionoptions usage
vim.o.sessionoptions="blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal"

-- Setup with custom options
-- Sessions are stored in vim.fn.stdpath('data').."/sessions/"
require('auto-session').setup({
    auto_session_enabled = false
})

map('n', '<leader>ses', ':SaveSession<CR>')
map('n', '<leader>ser', ':RestoreSession<CR>')
