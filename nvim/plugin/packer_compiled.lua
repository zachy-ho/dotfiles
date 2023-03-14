-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = true
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/zacharyho/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/zacharyho/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/zacharyho/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/zacharyho/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/zacharyho/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["cmp-buffer"] = {
    after_files = { "/Users/zacharyho/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/Users/zacharyho/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/Users/zacharyho/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["emmet-vim"] = {
    config = { "\27LJ\2\nÌ\1\0\0\3\0\a\0\r6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0v            autocmd FileType html,css,typescriptreact,javascriptreact,typescript,javascript EmmetInstall\n        \bcmd\n<C-y>\26user_emmet_leader_key\30user_emmet_install_global\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/opt/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  fzf = {
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["git-conflict.nvim"] = {
    config = { "\27LJ\2\nK\0\0\3\0\3\0\t6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0009\1\2\0B\1\1\1K\0\1\0\nsetup\17git-conflict\17safe_require\0" },
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/git-conflict.nvim",
    url = "https://github.com/akinsho/git-conflict.nvim"
  },
  ["gruvbox-material"] = {
    after = { "lualine.nvim" },
    config = { "\27LJ\2\n…\3\0\0\3\0\6\0\b6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\1\5\0=\1\4\0K\0\1\0\21gruvbox-material\16COLORSCHEME\14constantsˆ\2                if has('termguicolors')\n                    set termguicolors\n                endif\n\n                set background=dark\n\n                let g:gruvbox_material_background='soft'\n                let g:gruvbox_material_better_performance=1\n                let g:gruvbox_material_enable_italic=1\n\n                colorscheme gruvbox-material\n\n            \bcmd\bvim\0" },
    loaded = true,
    only_config = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  harpoon = {
    config = { "\27LJ\2\n˚\5\0\0\a\0\25\00096\0\0\0006\2\1\0009\2\2\2'\3\3\0&\2\3\2B\0\2\2\15\0\0\0X\1\18Ä6\1\4\0'\3\5\0006\4\6\0009\4\a\0049\6\b\0B\4\2\0029\4\t\4'\5\n\0B\1\4\0016\1\4\0'\3\5\0006\4\6\0009\4\a\0049\6\b\0B\4\2\0029\4\v\4'\5\f\0B\1\4\0016\1\4\0'\3\5\0'\4\r\0'\5\14\0B\1\4\0016\1\4\0'\3\5\0'\4\15\0'\5\16\0B\1\4\0016\1\4\0'\3\5\0'\4\17\0'\5\18\0B\1\4\0016\1\4\0'\3\5\0'\4\19\0'\5\20\0B\1\4\0016\1\4\0'\3\5\0'\4\21\0'\5\22\0B\1\4\0016\1\4\0'\3\5\0'\4\23\0'\5\24\0B\1\4\1K\0\1\0/:lua require(\"harpoon.ui\").nav_file(6)<CR>\15<leader>h6/:lua require(\"harpoon.ui\").nav_file(5)<CR>\15<leader>h5/:lua require(\"harpoon.ui\").nav_file(4)<CR>\15<leader>h4/:lua require(\"harpoon.ui\").nav_file(3)<CR>\15<leader>h3/:lua require(\"harpoon.ui\").nav_file(2)<CR>\15<leader>h2/:lua require(\"harpoon.ui\").nav_file(1)<CR>\15<leader>h10:lua require(\"harpoon.mark\").add_file()<CR>\radd_file7:lua require(\"harpoon.ui\").toggle_quick_menu()<CR>\vtoggle\ras_table\17check_exists\18preconditions\6n\bmap\20harpoon.keymaps\16PLUGINS_DIR\14constants\17safe_require\0" },
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nà\1\0\0\4\0\4\0\n6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0009\1\2\0005\3\3\0B\1\2\1K\0\1\0\1\0\2\31show_current_context_start\2\25show_current_context\2\nsetup\21indent_blankline\17safe_require\0" },
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nw\0\0\5\0\6\0\f6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0009\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\21gruvbox-material\nsetup\flualine\17safe_require\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    config = { "\27LJ\2\nL\0\0\5\0\4\0\0066\0\0\0'\2\1\0'\3\2\0'\4\3\0B\0\4\1K\0\1\0 <Plug>MarkdownPreviewToggle\15<leader>mp\6n\bmap\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\n◊\1\0\0\6\0\b\0\0256\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0006\1\0\0006\3\2\0009\3\3\3'\4\4\0&\3\4\3B\1\2\0024\2\0\0\15\0\1\0X\3\5Ä6\3\5\0009\3\6\3\18\5\1\0B\3\2\2\18\2\3\0009\3\a\0004\5\3\0>\2\1\5B\3\2\1K\0\1\0\nsetup\rget_keys\16table_utils\"nvim_lspconfig.server_configs\16PLUGINS_DIR\14constants\20mason-lspconfig\17safe_require\0" },
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n¨\1\0\0\6\0\b\0\0146\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0009\1\2\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3B\1\2\1K\0\1\0\aui\1\0\0\nicons\1\0\0\1\0\3\24package_uninstalled\b‚úó\22package_installed\b‚úì\20package_pending\b‚ûú\nsetup\nmason\17safe_require\0" },
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  nerdcommenter = {
    config = { "\27LJ\2\nè\2\0\0\5\0\r\0\0246\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\4\0'\2\5\0'\3\6\0'\4\a\0B\0\4\0016\0\4\0'\2\b\0'\3\t\0'\4\n\0B\0\4\0016\0\4\0'\2\5\0'\3\v\0'\4\f\0B\0\4\1K\0\1\0\28<Plug>NERDCommenterYank\15<leader>cy\30<Plug>NERDCommenterNested\15<leader>cn\6n\30<Plug>NERDCommenterToggle\21<leader>c<space>\avn\bmap\26NERDCommenterMappings\20NERDSpaceDelims\6g\bvim\0" },
    keys = { { "", "<leader>c<space>" }, { "", "<leader>cn" }, { "", "<leader>cy" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/opt/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n`\0\1\6\0\6\1\f9\1\0\0\18\3\1\0009\1\1\0019\4\2\0\23\4\0\0049\5\2\0B\1\4\0026\2\3\0009\2\4\0025\4\5\0\18\5\1\0D\2\3\0\1\3\0\0\a()\a{}\17tbl_contains\bvim\bcol\bsub\tline\2]\0\1\6\0\6\1\f9\1\0\0\18\3\1\0009\1\1\0019\4\2\0\23\4\0\0049\5\2\0B\1\4\0026\2\3\0009\2\4\0025\4\5\0\18\5\1\0D\2\3\0\1\2\0\0\a[]\17tbl_contains\bvim\bcol\bsub\tline\2\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\b.%)\nmatch\14prev_char\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\b.%}\nmatch\14prev_char\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\b.%]\nmatch\14prev_charì\b\1\0\r\0001\1Å\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\2\14\0\0\0X\3\1Ä2\0sÄ9\3\4\0005\5\5\0005\6\6\0005\a\a\0=\a\b\0066\a\t\0009\a\n\a'\t\v\0'\n\f\0'\v\r\0B\a\4\2=\a\14\6=\6\15\5B\3\2\1\15\0\1\0X\3\2Ä\14\0\2\0X\3\1Ä2\0aÄ9\3\16\0004\5\5\0\18\6\1\0'\b\17\0'\t\17\0B\6\3\2\18\b\6\0009\6\18\0063\t\19\0B\6\3\2\18\b\6\0009\6\18\0069\t\20\0025\v\21\0B\t\2\0A\6\1\2\18\b\6\0009\6\18\0063\t\22\0B\6\3\2>\6\1\5\18\6\1\0'\b\23\0'\t\24\0B\6\3\2\18\b\6\0009\6\18\0063\t\25\0B\6\3\2\18\b\6\0009\6\26\0063\t\27\0B\6\3\2\18\b\6\0009\6\28\6'\t\29\0B\6\3\2>\6\2\5\18\6\1\0'\b\30\0'\t\31\0B\6\3\2\18\b\6\0009\6\18\0063\t \0B\6\3\2\18\b\6\0009\6\26\0063\t!\0B\6\3\2\18\b\6\0009\6\28\6'\t\"\0B\6\3\2>\6\3\5\18\6\1\0'\b#\0'\t$\0B\6\3\2\18\b\6\0009\6\18\0063\t%\0B\6\3\2\18\b\6\0009\6\26\0063\t&\0B\6\3\2\18\b\6\0009\6\28\6'\t'\0B\6\3\0?\6\0\0B\3\2\0016\3\0\0'\5(\0B\3\2\0026\4\0\0'\6)\0B\4\2\2\15\0\4\0X\5\2Ä\14\0\3\0X\5\2Ä2\0\0ÄK\0\1\0009\5*\4\18\a\5\0009\5+\5'\b,\0009\t-\0035\v/\0005\f.\0=\f0\vB\t\2\0A\5\2\1K\0\1\0K\0\1\0K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\6]\0\0\a ]\a[ \6}\0\0\a }\a{ \6)\fuse_key\0\14with_move\0\a )\a( \0\1\3\0\0\twiki\amd\18not_filetypes\0\14with_pair\6 \14add_rules\14fast_wrap\fpattern\5\b%s+\25 [%'%\"%)%>%]%)%}%,] \tgsub\vstring\nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\a\16check_comma\2\19highlight_grey\fComment\bmap\n<C-a>\voffset\3\0\fend_key\6$\14highlight\vSearch\tkeys\31qwertyuiopzxcvbnmasdfghjkl\1\0\2\22ignored_next_char\v[%w%.]\30enable_check_bracket_line\1\nsetup\25nvim-autopairs.conds\24nvim-autopairs.rule\19nvim-autopairs\17safe_require\tÄÄ¿ô\4\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-buffer", "cmp-nvim-lua", "cmp-path", "nvim-autopairs" },
    config = { "\27LJ\2\n;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvim≈\b\1\0\v\0-\0Z6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\2\14\0\0\0X\1\1Ä2\0NÄ6\1\3\0'\3\5\0B\1\2\2\14\0\1\0X\2\1Ä2\0IÄ6\2\0\0009\2\6\2'\3\b\0=\3\a\0029\2\t\0005\4\r\0005\5\v\0003\6\n\0=\6\f\5=\5\14\0049\5\15\0009\5\16\0059\5\17\0055\a\19\0009\b\15\0009\b\18\b)\n¸ˇB\b\2\2=\b\20\a9\b\15\0009\b\18\b)\n\4\0B\b\2\2=\b\21\a9\b\15\0009\b\22\bB\b\1\2=\b\23\a9\b\15\0009\b\24\bB\b\1\2=\b\25\a9\b\15\0009\b\26\b5\n\27\0B\b\2\2=\b\28\aB\5\2\2=\5\15\0049\5\29\0009\5\30\0054\a\5\0005\b\31\0>\b\1\a5\b \0>\b\2\a5\b!\0>\b\3\a5\b\"\0>\b\4\aB\5\2\2=\5\30\0045\5%\0009\6#\0015\b$\0B\6\2\2=\6&\5=\5'\0045\5*\0009\6\29\0009\6(\0069\6)\6B\6\1\2=\6+\0059\6\29\0009\6(\0069\6)\6B\6\1\2=\6,\5=\5(\4B\2\2\1K\0\1\0K\0\1\0K\0\1\0\18documentation\15completion\1\0\0\rbordered\vwindow\15formatting\vformat\1\0\0\1\0\2\rmaxwidth\0032\14with_text\2\15cmp_format\1\0\1\tname\tpath\1\0\1\tname\rnvim_lua\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\t<CR>\1\0\1\vselect\1\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\26menu,menuone,noselect\16completeopt\6o\flspkind\bcmp\17safe_requireﬂ\2            let g:vsnip_snippet_dir = expand('$HOME/.config/dotfiles/nvim/vsnip/.vsnip')\n            let g:vsnip_filetypes = {}\n            let g:vsnip_filetypes.javascriptreact = ['javascript']\n            let g:vsnip_filetypes.typescriptreact = ['typescript', 'javascript']\n            let g:vsnip_filetypes.typescript = ['javascript']\n        \bcmd\bvim\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n\\\0\0\4\0\4\0\a6\0\0\0006\2\1\0009\2\2\2'\3\3\0&\2\3\2B\0\2\1K\0\1\0\26nvim_lspconfig.config\16PLUGINS_DIR\14constants\17safe_require\0" },
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\nL\0\0\3\0\3\0\t6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0009\1\2\0B\1\1\1K\0\1\0\nsetup\18nvim-surround\17safe_require\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/opt/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n¶\4\0\0\b\0\30\00096\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0009\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\v\0005\5\t\0005\6\a\0005\a\6\0=\a\b\6=\6\n\5=\5\f\4=\4\r\0035\4\14\0=\4\15\3B\1\2\0016\1\0\0006\3\16\0009\3\17\3'\4\18\0&\3\4\3B\1\2\2\15\0\1\0X\2\27Ä6\2\19\0'\4\20\0006\5\21\0009\5\22\0059\a\23\1B\5\2\0029\5\24\5'\6\25\0B\2\4\0016\2\19\0'\4\20\0006\5\21\0009\5\22\0059\a\23\1B\5\2\0029\5\26\5'\6\27\0B\2\4\0016\2\19\0'\4\20\0006\5\21\0009\5\22\0059\a\23\1B\5\2\0029\5\28\5'\6\29\0B\2\4\1K\0\1\0\23:NvimTreeFocus<CR>\nfocus\26:NvimTreeFindFile<CR>\22find_current_file\24:NvimTreeToggle<CR>\vtoggle\ras_table\17check_exists\18preconditions\6n\bmap\22nvim_tree.keymaps\16PLUGINS_DIR\14constants\bgit\1\0\1\vignore\1\rrenderer\nicons\1\0\0\vglyphs\1\0\0\vfolder\1\0\0\1\0\2\17arrow_closed\5\15arrow_open\5\tview\1\0\0\1\0\2\nwidth\3<\tside\nright\nsetup\14nvim-tree\17safe_require\0" },
    keys = { { "", "<leader>nf" }, { "", "<leader>nb" }, { "", "<leader>nt" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-ts-rainbow" },
    config = { "\27LJ\2\nØ\b\0\0\a\0\31\0.5\0\1\0005\1\0\0=\1\2\0005\1\3\0004\2\0\0=\2\4\1=\1\5\0005\1\6\0=\1\a\0005\1\b\0005\2\t\0=\2\n\1=\1\v\0005\1\f\0004\2\0\0=\2\r\0015\2\14\0=\2\15\1=\1\16\0006\1\17\0006\3\18\0009\3\19\3'\4\20\0&\3\4\3B\1\2\2\15\0\1\0X\2\fÄ5\2\22\0006\3\23\0009\3\24\0039\5\25\1B\3\2\0026\4\26\0006\6\18\0009\6\27\6B\4\2\0028\3\4\3=\3\25\2=\2\21\0006\2\28\0'\4\29\0B\2\2\0029\2\30\2\18\4\0\0B\2\2\1K\0\1\0\nsetup\28nvim-treesitter.configs\frequire\16COLORSCHEME\30replaceDashWithUnderscore\vcolors\17check_exists\18preconditions\1\0\2\18extended_mode\1\venable\2\frainbow$nvim_treesitter.nvim_ts_rainbow\16PLUGINS_DIR\14constants\17safe_require\15playground\16keybindings\1\0\n\21unfocus_language\6F\28toggle_language_display\6I\30toggle_injected_languages\6t\19focus_language\6f\vupdate\6R\27toggle_anonymous_nodes\6a\14goto_node\t<cr>\14show_help\6?\21toggle_hl_groups\6i\24toggle_query_editor\6o\fdisable\1\0\3\venable\2\20persist_queries\1\15updatetime\3\25\26incremental_selection\fkeymaps\1\0\4\21node_incremental\bgrn\19init_selection\bgnn\22scope_incremental\bgrc\21node_decremental\bgrp\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\20custom_captures\1\0\2\venable\2&additional_vim_regex_highlighting\2\21ensure_installed\1\0\0\1\27\0\0\tbash\bcss\15dockerfile\14gitignore\fgraphql\thtml\thttp\tjava\15javascript\njsdoc\tjson\njson5\blua\rmarkdown\bnix\vprisma\nproto\vpython\nregex\tscss\bsql\btsx\15typescript\bvim\bvue\tyaml\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\3\0\t6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0009\1\2\0B\1\1\1K\0\1\0\nsetup\23treesitter-context\17safe_require\0" },
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rose-pine"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["smartcolumn.nvim"] = {
    config = { "\27LJ\2\nJ\0\0\3\0\3\0\t6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0009\1\2\0B\1\1\1K\0\1\0\nsetup\16smartcolumn\17safe_require\0" },
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/smartcolumn.nvim",
    url = "https://github.com/m4xshen/smartcolumn.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nä\6\0\0\n\0'\0b6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\2\15\0\0\0X\2\2Ä\14\0\1\0X\2\1ÄK\0\1\0009\2\3\0005\4\14\0005\5\4\0005\6\t\0005\a\a\0009\b\5\0019\t\6\1 \b\t\b=\b\b\a=\a\n\0065\a\v\0009\b\5\0019\t\6\1 \b\t\b=\b\b\a=\a\f\6=\6\r\5=\5\15\0045\5\22\0005\6\21\0005\a\19\0005\b\17\0009\t\16\1=\t\18\b=\b\n\a5\b\20\0009\t\16\1=\t\18\b=\b\f\a=\a\r\6=\6\23\5=\5\24\4B\2\2\0016\2\0\0006\4\25\0009\4\26\4'\5\27\0&\4\5\4B\2\2\2\15\0\2\0X\3\"Ä6\3\28\0009\3\29\0039\5\30\2B\3\2\0026\4\0\0'\6\31\0B\4\2\2\15\0\4\0X\5\25Ä6\5 \0'\a\f\0009\b!\0039\t!\4B\5\4\0016\5 \0'\a\f\0009\b\"\0039\t\"\4B\5\4\0016\5 \0'\a\f\0009\b\23\0039\t\23\4B\5\4\0016\5 \0'\a\f\0009\b#\0039\t#\4B\5\4\0016\5 \0'\a\f\0009\b$\0039\t$\4B\5\4\0016\3\0\0006\5\25\0009\5\26\5'\6%\0&\5\6\5B\3\2\2\15\0\3\0X\4\3Ä\18\4\3\0005\6&\0B\4\2\1K\0\1\0\1\3\0\0\fharpoon\bfzf\25telescope.extensions\fkeymaps\20command_history\14live_grep\15find_files\bmap\22telescope.builtin\ras_table\17check_exists\18preconditions\22telescope.keymaps\16PLUGINS_DIR\14constants\fpickers\fbuffers\1\0\0\1\0\0\1\0\0\1\0\0\n<C-d>\1\0\0\18delete_buffer\rdefaults\1\0\0\rmappings\6n\1\0\0\6i\1\0\0\n<C-q>\1\0\0\16open_qflist\25smart_send_to_qflist\1\0\1\20layout_strategy\rvertical\nsetup\22telescope.actions\14telescope\17safe_require\0" },
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  tokyonight = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/tokyonight",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["true-zen.nvim"] = {
    config = { "\27LJ\2\n§\2\0\0\5\0\17\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0'\2\a\0'\3\b\0'\4\t\0B\0\4\0016\0\6\0'\2\a\0'\3\n\0'\4\v\0B\0\4\0016\0\6\0'\2\f\0'\3\r\0'\4\14\0B\0\4\0016\0\6\0'\2\a\0'\3\15\0'\4\16\0B\0\4\1K\0\1\0\22:TZMinimalist<CR>\15<leader>zm\23:'<,'>TZNarrow<CR>\15<leader>zn\6v\17:TZFocus<CR>\15<leader>zf\20:TZAtaraxis<CR>\15<leader>za\6n\bmap\17integrations\1\0\0\1\0\1\flualine\1\nsetup\rtrue-zen\frequire\0" },
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/true-zen.nvim",
    url = "https://github.com/Pocco81/true-zen.nvim"
  },
  ["typescript.nvim"] = {
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/typescript.nvim",
    url = "https://github.com/jose-elias-alvarez/typescript.nvim"
  },
  ["vim-easy-align"] = {
    config = { "\27LJ\2\n9\0\0\5\0\4\0\0066\0\0\0005\2\1\0'\3\2\0'\4\3\0B\0\4\1K\0\1\0\15:EasyAlign\aga\1\3\0\0\6n\6x\bmap\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/opt/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-grepper"] = {
    config = { "\27LJ\2\n«\4\0\0\a\0\14\0\0226\0\0\0009\0\1\0'\2\2\0B\0\2\0015\0\3\0006\1\4\0'\3\5\0009\4\6\0'\5\a\0B\1\4\0016\1\4\0'\3\5\0009\4\b\0'\5\t\0B\1\4\0016\1\4\0005\3\n\0009\4\v\0'\5\f\0005\6\r\0B\1\5\1K\0\1\0\1\0\1\fnoremap\1\28<plug>(GrepperOperator)\19grep_with_opts\1\3\0\0\6n\6x+:Grepper -noprompt -tool rg -cword<CR>\22grep_current_word(:Grepper -noprompt -tool rg -query \nquery\6n\bmap\1\0\3\nquery\15<leader>gq\19grep_with_opts\15<leader>gr\22grep_current_word\15<leader>gwÙ\1            runtime plugin/grepper.vim\n            let g:grepper.searchreg = 1\n            let g:grepper.tools = ['rg', 'git', 'ag', 'ack', 'ack-grep', 'grep', 'findstr', 'pt', 'sift']\n            let g:grepper.operator.prompt = 1\n        \bcmd\bvim\0" },
    keys = { { "", "<leader>gq" }, { "", "<leader>gw" }, { "", "<leader>gr" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/opt/vim-grepper",
    url = "https://github.com/mhinz/vim-grepper"
  },
  ["vim-prettier"] = {
    config = { "\27LJ\2\na\0\0\6\0\5\0\a5\0\0\0006\1\1\0'\3\2\0009\4\3\0'\5\4\0B\1\4\1K\0\1\0\18:Prettier<CR>\18prettier_sync\6n\bmap\1\0\1\18prettier_sync\15<leader>fm\0" },
    keys = { { "", "<leader>fm" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/opt/vim-prettier",
    url = "https://github.com/prettier/vim-prettier"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-vsnip"] = {
    after = { "nvim-cmp" },
    config = { "\27LJ\2\nÃ\6\0\0\6\0\20\0\0296\0\0\0005\2\1\0'\3\2\0'\4\3\0005\5\4\0B\0\5\0016\0\0\0005\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\0\0005\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0005\2\r\0'\3\14\0'\4\15\0005\5\16\0B\0\5\0016\0\17\0009\0\18\0'\2\19\0B\0\2\1K\0\1\0ﬂ\2            let g:vsnip_snippet_dir = expand('$HOME/.config/dotfiles/nvim/vsnip/.vsnip')\n            let g:vsnip_filetypes = {}\n            let g:vsnip_filetypes.javascriptreact = ['javascript']\n            let g:vsnip_filetypes.typescriptreact = ['typescript', 'javascript']\n            let g:vsnip_filetypes.typescript = ['javascript']\n        \bcmd\bvim\1\0\2\fnoremap\1\texpr\2?vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'\f<S-Tab>\1\3\0\0\6i\6s\1\0\2\fnoremap\1\texpr\2<vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'\n<Tab>\1\3\0\0\6i\6s\1\0\2\fnoremap\1\texpr\2Bvsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'\n<C-l>\1\3\0\0\6i\6s\1\0\2\fnoremap\1\texpr\2:vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'\n<C-j>\1\3\0\0\6i\6s\bmap\0" },
    loaded = true,
    only_config = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/Users/zacharyho/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ",
    url = "https://github.com/hrsh7th/vim-vsnip-integ"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: git-conflict.nvim
time([[Config for git-conflict.nvim]], true)
try_loadstring("\27LJ\2\nK\0\0\3\0\3\0\t6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0009\1\2\0B\1\1\1K\0\1\0\nsetup\17git-conflict\17safe_require\0", "config", "git-conflict.nvim")
time([[Config for git-conflict.nvim]], false)
-- Config for: vim-vsnip
time([[Config for vim-vsnip]], true)
try_loadstring("\27LJ\2\nÃ\6\0\0\6\0\20\0\0296\0\0\0005\2\1\0'\3\2\0'\4\3\0005\5\4\0B\0\5\0016\0\0\0005\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\0\0005\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0005\2\r\0'\3\14\0'\4\15\0005\5\16\0B\0\5\0016\0\17\0009\0\18\0'\2\19\0B\0\2\1K\0\1\0ﬂ\2            let g:vsnip_snippet_dir = expand('$HOME/.config/dotfiles/nvim/vsnip/.vsnip')\n            let g:vsnip_filetypes = {}\n            let g:vsnip_filetypes.javascriptreact = ['javascript']\n            let g:vsnip_filetypes.typescriptreact = ['typescript', 'javascript']\n            let g:vsnip_filetypes.typescript = ['javascript']\n        \bcmd\bvim\1\0\2\fnoremap\1\texpr\2?vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'\f<S-Tab>\1\3\0\0\6i\6s\1\0\2\fnoremap\1\texpr\2<vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'\n<Tab>\1\3\0\0\6i\6s\1\0\2\fnoremap\1\texpr\2Bvsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'\n<C-l>\1\3\0\0\6i\6s\1\0\2\fnoremap\1\texpr\2:vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'\n<C-j>\1\3\0\0\6i\6s\bmap\0", "config", "vim-vsnip")
time([[Config for vim-vsnip]], false)
-- Config for: tokyonight
time([[Config for tokyonight]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "tokyonight")
time([[Config for tokyonight]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n\\\0\0\4\0\4\0\a6\0\0\0006\2\1\0009\2\2\2'\3\3\0&\2\3\2B\0\2\1K\0\1\0\26nvim_lspconfig.config\16PLUGINS_DIR\14constants\17safe_require\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: smartcolumn.nvim
time([[Config for smartcolumn.nvim]], true)
try_loadstring("\27LJ\2\nJ\0\0\3\0\3\0\t6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0009\1\2\0B\1\1\1K\0\1\0\nsetup\16smartcolumn\17safe_require\0", "config", "smartcolumn.nvim")
time([[Config for smartcolumn.nvim]], false)
-- Config for: gruvbox-material
time([[Config for gruvbox-material]], true)
try_loadstring("\27LJ\2\n…\3\0\0\3\0\6\0\b6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\1\5\0=\1\4\0K\0\1\0\21gruvbox-material\16COLORSCHEME\14constantsˆ\2                if has('termguicolors')\n                    set termguicolors\n                endif\n\n                set background=dark\n\n                let g:gruvbox_material_background='soft'\n                let g:gruvbox_material_better_performance=1\n                let g:gruvbox_material_enable_italic=1\n\n                colorscheme gruvbox-material\n\n            \bcmd\bvim\0", "config", "gruvbox-material")
time([[Config for gruvbox-material]], false)
-- Config for: rose-pine
time([[Config for rose-pine]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "rose-pine")
time([[Config for rose-pine]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
try_loadstring("\27LJ\2\n˚\5\0\0\a\0\25\00096\0\0\0006\2\1\0009\2\2\2'\3\3\0&\2\3\2B\0\2\2\15\0\0\0X\1\18Ä6\1\4\0'\3\5\0006\4\6\0009\4\a\0049\6\b\0B\4\2\0029\4\t\4'\5\n\0B\1\4\0016\1\4\0'\3\5\0006\4\6\0009\4\a\0049\6\b\0B\4\2\0029\4\v\4'\5\f\0B\1\4\0016\1\4\0'\3\5\0'\4\r\0'\5\14\0B\1\4\0016\1\4\0'\3\5\0'\4\15\0'\5\16\0B\1\4\0016\1\4\0'\3\5\0'\4\17\0'\5\18\0B\1\4\0016\1\4\0'\3\5\0'\4\19\0'\5\20\0B\1\4\0016\1\4\0'\3\5\0'\4\21\0'\5\22\0B\1\4\0016\1\4\0'\3\5\0'\4\23\0'\5\24\0B\1\4\1K\0\1\0/:lua require(\"harpoon.ui\").nav_file(6)<CR>\15<leader>h6/:lua require(\"harpoon.ui\").nav_file(5)<CR>\15<leader>h5/:lua require(\"harpoon.ui\").nav_file(4)<CR>\15<leader>h4/:lua require(\"harpoon.ui\").nav_file(3)<CR>\15<leader>h3/:lua require(\"harpoon.ui\").nav_file(2)<CR>\15<leader>h2/:lua require(\"harpoon.ui\").nav_file(1)<CR>\15<leader>h10:lua require(\"harpoon.mark\").add_file()<CR>\radd_file7:lua require(\"harpoon.ui\").toggle_quick_menu()<CR>\vtoggle\ras_table\17check_exists\18preconditions\6n\bmap\20harpoon.keymaps\16PLUGINS_DIR\14constants\17safe_require\0", "config", "harpoon")
time([[Config for harpoon]], false)
-- Config for: true-zen.nvim
time([[Config for true-zen.nvim]], true)
try_loadstring("\27LJ\2\n§\2\0\0\5\0\17\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0'\2\a\0'\3\b\0'\4\t\0B\0\4\0016\0\6\0'\2\a\0'\3\n\0'\4\v\0B\0\4\0016\0\6\0'\2\f\0'\3\r\0'\4\14\0B\0\4\0016\0\6\0'\2\a\0'\3\15\0'\4\16\0B\0\4\1K\0\1\0\22:TZMinimalist<CR>\15<leader>zm\23:'<,'>TZNarrow<CR>\15<leader>zn\6v\17:TZFocus<CR>\15<leader>zf\20:TZAtaraxis<CR>\15<leader>za\6n\bmap\17integrations\1\0\0\1\0\1\flualine\1\nsetup\rtrue-zen\frequire\0", "config", "true-zen.nvim")
time([[Config for true-zen.nvim]], false)
-- Config for: mason-lspconfig.nvim
time([[Config for mason-lspconfig.nvim]], true)
try_loadstring("\27LJ\2\n◊\1\0\0\6\0\b\0\0256\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0006\1\0\0006\3\2\0009\3\3\3'\4\4\0&\3\4\3B\1\2\0024\2\0\0\15\0\1\0X\3\5Ä6\3\5\0009\3\6\3\18\5\1\0B\3\2\2\18\2\3\0009\3\a\0004\5\3\0>\2\1\5B\3\2\1K\0\1\0\nsetup\rget_keys\16table_utils\"nvim_lspconfig.server_configs\16PLUGINS_DIR\14constants\20mason-lspconfig\17safe_require\0", "config", "mason-lspconfig.nvim")
time([[Config for mason-lspconfig.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nä\6\0\0\n\0'\0b6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\2\15\0\0\0X\2\2Ä\14\0\1\0X\2\1ÄK\0\1\0009\2\3\0005\4\14\0005\5\4\0005\6\t\0005\a\a\0009\b\5\0019\t\6\1 \b\t\b=\b\b\a=\a\n\0065\a\v\0009\b\5\0019\t\6\1 \b\t\b=\b\b\a=\a\f\6=\6\r\5=\5\15\0045\5\22\0005\6\21\0005\a\19\0005\b\17\0009\t\16\1=\t\18\b=\b\n\a5\b\20\0009\t\16\1=\t\18\b=\b\f\a=\a\r\6=\6\23\5=\5\24\4B\2\2\0016\2\0\0006\4\25\0009\4\26\4'\5\27\0&\4\5\4B\2\2\2\15\0\2\0X\3\"Ä6\3\28\0009\3\29\0039\5\30\2B\3\2\0026\4\0\0'\6\31\0B\4\2\2\15\0\4\0X\5\25Ä6\5 \0'\a\f\0009\b!\0039\t!\4B\5\4\0016\5 \0'\a\f\0009\b\"\0039\t\"\4B\5\4\0016\5 \0'\a\f\0009\b\23\0039\t\23\4B\5\4\0016\5 \0'\a\f\0009\b#\0039\t#\4B\5\4\0016\5 \0'\a\f\0009\b$\0039\t$\4B\5\4\0016\3\0\0006\5\25\0009\5\26\5'\6%\0&\5\6\5B\3\2\2\15\0\3\0X\4\3Ä\18\4\3\0005\6&\0B\4\2\1K\0\1\0\1\3\0\0\fharpoon\bfzf\25telescope.extensions\fkeymaps\20command_history\14live_grep\15find_files\bmap\22telescope.builtin\ras_table\17check_exists\18preconditions\22telescope.keymaps\16PLUGINS_DIR\14constants\fpickers\fbuffers\1\0\0\1\0\0\1\0\0\1\0\0\n<C-d>\1\0\0\18delete_buffer\rdefaults\1\0\0\rmappings\6n\1\0\0\6i\1\0\0\n<C-q>\1\0\0\16open_qflist\25smart_send_to_qflist\1\0\1\20layout_strategy\rvertical\nsetup\22telescope.actions\14telescope\17safe_require\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nà\1\0\0\4\0\4\0\n6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0009\1\2\0005\3\3\0B\1\2\1K\0\1\0\1\0\2\31show_current_context_start\2\25show_current_context\2\nsetup\21indent_blankline\17safe_require\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\0\3\0\t6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0009\1\2\0B\1\1\1K\0\1\0\nsetup\23treesitter-context\17safe_require\0", "config", "nvim-treesitter-context")
time([[Config for nvim-treesitter-context]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n¨\1\0\0\6\0\b\0\0146\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0009\1\2\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3B\1\2\1K\0\1\0\aui\1\0\0\nicons\1\0\0\1\0\3\24package_uninstalled\b‚úó\22package_installed\b‚úì\20package_pending\b‚ûú\nsetup\nmason\17safe_require\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd lualine.nvim ]]

-- Config for: lualine.nvim
try_loadstring("\27LJ\2\nw\0\0\5\0\6\0\f6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0009\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\21gruvbox-material\nsetup\flualine\17safe_require\0", "config", "lualine.nvim")

vim.cmd [[ packadd cmp-vsnip ]]
vim.cmd [[ packadd vim-vsnip-integ ]]
vim.cmd [[ packadd nvim-cmp ]]

-- Config for: nvim-cmp
try_loadstring("\27LJ\2\n;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvim≈\b\1\0\v\0-\0Z6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\2\14\0\0\0X\1\1Ä2\0NÄ6\1\3\0'\3\5\0B\1\2\2\14\0\1\0X\2\1Ä2\0IÄ6\2\0\0009\2\6\2'\3\b\0=\3\a\0029\2\t\0005\4\r\0005\5\v\0003\6\n\0=\6\f\5=\5\14\0049\5\15\0009\5\16\0059\5\17\0055\a\19\0009\b\15\0009\b\18\b)\n¸ˇB\b\2\2=\b\20\a9\b\15\0009\b\18\b)\n\4\0B\b\2\2=\b\21\a9\b\15\0009\b\22\bB\b\1\2=\b\23\a9\b\15\0009\b\24\bB\b\1\2=\b\25\a9\b\15\0009\b\26\b5\n\27\0B\b\2\2=\b\28\aB\5\2\2=\5\15\0049\5\29\0009\5\30\0054\a\5\0005\b\31\0>\b\1\a5\b \0>\b\2\a5\b!\0>\b\3\a5\b\"\0>\b\4\aB\5\2\2=\5\30\0045\5%\0009\6#\0015\b$\0B\6\2\2=\6&\5=\5'\0045\5*\0009\6\29\0009\6(\0069\6)\6B\6\1\2=\6+\0059\6\29\0009\6(\0069\6)\6B\6\1\2=\6,\5=\5(\4B\2\2\1K\0\1\0K\0\1\0K\0\1\0\18documentation\15completion\1\0\0\rbordered\vwindow\15formatting\vformat\1\0\0\1\0\2\rmaxwidth\0032\14with_text\2\15cmp_format\1\0\1\tname\tpath\1\0\1\tname\rnvim_lua\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\t<CR>\1\0\1\vselect\1\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\26menu,menuone,noselect\16completeopt\6o\flspkind\bcmp\17safe_requireﬂ\2            let g:vsnip_snippet_dir = expand('$HOME/.config/dotfiles/nvim/vsnip/.vsnip')\n            let g:vsnip_filetypes = {}\n            let g:vsnip_filetypes.javascriptreact = ['javascript']\n            let g:vsnip_filetypes.typescriptreact = ['typescript', 'javascript']\n            let g:vsnip_filetypes.typescript = ['javascript']\n        \bcmd\bvim\0", "config", "nvim-cmp")

vim.cmd [[ packadd cmp-nvim-lua ]]
vim.cmd [[ packadd cmp-buffer ]]
vim.cmd [[ packadd nvim-autopairs ]]

-- Config for: nvim-autopairs
try_loadstring("\27LJ\2\n`\0\1\6\0\6\1\f9\1\0\0\18\3\1\0009\1\1\0019\4\2\0\23\4\0\0049\5\2\0B\1\4\0026\2\3\0009\2\4\0025\4\5\0\18\5\1\0D\2\3\0\1\3\0\0\a()\a{}\17tbl_contains\bvim\bcol\bsub\tline\2]\0\1\6\0\6\1\f9\1\0\0\18\3\1\0009\1\1\0019\4\2\0\23\4\0\0049\5\2\0B\1\4\0026\2\3\0009\2\4\0025\4\5\0\18\5\1\0D\2\3\0\1\2\0\0\a[]\17tbl_contains\bvim\bcol\bsub\tline\2\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\b.%)\nmatch\14prev_char\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\b.%}\nmatch\14prev_char\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\b.%]\nmatch\14prev_charì\b\1\0\r\0001\1Å\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\2\14\0\0\0X\3\1Ä2\0sÄ9\3\4\0005\5\5\0005\6\6\0005\a\a\0=\a\b\0066\a\t\0009\a\n\a'\t\v\0'\n\f\0'\v\r\0B\a\4\2=\a\14\6=\6\15\5B\3\2\1\15\0\1\0X\3\2Ä\14\0\2\0X\3\1Ä2\0aÄ9\3\16\0004\5\5\0\18\6\1\0'\b\17\0'\t\17\0B\6\3\2\18\b\6\0009\6\18\0063\t\19\0B\6\3\2\18\b\6\0009\6\18\0069\t\20\0025\v\21\0B\t\2\0A\6\1\2\18\b\6\0009\6\18\0063\t\22\0B\6\3\2>\6\1\5\18\6\1\0'\b\23\0'\t\24\0B\6\3\2\18\b\6\0009\6\18\0063\t\25\0B\6\3\2\18\b\6\0009\6\26\0063\t\27\0B\6\3\2\18\b\6\0009\6\28\6'\t\29\0B\6\3\2>\6\2\5\18\6\1\0'\b\30\0'\t\31\0B\6\3\2\18\b\6\0009\6\18\0063\t \0B\6\3\2\18\b\6\0009\6\26\0063\t!\0B\6\3\2\18\b\6\0009\6\28\6'\t\"\0B\6\3\2>\6\3\5\18\6\1\0'\b#\0'\t$\0B\6\3\2\18\b\6\0009\6\18\0063\t%\0B\6\3\2\18\b\6\0009\6\26\0063\t&\0B\6\3\2\18\b\6\0009\6\28\6'\t'\0B\6\3\0?\6\0\0B\3\2\0016\3\0\0'\5(\0B\3\2\0026\4\0\0'\6)\0B\4\2\2\15\0\4\0X\5\2Ä\14\0\3\0X\5\2Ä2\0\0ÄK\0\1\0009\5*\4\18\a\5\0009\5+\5'\b,\0009\t-\0035\v/\0005\f.\0=\f0\vB\t\2\0A\5\2\1K\0\1\0K\0\1\0K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\6]\0\0\a ]\a[ \6}\0\0\a }\a{ \6)\fuse_key\0\14with_move\0\a )\a( \0\1\3\0\0\twiki\amd\18not_filetypes\0\14with_pair\6 \14add_rules\14fast_wrap\fpattern\5\b%s+\25 [%'%\"%)%>%]%)%}%,] \tgsub\vstring\nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\a\16check_comma\2\19highlight_grey\fComment\bmap\n<C-a>\voffset\3\0\fend_key\6$\14highlight\vSearch\tkeys\31qwertyuiopzxcvbnmasdfghjkl\1\0\2\22ignored_next_char\v[%w%.]\30enable_check_bracket_line\1\nsetup\25nvim-autopairs.conds\24nvim-autopairs.rule\19nvim-autopairs\17safe_require\tÄÄ¿ô\4\0", "config", "nvim-autopairs")

vim.cmd [[ packadd cmp-path ]]
time([[Sequenced loading]], false)
-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <leader>nf <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "<lt>leader>nf", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>nt <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "<lt>leader>nt", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>nb <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "<lt>leader>nb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>cy <cmd>lua require("packer.load")({'nerdcommenter'}, { keys = "<lt>leader>cy", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>c<space> <cmd>lua require("packer.load")({'nerdcommenter'}, { keys = "<lt>leader>c<lt>space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>fm <cmd>lua require("packer.load")({'vim-prettier'}, { keys = "<lt>leader>fm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>cn <cmd>lua require("packer.load")({'nerdcommenter'}, { keys = "<lt>leader>cn", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>gw <cmd>lua require("packer.load")({'vim-grepper'}, { keys = "<lt>leader>gw", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>gq <cmd>lua require("packer.load")({'vim-grepper'}, { keys = "<lt>leader>gq", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>gr <cmd>lua require("packer.load")({'vim-grepper'}, { keys = "<lt>leader>gr", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'emmet-vim'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'emmet-vim'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'emmet-vim'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-easy-align', 'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'emmet-vim'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'emmet-vim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'emmet-vim'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'nvim-treesitter'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'nvim-surround'}, { event = "BufReadPost *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles(1) end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
