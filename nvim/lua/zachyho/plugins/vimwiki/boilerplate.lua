vim.cmd([[
    function VimwikiDiaryBoilerplate()
        " 'normalized' means that the strings are single-digit if the dates are single-digit
        let filename_day = split(split(expand('%:r'),'/')[-1], '-')[-1]
        let filename_day_normalized = string(str2nr(filename_day))
        let today_day = string(str2nr(strftime("%d")))
        let today_day_normalized = string(str2nr(strftime("%d")))
        let tomorrow_day_normalized = string(str2nr(strftime('%d')) + 1)

        " File is today's diary
        if filename_day_normalized == today_day_normalized
            let date = "# " . strftime("%A, %d %B %G")
        elseif filename_day_normalized == tomorrow_day_normalized
        " File is tomorrow's diary
            let date = "# " . strftime("%A, %d %B %G", localtime() + (24 * 3600))
        else
            echo "Vimwiki boilerplating didn't happen for some reason"
        endif
        " Ignore all other days
        call append(0, [date, '', '## todo', '- [ ] my', '- [ ] tings', '- [ ] today', '', '## growth', 'Today, I...' ])
    endfunction

    au BufNewFile ~/vimwiki/diary/*.md call VimwikiDiaryBoilerplate()
]])
