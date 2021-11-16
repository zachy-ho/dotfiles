-- Most things in this file are stolen from TJ Devries config!
-- Also this guy's one looks tidy af: https://github.com/martinsione/dotfiles/tree/master/src/.config/nvim

-- Lspkind
require('lspkind').init()

local has_lsp, lspconfig = pcall(require, "lspconfig")
if not has_lsp then
    return
end

-- On_attach to map keys after the language server(s) attaches to the current buffer
local custom_attach = function(_, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    local opts = { noremap=true, silent=true }

    -- Use ',' as second leader for LSP things
    buf_set_keymap('n', ',gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', ',gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', ',gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', ',gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', ',rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', ',gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', ',fm', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    -- Diagnostics
    buf_set_keymap('n', ',ds', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', ',dp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ',dn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', ',dl', [[ <cmd>lua vim.lsp.diagnostic.set_loclist({open_loclist=true})<CR> <bar> :setlocal wrap<CR>]], opts)

    -- Not really used often (yet)
    -- buf_set_keymap('n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

end

-- Sumneko-lua (START)
local system_name
if vim.fn.has("mac") == 1 then
    system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
    system_name = "Windows"
else
    print("Unsupported system for sumneko")
end

local sumneko_root_path = '/Users/zacharyho/.language_servers/lua-language-server'
local sumneko_binary = sumneko_root_path..("/bin/"..system_name.."/lua-language-server")

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- Sumneko-lua (END)

local custom_capabilities = vim.lsp.protocol.make_client_capabilities()
custom_capabilities.textDocument.completion.completionItem.snippetSupport = true
custom_capabilities = require('cmp_nvim_lsp').update_capabilities(custom_capabilities)

local eslint = {
    lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = { '%f:%l:%c: %m' },
    formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}',
    formatStdin = true
}

local servers = {
    bashls = true,
    cssls = true,
    dockerls = true,
    efm = {
        init_options = { documentFormatting = true },
        settings = {
            rootMarkers = { '.git/' },
            languages = {
                javascript = { eslint },
                javascriptreact = { eslint },
                ['javascript.jsx'] = { eslint },
                typescript = { eslint },
                typescriptreact= { eslint },
                ['typescript.tsx'] = { eslint },
            }
        },
        filetypes = {
            'javascript',
            'javascriptreact',
            'javascript.jsx',
            'typescript',
            'typescriptreact',
            'typescript.tsx',
        }
    },
    html = true,
    java_language_server = {
        cmd = { '~/.language_servers/java-language-server/dist/lang_server_mac.sh' }
    },
    jsonls = {
        commands = {
            Format = {
                function()
                    vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
                end
            }
        }
    },
    pyright = true,
    sumneko_lua = {
        cmd = { sumneko_binary, "-E", sumneko_root_path.."/main.lua" };
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in Neovim)
                    version = "LuaJIT",
                    -- Setup your lua path
                    path = runtime_path,
                },
                diagnostics = {
                    -- Get the language server to recognize the 'vim' global
                    globals = {'vim'}
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false
                }
            }
        }
    },
    tsserver = true,
    vimls = true,
    yamlls = true

}

local diagnostic_signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(diagnostic_signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

local setup_server = function(server, config)
    if not config then
        return
    end

    if type(config) ~= "table" then
        config = {}
    end

    config = vim.tbl_deep_extend("keep", {
        on_attach = custom_attach,
        capabilities = custom_capabilities,
        flags = {
            debounce_text_changes = 50,
        }
    }, config)

    lspconfig[server].setup(config)
end

for server, config in pairs(servers) do
    setup_server(server, config)
end
