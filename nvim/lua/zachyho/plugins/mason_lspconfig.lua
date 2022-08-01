return {
	"williamboman/mason-lspconfig.nvim",
	requires = "williamboman/mason.nvim",
	config = function()
		-- Mason lsp
		local mason_lsp = safe_require("mason-lspconfig")
		if not mason_lsp then
			return
		end

		local table_utils = safe_require("zachyho.table_utils")
		local server_configs = safe_require(constants.PLUGINS_DIR .. "nvim_lspconfig.server_configs")
		local ensure_installed = {}
		if server_configs and table_utils then
			ensure_installed = table_utils.get_keys(server_configs)
		end
		if table_utils then
			mason_lsp.setup({
				ensure_installed,
			})
		end
	end,
}
