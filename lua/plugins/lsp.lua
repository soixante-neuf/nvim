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

            require("neodev").setup()

            local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
            capabilities.textDocument.completion.completionItem.snippetSupport = false

            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    require('lspconfig')[server_name].setup({
                        capabilities = capabilities
                    })
                end,
            })

            local cmp = require('cmp')
            cmp.setup({
                sources = cmp.config.sources({
                    {
                        name = 'nvim_lsp',
                        group_index = 1,
                        entry_filter = function(entry, _)
                            -- get_kind == 15 when entry is a snippet
                            if entry:get_kind() == 15 then
                                return false
                            end
                            return true
                        end,
                    },
                    { name = 'buffer', group_index = 2 },
                    { name = 'path',   group_index = 3 },
                }),
                preselect = 'item',
                completion = {
                    completeopt = 'menu,menuone,noinsert,noselect,preview'
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                }),

            })
        end
    },
}
