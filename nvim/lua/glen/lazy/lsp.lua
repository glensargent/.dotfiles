return {
  'neovim/nvim-lspconfig',
  config = function()
    -- Use the new vim.lsp.config API
    vim.lsp.config.gopls = {
      cmd = {"/opt/homebrew/bin/gopls"},
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_markers = { "go.work", "go.mod", ".git" },
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
        },
      },
    }

    vim.lsp.config.hls = {
      filetypes = { "haskell", "lhaskell", "cabal" },
      root_markers = { "hie.yaml", "stack.yaml", "cabal.project", "*.cabal", ".git" },
      settings = {
        haskell = {
          cabalFormattingProvider = "cabalfmt",
          formattingProvider = "ormolu",
        },
      },
    }

    vim.lsp.config.tailwindcss = {
      filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
      root_markers = { "tailwind.config.js", "tailwind.config.cjs", "tailwind.config.mjs", "tailwind.config.ts", ".git" },
    }

    vim.lsp.config.ts_ls = {
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
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
      },
      root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
    }

    vim.lsp.config.vue_ls = {
      filetypes = {'vue'},
      root_markers = { "package.json", ".git" },
      init_options = {
        typescript = {
          tsdk = '/opt/homebrew/lib/node_modules/typescript/lib'
        },
      },
    }

    vim.lsp.config.rust_analyzer = {
      filetypes = { "rust" },
      root_markers = { "Cargo.toml", "rust-project.json", ".git" },
    }

    vim.lsp.config.elmls = {
      filetypes = { "elm" },
      root_markers = { "elm.json", ".git" },
    }

    -- set the filetype for roc files so that the lsp can actually be used
    vim.cmd [[
      autocmd BufRead,BufNewFile *.roc set filetype=roc
    ]]

    vim.lsp.config.svelte = {
      filetypes = { "svelte" },
      root_markers = { "package.json", ".git" },
    }

    vim.lsp.config.ocamllsp = {
      filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
      root_markers = { "*.opam", "esy.json", "package.json", "dune-project", "dune-workspace", ".git" },
    }

    vim.lsp.config.gleam = {
      filetypes = { "gleam" },
      root_markers = { "gleam.toml", ".git" },
    }

    vim.lsp.config.terraformls = {
      filetypes = { "terraform", "terraform-vars" },
      root_markers = { ".terraform", ".git" },
    }

    vim.lsp.config.elixirls = {
      cmd = { "/opt/homebrew/bin/elixir-ls" },
      filetypes = { "elixir", "eelixir", "heex", "surface" },
      root_markers = { "mix.exs", ".git" },
    }

    vim.lsp.config.cssls = {
      filetypes = { "css", "scss", "less" },
      root_markers = { "package.json", ".git" },
    }

    -- Enable LSP servers
    vim.lsp.enable('gopls')
    vim.lsp.enable('hls')
    vim.lsp.enable('tailwindcss')
    vim.lsp.enable('ts_ls')
    vim.lsp.enable('vue_ls')
    vim.lsp.enable('rust_analyzer')
    vim.lsp.enable('elmls')
    vim.lsp.enable('svelte')
    vim.lsp.enable('ocamllsp')
    vim.lsp.enable('gleam')
    vim.lsp.enable('terraformls')
    vim.lsp.enable('elixirls')
    vim.lsp.enable('cssls')

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
