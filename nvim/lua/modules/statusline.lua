--> Status line <--
-- Stolen from: https://icyphox.sh/blog/nvim-lua/

local mode_map = {
    ['n'] = 'NORMAL',
    ['no'] = 'N-OPERATOR PENDING',
    ['v'] = 'VISUAL',
    ['V'] = 'V-LINE',
    [''] = 'V-BLOCK',
    ['s'] = 'SELECT',
    ['S'] = 'S-LINE',
    ['i'] = 'INSERT',
    ['R'] = 'REPLACE',
    ['Rv'] = 'V-REPLACE',
    ['c'] = 'COMMAND',
    ['cv'] = 'VIM EX',
    ['ce'] = 'EX',
    ['r'] = 'PROMPT',
    ['rm'] = 'MORE',
    ['r?'] = 'CONFIRM',
    ['!'] = 'SHELL',
    ['t'] = 'TERMINAL'
}

local function mode()
    local m = vim.api.nvim_get_mode().mode
    if mode_map[m] == nil then return m end
    return mode_map[m]
end

-- TODO: Double-check on deployment to see if anything is off!
local stl = {
    '%#GruvboxGreen#',
    mode(),
    ' ',
    '%#GruvboxBg4#',
    "%{fugitive#head()!=''?'  '.fugitive#head().' ':''}",
    '%#GruvboxBg4#',
    ' %M',
    '%y',
    '%t',
    '%=',
    '%#GruvboxBg4#',
    ' %c:%l/%L',
    " %{''}",
    ' %p%%',
    " %{''}",
    ' [%n]'
}

vim.o.statusline = table.concat(stl)

-- Cool symbols
-- 
