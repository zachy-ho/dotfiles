return {
	"renerocksai/telekasten.nvim",
	config = function()
		local telekasten = safe_require("telekasten")
		if not telekasten then
			return
		end
		local home = vim.fn.expand("~/zachyho-gits/zachtelkasten")
		telekasten.setup({
			home = home,
			tag_notation = "#tag",
			template_new_note = home .. "/" .. "templates/new_note.md",
			template_new_daily = home .. "/" .. "templates/daily.md",
			template_new_weekly = home .. "/" .. "templates/weekly.md",
			uuid_sep = "_",
			take_over_my_home = false,
		})

		-- Mappings
		map("n", "<leader>z", ':lua require("telekasten").panel()<CR>')
		map("n", "<leader>zn", ':lua require("telekasten").new_note()<CR>')
		map("n", "<leader>zN", ':lua require("telekasten").new_templated_note()<CR>')
		map("n", "<leader>zr", ':lua require("telekasten").rename_note()<CR>')
		map("n", "<leader>zf", ':lua require("telekasten").find_notes()<CR>')
		map("n", "<leader>zd", ':lua require("telekasten").find_daily_notes()<CR>')
		map("n", "<leader>zw", ':lua require("telekasten").find_weekly_notes()<CR>')
		map("n", "<leader>zg", ':lua require("telekasten").search_notes()<CR>')
		map("n", "<leader>zz", ':lua require("telekasten").follow_link()<CR>')
		map("n", "<leader>zT", ':lua require("telekasten").goto_today()<CR>')
		map("n", "<leader>zW", ':lua require("telekasten").goto_thisweek()<CR>')
		map("n", "<leader>zy", ':lua require("telekasten").yank_notelink()<CR>')
		map("n", "<leader>zF", ':lua require("telekasten").find_friends()<CR>')
		map("n", "<leader>zI", ':lua require("telekasten").insert_img_link({ i=true })<CR>')
		map("n", "<leader>zb", ':lua require("telekasten").show_backlinks()<CR>')
		map("n", "<C-SPACE>", ':lua require("telekasten").toggle_todo()<CR>')
		map("n", "#", ':lua require("telekasten").show_tags()<CR>')
	end,
}
