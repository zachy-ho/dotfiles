local baseWiki = {
    path = '~/zachyho-codes/vimwiki',
    path_html = '~/zachyho-codes/vimwiki/html',
    syntax = 'markdown',
    ext = '.md'
}
vim.g.vimwiki_list = {baseWiki}

vim.g.vimwiki_folding = 'custom'

map('n', ',wh', '<Plug>Vimwiki2HTML')
map('n', ',whh', '<Plug>Vimwiki2HTMLBrowse')
