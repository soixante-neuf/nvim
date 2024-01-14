vim.g.mapleader = " "

vim.keymap.set("n", "<leader>wk", vim.cmd.WhichKey, { desc = "[W]hich [K]ey" })
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = "[F]ile [E]xit", })

vim.keymap.set("n", "<leader><leader>", function ()
    vim.cmd("!" .. vim.fn.input("Terminal command to execute: "))
end, { desc = "Run terminal command" })

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

vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "[S]earch and [R]eplace" })

--vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- ------------------------------------------------------------------------------------------------
-- LSP --------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------

vim.keymap.set('n', '<leader>sm', vim.cmd.ClangdSwitchSourceHeader,
    { desc = "[S]witch Between [M]odule Files" })

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }

        -- Diagnostics
        opts.desc = "[V]iew [D]iagnostics Window"
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        opts.desc = "Next Diagnostic"
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
        opts.desc = "Previous Diagnostic"
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)

        -- Workspace
        opts.desc = "[W]orkspace [S]ymbol"
        vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol, opts)
        opts.desc = "[W]orkspace [A]dd Folder"
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        opts.desc = "[W]orkspace [R]emove Folder"
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        opts.desc = "[W]orkspace [L]ist Folder(s)"
        vim.keymap.set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)

        -- Other
        opts.desc = "[G]o [D]eclaration"
        vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
        opts.desc = "[G]o [D]efinition"
        vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
        opts.desc = "Hover Documentation"
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        opts.desc = "[G]o [I]mplimentation"
        vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
        opts.desc = "Signature Help"
        vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)
        opts.desc = "[T]ype [D]efinition"
        vim.keymap.set('n', '<leader>td', vim.lsp.buf.type_definition, opts)
        opts.desc = "[R]e[n]ame"
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        opts.desc = "[C]ode [A]ction"
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        opts.desc = "[G]o [R]eferences"
        vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
        opts.desc = "[F]ormat"
        vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
