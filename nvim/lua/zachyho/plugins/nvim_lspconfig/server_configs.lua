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
	prismals = true,
	pyright = true,
	sumneko_lua = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
	tailwindcss = true,
	tsserver = true,
	vimls = true,
	yamlls = true,
}

return server_configs
