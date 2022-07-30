# zachyho's Neovim setup

## How my neovim starts up
1. `init.lua` sourced
2. Stuff in `after/plugin/` sourced
3. Stuff in `after/ftplugin/` sourced if filetype matches
4. Stuff in `autoload/` is sourced if called
See `:h runtimepath` for more info on how the order of files/directories executed when neovim starts up.

## Packer and my plugins
I use [Packer](https://github.com/wbthomason/packer.nvim) as my Neovim plugin manager.
Only a select few plugins are eagerly loaded on Neovim startup. The rest are lazy-loaded under
specific conditions. This is so my Neovim can start up as lightweight and as quickly as possible,
and plugins are only loaded when they are needed. See `lua/zachyho/plugins.lua` for more info.

## Naming style
- Multi-word files or directories are named in snake_case, even if they handle plugins that are
named in kebab-case. e.g. the file configuring `glepnir/indent-guides.nvim` is named `indent_guides.lua`
