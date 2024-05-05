return {
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
        },
        config = function()
            local wk = require("which-key")
            wk.register({
                ["<leader>gg"] = {"<cmd>LazyGit<cr>", "LazyGit"}
            })
        end
    },

    -- Telescope, for fuzzy finding
    -- https://github.com/nvim-telescope/telescope.nvim
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File"},
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Fuzzy Find"},
            { "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy Find in Buffer"},
            { "<leader>fv", "<cmd>Telescope buffers<cr>", desc = "Find Buffer"},
        }
    }
}
