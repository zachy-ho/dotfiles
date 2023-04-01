return {
	"mhinz/vim-grepper",
	config = function()
		-- Must initialize g:grepper with default values
		vim.cmd([[
            runtime plugin/grepper.vim
            let g:grepper.searchreg = 1
            let g:grepper.tools = ['rg', 'git', 'ag', 'ack', 'ack-grep', 'grep', 'findstr', 'pt', 'sift']
            let g:grepper.operator.prompt = 1
        ]])

		-- I didn't use a custom command the :Grepper commands because I wanna be able to add flags
		-- (e.g. adding -buffer)

		-- Keep this and `keys` in sync
		local keymaps_upvalue = {
			query = "<leader>gq",
			grep_current_word = "<leader>gw",
			grep_with_opts = "<leader>gr",
		}
		-- Grep with manual query
		-- map("n", keymaps_upvalue.query, ":Grepper -noprompt -tool rg -query ")

		-- Grep the current word
		-- map("n", keymaps_upvalue.grep_current_word, ":Grepper -noprompt -tool rg -cword<CR>")

		-- Grep with operators
		-- map({ "n", "x" }, keymaps_upvalue.grep_with_opts, "<plug>(GrepperOperator)", { noremap = false })
	end,
	-- Keep this and `keymaps_upvalue` in sync
	keys = {
		{ "<leader>gq", ":Grepper -noprompt -tool rg -query ", desc = "grep query" },
		{ "<leader>gw", ":Grepper -noprompt -tool rg -cword<CR>", desc = "grep current word" },
		{ "<leader>gr", "<plug>(GrepperOperator)", mode = { "n", "x" }, noremap = false, desc = "grep with opts" },
	},
}
