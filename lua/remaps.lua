vim.g.mapleader = " "

vim.keymap.set("n", "<leader>wk", vim.cmd.WhichKey, { desc = "[W]hich [K]ey" })
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = "[F]ile [E]xit", })

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down" })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll [D]own" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll [U]p" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Move to next item in find" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Move to previous item in find" })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "[P]aste without loosing copied contents" })

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "[F]ormat" })

vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "[S]earch and [R]eplace" })

--vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

