local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Merge all plugin files 
-- TODO: Automatically detect these
local plugins = {}
for k,v in pairs(require("plugins.visual")) do
    table.insert(plugins, v)
end 
for k,v in pairs(require("plugins.development")) do
    table.insert(plugins, v)
end 
for k,v in pairs(require("plugins.lsp")) do
    table.insert(plugins, v)
end 

require("lazy").setup(plugins)
