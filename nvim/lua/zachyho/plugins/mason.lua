return {
	"williamboman/mason.nvim",
	config = function()
		local mason = safe_require("mason")
		if not mason then
			return
		end

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
	end,
}
