local map = require('zachyho.utils').map

-- Expand
map({'i', 's'}, '<expr> <C-j>', "vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'", { noremap = false })

-- Expand or jump
map({'i', 's'}, '<expr> <C-l>', "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", { noremap = false })

-- Jump forward or backward
map({'i', 's'}, '<expr> <Tab>', "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'", { noremap = false })
map({'i', 's'}, '<expr> <S-Tab>', "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'", { noremap = false })

-- E.g. vsnip_filetypes.typescript = ['javascript'] means we can use js snippets in .ts files
vim.cmd([[
    let g:vsnip_filetypes = {}
    let g:vsnip_filetypes.javascriptreact = ['javascript']
    let g:vsnip_filetypes.typescriptreact = ['typescript', 'javascript']
    let g:vsnip_filetypes.typescript = ['javascript']
]])
