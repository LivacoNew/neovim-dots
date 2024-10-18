require("mason").setup()
require("mason-lspconfig").setup()

local ensure_installed = {}
local setups = {}
function define_lsp(lsp, setup)
    table.insert(ensure_installed, lsp)
    setups[lsp] = setup
end 

function setup()
    require("mason-lspconfig").setup {
        ensure_installed = ensure_installed
    }
    for k,v in pairs(setups) do
        require("lspconfig")[k].setup(v)
    end
end


-- DEFINE LSP'S HERE --

define_lsp("omnisharp", {})
define_lsp("lua_ls", {})
define_lsp("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy"
            }
        }
    }
})
define_lsp("pyright", {})
define_lsp("intelephense", {})
define_lsp("kotlin_language_server", {})
define_lsp("taplo", {
    settings = {
        evenBetterToml = {
            schema = {
                associations = {
                    ["CrabFetch/config\\.toml"] = os.execute("crabfetch -g")
                }
            }
        }
    }
})
define_lsp("jdtls", {})
define_lsp("eslint", {})
define_lsp("arduino_language_server", {})

--     NOW STOP      --
setup()

require("cmp").setup({
    snippet = {
        expand = function(args)
            --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            --vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    sources = require("cmp").config.sources({
        { name = 'nvim_lsp' },
        --{ name = 'vsnip' }, -- For vsnip users.
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})

-- Key bindings 
vim.keymap.set("n", "<leader>la", function()
    vim.lsp.buf.code_action()
end, {desc = "LSP Action."})
vim.keymap.set("n", "<leader>lr", function()
    vim.lsp.buf.rename()
end, {desc = "LSP Rename."})
vim.keymap.set("n", "<leader>ld", function()
    vim.lsp.buf.declaration()
end, {desc = "LSP Rename."})

-- Type hints
vim.lsp.inlay_hint.enable(true);
