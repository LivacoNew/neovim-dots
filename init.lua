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
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight=0

-- Keybindings
vim.keymap.set("i", "<C-BS>", "<C-W>") -- CTRL + Backspace

local startup_time = os.clock() - load_start
if startup_time > 0.5 then
    print(string.format("Warning: Slow load time, loaded in %.4f seconds.", startup_time))
end
