local handlers = safe_require(constants.PLUGINS_DIR .. "nvim_lspconfig.handlers")

-- TODO Remove duplication here with config.lua on importing handlers
local common_on_attach = {}
if handlers then
    common_on_attach = handlers.on_attach
end

local server_configs = {
    bashls = true,
    cssls = true,
    cssmodules_ls = true,
    dockerls = true,
    emmet_ls = true,
    -- eslint = true,
    graphql = true,
    html = true,
    jdtls = true,
    jsonls = true,
    prismals = true,
    pyright = true,
    sumneko_lua = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
            },
        },
    },
    tailwindcss = true,
    tsserver = {
        on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
            -- Call the common_on_attach function whenever a server has its own on_attach
            common_on_attach(client, bufnr)
        end,
    },
    vimls = true,
    yamlls = true,
}

return server_configs
