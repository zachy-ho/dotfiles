-- HACK: literal copy paste of the :SourcegraphLink callback from the [source code](https://github.com/sourcegraph/sg.nvim/blob/8d7735bfb810d919806da1e1c4f839fbc6ecccfe/plugin/sg.lua#L148)
-- so I can extend this to open the link in the browser straight away
vim.api.nvim_create_user_command("SourcegraphOpenLink", function(args)
	print("requesting link...")

	local callback = function(err, link)
		if err or not link then
			print("[sourcegraph] Failed to get link:", link)
			return
		end
		print("[sourcegraph] opening the link in browser", link)
		vim.fn.jobstart({ "open", link }, { detach = true })
	end

	local status, region = pcall(function()
		return vim.region(0, "'<", "'>", "v", true)
	end)

	if not status then
		-- vim.region failed defaulting to cursor position
		local cursor = vim.api.nvim_win_get_cursor(0)
		local row, col = cursor[1], cursor[2]
		local range = { start_line = row, start_col = col, end_line = row, end_col = col }
		require("sg.rpc").get_link(vim.api.nvim_buf_get_name(0), range, callback)
		return
	end

	local keys = vim.tbl_keys(region)
	table.sort(keys)

	local row1 = args.line1 - 1
	local row2 = args.line2 - 1

	local first = keys[1]
	local last = keys[#keys]

	local range
	if first == row1 and last == row2 then
		-- We have a visual selection
		range = {
			start_line = first + 1,
			start_col = region[first][1],
			end_line = last + 1,
			end_col = region[last][2],
		}
	else
		-- Just some range passed, or no range at all
		range = {
			start_line = args.line1,
			start_col = 0,
			end_line = args.line2,
			end_col = 0,
		}
	end

	require("sg.rpc").get_link(vim.api.nvim_buf_get_name(0), range, callback)
end, {
	desc = "Opens the sourcegraph link to the current location in browser",
	range = 2,
})

return {
	"sourcegraph/sg.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("sg").setup()
	end,
	keys = {
		{ "<leader>sggl", ":SourcegraphLink<CR>", desc = "get sg link to current position" },
		{
			"<leader>sgol",
			":SourcegraphOpenLink<CR>",
			desc = "open sg link to current position in browser",
		},
	},
}
