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
}
