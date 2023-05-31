local lspconfig = safe_require("lspconfig")
if not lspconfig then
	return
end

local handlers = safe_require(constants.PLUGINS_DIR .. "nvim_lspconfig.handlers")

local common_on_attach = {}
local common_capabilities = {}
if handlers then
	handlers.setup()
	-- handlers.enable_format_on_save()
	common_on_attach = handlers.on_attach
	common_capabilities = handlers.capabilities
end

-- Set up null-ls
local null_ls = safe_require(constants.PLUGINS_DIR .. "nvim_lspconfig.null_ls.config")
if null_ls then
	null_ls.setup()
end

local server_configs = safe_require(constants.PLUGINS_DIR .. "nvim_lspconfig.server_configs")
if not server_configs then
	return
end

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

	-- Special case for typescript
	if server == "tsserver" then
		local typescript = safe_require("typescript")
		if typescript then
			-- Set the root_dir in canva/canva so there's only one tsserver client initialised
			if
				string.find(vim.fn.getcwd(), "work/canva") ~= nil
				or string.find(vim.fn.getcwd(), "work/canva2") ~= nil
			then
				config = vim.tbl_deep_extend("force", {
					cmd = { "typescript-language-server", "--stdio", "--log-level=4" },
					init_options = {
						hostInfo = "neovim",
						maxTsServerMemory = 8192,
					},
					root_dir = lspconfig.util.root_pattern("web.bzl"),
				}, config)
			end
			print("typesript setup")
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
