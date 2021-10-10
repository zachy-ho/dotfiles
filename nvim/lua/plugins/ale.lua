local g = vim.g

g.ale_sign_error = '✘'
g.ale_sign_warning = '⚠'
g.ale_lint_on_text_changed = 1
g.ale_lint_on_enter = 1
g.ale_lint_on_save = 1
g.ale_fix_on_save = 1
g.ale_linters = {
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
g.ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'],
                    \ 'html': ['prettier'],
                    \ 'javascript': ['eslint'],
                    \ 'typescript': ['prettier'],
                    \ 'css': ['prettier'],
                    \ 'scss': ['prettier'],
                    \ 'python': ['autopep8']}

-- Use with coc.nvim
g.ale_disable_lsp = 1
