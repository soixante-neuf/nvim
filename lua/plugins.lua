return {
    --{ "folke/which-key.nvim" },
    { "folke/neodev.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "alec-gibson/nvim-tetris", event = "VeryLazy" },
    { 'eandrju/cellular-automaton.nvim', event = "VeryLazy" },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({ options = { theme = 'gruvbox-material' } })
        end
    },

    {
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {
            disable_mouse = false,
        },
        config = function()
            require("hardtime").setup()
        end,
    },

    {
        'sainnhe/gruvbox-material',
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_background = 'hard'
            vim.g.gruvbox_material_transparent_background = 2

            vim.cmd.colorscheme('gruvbox-material')
        end
    },

    {
        'mbbill/undotree',
        event = "VeryLazy",
        init = function()
            vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle, { desc = "[U]ndotree [T]oggle" })
            vim.keymap.set("n", "<leader>uf", vim.cmd.UndotreeFocus, { desc = "[U]ndotree [F]ocus" })
        end,
    },

    {
        "tpope/vim-fugitive",
        event = "VeryLazy",
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "[G]it [S]tatus" })
        end
    },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',

            "L3MON4D3/LuaSnip",
        },
    },

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
        },
    },

}
