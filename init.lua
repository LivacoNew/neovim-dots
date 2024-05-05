local load_start = os.clock()

-- Required for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("plugins")

-- Colorscheme
vim.opt.background = "dark"
vim.cmd("colorscheme oxocarbon")
vim.api.nvim_set_hl(0, "NvimTreeNormal", {fg = "#FFFFFF", bg = "#101010"})

-- Vim settings
vim.opt.relativenumber = true
vim.opt.number = false
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"

-- Keybindings
vim.keymap.set("i", "<C-BS>", "<C-W>") -- CTRL + Backspace

print(string.format("Loaded in %.4f seconds.", (os.clock() - load_start)))
