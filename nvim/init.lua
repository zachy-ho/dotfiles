-- Utils should be first to get sourced since many other files use the functions exposed
require("zachyho.utils")

-- Global options and settings
require("zachyho.options")

-- General key bindings
require("zachyho.general_keymaps")

-- Key bindings for my wikis
require("zachyho.wiki_keymaps")

-- Disable built-ins
require("zachyho.disables")

-- All the plugins
require("zachyho.plugins")

-- Plugin configuration files in `after/plugin` are automatically sourced
