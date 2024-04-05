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

local is_work_laptop = function()
	return vim.fn.isdirectory("~/work/canva")
end

local create_plugin_specs = function()
	---@type table List of Lua module names in the plugin directory, will be set up in order.
	local common_plugin_filenames = {
		----- Plugins depended on by a few other plugins -----
		"plenary",

		"nvim_web_devicons",
		----- Start: This block MUST come before nvim-lspconfig! -----
		"mason",
		"mason_lspconfig",
		"neodev",
		"typescript_tools",
		"cmp_nvim_lsp",
		"lspkind_nvim",
		"nvim_lspconfig.null_ls",
		----- End: This block MUST come before nvim-lspconfig! -----
		"nvim_lspconfig",
		"telescope",
		"telescope_fzf_native",
		"harpoon",
		"vsnip",
		"nvim_cmp",
		"nvim_tree",
		"nvim_treesitter",
		"nvim_treesitter_context",

		----- helpful stuff -----
		"colorscheme",
		"lualine",
		"autopairs",
		"nvim_spider",
		"comment",
		"prettier",
		"nvim_surround",
		"fugitive",
		-- "git_conflict",
		"gitsigns",
		"fzf_lua",
		"vim_kitty",
		"sourcegraph",
		"trouble",

		----- low priority -----
		"easy_align",
		"markdown_preview",
		"smartcolumn",
		"emmet",

		----- custom plugin -----
		"complex",
	}

	local work_plugin_filenames = {
		"canva_dprint",
	}

	local plugin_filenames
	if is_work_laptop() then
		plugin_filenames = table_utils.combine_lists(common_plugin_filenames, work_plugin_filenames)
	else
		plugin_filenames = common_plugin_filenames
	end

	local specs = {}
	for _, filename in ipairs(plugin_filenames) do
		local path = "zachyho.plugins." .. filename
		local spec = safe_require(path)
		if spec then
			table.insert(specs, spec)
		end
	end

	return specs
end

require("lazy").setup(create_plugin_specs())
