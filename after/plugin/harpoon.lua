local harpoon = require('harpoon')
harpoon:setup({})

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end,
    { desc = "Harpoon [A]ppend" })
vim.keymap.set("n", "<leader>l", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = "Harpoon [L]ist" })

vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end,
    { desc = "Harpoon item 1" })
vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end,
    { desc = "Harpoon item 2" })
vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end,
    { desc = "Harpoon item 3" })
vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end,
    { desc = "Harpoon item 4" })
vim.keymap.set("n", "<A-5>", function() harpoon:list():select(5) end,
    { desc = "Harpoon item 5" })
vim.keymap.set("n", "<A-6>", function() harpoon:list():select(6) end,
    { desc = "Harpoon item 6" })

-- Toggle previous & next buffers stored within Harpoon list
--vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
--vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

