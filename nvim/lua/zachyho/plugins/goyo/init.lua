-- Zen mode

-- vim.cmd([[
-- autocmd! User GoyoEnter Limelight
-- autocmd! User GoyoLeave Limelight!
-- ]])

local goyo = {
	"junegunn/goyo.vim",
	config = function()
		local keymaps = safe_require(constants.PLUGINS_DIR .. "goyo.keymaps")
		if keymaps then
			map("n", preconditions.check_exists(keymaps.as_table).toggle, ":Goyo<CR>")
		end
		vim.g.goyo_width = 120
		vim.g.goyo_height = "100%"
	end,
	event = "BufWinEnter",
}
local keymaps = safe_require(constants.PLUGINS_DIR .. "goyo.keymaps")
if keymaps then
	goyo.keys = preconditions.check_exists(keymaps.as_list)
end

return goyo
