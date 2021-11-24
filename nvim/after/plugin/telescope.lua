local map = require('zachyho.utils').map

local ok, actions = pcall(require, 'telescope.actions')
if not ok then
    return
end

require('telescope').setup({
    defaults = {
        layout_strategy = 'vertical',
        mappings = {
            i = {
                ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
            },
            n = {
                ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
            }
        }
    },
    pickers = {
        buffers = {
            mappings = {
                i = {
                    ['<C-d>'] = actions.delete_buffer
                }
            }
        }
    }
})

map('n', '<leader>tff', ':Telescope find_files<CR>')
map('n', '<leader>tfg', ':Telescope live_grep<CR>')
map('n', '<leader>tfb', ':Telescope buffers<CR>')
