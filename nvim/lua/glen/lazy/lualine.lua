return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup {
      sections = {
        lualine_a = {
          {
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path = 2 -- 0 = just filename, 1 = relative path, 2 = absolute path
          }
        },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
      }
    }
  end
}