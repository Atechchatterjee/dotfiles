local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr) end

local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

-- attaching the different language installed servers
local servers = { 'pyright', 'clangd', 'tsserver', 'jdtls' }

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- configuring lsp installer
local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(opts)
end)

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    },
  cmd = {
     "clangd",
     "--background-index",
     "-j=12",
     "--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
     "--clang-tidy",
     "--clang-tidy-checks=*",
     "--all-scopes-completion",
     "--cross-file-rename",
     "--completion-style=detailed",
     "--header-insertion-decorators",
     "--header-insertion=iwyu",
     "--pch-storage=memory",
 }
})

