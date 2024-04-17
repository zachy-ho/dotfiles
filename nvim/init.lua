-- see :h nvim-tree-netrw
-- Disabling netrw because it interferes with nvim-tree
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- Utils should be first to get sourced since many other files use the functions exposed
require("zachyho.utils")

-- Global options and settings
require("zachyho.options")

-- General key bindings
require("zachyho.general_keymaps")

-- Disable built-ins
require("zachyho.disables")

require("zachyho.plugins")

-- Canva (work) stuff
quiet_safe_require("canva.keymaps")

-- Plugin configuration files in `after/plugin` are automatically sourced
