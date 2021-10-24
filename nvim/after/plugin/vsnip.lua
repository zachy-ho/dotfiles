local map = require('zachyho.utils').map

-- Expand
map({'i', 's'}, '<expr> <C-j>', "vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'", { noremap = false })

-- Expand or jump
map({'i', 's'}, '<expr> <C-l>', "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", { noremap = false })

-- Jump forward or backward
map({'i', 's'}, '<expr> <Tab>', "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'", { noremap = false })
map({'i', 's'}, '<expr> <S-Tab>', "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'", { noremap = false })
