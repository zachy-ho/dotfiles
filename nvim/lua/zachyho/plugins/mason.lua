-- Lazy loading mason.nvim is not recommended (see README.md for the plugin).
-- It's already optimised to load as little as possible during setup.
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
	build = ":MasonUpdate",
}
