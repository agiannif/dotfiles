-- sets
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.spelllang = "en_us"
vim.opt.spell = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- remaps
--- project view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--- shifting blocks of code in visual mode using J, K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--- when appending with J, keep cursor in place
vim.keymap.set("n", "J", "mzJ`z")

--- when half-page jumping with C-d, C-u, keep cursor in place
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--- keep search terms in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--- use leader to paste or delete using void register
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

--- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
