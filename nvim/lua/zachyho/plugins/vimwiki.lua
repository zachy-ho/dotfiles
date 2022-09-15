return {
	"vimwiki/vimwiki",
	branch = "dev",
	setup = function()
		local wiki_path = "~/zachyho-gits/vimwiki/"

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

		vim.cmd([[
            autocmd BufNewFile ~/zachyho-gits/vimwiki/diary/[0-9]*.md :silent %!echo "\# `date +'\%A, \%B \%d \%Y'`\n\n\#\# todo\n- [ ] my\n- [ ] todo\n- [ ] tings"
        ]])
	end,
	config = function()
		map("n", "<leader>vrt", ":VimwikiRebuildTags!<CR>")
		map("n", "<leader>vgt", ":VimwikiGenerateTagLinks<CR>")
		map("n", "<leader>vst", ":VimwikiSearchTags ")
		map("n", "<leader>vc", ":VimwikiColorize ")
		map("n", "<leader>vtc", ":VimwikiTOC<CR>")
		map("n", "<leader>vbl", ":VimwikiBacklinks<CR>")
	end,
}
