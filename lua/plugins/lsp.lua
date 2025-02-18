return {
    -- Mason, LSP package manager
    -- https://github.com/williamboman/mason.nvim
    {
        "williamboman/mason.nvim",
    },

    -- mason-lspconfig.nvim
    -- https://github.com/williamboman/mason-lspconfig.nvim
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },

    -- nvim-cmp - Complete engine
    -- https://github.com/hrsh7th/nvim-cmp
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-cmdline",
        },
		config = function()
			local luasnip = require('luasnip')
			local cmp = require('cmp')
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				sources = {
					{ name = 'luasnip' }, -- For luasnip users.
					{ name = 'nvim_lsp' },
					{ name = 'buffer' },
				},
				mapping = cmp.mapping.preset.insert({
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
			})
		end
    },

    -- luasnip, snippet engine
    -- https://github.com/L3MON4D3/LuaSnip
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            local ls = require("luasnip")
            ls.filetype_extend("php", { "html" })

            vim.keymap.set({"i", "s"}, "<C-K>", function() ls.expand() end)
            vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end)
            vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end)
            vim.keymap.set({"i", "s"}, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end)

            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                highlight = {
                    enable = true,
                },
            })

            local parsers = require("nvim-treesitter.parsers").get_parser_configs()
            parsers.blade = {
                install_info = {
                    url = "https://github.com/EmranMR/tree-sitter-blade",
                    files = {"src/parser.c"},
                    branch = "main",
                },
                filetype = "blade"
            }
        end
    },

    {
        "lewis6991/hover.nvim",
        config = function()
            require("hover").setup({
                init = function()
                    require("hover.providers.lsp")
                end,
                preview_opts = {
                    border = 'single'
                },
                preview_window = false,
                title = true,
                mouse_providers = {
                    'LSP'
                },
                mouse_delay = 1000
            })
        end,
        keys = {
            { "<leader>lh", function()
                require("hover").hover()
            end, desc = "LSP Hover" },
        }
    }
}
