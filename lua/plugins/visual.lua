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
		config = function()
			require("which-key").setup()
		end
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
                    disabled_filetypes = { 'packer', 'NvimTree' } -- Credit: https://www.reddit.com/r/neovim/comments/tth9qh/comment/i2y69mv/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
                },
                sections = {
                    lualine_c = {function() 
                        -- Credit: https://www.reddit.com/r/neovim/comments/xy0tu1/comment/irfegvd/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
                        local recording_register = vim.fn.reg_recording()
                        if recording_register == "" then
                            return ""
                        else
                            return "Recording @" .. recording_register
                        end
                    end}
                }
            })
        end 
    },

    {
        'akinsho/bufferline.nvim', 
        version = "*", 
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup({})

            vim.keymap.set("n", "]", function()
                vim.cmd("bnext")
            end, {desc = "Next Buffer."})
            vim.keymap.set("n", "[", function()
                vim.cmd("bprev")
            end, {desc = "Previous Buffer."})
            vim.keymap.set("n", "<leader>bc", function()
                vim.cmd("bdelete")
                vim.cmd("bnext")
            end, {desc = "Close Buffer."})
        end,
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
                require("nvim-tree.api").tree.open() 
            end })
        end,
        keys = {
            { "<leader>e", "<cmd>NvimTreeFocus<cr>", desc = "Focus Nvim Tree" },
            { "<leader>v", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Nvim Tree" }
        }
    },

    -- Alpha-Nvim, greeter
    -- https://github.com/goolord/alpha-nvim/tree/main
    {
        'goolord/alpha-nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'nvim-lua/plenary.nvim'
        },
        config = function()
            local dashboard = require("alpha.themes.dashboard")
            dashboard.section.header.val = {
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⠿⠓⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠃⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⡟⠀⢀⡆⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠀⠅⠀⠀⠀⠀⢀⡄⠀⠀⠀⣿⣿⣿⣗⣠⣾⡇⠀⠀⠀⠀⢠⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⢸⣆⠀⠀⢰⣿⣿⣿⣿⣿⣯⠀⢀⣴⠆⠀⠻⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⣷⠀⠀⠀⠀⠀⠀⢸⣿⠀⢀⣾⣿⣿⣿⣿⣿⡿⣥⣾⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⡆⠀⠀⣀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⢹⣿⠀⠀⠀⣴⠃⠀⣠⡆⢀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠱⣄⠀⠀⠀⠀⠈⣿⡇⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠘⠁⠀⠀⣰⣿⠀⢰⠟⠀⣤⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⢀⠁⠀⢀⣰⣿⣿⡿⠆⠈⠀⣰⣷⡄⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠘⢿⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⡾⣧⡜⠀⣠⣿⣿⣿⣿⡿⠋⣹⣿⣿⣿⠟⢸⣿⣦⣴⣿⣿⣿⡿⠁⠀⠀⣾⣿⣿⠁⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⢀⠀⠀⢹⣿⣧⠀⠀⠀⠀⡀⢀⣾⢀⣿⣿⣿⣾⣿⣿⣿⣿⠛⠁⢠⠿⠟⠉⠁⠀⢸⣹⣿⣿⠛⠻⣯⠁⠀⠀⣀⣿⠿⠁⠀⠀⠀⣆⢹]],
                [[⠀⠀⠰⣄⠸⣷⡄⠀⢿⣟⠀⠀⠀⠀⣷⡀⣇⠀⣿⣿⠿⣿⠛⣿⠏⠀⠀⡄⠀⢀⣴⡾⠁⠀⣼⣿⡿⠏⠀⠐⣿⡄⠀⣰⠋⠀⠀⣺⠀⠀⠀⢹⣘]],
                [[⠀⠀⠠⣽⣶⡿⠇⠀⠀⢉⠀⠶⠒⠀⠘⢷⣿⣥⠈⠿⠀⠘⢆⠘⠀⢠⣿⡁⠀⣾⣿⠃⠀⣸⢿⣿⣇⣀⠀⢀⣿⡇⠀⡘⠀⠀⠸⣿⠀⠀⠀⢸⠁]],
                [[⠀⠀⠀⠘⠋⢀⠀⣄⠀⣆⠁⣾⣿⣧⠀⠘⣿⣿⣦⢸⣦⠀⠈⣤⣼⣿⣿⣿⣾⡿⠁⠀⠈⣠⣾⣿⣿⣿⣿⣿⣿⡇⢀⣧⠀⠲⣀⣿⡆⠀⠐⠀⠀]],
                [[⠀⠀⠀⠀⡶⢠⣾⡿⠷⠿⢷⣿⣿⣿⠇⠀⠋⢹⣿⣶⣿⣷⣶⣿⣿⣿⠋⠉⣿⠃⠀⢀⣾⣿⣿⣿⣿⡿⠻⠙⠿⡇⠈⣿⠁⠀⣿⠏⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⡀⠙⡁⠶⣿⡿⢒⣠⠀⡤⠀⢐⠀⠸⣿⣿⣿⣿⣿⡟⠉⢿⠀⢸⣿⡀⠀⢸⣿⣿⣿⠟⠁⠀⠀⠀⠀⢱⠀⠎⠠⠔⠁⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⣶⠀⡇⢄⠘⠲⣦⠰⠟⠉⠒⠲⡄⠀⠁⢸⣿⠟⠁⢸⠟⢣⠀⠻⡀⠘⢿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠘⡆⠀⣶⠃⣰⡆⠀⠀⠀⠀⠀]],
                [[⠂⠀⣿⣦⠈⠈⠛⢶⣦⠀⡸⡀⠀⠀⡸⠀⠀⠈⠁⠀⠰⠃⠀⢸⣄⠀⠘⠂⡀⢻⣿⡿⠟⠀⢤⠀⠀⠀⠀⠀⠀⢰⠗⢠⡯⢰⣿⠁⠀⠀⠀⠀⠀]],
                [[⠀⣼⣿⡿⠁⠀⠈⢀⣄⠀⠷⣬⣑⡨⣴⡇⣴⠀⢀⣄⣠⣤⣴⣿⣾⣷⢄⡀⠀⠈⠀⠀⠈⠓⠋⠀⠀⠀⠀⢀⣼⠏⠀⣸⡇⢨⡏⠀⠀⠀⠀⠀⠀]],
                [[⠀⢫⣿⡃⠀⢰⣿⣦⣅⡀⠛⠶⠶⠶⠌⠁⠀⠀⠀⠀⠉⠉⣿⣹⣿⠉⠙⣌⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⡞⠁⠀⣰⢫⡇⠈⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠈⠇⠘⠘⢿⣥⣀⠉⠛⣿⣷⣶⣿⣿⡟⢀⣴⠂⠀⠀⠀⠹⣿⣧⡀⠀⠙⢦⡀⠀⠀⢦⣄⣤⣨⣭⣤⣠⠴⠋⠀⠸⠁⠀⢦⡀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⣬⣙⡛⠓⠒⢒⢀⣤⠀⣄⠻⣿⣄⠀⠀⠀⢀⣿⣿⣽⣦⡀⠀⠀⠳⣄⡀⠀⠈⠛⠛⠛⠁⠀⡠⠞⠁⠀⠻⣦⡹⣦⡐⢄⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⣻⠟⣛⣃⣸⣿⡇⣹⣿⡷⠀⣠⠟⢻⣿⢿⠛⠋⠃⡄⠀⠈⢿⣶⣶⠦⢶⡖⠆⢁⣄⠐⢿⣷⣄⠈⠻⣌⢻⣆⠡⡀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⢋⣼⣿⣿⡿⠙⢁⣾⣿⡇⠀⠀⣠⣾⣿⠀⠀⠀⣴⠃⠀⣀⣀⡈⠉⠛⢷⣾⠀⠻⣿⣷⣄⠙⠛⣡⣄⡹⣧⠹⡇⢱]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠘⠗⣠⣌⠛⠀⠹⠿⠿⣇⠀⠀⠻⠿⠋⠀⠀⠋⠁⡔⠚⠉⣉⡋⠐⠀⠀⢟⠀⠀⠈⠻⣿⠇⣀⠈⠛⢛⣿⡗⢃⡌]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⢛⣴⣿⣿⣧⠰⣷⢰⡆⣶⢠⠀⠰⣦⣤⣤⣴⠶⠉⠀⢰⣾⣿⣿⣦⠈⠀⠀⠀⠀⠀⠀⠨⡘⢿⣿⣿⣿⣿⠇⡼⠀]],
                [[⠀⠀⠀⠀⢀⣀⣤⠶⢟⣫⣴⣿⣿⣿⣿⠏⠰⣤⡤⠔⠀⠀⠀⠀⠉⠉⠉⠁⠀⠀⠀⠈⠻⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠈⠒⠦⠭⠭⠥⠚⠀⠀]],
                [[⠀⠀⠴⠞⣛⣭⣴⣾⣿⣿⣿⣿⠿⠛⣡⢸⣷⣌⠓⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⣦⠐⣌⠻⢿⣿⣿⣷⣦⣬⣓⡒⠤⠤⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠤⣭⣭⣭⣭⣭⣭⣭⣭⠐⢶⡃⠉⠘⠿⠿⠈⡁⣠⣾⣿⣿⢿⣷⣶⣄⡙⠂⢾⣿⠀⠟⣡⣤⣍⡛⠻⢿⣿⣿⣿⡿⠶⢒⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠈⠉⠁⠀⠀⠀⠀⠈⢿⣤⣀⣀⣦⠿⠛⠉⢁⡀⠀⢀⣀⡀⠙⠹⠿⣷⣦⣤⣞⣿⣿⠟⠀⠘⠓⠲⠶⠶⠒⠋⠁⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠓⠋⣡⡴⢁⣴⣿⣿⣦⣶⣿⣷⣄⠀⢶⣤⣭⠍⠛⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢁⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⠄⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠿⠿⠟⠻⠿⠿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
            }

            require('alpha').setup(dashboard.config)
        end
    },

	-- marks.nvim for marking lines 
	-- https://github.com/chentoast/marks.nvim
	{
		"chentoast/marks.nvim",
		opts = {},
		config = function()
			require("marks").setup({
				mappings = {
					set_next = "m;",
					delete_line = "m/"
				}
			})
		end
	},

	-- modes.nvim for highlighting lines with fancy colors
	-- https://github.com/mvllow/modes.nvim
	{
		"mvllow/modes.nvim",
		config = function()
			require("modes").setup({
				colors = {
					insert = "",
					copy = "#f5c359",
					delete = "#c75c6a",
					visual = "#b07fc7"
				},
				line_opacity = {
					copy = 0.5,
					delete = 0.5,
					insert = 0.5,
					visual = 0.5
				}
			})
		end
	},

	-- numb.nvim to let me peek without moving to it 
	-- https://github.com/nacro90/numb.nvim
	{
		'nacro90/numb.nvim',
		config = function()
			require('numb').setup()
		end,
	},

	-- nvim-colorizer 
	-- https://github.com/norcalli/nvim-colorizer.lua
	{
		'norcalli/nvim-colorizer.lua',
		config = function()
			require('colorizer').setup({
                ['*'] = {
                    mode = 'foreground'
                }
            })
		end,
        keys = {
            { "<leader>p", function()
                -- "<cmd>ColorizerDetachFromBuffer<cr>"
                -- "<cmd>ColorizerAttachToBuffer<cr>"
                local colorizer = require('colorizer')
                if colorizer.is_buffer_attached() then
                    colorizer.detach_from_buffer()
                else
                    colorizer.attach_to_buffer()
                end
            end, desc = "Toggle Colorizer" },
        }
    }
}
