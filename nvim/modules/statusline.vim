" ---------- Status line ----------
" To show current mode
let g:currentmode = {
            \ 'n' : 'NORMAL',
            \ 'v' : 'VISUAL',
            \ 'V' : 'V-Line',
            \ ''  : 'V-Block',
            \ 'i' : 'INSERT',
            \ 'R' : 'REPLACE',
            \ 'Rv': 'V-Replace',
            \ 'c' : 'COMMAND',
            \ 't' : 'FZF',
            \}

" Left side
set statusline=
set statusline+=%#CtrlPMode2#
set statusline+=\ %{toupper(g:currentmode[mode()]).'\ '}
set statusline+=%#CtrlPMode1#
set statusline+=%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':''}
set statusline+=%#StatusLineNC#
set statusline+=\ %M
set statusline+=%y
set statusline+=\%t
" Right side
set statusline+=%=
set statusline+=%#TabLineSel#
set statusline+=\ %c:%l/%L
set statusline+=\ %{'\\'}
set statusline+=\ %p%%
set statusline+=\ %{'\\'}
set statusline+=\ [%n]

" Cool symbols!
"
