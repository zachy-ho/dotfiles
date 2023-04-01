return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"nvim-lspconfig",
		"cmp-vsnip",
		"vim-vsnip",
		"vim-vsnip-integ",
	},
	config = function()
		-- E.g. vsnip_filetypes.typescript = ['javascript'] means we can use js snippets in .ts files
		vim.cmd([[
            let g:vsnip_snippet_dir = expand('$HOME/.config/dotfiles/nvim/vsnip/.vsnip')
            let g:vsnip_filetypes = {}
            let g:vsnip_filetypes.javascriptreact = ['javascript']
            let g:vsnip_filetypes.typescriptreact = ['typescript', 'javascript']
            let g:vsnip_filetypes.typescript = ['javascript']
        ]])
		local cmp = safe_require("cmp")
		if not cmp then
			return
		end

		local lspkind = safe_require("lspkind")
		if not lspkind then
			return
		end

		vim.o.completeopt = "menu,menuone,noselect"

		cmp.setup({
			-- NOTE: A snippet engine MUST be specified (currently vsnip)
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = cmp.config.sources({
				-- Neovim builtin LSP client
				{
					name = "nvim_lsp",
					entry_filter = function(entry)
						-- Fuck snippets. They pollute my autocompletions
						-- See :h nvim-cmp 'entry_filter'
						return cmp.lsp.CompletionItemKind[entry:get_kind()] ~= "Snippet"
					end,
				},
				-- Vsnip
				-- { name = "vsnip" },
				-- Neovim Lua API
				{ name = "nvim_lua" },
				-- Filesystem paths
				{ name = "path" },
				-- Buffer words
				{ name = "buffer" },
			}),
			formatting = {
				format = lspkind.cmp_format({ with_text = true, maxwidth = 50 }),
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})
	end,
}
