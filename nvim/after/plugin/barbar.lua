local map = require('zachyho.utils').map

-- Enable mouse click interactions
vim.cmd([[set mouse+=a]])

-- Move to previous/next
map('n', '<leader>bp', ':BufferPrevious<CR>')
map('n', '<leader>bn', ':BufferNext<CR>')
-- Re-order to previous/next
map('n', '<leader>b,', ':BufferMovePrevious<CR>')
map('n', '<leader>b.', ':BufferMoveNext<CR>')
-- Goto buffer in position...
map('n', '<leader>b1', ':BufferGoto 1<CR>')
map('n', '<leader>b2', ':BufferGoto 2<CR>')
map('n', '<leader>b3', ':BufferGoto 3<CR>')
map('n', '<leader>b4', ':BufferGoto 4<CR>')
map('n', '<leader>b5', ':BufferGoto 5<CR>')
map('n', '<leader>b6', ':BufferGoto 6<CR>')
map('n', '<leader>b7', ':BufferGoto 7<CR>')
map('n', '<leader>b8', ':BufferGoto 8<CR>')
map('n', '<leader>b9', ':BufferGoto 9<CR>')
map('n', '<leader>b0', ':BufferLast<CR>')
-- Close buffer
map('n', '<leader>bc', ':BufferClose<CR>')
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCoseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
-- map('n', '<leader>bi', ':BufferPick<CR>')
-- Sort automatically by...
map('n', '<Space>bon', ':BufferOrderByBufferNumber<CR>')
map('n', '<Space>bod', ':BufferOrderByDirectory<CR>')

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be usedl
