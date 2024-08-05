return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-jest", -- adaptor for jest
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-jest")({
					-- TODO construct different setups depending on work vs. personal projects
					jestCommand = "yarn test --",
					jestConfigFile = "jest.config.js",
					env = { CI = true },
					cwd = function(_)
						return vim.fn.getcwd()
					end,
				}),
			},
		})
	end,
}
