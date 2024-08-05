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

local has_work_dir = function()
	return vim.fn.isdirectory(os.getenv("HOME") .. "/work/canva/") == 1
end

local create_plugin_specs = function()
	---@type table List of Lua module names in the plugin directory, will be set up in order.
	local common_plugin_filenames = {
		"nvim_web_devicons",
		----- Start: This block MUST come before nvim-lspconfig! -----
		"mason",
		"mason_lspconfig",
		"neodev",
		----- End: This block MUST come before nvim-lspconfig! -----
		"nvim_lspconfig",
		"telescope",
		"telescope_fzf_native",
		"harpoon",
		"nvim_cmp",
		"nvim_tree",
		"oil",
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
		"sourcegraph",
		"trouble",
		"jester",
		-- "nvim_dap_ui",
		-- "neotest",

		----- low priority -----
		"vim_kitty",
		"easy_align",
		"markdown_preview",
		"smartcolumn",

		----- custom plugin -----
		"complex",
	}

	local plugin_filenames
	if has_work_dir() then
		plugin_filenames = table_utils.combine_lists(common_plugin_filenames, {
			"canva_dprint",
		})
	else
		plugin_filenames = common_plugin_filenames
	end

	local specs = {}
	for _, filename in ipairs(plugin_filenames) do
		local path = "zachyho.plugins." .. filename
		local spec = require(path)
		if spec then
			table.insert(specs, spec)
		end
	end

	return specs
end

require("lazy").setup(create_plugin_specs())
