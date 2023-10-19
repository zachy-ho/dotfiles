--- lazy.nvim migration ---
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local lazy_pacman = safe_require("lazy")
if not lazy_pacman then
	return
end

local function require_plugin(path)
	return safe_require(local_paths.PLUGINS_DIR .. path)
end

lazy_pacman.setup({
	require_plugin("plenary"),

	require_plugin("colorscheme"),
	require_plugin("nvim_web_devicons"),
	require_plugin("lualine"),
	require_plugin("autopairs"),
	require_plugin("smartcolumn"),
	require_plugin("indent_blankline"),
	require_plugin("nvim_spider"),
	require_plugin("nerdcommenter"),
	require_plugin("markdown_preview"),
	require_plugin("prettier"),
	require_plugin("emmet"),
	require_plugin("easy_align"),
	require_plugin("nvim_surround"),
	require_plugin("fugitive"),
	require_plugin("git_conflict"),
	require_plugin("fzf_lua"),
	-- require_plugin("vim_grepper"),

	----- These MUST come before nvim-lspconfig! -----
	require_plugin("mason"),
	require_plugin("mason_lspconfig"),
	-- require_plugin("typescript"),
	require_plugin("typescript_tools"),
	require_plugin("cmp_nvim_lsp"),
	require_plugin("lspkind_nvim"),
	require_plugin("nvim_lspconfig.null_ls"),

	require_plugin("nvim_lspconfig"),
	require_plugin("telescope"),
	require_plugin("telescope_fzf_native"),
	require_plugin("harpoon"),

	require_plugin("vsnip.vim_vsnip"),
	require_plugin("vsnip.cmp_vsnip"),
	require_plugin("vsnip.vim_vsnip_integ"),
	require_plugin("nvim_cmp"),
	require_plugin("nvim_cmp.sources"),

	require_plugin("nvim_tree"),
	require_plugin("nvim_treesitter"),
	require_plugin("nvim_treesitter_context"),

	require_plugin("vim_kitty"),
})
