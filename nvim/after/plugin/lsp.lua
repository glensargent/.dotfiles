-- lsp zero
local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls',
  'rust_analyzer',
  'gopls',
})

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})


