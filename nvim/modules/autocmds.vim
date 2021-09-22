" augroup remember_folds
    " autocmd!
    " let btToIgnore = ['terminal']
    " autocmd BufWinLeave ?* if index(btToIgnore, &buftype) < 0 |mkview 1
    " autocmd BufWinEnter ?* silent! loadview 1
" augroup END

augroup set_react_filetypes
    autocmd!
    autocmd BufNewFile,BufRead,BufWinEnter *.tsx, set filetype=typescriptreact
    autocmd BufNewFile,BufRead,BufWinEnter *.jsx, set filetype=javascriptreact
augroup END
