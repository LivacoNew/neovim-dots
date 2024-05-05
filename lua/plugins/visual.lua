return {
    -- Oxocarbon Color Scheme
    -- https://github.com/nyoom-engineering/oxocarbon.nvim
	{"nyoom-engineering/oxocarbon.nvim"}, 

    -- WhichKey for when I forget what i've bound
    -- https://github.com/folke/which-key.nvim
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },

    -- Lua Line, Status Bar
    -- https://github.com/nvim-lualine/lualine.nvim
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function() 
            require("lualine").setup({
                options = {
                    icons_enabled = true,
                    theme = 'codedark',
                    component_separators = { left = '|', right = '|'},
                }
            })
        end 
    }
}
