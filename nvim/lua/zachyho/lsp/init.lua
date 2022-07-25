local lspconfig = safe_require("lspconfig")
if not lspconfig then
	return
end

local handlers = require("zachyho.lsp.handlers")

handlers.setup()
handlers.enable_format_on_save()

-- Set up null-ls
require("zachyho.lsp.null-ls").setup()

local common_on_attach = handlers.on_attach
local common_capabilities = handlers.capabilities

local server_configs = {
	bashls = true,
	cssls = true,
	cssmodules_ls = true,
	dockerls = true,
	emmet_ls = true,
	eslint = true,
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
	tsserver = {
		on_attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false
			-- Call the common_on_attach function whenever a server has its own on_attach
			common_on_attach(client, bufnr)
		end,
	},
	vimls = true,
	yamlls = true,
}

local servers = {}
for server, _c in pairs(server_configs) do
	table.insert(servers, server)
end

-- Mason
local mason = safe_require("mason")
if not mason then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- Mason lsp
local mason_lsp = safe_require("mason-lspconfig")
if not mason_lsp then
	return
end

mason_lsp.setup({
	ensure_installed = servers,
})

-- Setup each server
for server, config in pairs(server_configs) do
	if not config then
		return
	end

	if type(config) ~= "table" then
		config = {}
	end

	config = vim.tbl_deep_extend("force", {
		on_attach = common_on_attach,
		capabilities = common_capabilities,
	}, config)

	if server == "tsserver" then
		-- Special case for typescript
		local typescript = safe_require("typescript")
		if typescript then
			typescript.setup({
				disable_commands = false,
				debug = false,
				server = config,
			})
		end
	else
		lspconfig[server].setup(config)
	end
end
