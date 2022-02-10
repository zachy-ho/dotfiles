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

local servers = {
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
			local ts_utils = safe_require("nvim-lsp-ts-utils")
			if ts_utils then
				ts_utils.setup({
					enable_import_on_completion = true,
					import_all_timeout = 5000, -- ms
					always_organize_imports = true,
				})

				ts_utils.setup_client(client)
			end

			-- Call the common_on_attach function whenever a server has its own on_attach
			common_on_attach(client, bufnr)
		end,
	},
	vimls = true,
	yamlls = true,
}

-- Lsp-installer
local lsp_installer = safe_require("nvim-lsp-installer")
if not lsp_installer then
	return
end

-- Install each of the servers defined in the table above
for server_name, _config in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(server_name)
	if server_is_found and not server:is_installed() then
		server:install()
	end
end

-- Set up each server after install
lsp_installer.on_server_ready(function(server)
	local config = servers[server.name]

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

	server:setup(config)
end)
