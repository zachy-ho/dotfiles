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
	auto_tags = 1,
	auto_generate_links = 1,
}

vim.g.vimwiki_list = { baseWiki, notesWiki }

vim.g.vimwiki_folding = "expr"

map("n", "<leader>wh", "<Plug>Vimwiki2HTML")
map("n", "<leader>whh", "<Plug>Vimwiki2HTMLBrowse")
map("n", "<leader>vgt", ":VimwikiGenerateTagLinks<CR>")
map("n", "<leader>vst", ":VimwikiSearchTags ")
