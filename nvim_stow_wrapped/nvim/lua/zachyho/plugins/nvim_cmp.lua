return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"nvim-lspconfig",
			"onsails/lspkind-nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp", -- optional
			},
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			vim.o.completeopt = "menu,menuone,noselect"

			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{
						name = "nvim_lsp",
						-- Remove snippets from completion sources because I don't use them and they're annoying me
						entry_filter = function(entry, ctx)
							return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
						end,
					},
					{ name = "nvim_lua" },
					{ name = "lazydev", group_index = 0 },
					{ name = "path" },
					{ name = "buffer" },
				}),
				formatting = {
					format = lspkind.cmp_format({ with_text = true, maxwidth = 50 }),
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				-- NOTE: A snippet engine MUST be specified
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
			})
		end,
	},
}
