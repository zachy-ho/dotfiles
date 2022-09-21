vim.cmd([[
    function VimwikiDiaryBoilerplate()
        " File is today's diary
        if split(split(expand('%:r'),'/')[-1], '-')[-1] == strftime("%d")
            let date = "# " . strftime("%A, %d %B %G")
        elseif split(split(expand('%:r'),'/')[-1], '-')[-1] == string(str2nr(strftime('%d')) + 1)
        " File is tomorrow's diary
            let date = "# " . strftime("%A, %d %B %G", localtime() + (24 * 3600))
        endif
        " Ignore all other days
            call append(0, [date, '', '## todo', '- [ ] my',  '- [ ] tings',   '- [ ] today', '', '## growth', 'Today, I...' ])
    endfunction

    au BufNewFile ~/zachyho-gits/vimwiki/diary/*.md call VimwikiDiaryBoilerplate()
]])
