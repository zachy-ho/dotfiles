autocmd ColorScheme * call s:setup_org_colors()

function! s:setup_org_colors() abort
    hi link OrgHeadlineLevel1 PreProc
    hi link OrgHeadlineLevel2 PreProc
endfunction
