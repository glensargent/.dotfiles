return {
    'nvim-tree/nvim-tree.lua',
    config = function()
        local HEIGHT_RATIO = vim.g.nvim_tree_height_ratio or 0.8
        local WIDTH_RATIO = vim.g.nvim_tree_width_ratio or 0.5
        -- Disable netrw at the start (strongly recommended)
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- Enable true color support
        vim.opt.termguicolors = true

        -- Setup nvim-tree
        require("nvim-tree").setup({
            hijack_netrw = true,
            sync_root_with_cwd = true,
            view = {
                relativenumber = true,
                float = {
                    enable = true,
                    open_win_config = function()
                        local screen_w = vim.opt.columns:get()
                        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                        local window_w = math.floor(screen_w * WIDTH_RATIO)
                        local window_h = math.floor(screen_h * HEIGHT_RATIO)
                        local center_x = (screen_w - window_w) / 2
                        local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
                        return {
                            border = "rounded",
                            relative = "editor",
                            row = center_y,
                            col = center_x,
                            width = window_w,
                            height = window_h,
                        }
                    end,
                },
            },
        })
    end
}