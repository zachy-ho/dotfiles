return {
    {
        "hrsh7th/vim-vsnip",
        config = function()
            -- Expand
            map(
                { "i", "s" },
                "<C-j>",
                "vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'",
                { noremap = false, expr = true }
            )

            -- Expand or jump
            map(
                { "i", "s" },
                "<C-l>",
                "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'",
                { noremap = false, expr = true }
            )

            -- Jump forward or backward
            map(
                { "i", "s" },
                "<Tab>",
                "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'",
                { noremap = false, expr = true }
            )
            map(
                { "i", "s" },
                "<S-Tab>",
                "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'",
                { noremap = false, expr = true }
            )

            -- E.g. vsnip_filetypes.typescript = ['javascript'] means we can use js snippets in .ts files
            vim.cmd([[
            let g:vsnip_snippet_dir = expand('$HOME/.config/dotfiles/nvim/vsnip/.vsnip')
            let g:vsnip_filetypes = {}
            let g:vsnip_filetypes.javascriptreact = ['javascript']
            let g:vsnip_filetypes.typescriptreact = ['typescript', 'javascript']
            let g:vsnip_filetypes.typescript = ['javascript']
        ]])
        end,
    },
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip-integ",
}
