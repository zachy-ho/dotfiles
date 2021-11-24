-- Look HERE if having trouble with <CR> with nvim-cmp
local autopairs = require'nvim-autopairs'
local Rule = require'nvim-autopairs.rule'
local cond = require('nvim-autopairs.conds')

autopairs.setup({
    enable_check_bracket_line = false,
    -- Don't add pairs if the next char is alphanumeric
    ignored_next_char = '[%w%.]';
})

autopairs.add_rules({
    -- Adding spaces between parentheses
    Rule(' ', ' ')
        :with_pair(function (opts)
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({ '()', '{}' }, pair)
        end)
        :with_pair(cond.not_filetypes({'wiki', 'md'}))
        :with_pair(function (opts)
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({ '[]' }, pair)
        end),
    -- Disable adding spaces between square brackets for wiki and md filetypes
    Rule('( ', ' )')
        :with_pair(function() return false end)
        :with_move(function(opts)
            return opts.prev_char:match('.%)') ~= nil
        end)
        :use_key(')'),
    Rule('{ ', ' }')
        :with_pair(function() return false end)
        :with_move(function(opts)
            return opts.prev_char:match('.%}') ~= nil
        end)
        :use_key('}'),
    Rule('[ ', ' ]')
        :with_pair(function() return false end)
        :with_move(function(opts)
            return opts.prev_char:match('.%]') ~= nil
        end)
        :use_key(']')
})

-- Insert '(' after selecting function or method item with nvim-cmp
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
