return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("navarasu/onedark.nvim") -- goated colour scheme
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })

    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")



    use("tzachar/cmp-tabnine", { run = "./install.sh" })

    use "ray-x/go.nvim"
    use "ray-x/guihua.lua" -- recommanded if need floating window support
  
  end)