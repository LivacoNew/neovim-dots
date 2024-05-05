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
    },

    -- Nvim-tree, file explorer
    -- https://github.com/nvim-tree/nvim-tree.lua
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
            vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = function(data)
                -- Only auto-open if we're asking to edit a directory 
                if vim.fn.isdirectory(data.file) == 0 then return end 
                vim.g.nvimtree_auto_close = false -- Prevent nvimtree from auto-closing itself when it's the last buffer, as currently it will be the only buffer
                require("nvim-tree.api").tree.open() 
            end })
            vim.api.nvim_create_autocmd("BufEnter", {
                nested = true,
                callback = function()
                    if not vim.g.nvimtree_auto_close then 
                        vim.g.nvimtree_auto_close = true
                        return
                    end 
                    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
                        vim.cmd "quit"
                    end
                end
            })
        end,
        keys = {
            { "<leader>e", "<cmd>NvimTreeFocus<cr>", desc = "Focus Nvim Tree" },
            { "<leader>v", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Nvim Tree" }
        }
    }
}
