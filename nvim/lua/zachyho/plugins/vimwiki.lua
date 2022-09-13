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
        }
        vim.g.vimwiki_list = { baseWiki, notesWiki }

        vim.g.vimwiki_folding = "expr"

        -- Removing default vimwiki keymaps that clash with personal keymaps
        vim.g.vimwiki_key_mappings = {
            html = 0,
        }
    end,
    config = function()
        -- NOTE: Makes going to teuxdeux list easy, but might break shit if the file/directory doesn't exist.
        map("n", "<leader>td", ":e ~/zachyho-gits/vimwiki/teuxdeux.md<CR>")
    end,
    keys = {
        "<leader>ww",
        "<leader>w<leader>w",
        -- NOTE: Going straight to teuxdeux
        "<leader>td",
    },
}
