local cmp = require'cmp'

vim.o.completeopt = 'menu,menuone,noselect'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    mapping = {
        -- Read :h ins-completion first
        -- ['<Tab>'] = function(fallback)
            -- if cmp.visible() then
            -- if cmp.visible() then
                -- cmp.select_next_item()
            -- else
                -- fallback()
            -- end
        -- end,
        -- ['<S-Tab>'] = function(fallback)
            -- if cmp.visible() then
                -- cmp.select_prev_item()
            -- else
                -- fallback()
            -- end
        -- end,
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        -- Neovim builtin LSP client
        { name = 'nvim_lsp' },
        -- Vsnip
        { name = 'vsnip' },
        -- Neovim Lua API
        { name = 'nvim_lua' },
        -- Filesystem paths
        { name = 'path' },
        -- Buffer words
        { name = 'buffer' },
        -- Orgmode
        { name = 'orgmode' }
    },
})
