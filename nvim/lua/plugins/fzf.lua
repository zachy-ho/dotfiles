local utils = require 'utils'
local map = utils.map

---------- FZF settings ----------
--column: Show column number
--line-number: Show line number
--no-heading: Do not show file headings in results
--fixed-strings: Search term as a literal string
--ignore-case: Case insensitive search
--no-ignore: Do not respect .gitignore, etc...
--hidden: Search hidden files and folders
--follow: Follow symlinks
--glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
-- --color: Search color options
-- Fzf find from current directory

-- For fzf to search from project/git root
vim.cmd([[
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

    function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
    endfunction
    command! ProjectFiles execute 'Files' s:find_git_root()

    lua << EOF
    function _G.check_back_space()
        local col = vim.api.nvim_win_get_cursor(0)[2]
        return (col == 0 or vim.api.nvim_get_current_line():sub(col, col):match('%s')) and true
    end
    EOF

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
      else
        execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction

    inoremap <silent><expr> <Tab>
        \ pumvisible() ? "\<C-n>" :
        \ v:lua.check_back_space() ? "\<Tab>" :
        \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
]])

-- Creates a box in the middle for fzf instaed of having it small at the
-- bottom
vim.cmd([[
    let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
]])

vim.cmd([[
    let $FZF_DEFAULT_OPTS = '--reverse'
]])

map('n', '<leader>ff', ':Files<CR>')
map('n', '<leader>fg', ':ProjectFiles<CR>')
map('n', '<leader>fr', ':let @+=expand("%:p:h") <bar> :Files ')
map('n', '<leader>rg', ':Find<CR>')
