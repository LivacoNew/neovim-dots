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
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Fuzzy Find" },
            { "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy Find in Buffer" },
            { "<leader>fv", "<cmd>Telescope buffers<cr>", desc = "Find Buffer" },
        }
    },

    -- Comment.nvim to comment out lines fast
    -- https://github.com/numToStr/Comment.nvim
    {
        'numToStr/Comment.nvim',
        config = function()
            -- Tried setting the binds in opt but just couldn't get them to work for some reason
            vim.keymap.set("n", "<leader>/", function()
                require("Comment.api").toggle.linewise.count(math.max(1, vim.v.count))
            end, {desc = "Toggle comment."})

            vim.keymap.set("n", "<leader>?", function()
                require("Comment.api").toggle.blockwise.count(math.max(1, vim.v.count))
            end, {desc = "Toggle block comment."})

            require('Comment').setup()
        end, 
        lazy = false,
    },

    -- Spectre for finding/replacing easily
    {
        "nvim-pack/nvim-spectre",
        keys = {
            { "<leader>ss", "<cmd>lua require('spectre').toggle()<cr>", desc = "Toggle Spectre" },
            { "<leader>sw", "<cmd>lua require('spectre').open_file_search({select_word=false})<cr>", desc = "Search current with file." },
        },
        lazy = false
    }
}
