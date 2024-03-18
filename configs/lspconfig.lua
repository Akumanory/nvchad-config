local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require('lspconfig')

lspconfig.clangd.setup {
  cmd = {   "clangd",
            "--completion-style=detailed",
            "--background-index",
            "-j=8",
            "--clang-tidy",
            -- "--clang-tidy-checks=*",
            "--all-scopes-completion",
            "--cross-file-rename",
            "--header-insertion-decorators",
            "--header-insertion=iwyu",
            "--pch-storage=memory"
        },
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

lspconfig.cmake.setup {
    cmd = { "cmake-language-server" },
    filetype = { "cmake" },
    on_attach = function (client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
        on_attach(client, bufnr)
    end,
    capabilities = capabilities,
}

