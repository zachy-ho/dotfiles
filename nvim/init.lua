-- Contains globals like `map()`.
-- This should be first to get sourced since a lot of other files use the `map()` function
require("zachyho.utils")

-- Global options and settings
require("zachyho.options")

-- General key bindings
require("zachyho.general_keymaps")

-- Packer plugins
require("zachyho.plugins")

-- Set up Language Server Protocols (LSPs)
require("zachyho.lsp")

-- Plugin configuration files in `after/plugin` are automatically sourced
