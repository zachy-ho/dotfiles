return {
	"vimwiki/vimwiki",
	branch = "dev",
	setup = function()
		local wiki_path = "~/vimwiki/"

		-- Execute config file before loading the plugin so it knows where the wiki
		local baseWiki = {
			path = wiki_path,
			path_html = wiki_path .. "html",
			syntax = "markdown",
			ext = ".md",
		}
		local zachtelkasten = {
			path = wiki_path .. "zachtelkasten",
			path_html = wiki_path .. "zachtelkasten/html",
			syntax = "markdown",
			ext = ".md",
		}
		vim.g.vimwiki_list = { baseWiki, zachtelkasten }

		vim.g.vimwiki_folding = "expr"

		-- Removing default vimwiki keymaps that clash with personal keymaps
		vim.g.vimwiki_key_mappings = {
			html = 0,
		}

		map("n", "<leader>wn", "<Plug>VimwikiNextLink")

		-- Boilerplate for templating diary notes
		safe_require(constants.PLUGINS_DIR .. "vimwiki.boilerplate")
	end,
	config = function()
		-- Open diary files from my non-zettel wiki to use as my daily notes
		unmap("n", "<leader>w<leader>w")
		map("n", "<leader>w<leader>w", ":VimwikiMakeDiaryNote 1<CR>")

		map("n", "<leader>vrt", ":VimwikiRebuildTags!<CR>")
		map("n", "<leader>vgt", ":VimwikiGenerateTagLinks<CR>")
		map("n", "<leader>vst", ":VimwikiSearchTags ")
		map("n", "<leader>vc", ":VimwikiColorize ")
		map("n", "<leader>vtc", ":VimwikiTOC<CR>")
		map("n", "<leader>vbl", ":VimwikiBacklinks<CR>")
	end,
}
