local load_start = os.clock()

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

-- Plugins Loaded
require("plugins")
vim.opt.background = "dark"
vim.cmd("colorscheme oxocarbon")

-- Which-Key
local wk = require("which-key")

print(string.format("Loaded in %.4f seconds.", (os.clock() - load_start)))
