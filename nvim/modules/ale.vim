let g:ale_linters = {
            \ 'python': ['prospector'],
            \ 'typescript': ['tsserver', 'tslint'],
            \ 'java': ['javac'],
            \ 'markdown': ['prettier']
            \ }
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'],
                    \ 'typescript': ['prettier']}
let g:ale_fix_on_save = 1

" Use with coc.nvim
let g:ale_disable_lsp = 1
