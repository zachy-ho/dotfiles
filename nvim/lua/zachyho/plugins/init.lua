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

local prepare_plugin_specs = function()
	---@type table List of Lua module names in the plugin directory, to be set up in order.
	local plugins = {
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
		"fzf_lua",
		----- These MUST come before nvim-lspconfig! -----
		"mason",
		"mason_lspconfig",
		"neodev",
		"typescript_tools",
		"cmp_nvim_lsp",
		"lspkind_nvim",
		"nvim_lspconfig.null_ls",
		"nvim_lspconfig",

		"telescope",
		"telescope_fzf_native",
		"harpoon",
		"vsnip.vim_vsnip",
		"vsnip.cmp_vsnip",
		"vsnip.vim_vsnip_integ",
		"nvim_cmp",
		"nvim_cmp.sources",
		"nvim_tree",
		"nvim_treesitter",
		"nvim_treesitter_context",
		"vim_kitty",
	}

	local spec_initialisers = {}
	for i, filename in ipairs(plugins) do
		local full_filename = "zachyho.plugins." .. filename
		spec_initialisers[i] = function()
			local res = safe_require(full_filename)
			return res or nil
		end
	end

	local specs = {}
	for _, init in ipairs(spec_initialisers) do
		local spec = init()
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

local specs = prepare_plugin_specs()
require("lazy").setup(specs)
