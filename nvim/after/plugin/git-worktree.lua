local map = require('zachyho.utils').map

require('telescope').load_extension('git_worktree')

map('n', ',ws', ':lua require("telescope").extensions.git_worktree.git_worktrees()<CR>')
map('n', ',wc', ':lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>')
