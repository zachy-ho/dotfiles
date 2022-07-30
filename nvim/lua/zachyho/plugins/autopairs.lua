return {
	"windwp/nvim-autopairs",
	config = function()
		-- Look HERE if having trouble with <CR> with nvim-cmp
		local autopairs = safe_require("nvim-autopairs")
		local Rule = safe_require("nvim-autopairs.rule")
		local cond = safe_require("nvim-autopairs.conds")

		if not autopairs then
			return
		end

		autopairs.setup({
			enable_check_bracket_line = false,
			-- Don't add pairs if the next char is alphanumeric
			ignored_next_char = "[%w%.]",
			fast_wrap = {
				map = "<C-a>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
				offset = 0, -- Offset from pattern match
				end_key = "$",
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
		})

		if not (Rule and cond) then
			return
		end

		autopairs.add_rules({
			-- Adding spaces between parentheses
			Rule(" ", " ")
				:with_pair(function(opts)
					local pair = opts.line:sub(opts.col - 1, opts.col)
					return vim.tbl_contains({ "()", "{}" }, pair)
				end)
				:with_pair(cond.not_filetypes({ "wiki", "md" }))
				:with_pair(function(opts)
					local pair = opts.line:sub(opts.col - 1, opts.col)
					return vim.tbl_contains({ "[]" }, pair)
				end),
			-- Disable adding spaces between square brackets for wiki and md filetypes
			Rule("( ", " )")
				:with_pair(function()
					return false
				end)
				:with_move(function(opts)
					return opts.prev_char:match(".%)") ~= nil
				end)
				:use_key(")"),
			Rule("{ ", " }")
				:with_pair(function()
					return false
				end)
				:with_move(function(opts)
					return opts.prev_char:match(".%}") ~= nil
				end)
				:use_key("}"),
			Rule("[ ", " ]")
				:with_pair(function()
					return false
				end)
				:with_move(function(opts)
					return opts.prev_char:match(".%]") ~= nil
				end)
				:use_key("]"),
		})

		-- Insert '(' after selecting function or method item with nvim-cmp
		local cmp_autopairs = safe_require("nvim-autopairs.completion.cmp")
		local cmp = safe_require("cmp")
		if not (cmp and cmp_autopairs) then
			return
		end
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
	end,
	after = "nvim-cmp",
}
