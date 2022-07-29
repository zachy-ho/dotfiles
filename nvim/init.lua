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

-- Lazy loading
-- 1. Move plugin config into lua/zachyho
-- 2. Set up lazy loading condition in packer plugin file
-- 3. Require the plugin config manually
-- 4. Test
