local baseWiki = {
	path = "~/zachyho-gits/vimwiki",
	path_html = "~/zachyho-gits/vimwiki/html",
	syntax = "markdown",
	ext = ".md",
}
vim.g.vimwiki_list = { baseWiki }

vim.g.vimwiki_folding = "expr"

map("n", ",wh", "<Plug>Vimwiki2HTML")
map("n", ",whh", "<Plug>Vimwiki2HTMLBrowse")
