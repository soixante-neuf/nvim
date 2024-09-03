return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        event = "VeryLazy",
        config = function()
            require("telescope").setup({})
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "[F]ind [F]iles" })
            vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = "Find [G]it [F]iles" })
            vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = "[F]ind [S]tring" })
        end
    },
}
