local server_configs = {
	bashls = true,
	cssls = true,
	cssmodules_ls = true,
	dockerls = true,
	emmet_ls = true,
	-- eslint = true,
	graphql = true,
	html = true,
	jdtls = true,
	jsonls = true,
	lua_ls = {
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	},
	prismals = true,
	pyright = true,
	tailwindcss = true,
	tsserver = true,
	vimls = true,
	yamlls = true,
}

return server_configs
