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
		local zachtelkasten = {
			path = "~/zachyho-gits/vimwiki/zachtelkasten",
			path_html = "~/zachyho-gits/vimwiki/zachtelkasten/html",
			syntax = "markdown",
			ext = ".md",
		}
		vim.g.vimwiki_list = { baseWiki, zachtelkasten }

		vim.g.vimwiki_folding = "expr"

		-- Removing default vimwiki keymaps that clash with personal keymaps
		vim.g.vimwiki_key_mappings = {
			html = 0,
		}
	end,
	config = function()
		map("n", "<leader>vrt", ":VimwikiRebuildTags!")
		map("n", "<leader>vgt", ":VimwikiGenerateTagLinks")
		map("n", "<leader>vst", ":VimwikiSearchTags ")
		map("n", "<leader>vc", ":VimwikiColorize ")
		map("n", "<leader>vtc", ":VimwikiTOC<CR>")
		map("n", "<leader>vbl", ":VimwikiBacklinks<CR>")
	end,
}
