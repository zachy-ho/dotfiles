return {
	"vimwiki/vimwiki",
	branch = "dev",
	setup = function()
		-- Execute config file before loading the plugin so it knows where the wiki
		local baseWiki = {
			path = "~/zachyho-gits/vimwiki",
			path_html = "~/zachyho-gits/vimwiki/html",
			syntax = "markdown",
			ext = ".md",
		}
		local notesWiki = {
			path = "~/zachyho-gits/vimwiki/notes",
			syntax = "markdown",
			ext = ".md",
			auto_generate_links = 1,
		}

		vim.g.vimwiki_list = { baseWiki, notesWiki }

		vim.g.vimwiki_folding = "expr"

		-- Removing default vimwiki keymaps that clash with personal keymaps
		vim.g.vimwiki_key_mappings = {
			html = 0,
		}
		-- directories are upon loading
	end,
	keys = { "<leader>ww", "<leader>w<leader>w" },
}
