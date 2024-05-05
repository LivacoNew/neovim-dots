require("lazy").setup({
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

    -- Lazygit.nvim for git management
    -- https://github.com/kdheepak/lazygit.nvim
    {
        "kdheepak/lazygit.nvim",
        event = "VeryLazy",
    	cmd = {
    		"LazyGit",
    		"LazyGitConfig",
    		"LazyGitCurrentFile",
    		"LazyGitFilter",
    		"LazyGitFilterCurrentFile",
    	},
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
           { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    },
})
