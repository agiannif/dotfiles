require("config.lazy")

vim.opt.number = true

vim.opt.mouse = 'a'

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true

vim.api.nvim_set_option("clipboard", "unnamed")

vim.cmd("syntax enable")

