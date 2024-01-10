local lspconfig = safe_require("lspconfig")
if not lspconfig then
	return
end

local handlers = safe_require(local_paths.PLUGINS_DIR .. "nvim_lspconfig.handlers")

local common_on_attach = {}
local common_capabilities = {}
if handlers then
	handlers.setup()
	common_on_attach = handlers.on_attach
	common_capabilities = handlers.capabilities
end

-- Set up null-ls
local null_ls = safe_require(local_paths.PLUGINS_DIR .. "nvim_lspconfig.null_ls.config")
if null_ls then
	null_ls.setup(common_on_attach)
end

local canva_null_ls = safe_require(local_paths.WORK_PLUGINS_DIR .. "null_ls.config")
if canva_null_ls then
	canva_null_ls.setup()
end

local configs = safe_require(local_paths.PLUGINS_DIR .. "nvim_lspconfig.server_configs")
if not configs then
	return
end

-- Setup each server
for server, config in pairs(configs) do
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
		local typescript_tools = safe_require("typescript-tools")
		if typescript_tools then
			-- Set the root_dir in canva/canva so there's only one tsserver client initialised
			if
				string.find(vim.fn.getcwd(), "work/canva") ~= nil
				or string.find(vim.fn.getcwd(), "work/canva2") ~= nil
			then
				config = vim.tbl_deep_extend("force", {
					init_options = {
						hostInfo = "neovim",
						maxTsServerMemory = 8192,
					},
					root_dir = lspconfig.util.root_pattern("shell.nix", "package.json"),
				}, config)
			end
			typescript_tools.setup(config)
		end
	else
		if server == "lua_ls" then
			lspconfig[server].setup({
				on_init = function(client)
					local path = client.workspace_folders[1].name
					if not vim.loop.fs_stat(path .. "/.luarc.json") then
						client.config.settings = vim.tbl_deep_extend("force", client.config.settings, config)
						client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
					end
					return true
				end,
			})
		else
			lspconfig[server].setup(config)
		end
	end
end
