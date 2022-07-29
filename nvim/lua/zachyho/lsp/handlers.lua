local M = {}

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
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
	require("lspkind").init()
end

function M.on_attach(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }
	local function buf_map(lhs, rhs)
		vim.api.nvim_buf_set_keymap(bufnr, "n", lhs, rhs, opts)
	end

	-- Key-bindings
	buf_map(",gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
	buf_map(",gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
	buf_map(",gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
	buf_map(",gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
	buf_map(",gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	buf_map("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
	buf_map(",ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
	buf_map(",rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
	buf_map(",gr", "<cmd>lua vim.lsp.buf.references()<CR>")
	buf_map(",fm", "<cmd>lua vim.lsp.buf.formatting()<CR>")
	buf_map(",ds", "<cmd>lua vim.diagnostic.open_float()<CR>")
	buf_map(",dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
	buf_map(",dn", "<cmd>lua vim.diagnostic.goto_next()<CR>")
	buf_map(",dl", [[ <cmd>lua vim.diagnostic.setloclist({open_loclist=true})<CR> <bar> :setlocal wrap<CR>]])

	-- Attach lsp-signature to every server
	-- local lsp_signature = safe_require("lsp_signature")
	-- if lsp_signature then
	-- lsp_signature.on_attach()
	-- end

	-- Let null-ls do all formatting
	if client.name ~= "null-ls" then
		client.resolved_capabilities.document_formatting = false
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}
local cmp_nvim_lsp = safe_require("cmp_nvim_lsp")
if cmp_nvim_lsp then
	capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end
M.capabilities = capabilities

function M.enable_format_on_save()
	vim.cmd([[
        augroup format_on_save
            au!
            au BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 5000)
        augroup end
    ]])
end

function M.toggle_format_on_save()
	if vim.fn.exists("#format_on_save#BufWritePre") == 0 then
		M.enable_format_on_save()
		vim.notify("Enabled format on save")
	else
		vim.cmd("au! format_on_save")
		vim.notify("Disabled format on save")
	end
end

-- TODO fix this bugged command
vim.cmd([[command! LspToggleAutoFormat execute 'lua require("modules.config.lsp.handlers").toggle_format_on_save()']])

return M
