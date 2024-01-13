return {
    { "folke/which-key.nvim" },
    { "folke/neodev.nvim" },
    { "nvim-lua/plenary.nvim" },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({})
        end
    },

    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                disable_float_background = true,
            })
            vim.cmd('colorscheme rose-pine')
        end
    },

    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup({
                wrap = true,
                check_completion_visible = true,
                transparency = 25,
            })
        end
    },

    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',

            -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets',
        },
    },

}
