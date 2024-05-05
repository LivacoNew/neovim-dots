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
}
