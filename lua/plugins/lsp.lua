local capabilities = require('cmp').setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = "luasnip" },
        { name = 'buffer' },
        { name = "path" },
    },
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = require('cmp').mapping.preset.insert({
        ['<Tab>'] = require('cmp').mapping.confirm({ select = false }),
        ["<C-p>"] = require('cmp').mapping.select_prev_item(),
        ["<C-n>"] = require('cmp').mapping.select_next_item(),
        ['<C-u>'] = require('cmp').mapping.scroll_docs(-4),
        ['<C-d>'] = require('cmp').mapping.scroll_docs(4),
    }),
})

local on_attach = function(_, bufnr)
    vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end,
        { buffer = bufnr, remap = false, desc = "[G]o [D]efinition" })
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
        { buffer = bufnr, remap = false, desc = "Hover" })
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
        { buffer = bufnr, remap = false, desc = "[V]iew [W]orkspace [S]ymbol" })
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
        { buffer = bufnr, remap = false, desc = "[V]iew [D]iagnostics" })
    vim.keymap.set("n", "<C-n>", function() vim.diagnostic.goto_next() end,
        { buffer = bufnr, remap = false, desc = "Go to next diagnostic" })
    vim.keymap.set("n", "<C-p>", function() vim.diagnostic.goto_prev() end,
        { buffer = bufnr, remap = false, desc = "Go to previous diagnostic" })
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
        { buffer = bufnr, remap = false, desc = "[V]iew [C]ode [A]ction" })
    vim.keymap.set("n", "<leader>vcr", function() vim.lsp.buf.references() end,
        { buffer = bufnr, remap = false, desc = "[V]iew [C]ode [R]eference" })
    vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.rename() end,
        { buffer = bufnr, remap = false, desc = "[V]ariable [R]ename" })
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
        { buffer = bufnr, remap = false, desc = "Signature [H]elp" })
    vim.keymap.set("n", "<leader>sm", vim.cmd.ClangdSwitchSourceHeader,
        { desc = "[S]witch between [M]odule files" })

    local cmp = require('cmp')
    cmp.setup({
        sources = {
            { name = 'nvim_lsp' },
            { name = "luasnip" },
            { name = 'buffer' },
            { name = "path" },
        },
        preselect = 'item',
        completion = {
            completeopt = 'menu,menuone,noinsert'
        },
        mapping = cmp.mapping.preset.insert({
            ['<Tab>'] = cmp.mapping.confirm({ select = false }),
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
        }),
    })
end

return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'lua_ls',
                    'clangd',
                    'zls',
                    'rust_analyzer',
                    "pyright",
                    'html',
                    'cssls',
                    'intelephense',
                    "vimls",
                },
            })

            require("mason-lspconfig").setup_handlers {
                function(server_name)
                    require('lspconfig')[server_name].setup {
                        capabilities = capabilities,
                        on_attach = on_attach,
                    }
                end,

                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup {
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    }
                end,

                ["clangd"] = function()
                    require("lspconfig").clangd.setup {
                        --cmd = { "clangd -header-insertion=never", },
                    }
                end
            }

            vim.cmd("MasonUpdate")
        end
    },
}
