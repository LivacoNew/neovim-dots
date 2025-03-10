local load_start = os.clock()

-- Required for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

require("plugins")

-- Colorscheme
vim.opt.background = "dark"
vim.cmd("colorscheme oxocarbon")
if os.getenv("TRANSPARENT_THEME") then
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeNormal", {bg = "none"})
    vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", {fg = "#242424", bg = "none"})
    vim.api.nvim_set_hl(0, "LineNr", {bg = "none"})
    vim.api.nvim_set_hl(0, "LineNrAbove", {bg = "none"})
    vim.api.nvim_set_hl(0, "LineNrBelow", {bg = "none"})
    vim.api.nvim_set_hl(0, "LineNrBelow", {bg = "none"})
    vim.api.nvim_set_hl(0, "SignColumn", {bg = "none"})
    vim.api.nvim_set_hl(0, "CursorLine", {bg = "none"})
    vim.api.nvim_set_hl(0, "CursorLineNr", {bg = "none"})
else 
    -- vim.api.nvim_set_hl(0, "NvimTreeNormal", {fg = "#FFFFFF", bg = "#101010"})
    vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", {fg = "#242424", bg = "#161616"})
end

-- Vim settings
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight=0
vim.opt.scrolloff=999

-- Keybindings
vim.keymap.set("i", "<C-BS>", "<C-W>") -- CTRL + Backspace
vim.keymap.set("n", "<leader>jf", function()
	vim.cmd("%!jq '.'")
end)


vim.filetype.add({
	pattern = {
		['.*%.blade%.php'] = 'blade',
	}
})

-- Load other modules
require("core")

local startup_time = os.clock() - load_start
if startup_time > 0.5 then
    print(string.format("Warning: Slow load time, loaded in %.4f seconds.", startup_time))
end

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- Thanks https://www.reddit.com/r/neovim/comments/1ciobdk/how_to_resize_window_more_fluidly/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })

vim.keymap.set("n", "<leader>rp", function()
	-- https://www.reddit.com/r/neovim/comments/10fzpfi/comment/j50hr5b/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
	local filePath = vim.fn.expand("%:.")
	local lineNumber = vim.fn.line(".")
	vim.fn.setreg("+", filePath .. ":" .. lineNumber)
end, { desc = "Copy file name and line number." })
vim.keymap.set("n", "<leader>E", function()
	vim.fn.setreg("+", "")
end, { desc = "Copy ANSII Escape Key." })
