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

local configs = safe_require(local_paths.PLUGINS_DIR .. "nvim_lspconfig.server_configs")
if not configs then
	return
end

-- Setup each server
for server, config in pairs(configs) do
	if not config then
		return
	end

	local setup_server = (function()
		if server == "tsserver" then
			local typescript_tools = safe_require("typescript-tools")
			assert(typescript_tools)
			return typescript_tools.setup
		end

		if server == "null_ls" then
			local null_ls = safe_require("null-ls")
			assert(null_ls)
			return null_ls.setup
		end

		return lspconfig[server].setup
	end)()

	local parsed_config = (function()
		if server == "tsserver" then
			local typescript_tools = safe_require("typescript-tools")
			if typescript_tools then
				-- Set the root_dir in canva/canva so there's only one tsserver client initialised
				if
					string.find(vim.fn.getcwd(), "work/canva") ~= nil
					or string.find(vim.fn.getcwd(), "work/canva2") ~= nil
				then
					return {
						on_attach = common_on_attach,
						capabilities = common_capabilities,
						init_options = {
							hostInfo = "neovim",
							maxTsServerMemory = 8192,
						},
						root_dir = lspconfig.util.root_pattern("shell.nix", "package.json"),
					}
				end
			end

			return {
				on_attach = common_on_attach,
				capabilities = common_capabilities,
			}
		end

		if server == "lua_ls" then
			return {
				on_init = function(client)
					local path = client.workspace_folders[1].name
					if not vim.loop.fs_stat(path .. "/.luarc.json") then
						client.config.settings.on_attach = common_on_attach
						client.config.settings.capabilities = common_capabilities
						client.config.settings.Lua = config.Lua
						client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
					end
					return true
				end,
			}
		end
		if type(config) == "table" then
			return config
		end

		if type(config) == "boolean" then
			return {
				on_attach = common_on_attach,
				capabilities = common_capabilities,
			}
		end

		-- It's null-lsp
		assert(server == "null_ls")
		return config(common_on_attach)
	end)()

	local ok, result = pcall(setup_server, parsed_config)
	if not ok then
		P(result)
	end
end
