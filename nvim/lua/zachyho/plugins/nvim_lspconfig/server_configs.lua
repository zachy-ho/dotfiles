return {
	bashls = true,
	bufls = true,
	cssls = true,
	cssmodules_ls = true,
	dockerls = true,
	emmet_ls = true,
	-- eslint = true,
	graphql = true,
	html = true,
	jdtls = true,
	jsonls = true,
	kotlin_language_server = true,
	lua_ls = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				builtin = "enable",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					vim.env.VIMRUNTIME,
				},
				-- https://github.com/neovim/nvim-lspconfig/issues/1700#issuecomment-1033127328
				checkThirdParty = false,
			},
		},
	},
	prismals = true,
	pyright = true,
	-- tailwindcss = true,
	tsserver = "custom", -- We don't want the built-in typescript-language-server
	vimls = true,
	yamlls = true,
}
