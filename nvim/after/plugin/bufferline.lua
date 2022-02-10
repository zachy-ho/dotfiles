vim.opt.termguicolors = true
vim.cmd([[set mouse+=a]])

require("bufferline").setup{
    options = {
        diagnostics = 'nvim_lsp',
        offsets = {
            {
                filetype = 'nerdtree',
                text = "ur doin' gr8 m8",
                -- highlight = 'Directory',
                text_align = 'center'
            }
        }
    }
}

map('n', '<leader>bp', ':BufferLineCyclePrev<CR>')
map('n', '<leader>bn', ':BufferLineCycleNext<CR>')
map('n', '<leader>b,', ':BufferLineMovePrev<CR>')
map('n', '<leader>b.', ':BufferLineMoveNext<CR>')
map('n', '<leader>bc', ':BufferLinePickClose<CR>')
map('n', '<leader>bb', ':BufferLinePick<CR>')

map('n', '<leader>b1', ':BufferLineGoToBuffer 1<CR>')
map('n', '<leader>b2', ':BufferLineGoToBuffer 2<CR>')
map('n', '<leader>b3', ':BufferLineGoToBuffer 3<CR>')
map('n', '<leader>b4', ':BufferLineGoToBuffer 4<CR>')
map('n', '<leader>b5', ':BufferLineGoToBuffer 5<CR>')
map('n', '<leader>b6', ':BufferLineGoToBuffer 6<CR>')
map('n', '<leader>b7', ':BufferLineGoToBuffer 7<CR>')
map('n', '<leader>b8', ':BufferLineGoToBuffer 8<CR>')
map('n', '<leader>b9', ':BufferLineGoToBuffer 9<CR>')
