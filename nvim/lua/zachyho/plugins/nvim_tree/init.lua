local nvim_tree = {
	"kyazdani42/nvim-tree.lua",
	tag = "nightly", -- optional, updated every week. (see issue #1193)
	requires = {
		"kyazdani42/nvim-web-devicons",
	},
	config = function()
		local nvim_tree = safe_require("nvim-tree")
		if not nvim_tree then
			return
		end

		nvim_tree.setup({
			view = {
				width = 80,
				side = "right",
			},
		})

		local keymaps_upvalue = safe_require(constants.PLUGINS_DIR .. "nvim_tree.keymaps")
		if keymaps_upvalue then
			map("n", preconditions.check_exists(keymaps_upvalue.as_table).toggle, ":NvimTreeToggle<CR>")
			map("n", preconditions.check_exists(keymaps_upvalue.as_table).find_current_file, ":NvimTreeFindFile<CR>")
			map("n", preconditions.check_exists(keymaps_upvalue.as_table).focus, ":NvimTreeFocus<CR>")
		end
	end,
	keys = { "<leader>nt", "<leader>nb", "<leader>nf" },
}
local keymaps = safe_require(constants.PLUGINS_DIR .. "nvim_tree.keymaps")
if keymaps then
	nvim_tree.keys = preconditions.check_exists(keymaps.as_list)
end

return nvim_tree
