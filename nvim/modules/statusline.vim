" ---------- Status line ----------
" To show current mode
let g:currentmode = {
            \ 'n' : 'NORMAL',
            \ 'v' : 'VISUAL',
            \ 'V' : 'V-Line',
            \ ''  : 'V-Block',
            \ 'i' : 'INSERT',
            \ 'R' : 'REPLACE',
            \ 's' : 'SELECT',
            \ 'c' : 'COMMAND',
            \ 't' : 'FZF',
            \}

" Left side
set statusline=
set statusline+=%#GruvboxGreen#
set statusline+=\ %{toupper(g:currentmode[mode()]).'\ '}
set statusline+=%#GruvboxBg4#
set statusline+=%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':''}
set statusline+=%#GruvboxBg4#
set statusline+=\ %M
set statusline+=%y
set statusline+=\%t
" Right side
set statusline+=%=
set statusline+=%#GruvboxBg4#
set statusline+=\ %c:%l/%L
set statusline+=\ %{'\\'}
set statusline+=\ %p%%
set statusline+=\ %{'\\'}
set statusline+=\ [%n]

" Cool symbols!
"
