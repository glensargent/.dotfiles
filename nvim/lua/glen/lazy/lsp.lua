return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},    -- Required
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional
      {'hrsh7th/cmp-cmdline'},      -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'} -- Optional
  },
  config = function()
    -- lsp zero
    local lsp = require 'lsp-zero'
    local lspconfig = require 'lspconfig'
    local configs = require 'lspconfig.configs'

    lsp.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false
      })
    end)

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

    require'lspconfig'.volar.setup{
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
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<space>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })


  end
}