return {
	"David-Kunz/jester",
	config = function()
		require("jester").setup({
			cmd = "yarn test -t='$result' $file",
		})
	end,
	keys = {
		{ "<leader>jt", ":lua require('jester').run()<CR>" },
		{ "<leader>ja", ":lua require('jester').run_file({ cmd = 'yarn test $file' })<CR>" },
	},
}
