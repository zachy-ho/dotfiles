vim.cmd([[
    function VimwikiDiaryBoilerplate()
        " File is today's diary
        if split(split(expand('%:r'),'/')[-1], '-')[-1] == strftime("%d")
            call append(0, ["# " . strftime("%A, %d %B %G"), "", "## todo", "- [ ] my",  "- [ ] tings",   "- [ ] today" ])
        elseif split(split(expand('%:r'),'/')[-1], '-')[-1] == string(str2nr(strftime('%d')) + 1)
        " File is tomorrow's diary
            call append(0, ['# ' . strftime('%A, %d %B %G', localtime() + (24 * 3600)), '', '## todo', '- [ ] my',  '- [ ] tings',   '- [ ] today' ])
        endif
        " Ignore all other days
    endfunction

    au BufNewFile ~/zachyho-gits/vimwiki/diary/*.md call VimwikiDiaryBoilerplate()
]])
