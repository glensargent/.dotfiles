-- line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- tabs & indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- line wrapping
vim.opt.wrap = false

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- backspace
vim.opt.backspace = "indent,eol,start"

-- clipboard
vim.opt.clipboard:append("unnamedplus")

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- vim-go configuration
vim.g.go_fmt_command = "goimports" -- Configure the formatter to use goimports
vim.g.go_code_completion_enabled = 0 -- Disable code completion since I use copilot
-- vim.g.go_auto_sameids = 1 -- Highlight same identifier occurrences
vim.g.go_gocode_propose_imports = 1 -- Propose imports
vim.g.go_list_type = "quickfix" -- Show :GoTest and :GoRun errors in the quickfix window
vim.g.go_doc_keywordprg_enabled = 0 -- remove keyword lookup so lsp can deal with it

-- disable copilot tab setting so it can be remapped
vim.g.copilot_no_tab_map = true

