let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_linters = {
            \ 'python': ['prospector'],
            \ 'vue': ['prettier'],
            \ 'javascript': ['eslint'],
            \ 'typescript': ['tsserver', 'tslint', 'eslint'],
            \ 'java': ['javac'],
            \ 'markdown': ['prettier']
            \ }
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'],
                    \ 'javascript': ['eslint'],
                    \ 'typescript': ['prettier'],}
let g:ale_fix_on_save = 1

" Use with coc.nvim
let g:ale_disable_lsp = 1
