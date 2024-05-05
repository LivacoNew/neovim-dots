return {
    -- Oxocarbon Color Scheme
    -- https://github.com/nyoom-engineering/oxocarbon.nvim
	{ 
		"nyoom-engineering/oxocarbon.nvim"
		-- Add in any other configuration; 
		--   event = foo, 
		--   config = bar
		--   end,
	}, 

    -- WhichKey for when I forget what i've bound
    -- https://github.com/folke/which-key.nvim
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
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
