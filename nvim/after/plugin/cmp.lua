local cmp = require("cmp")
local lspkind = require("lspkind")

vim.o.completeopt = "menu,menuone,noselect"

cmp.setup({
	-- NOTE: A snippet engine MUST be specified (currently vsnip)
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
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
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	sources = cmp.config.sources({
		-- Neovim builtin LSP client
		{ name = "nvim_lsp" },
		-- Vsnip
		{ name = "vsnip" },
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
