return {
    {
        'williamboman/mason.nvim',
        build = ":MasonUpdate",
        config = function()
            require('mason').setup({})
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    require("lsp-zero").default_setup,
                },
            })
        end
    },
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        config = function()
            require("mason").setup({})
            require('mason-tool-installer').setup {
                -- a list of all tools you want to ensure are installed upon
                -- start
                ensure_installed = {
                    'lua-language-server',
                    'clangd',
                    'zls',
                    'rust-analyzer',
                    'html-lsp',
                    'css-lsp',
                    'intelephense',
                },
                -- if set to true this will check each tool for updates. If updates
                -- are available the tool will be updated. This setting does not
                -- affect :MasonToolsUpdate or :MasonToolsInstall.
                -- Default: false
                auto_update = true,
                -- automatically install / update on startup. If set to false nothing
                -- will happen on startup. You can use :MasonToolsInstall or
                -- :MasonToolsUpdate to install tools and check for updates.
                -- Default: true
                run_on_start = true,
                -- Only attempt to install if 'debounce_hours' number of hours has
                -- elapsed since the last time Neovim was started. This stores a
                -- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
                -- This is only relevant when you are using 'run_on_start'. It has no
                -- effect when running manually via ':MasonToolsInstall' etc....
                -- Default: nil
                debounce_hours = 5, -- at least 5 hours between attempts to install/update
            }
        end
    },
}
