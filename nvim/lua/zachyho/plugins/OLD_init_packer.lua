-- Autocmd: Automatically sources this file and runs 'PackerSync' whenever we write to this file
-- vim.cmd([[
-- augroup Packer
-- autocmd!
-- autocmd BufWritePost ~/.config/dotfiles/nvim/lua/zachyho/plugins.lua source <afile> | PackerSync
-- augroup end
-- ]])

-- If not using the autocmd above, whenever a change is made on this file:
-- 1. Write this file.
-- 2. Source/execute it.
-- 3. Run ':PackerCompile' if not making changes to plugin installs. Run ':PackerSync' otherwise.
-- 4. Might need to run `:PackerCompile` a second time as there could be errors the first time that
-- would go away after a second execution.

--------------- Packer & plugins ---------------
-- Eager-loaded plugins are put at the top of the startup function
-- The rest are lazy-loaded and organised to be loaded under certain conditions.
-- Conditions include:
-- -> ft = load if filetype of buffer is in the provided list of filetypes.
-- -> event = load on this event. See `:h events`.
-- -> keys = load if any of the specified keymaps are executed.
-- -> after = load after specified plugin(s) have loaded.
------------------------------------------------

-- Need to manually set this env value to make enable Luarocks to install rocks
-- see: https://github.com/wbthomason/packer.nvim/issues/180
-- vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "12.5.1")

local packer = safe_require("packer")
if not packer then
	return
end

local packer_util = safe_require("packer.util")
local open_fn
if packer_util then
	open_fn = packer_util.float
end

packer.init({
	luarocks = {
		python_cmd = "python3",
	},
})

packer.startup({
	function(use)
		-- Packer manages itself
		use("wbthomason/packer.nvim")

		-- Make me fast PLEASE
		use("lewis6991/impatient.nvim")

		use("dstein64/vim-startuptime")

		---------- Eager-loaded plugins ----------

		use("nvim-lua/plenary.nvim")

		-- Colorscheme
		use(safe_require(local_paths.PLUGINS_DIR .. "colorscheme"))

		-- Fugitive: Git operations within vim
		use(safe_require(local_paths.PLUGINS_DIR .. "fugitive"))

		-- Git conflicts (because Fugitive's one is too slow for big repos)
		use(safe_require(local_paths.PLUGINS_DIR .. "git_conflict"))

		-- Fzf: Fuzzy finder
		use(safe_require(local_paths.PLUGINS_DIR .. "fzf"))

		----- These below MUST come before nvim-lspconfig! -----
		-- Mason: The big manager
		use(safe_require(local_paths.PLUGINS_DIR .. "mason"))

		-- Mason-lspconfig: The lspconfig manager
		use(safe_require(local_paths.PLUGINS_DIR .. "mason_lspconfig"))

		-- Typescript add-ons
		use(safe_require(local_paths.PLUGINS_DIR .. "typescript"))

		-- Completion source for nvim-lsp. Required in LSP handlers.
		use(safe_require(local_paths.PLUGINS_DIR .. "cmp_nvim_lsp"))

		-- Lspkind: Cute logos for LSP
		use(safe_require(local_paths.PLUGINS_DIR .. "lspkind_nvim"))

		-- Null-ls
		use(safe_require(local_paths.PLUGINS_DIR .. "nvim_lspconfig.null_ls"))
		----- The above MUST come before nvim-lspconfig

		-- Native-lsp: Neovim native Language Server Protocols
		use(safe_require(local_paths.PLUGINS_DIR .. "nvim_lspconfig"))

		-- Harpoon: File marking to jump back and forth more quickly
		use(safe_require(local_paths.PLUGINS_DIR .. "harpoon"))

		----- Telescope family (should be loaded in order)
		-- Telescope-fzf-native (for sorting performance)
		use(safe_require(local_paths.PLUGINS_DIR .. "telescope_fzf_native"))

		-- Telescope
		use(safe_require(local_paths.PLUGINS_DIR .. "telescope"))
		----- Telescope family end -----

		----- Cmp family -----
		-- Vsnip and snippets
		use(safe_require(local_paths.PLUGINS_DIR .. "vsnip.vim_vsnip"))
		use(safe_require(local_paths.PLUGINS_DIR .. "vsnip.cmp_vsnip"))
		use(safe_require(local_paths.PLUGINS_DIR .. "vsnip.vim_vsnip_integ"))

		-- nvim-cmp
		use(safe_require(local_paths.PLUGINS_DIR .. "nvim_cmp"))

		-- completion sources
		-- NOTE: cmp-nvim-lsp is installed above together with nvim-lspconfig
		local cmp_sources = safe_require(local_paths.PLUGINS_DIR .. "nvim_cmp.sources")
		if cmp_sources then
			use(cmp_sources.cmp_buffer)
			use(cmp_sources.cmp_path)
			use(cmp_sources.cmp_nvim_lua)
		end

		-- Autopairs: For pairs like '', "", (), {}, []. Works with nvim-cmp
		use(safe_require(local_paths.PLUGINS_DIR .. "autopairs"))
		----- Cmp family End -----

		-- true-zen: Focused (lazy-loading causes statusline to still show)
		use(safe_require(local_paths.PLUGINS_DIR .. "true_zen"))

		-- smartcolumn
		use(safe_require(local_paths.PLUGINS_DIR .. "smartcolumn"))

		-- Indent guides
		use(safe_require(local_paths.PLUGINS_DIR .. "indent_blankline"))

		-- Spider (makes w, e, b more intuitive)
		use(safe_require(local_paths.PLUGINS_DIR .. "nvim_spider"))

		---------- Eager-loaded plugins end ----------

		---------- Lazy-loaded plugins ----------
		-- Grepper: Makes grepping shit and putting them in quickfix lists so easy
		use(safe_require(local_paths.PLUGINS_DIR .. "vim_grepper"))

		-- Nerdcommenter: Commenting shortcuts
		use(safe_require(local_paths.PLUGINS_DIR .. "nerdcommenter"))

		use(safe_require(local_paths.PLUGINS_DIR .. "nvim_web_devicons"))

		-- Lualine
		use(safe_require(local_paths.PLUGINS_DIR .. "lualine"))

		-- Nvim-tree: Tree-style navigator
		use(safe_require(local_paths.PLUGINS_DIR .. "nvim_tree"))

		-- Treesitter
		use(safe_require(local_paths.PLUGINS_DIR .. "nvim_treesitter"))

		-- Treesitter
		use(safe_require(local_paths.PLUGINS_DIR .. "nvim_treesitter_context"))

		-- Markdown-preview
		use(safe_require(local_paths.PLUGINS_DIR .. "markdown_preview"))

		-- Prettier
		use(safe_require(local_paths.PLUGINS_DIR .. "prettier"))

		-- Emmet: HTML templating
		use(safe_require(local_paths.PLUGINS_DIR .. "emmet"))

		-- Easy align: Aligning things to look pretty
		use(safe_require(local_paths.PLUGINS_DIR .. "easy_align"))

		-- Surround: Wrapping stuff in brackets and tings
		use(safe_require(local_paths.PLUGINS_DIR .. "nvim_surround"))

		---------- Lazy-loaded plugins end ----------

		----- Plugin graveyard -----

		-- Hexokinase: Previews color whenever color (e.g. hex) is used
		-- use(safe_require(local_paths.PLUGINS_DIR .. "hexokinase"))

		-- Vimwiki
		-- use(safe_require(local_paths.PLUGINS_DIR .. "vimwiki"))
		-- use(safe_require(local_paths.PLUGINS_DIR .. "vim_zettel"))

		-- Undotree: Undo and redo
		-- use(safe_require(local_paths.PLUGINS_DIR .. "undotree"))

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
		profile = {
			enable = true,
			threshold = 1,
		},
		display = {
			open_fn,
		},
	},
})
