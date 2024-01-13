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
                    "autotools_ls",
                    'zls',
                    'rust_analyzer',
                    "pyright",
                    'html',
                    'cssls',
                    'intelephense',
                    "vimls",
                },
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

            require("neodev").setup()

            require("mason-lspconfig").setup_handlers {
                function(server_name)
                    require('lspconfig')[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
            }

            local luasnip = require("luasnip")
            require('luasnip.loaders.from_vscode').lazy_load()
            luasnip.config.setup()

            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
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
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),

                    ['<Tab>'] = cmp.mapping.confirm({
                        select = false,
                        behavior = cmp.ConfirmBehavior.Replace,
                    }),
                }),

            })

        end
    },
}
