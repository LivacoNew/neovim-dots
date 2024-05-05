local load_start = os.clock()
require("plugins")

-- Colorscheme
vim.opt.background = "dark"
vim.cmd("colorscheme oxocarbon")

-- Vim settings
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.relativenumber = true
vim.opt.number = false
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"

print(string.format("Loaded in %.4f seconds.", (os.clock() - load_start)))
