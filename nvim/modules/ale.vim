let g:ale_linters = {
            \ 'python': ['prospector'],
            \ 'typescript': ['tsserver', 'tslint'],
            \ 'markdown': ['prettier']
            \ }
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'],
                    \ 'typescript': ['prettier']}
let g:ale_fix_on_save = 1
