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

lazy_pacman.setup({
	safe_require(constants.PLUGINS_DIR .. "plenary"),

	safe_require(constants.PLUGINS_DIR .. "colorscheme"),
	safe_require(constants.PLUGINS_DIR .. "lualine"),
	safe_require(constants.PLUGINS_DIR .. "autopairs"),
	safe_require(constants.PLUGINS_DIR .. "smartcolumn"),
	safe_require(constants.PLUGINS_DIR .. "indent_blankline"),
	safe_require(constants.PLUGINS_DIR .. "nvim_spider"),
	safe_require(constants.PLUGINS_DIR .. "nerdcommenter"),
	safe_require(constants.PLUGINS_DIR .. "markdown_preview"),
	safe_require(constants.PLUGINS_DIR .. "prettier"),
	safe_require(constants.PLUGINS_DIR .. "emmet"),
	safe_require(constants.PLUGINS_DIR .. "easy_align"),
	safe_require(constants.PLUGINS_DIR .. "nvim_surround"),
	safe_require(constants.PLUGINS_DIR .. "fugitive"),
	safe_require(constants.PLUGINS_DIR .. "git_conflict"),
	safe_require(constants.PLUGINS_DIR .. "fzf"),
	safe_require(constants.PLUGINS_DIR .. "vim_grepper"),

	----- These MUST come before nvim-lspconfig! -----
	safe_require(constants.PLUGINS_DIR .. "mason"),
	safe_require(constants.PLUGINS_DIR .. "mason_lspconfig"),
	safe_require(constants.PLUGINS_DIR .. "typescript"),
	safe_require(constants.PLUGINS_DIR .. "cmp_nvim_lsp"),
	safe_require(constants.PLUGINS_DIR .. "lspkind_nvim"),
	safe_require(constants.PLUGINS_DIR .. "nvim_lspconfig.null_ls"),

	safe_require(constants.PLUGINS_DIR .. "nvim_lspconfig"),
	safe_require(constants.PLUGINS_DIR .. "telescope"),
	safe_require(constants.PLUGINS_DIR .. "telescope_fzf_native"),
	safe_require(constants.PLUGINS_DIR .. "harpoon"),

	safe_require(constants.PLUGINS_DIR .. "vsnip.vim_vsnip"),
	safe_require(constants.PLUGINS_DIR .. "vsnip.cmp_vsnip"),
	safe_require(constants.PLUGINS_DIR .. "vsnip.vim_vsnip_integ"),
	safe_require(constants.PLUGINS_DIR .. "nvim_cmp"),
	safe_require(constants.PLUGINS_DIR .. "nvim_cmp.sources"),

	safe_require(constants.PLUGINS_DIR .. "nvim_treesitter"),
	safe_require(constants.PLUGINS_DIR .. "nvim_treesitter_context"),
	safe_require(constants.PLUGINS_DIR .. "nvim_treesitter.nvim_ts_rainbow"),

	safe_require(constants.PLUGINS_DIR .. "vim_kitty"),
})
