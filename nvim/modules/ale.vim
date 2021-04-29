let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
            \ 'html': ['prettier'],
            \ 'javascript': ['eslint'],
            \ 'typescript': ['tsserver', 'tslint', 'eslint'],
            \ 'css': ['prettier'],
            \ 'scss': ['prettier'],
            \ 'markdown': ['prettier'],
            \ 'vue': ['prettier'],
            \ 'java': ['javac'],
            \ 'python': ['flake8'],
            \ 'json': ['jsonlint'],
            \ }
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'],
                    \ 'html': ['prettier'],
                    \ 'javascript': ['eslint'],
                    \ 'typescript': ['prettier'],
                    \ 'css': ['prettier'],
                    \ 'scss': ['prettier'],
                    \ 'python': ['autopep8']}

" Use with coc.nvim
let g:ale_disable_lsp = 1
