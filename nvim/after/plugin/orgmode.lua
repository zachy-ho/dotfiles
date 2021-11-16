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
    org_deadline_warning_days = 0,
    org_agenda_skip_scheduled_if_done = true,
    org_agenda_skip_deadline_if_done = true,
    -- Wait till this is tested first. Or if you have time, test it yourself and contribute at:
    -- https://github.com/kristijanhusak/orgmode.nvim/issues/49
    -- Don't do this if you don't have time though. Just keep an eye out for updates
    -- notifications = {
        -- enabled = false,
        -- cron_enabled = true,
        -- repeater_reminder_time = false,
        -- deadline_warning_reminder_time = false,
        -- reminder_time = 10,
        -- deadline_reminder = true,
        -- scheduled_reminder = true,
        -- notifier = function(tasks)
          -- local result = {}
          -- for _, task in ipairs(tasks) do
            -- require('orgmode.utils').concat(result, {
              -- string.format('# %s (%s)', task.category, task.humanized_duration),
              -- string.format('%s %s %s', string.rep('*', task.level), task.todo, task.title),
              -- string.format('%s: <%s>', task.type, task.time:to_string())
            -- })
          -- end
          -- if not vim.tbl_isempty(result) then
            -- require('orgmode.notifications.notification_popup'):new({ content = result })
          -- end
        -- end,
        -- cron_notifier = function(tasks)
          -- for _, task in ipairs(tasks) do
            -- local title = string.format('%s (%s)', task.category, task.humanized_duration)
            -- local subtitle = string.format('%s %s %s', string.rep('*', task.level), task.todo, task.title)
            -- local date = string.format('%s: %s', task.type, task.time:to_string())
            -- -- Linux
            -- if vim.fn.executable('notify-send') == 1 then
              -- vim.loop.spawn('notify-send', { args = { string.format('%s\n%s\n%s', title, subtitle, date) }})
            -- end
            -- -- MacOS
            -- if vim.fn.executable('terminal-notifier') == 1 then
              -- vim.loop.spawn('terminal-notifier', { args = { '-title', title, '-subtitle', subtitle, '-message', date }})
            -- end
          -- end
        -- end
    -- }
})


-- Org bullets
require('org-bullets').setup({
    symbols = { "◉", "○", "✸", "✿" }
})

-- Headlines highlight
require('headlines').setup()
