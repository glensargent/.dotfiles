return require("packer").startup(function(use)

    -- set up packer and color theme
    use("wbthomason/packer.nvim")
    use("navarasu/onedark.nvim") -- goated colour scheme

    -- nvim-web-devicons
    use('nvim-tree/nvim-web-devicons')

    -- tree sitter
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    -- auto closing
    use("windwp/nvim-autopairs")
    use("windwp/nvim-ts-autotag")

    -- automcompletion
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")
   
    -- configuring lsp servers
    use("neovim/nvim-lspconfig")
    use('hrsh7th/vim-vsnip')
    use ('simrat39/rust-tools.nvim')

    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},         -- Required
        {'hrsh7th/cmp-nvim-lsp'},     -- Required
        {'hrsh7th/cmp-buffer'},       -- Optional
        {'hrsh7th/cmp-path'},         -- Optional
        {'saadparwaiz1/cmp_luasnip'}, -- Optional
        {'hrsh7th/cmp-nvim-lua'},     -- Optional

        -- Snippets
        {'L3MON4D3/LuaSnip'},             -- Required
        {'rafamadriz/friendly-snippets'}, -- Optional
      }
    }

    -- tmux navigation
    use("christoomey/vim-tmux-navigator")
    use("szw/vim-maximizer")
    
    -- gcc for quick commenting
    use("numToStr/Comment.nvim")
    
    -- nvim file tree and lualine
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use("nvim-lualine/lualine.nvim")

    use('nvim-lua/plenary.nvim')

    -- fuzzy finding and grepping
    use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})
    use {
      'nvim-telescope/telescope.nvim', branch = "0.1.x",
      requires = { {'nvim-lua/plenary.nvim'} }
    }



    use "ray-x/go.nvim"
    use "ray-x/guihua.lua" -- recommanded if need floating window support

    use 'mfussenegger/nvim-dap'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'rcarriga/nvim-dap-ui'

    -- git signs
    use("lewis6991/gitsigns.nvim")

    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        requires = { {"nvim-tree/nvim-web-devicons"} }
    })

    -- ai magic
    use("github/copilot.vim")
    
  end)
