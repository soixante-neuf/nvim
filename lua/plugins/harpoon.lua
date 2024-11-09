return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        config = function()
            local harpoon = require('harpoon')
            harpoon:setup({})

            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end,
                { desc = "Harpoon [A]dd" })
            vim.keymap.set("n", "<leader>l", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
                { desc = "Harpoon [L]ist" })

            vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end,
                { desc = "Harpoon item 1" })
            vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end,
                { desc = "Harpoon item 2" })
            vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end,
                { desc = "Harpoon item 3" })
            vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end,
                { desc = "Harpoon item 4" })
            vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end,
                { desc = "Harpoon item 5" })
            vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end,
                { desc = "Harpoon item 6" })
        end
    },
}
