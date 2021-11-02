local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.org = {
    install_info = {
        url = 'https://github.com/milisims/tree-sitter-org',
        revision = 'main',
        files = { 'src/parser.c', 'src/scanner.cc' }
    },
    filetype = 'org'
}

require('nvim-treesitter.configs').setup({
    -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
    highlight = {
        enable = true,
        -- disable = { 'org' } -- Remove this to use TS highlighter for some of the highlights (Experimental)
        additional_vim_regex_highlighting = { 'org' } -- Required since TS highlighter doesn't support all syntax features (conceal)
    },
    ensure_installed = { 'org' }
})

require('orgmode').setup({
    org_agenda_files = { '~/zachyho-codes/zachyho-orgs/**/*', '~/zachyho-codes/zachyho-orgs/*' },
    org_default_notes_file = '~/zachyho-codes/zachyho-orgs/inbox.org',
    org_todo_keywords = { 'TODO(t)', 'DOING(d)', '|', 'CANCELLED(c)', 'FINI(f)' },
    org_todo_keyword_faces = {
        DOING = ':foreground #a58155'
    },
    org_archive_location = '#+ARCHIVE: ~/zachyho-codes/zachyho-orgs/archive/%s_archive::',
    org_hide_emphasis_markers = false,
    org_deadline_warning_days = 7,
})


-- Org bullets
require('org-bullets').setup({
    symbols = { "◉", "○", "✸", "✿" }
})

-- Headlines highlight
require('headlines').setup()
