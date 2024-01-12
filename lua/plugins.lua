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
                wrap = true,                -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long
                check_completion_visible = true, -- adjust position of signature window relative to completion popup
                transparency = 25, -- disabled by default, allow floating win transparent value 1~100
            })
        end
    },

    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },

    { 'neovim/nvim-lspconfig', },
    { "saadparwaiz1/cmp_luasnip" },
    { "rafamadriz/friendly-snippets" },
    { 'L3MON4D3/LuaSnip' },


}
