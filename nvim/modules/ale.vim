let g:ale_linters = {
            \ 'python': ['prospector'],
            \ 'markdown': ['prettier']
            \ }
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fix_on_save = 1
