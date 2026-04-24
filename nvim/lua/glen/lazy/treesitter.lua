return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup()

        require("nvim-treesitter").install({
            "lua",
            "javascript",
            "html",
            "css",
            "typescript",
            "tsx",
            "go",
            "vue",
            "svelte",
            "yaml",
            "json",
            "dockerfile",
            "make",
            "terraform",
            "rust",
            "haskell",
            "bash",
            "clojure",
            "fennel",
            "scheme",
            "commonlisp",
        })

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(ev)
                local lang = vim.treesitter.language.get_lang(ev.match) or ev.match
                local ok = pcall(vim.treesitter.language.inspect, lang)
                if not ok then
                    return
                end

                local max_filesize = 1000 * 1024
                local stats_ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(ev.buf))
                if stats_ok and stats and stats.size > max_filesize then
                    vim.notify(
                        "File larger than 1MB, treesitter disabled for performance",
                        vim.log.levels.WARN,
                        { title = "Treesitter" }
                    )
                    return
                end

                vim.treesitter.start(ev.buf, lang)
                vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
