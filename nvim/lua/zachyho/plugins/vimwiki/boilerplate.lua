vim.cmd([[
    function GetLastDayOfMonth(month)
        let month = a:month
        if month == '1'
            return '31'
        elseif month == '2'
            if str2nr(strftime("%y")) % 4 == 0
                return '29'
            endif
            return '28'
        elseif month == '3'
            return '31'
        elseif month == '4'
            return '30'
        elseif month == '5'
            return '31'
        elseif month == '6'
            return '30'
        elseif month == '7'
            return '31'
        elseif month == '8'
            return '31'
        elseif month == '9'
            return '30'
        elseif month == '10'
            return '31'
        elseif month == '11'
            return '30'
        elseif month == '12'
            return '31'
        endif
    endfunction

    function VimwikiDiaryBoilerplate()
        " 'normalized' means that the strings are single-digit if the dates are single-digit
        let filename_day = split(split(expand('%:r'),'/')[-1], '-')[-1]
        let filename_day_normalized = string(str2nr(filename_day))
        let today_day_normalized = string(str2nr(strftime("%d")))
        if GetLastDayOfMonth(strftime("%m")) == str2nr(today_day_normalized)
            let tomorrow_day_normalized = "1"
        else
            let tomorrow_day_normalized = string(str2nr(strftime('%d')) + 1)
        endif

        " File is today's diary
        if filename_day_normalized == today_day_normalized
            let date = "# " . strftime("%A, %d %B %G")
        elseif filename_day_normalized == tomorrow_day_normalized
        " File is tomorrow's diary
            let date = "# " . strftime("%A, %d %B %G", localtime() + (24 * 3600))
        else
            echo "date is undefined :("
            let date = "# <insert date here>"
        endif
        " Ignore all other days
        call append(0, [date, '', '## todo', '- [ ] monkaS', '- [ ] giga', '- [ ] kekw', '', '## growth', 'Today, I...', '', '## rate ur day', 'mood - x/10', 'productivity - x/10', 'slep hrs - x/8', 'slep quality - x/10', 'kofefes - x'])
    endfunction

    au BufNewFile ~/vimwiki/diary/*.md call VimwikiDiaryBoilerplate()
]])
