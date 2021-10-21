local cmp = require'cmp'

vim.o.completeopt = 'menu,menuone,noselect'

cmp.setup({
    mapping = {
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end
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
    },
})
