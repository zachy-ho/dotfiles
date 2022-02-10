-- Contains globals like `map()`. This should be first since a lot of other files need the `map()` function
require("zachyho.utils")

-- Global options and settings
require("zachyho.options")

-- General key bindings
require("zachyho.general-keymaps")

-- Packer plugins
require("zachyho.plugins")

-- Set up Language Server Protocols (LSPs)
require("zachyho.lsp")
