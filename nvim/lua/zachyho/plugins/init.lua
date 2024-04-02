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

local create_plugin_specs = function()
	---@type table List of Lua module names in the plugin directory, will be set up in order.
	local plugin_filenames = {
		"plenary",
		"colorscheme",
		"nvim_web_devicons",
		"lualine",
		"autopairs",
		"smartcolumn",
		"nvim_spider",
		"nerdcommenter",
		"markdown_preview",
		"prettier",
		"emmet",
		"easy_align",
		"nvim_surround",
		"fugitive",
		"git_conflict",
		"gitsigns",
		"fzf_lua",

		----- This block MUST come before nvim-lspconfig! -----
		"mason",
		"mason_lspconfig",
		"neodev",
		"typescript_tools",
		"cmp_nvim_lsp",
		"lspkind_nvim",
		"nvim_lspconfig.null_ls",
		----- This block MUST come before nvim-lspconfig! -----

		"nvim_lspconfig",
		"telescope",
		"telescope_fzf_native",
		"harpoon",
		"vsnip",
		"nvim_cmp",
		"nvim_tree",
		"nvim_treesitter",
		"nvim_treesitter_context",
		"vim_kitty",
		"sourcegraph",
		"pepe",
	}

	local specs = {}
	for _, filename in ipairs(plugin_filenames) do
		local path = "zachyho.plugins." .. filename
		local spec = safe_require(path)
		if spec then
			table.insert(specs, spec)
		end
	end

	table.insert(
		specs,
		-- my local complex.nvim plugin
		{
			dir = "~/projects/complex.nvim",
			dependencies = { "nvim-treesitter/nvim-treesitter" },
			config = function()
				require("complex")
				-- dev
				map("n", "<leader>dl", ":lua package.loaded['complex'] = nil<CR>")
				map("n", "<leader>cp", ":lua require'complex'.get_function_complexity()<CR>")
				map("n", "<leader>rt", ":PlenaryBustedFile %<CR>")
			end,
		}
	)
	return specs
end

require("lazy").setup(create_plugin_specs())
