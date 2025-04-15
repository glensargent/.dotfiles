return {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require 'lspconfig'
    local configs = require 'lspconfig.configs'

    lspconfig.gopls.setup({
      cmd = {"/opt/homebrew/bin/gopls"},
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
        },
      },
    })
    lspconfig.hls.setup({
      filetypes = { "haskell", "lhaskell", "cabal" },
      settings = {
        haskell = {
          cabalFormattingProvider = "cabalfmt",
          formattingProvider = "ormolu",
        },
      },
    })
    lspconfig.tailwindcss.setup{}
    lspconfig.ts_ls.setup({
      settings = {
        format = {
          enable = true,
        },
      },
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = "/opt/homebrew/lib/node_modules/@vue/typescript-plugin",
            languages = {"javascript", "typescript", "vue"},
          },
        },
      },
      filetypes = {
        "javascript",
        "typescript",
        "vue",
      },
    })
    lspconfig.volar.setup{
      filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
      init_options = {
        typescript = {
          tsdk = '/opt/homebrew/lib/node_modules/typescript/lib'
        },
      },
    }
    lspconfig.rust_analyzer.setup{}
    lspconfig.elmls.setup{}
    configs.roc = {
      default_config = {
        cmd = {"/Users/glensargent/Documents/roc_nightly-macos_apple_silicon-2024-05-06-5984e4c585d/roc_language_server"},
        filetypes = { 'roc' },
        root_dir = lspconfig.util.root_pattern 'main.roc',
      },
    }
    lspconfig.roc.setup{}
    -- set the filetype for roc files so that the lsp can actually be used
    vim.cmd [[
      autocmd BufRead,BufNewFile *.roc set filetype=roc
    ]]
    lspconfig.svelte.setup{}
    lspconfig.ocamllsp.setup{}
    lspconfig.gleam.setup{}
    lspconfig.terraformls.setup{}
    lspconfig.elixirls.setup{
      cmd = { "/opt/homebrew/bin/elixir-ls" }
    }

    vim.diagnostic.config({
      virtual_text = true
    })
    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)

        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<space>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })
  end
}
