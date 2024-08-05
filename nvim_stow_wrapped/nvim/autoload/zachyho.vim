if !exists('zachyho#save_and_exec')
    function! zachyho#save_and_exec() abort
        if &filetype == 'vim'
            :silent! write
            :source %
        elseif &filetype == 'lua'
            :silent! write
            :luafile %
        endif

        return
    endfunction
endif
