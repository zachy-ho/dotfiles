" This file is in vimscript because idk how to use <SID> or whatever the fuck
" that is in a Lua file without an error screaming at me

" ---------- FZF settings ----------
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
" -- Fzf find from current directory
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" Creates a box in the middle for fzf instead of having it small at the
" bottom
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6, 'highlight': 'Comment' } }

" Set preview window position and trigger key
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Grep command config
command! -bang -nargs=* RgWithOpts
            \ call fzf#vim#grep(
            \   'rg --sort path --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!{.git,node_modules}/*" --color "always" '. <q-args>,
            \   1,
            \   <bang>0
            \ )

" Find from git root
function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()


let $FZF_DEFAULT_OPTS = '--reverse'

" Mapping keymaps
lua << EOF
local utils = require 'zachyho.utils'
local map = utils.map
map('n', '<leader>ff', ':Files<CR>', { noremap = true })
map('n', '<leader>fr', ':ProjectFiles<CR>', { noremap = true })
map('n', '<leader>fg', ':GFiles<CR>', { noremap = true })
map('n', '<leader>rg', ':RgWithOpts ""', { noremap = true })
map('n', '<leader>fb', ':Buffers<CR>', { noremap = true })
EOF
