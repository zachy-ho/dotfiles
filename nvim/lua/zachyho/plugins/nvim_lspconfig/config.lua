local setup_lsp_handlers = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "🫠" },
		{ name = "DiagnosticSignWarn", text = "😑" },
		{ name = "DiagnosticSignHint", text = "🤔" },
		{ name = "DiagnosticSignInfo", text = "🤓" },
		{ name = "DiagnosticUnnecessary" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { text = sign.text, linehl = sign.linehl, numhl = "" })
	end

	local border = {
		{ "╭", "FloatBorder" },
		{ "─", "FloatBorder" },
		{ "╮", "FloatBorder" },
		{ "│", "FloatBorder" },
		{ "╯", "FloatBorder" },
		{ "─", "FloatBorder" },
		{ "╰", "FloatBorder" },
		{ "│", "FloatBorder" },
	}

	vim.diagnostic.config({
		virtual_text = true,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = border,
			source = "always",
			header = "",
			prefix = "",
		},
	})

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = border,
	})
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = border,
	})

	-- LspKind
	local lspkind = safe_require("lspkind")
	if lspkind then
		lspkind.init()
	end
end

local M = {}

M.setup = function()
	local lspconfig = safe_require("lspconfig")
	if not lspconfig then
		return
	end

	setup_lsp_handlers()

	local server_configs_factory = safe_require(local_paths.PLUGINS_DIR .. "nvim_lspconfig.server_config_factory")
	if server_configs_factory then
		local server_configs = server_configs_factory.create()
		for _, config in pairs(server_configs) do
			local server = config.get_server()
			local c = config.get_config()
			if server then
				server.setup(c)
			end
		end
	end
end

return M
