local utils = require 'utils'
local map = utils.map
-- Make a new split if the destination file is not already open
-- Stolen from: https://ramgo.li/posts/coc.nvim_split_if_not_open/
vim.cmd([[
    function! SplitIfNotOpen(...)
        let fname = a:1
        let call = ''
        if a:0 == 2
            let fname = a:2
            let call = a:1
        endif
        let bufnum=bufnr(expand(fname))
        let winnum=bufwinnr(bufnum)
        if winnum != -1
            " Jump to existing split
            exe winnum . "wincmd w"
        else
            " Make new split as usual
            exe "vsplit " . fname
        endif
        " Execute the cursor movement command
        exe call
    endfunction

    command! -nargs=+ CocSplitIfNotOpen :call SplitIfNotOpen(<f-args>)
]])

-- Coc.nvim
map('n', '<leader>gd', ':call CocAction("jumpDefinition")<CR>')
map('n', '<leader>gt', '<Plug>(coc-type-definition)')
map('n', '<leader>gi', ':call CocAction("jumpImplementation")<CR>')
map('n', '<leader>gr', '<Plug>(coc-references)')
map('n', '<leader>gp', '<Plug>(coc-action-doHover)')
map('n', '<leader>rn', '<Plug>(coc-rename)')
map('n', 'K', ':call <SID>show_documentation()<CR>')
