return {
    { "folke/which-key.nvim" },
    { "folke/neodev.nvim" },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = function()
            require('lualine').setup({})
        end
    },

    { "nvim-lua/plenary.nvim" },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },

    {
        'rose-pine/neovim',
        name = 'rose-pine',
    },

    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    { 'VonHeikemen/lsp-zero.nvim',                branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "rafamadriz/friendly-snippets" },
    { 'L3MON4D3/LuaSnip' },

    { 'WhoIsSethDaniel/mason-tool-installer.nvim' },

}
