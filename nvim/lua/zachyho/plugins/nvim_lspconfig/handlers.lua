local M = {}

M.setup = function()
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

function M.on_attach(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true, buffer = 0 }
	local function set_buf_keymap(lhs, rhs)
		vim.keymap.set("n", lhs, rhs, opts)
	end

	-- Key-bindings
	set_buf_keymap(",gD", vim.lsp.buf.declaration)
	set_buf_keymap(",gd", vim.lsp.buf.definition)
	set_buf_keymap(",gt", vim.lsp.buf.type_definition)
	set_buf_keymap(",gi", vim.lsp.buf.implementation)
	set_buf_keymap(",gh", vim.lsp.buf.signature_help)
	set_buf_keymap("K", vim.lsp.buf.hover)
	set_buf_keymap(",ca", vim.lsp.buf.code_action)
	set_buf_keymap(",rn", vim.lsp.buf.rename)
	set_buf_keymap(",gr", vim.lsp.buf.references)
	set_buf_keymap(",fm", function()
		vim.lsp.buf.format({
			async = false,
			timeout_ms = 5000,
			name = "null-ls",
		})
	end)
	set_buf_keymap(",ds", vim.diagnostic.open_float)
	set_buf_keymap(",dp", vim.diagnostic.goto_prev)
	set_buf_keymap(",dn", vim.diagnostic.goto_next)
	set_buf_keymap(",dl", function()
		vim.diagnostic.setloclist({ open_loclist = true })
		vim.cmd([[:setlocal wrap]])
	end)
end

local capabilities = nil
local cmp_nvim_lsp = safe_require("cmp_nvim_lsp")
if cmp_nvim_lsp then
	capabilities = cmp_nvim_lsp.default_capabilities({
		snippetSupport = false,
	})
end
M.capabilities = capabilities

-- function M.enable_format_on_save()
-- vim.cmd([[
-- augroup format_on_save
-- au!
-- au BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 5000)
-- augroup end
-- ]])
-- end

-- function M.toggle_format_on_save()
-- if vim.fn.exists("#format_on_save#BufWritePre") == 0 then
-- M.enable_format_on_save()
-- vim.notify("Enabled format on save")
-- else
-- vim.cmd("au! format_on_save")
-- vim.notify("Disabled format on save")
-- end
-- end

-- -- TODO fix this bugged command
-- vim.cmd([[command! LspToggleAutoFormat execute 'lua require("modules.config.lsp.handlers").toggle_format_on_save()']])

return M
