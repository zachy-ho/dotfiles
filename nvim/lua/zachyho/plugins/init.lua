-- Automatically sources this file and runs 'PackerSync' whenever we write to this file
-- vim.cmd([[
-- augroup Packer
-- autocmd!
-- autocmd BufWritePost ~/.config/dotfiles/nvim/lua/zachyho/plugins.lua source <afile> | PackerSync
-- augroup end
-- ]])

-- If not using the autocmd above, whenever a change is made on this file:
-- 1. Write this file
-- 2. Source/execute it
-- 3. Run ':PackerSync'

--------------- Packer & plugins ---------------
-- Eager-loaded plugins are put at the top of the startup function
-- The rest are lazy-loaded and organised to be loaded under certain conditions.
-- Conditions include:
-- -> ft = load if filetype of buffer is in the provided list of filetypes.
-- -> event = load on this event. See `:h events`.
-- -> keys = load if any of the specified keymaps are executed.
-- -> after = load after specified plugin(s) have loaded.
------------------------------------------------

local packer = safe_require("packer")
if not packer then
	return
end

local packer_util = safe_require("packer.util")
local open_fn
if packer_util then
	open_fn = packer_util.float
end

return packer.startup({
	function(use)
		-- Packer manages itself
		use("wbthomason/packer.nvim")

		---------- Eager-loaded plugins ----------
		-- Colorscheme
		use(safe_require(constants.PLUGINS_DIR .. "colorscheme"))

		-- Indent guides
		use(safe_require(constants.PLUGINS_DIR .. "indent_guides"))

		-- Fugitive: Git operations within vim
		use(safe_require(constants.PLUGINS_DIR .. "fugitive"))

		-- Fzf: Fuzzy finder
		use(safe_require(constants.PLUGINS_DIR .. "fzf"))

		-- Grepper: Makes grepping shit and putting them in quickfix lists so easy
		use(safe_require(constants.PLUGINS_DIR .. "vim_grepper"))

		-- Nerdcommenter: Commenting shortcuts
		use(safe_require(constants.PLUGINS_DIR .. "nerdcommenter"))
		---------- Eager-loaded plugins end ----------

		---------- Lazy-loaded plugins ----------
		-- Vimwiki
		use(safe_require(constants.PLUGINS_DIR .. "vimwiki"))

		-- Lualine
		use(safe_require(constants.PLUGINS_DIR .. "lualine"))

		-- Goyo for Zen mode
		use(safe_require(constants.PLUGINS_DIR .. "goyo"))

		-- Hexokinase: Previews color whenever color (e.g. hex) is used
		use(safe_require(constants.PLUGINS_DIR .. "hexokinase"))

		-- Nvim-tree: Tree-style navigator
		use(safe_require(constants.PLUGINS_DIR .. "nvim_tree"))

		-- Native-lsp: Neovim native Language Server Protocols
		-- TODO reorganise this and lsp/
		use(safe_require(constants.PLUGINS_DIR .. "nvim_lspconfig"))

		----- Cmp family -----
		-- nvim-cmp
		use(safe_require(constants.PLUGINS_DIR .. "nvim_cmp"))

		-- completion sources
		-- NOTE: cmp-nvim-lsp is installed above together with nvim-lspconfig
		local cmp_sources = safe_require(constants.PLUGINS_DIR .. "nvim_cmp.sources")
		if cmp_sources then
			use(cmp_sources.cmp_buffer)
			use(cmp_sources.cmp_path)
			use(cmp_sources.cmp_nvim_lua)
		end

		-- Autopairs: For pairs like '', "", (), {}, []. Works with nvim-cmp
		use(safe_require(constants.PLUGINS_DIR .. "autopairs"))
		----- Cmp family End -----

		-- Telescope
		-- TODO make telescope entire config exportable and require in harpoon loading
		use(safe_require(constants.PLUGINS_DIR .. "telescope"))

		-- Harpoon: File marking to jump back and forth more quickly
		use(safe_require(constants.PLUGINS_DIR .. "harpoon"))

		-- Treesitter
		use(safe_require(constants.PLUGINS_DIR .. "treesitter"))

		-- Treesitter rainbow brackets
		local rainbow = safe_require(constants.PLUGINS_DIR .. "treesitter.nvim_ts_rainbow")
		if rainbow then
			use(rainbow.plugin)
		end

		-- Undotree: Undo and redo
		use(safe_require(constants.PLUGINS_DIR .. "undotree"))

		-- Headlines highlighting
		use(safe_require(constants.PLUGINS_DIR .. "headlines"))

		-- Markdown-preview
		use(safe_require(constants.PLUGINS_DIR .. "markdown_preview"))

		-- Prettier
		use(safe_require(constants.PLUGINS_DIR .. "prettier"))

		-- Emmet: HTML templating
		use(safe_require(constants.PLUGINS_DIR .. "emmet"))

		-- Easy align: Aligning things to look pretty
		use(safe_require(constants.PLUGINS_DIR .. "easy_align"))

		-- Surround: Wrapping stuff in brackets and tings
		use(safe_require(constants.PLUGINS_DIR .. "vim_surround"))

		---------- Lazy-loaded plugins end ----------

		----- Plugin graveyard -----
		-- Bufferline
		-- use({
		-- "akinsho/bufferline.nvim",
		-- requires = "kyazdani42/nvim-web-devicons",
		-- })

		-- Vsnip and snippets: Snippets for fast coding
		-- use({
		-- "hrsh7th/cmp-vsnip",
		-- "hrsh7th/vim-vsnip",
		-- "hrsh7th/vim-vsnip-integ",
		-- "rafamadriz/friendly-snippets",
		-- })

		-- Limelight
		-- use({ "junegunn/limelight.vim", })

		-- Lsp-Signature
		-- use({
		-- "ray-x/lsp_signature.nvim",
		-- })

		-- Treesitter-playground
		-- use({
		-- "nvim-treesitter/playground",
		-- requires = "nvim-treesitter/nvim-treesitter",
		-- })
	end,
	config = {
		display = {
			open_fn,
		},
	},
})
