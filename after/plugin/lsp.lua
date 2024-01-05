local lsp_zero = require('lsp-zero')

lsp_zero.preset("recommended")

lsp_zero.on_attach(function(client, bufnr)
    vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end,
        { buffer = bufnr, remap = false, desc = "[G]o [D]efinition" })
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
        { buffer = bufnr, remap = false, desc = "Hover" })
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
        { buffer = bufnr, remap = false, desc = "[V]iew [W]orkspace [S]ymbol" })
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
        { buffer = bufnr, remap = false, desc = "[V]iew [D]iagnostics" })
    vim.keymap.set("n", "<C-n>", function() vim.diagnostic.goto_next() end,
        { buffer = bufnr, remap = false, desc = "Go to next diagnostic" })
    vim.keymap.set("n", "<C-p>", function() vim.diagnostic.goto_prev() end,
        { buffer = bufnr, remap = false, desc = "Go to previous diagnostic" })
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
        { buffer = bufnr, remap = false, desc = "[V]iew [C]ode [A]ction" })
    vim.keymap.set("n", "<leader>vcr", function() vim.lsp.buf.references() end,
        { buffer = bufnr, remap = false, desc = "[V]iew [C]ode [R]eference" })
    vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.rename() end,
        { buffer = bufnr, remap = false, desc = "[V]ariable [R]ename" })
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
        { buffer = bufnr, remap = false, desc = "Signature [H]elp" })

    vim.keymap.set("n", "<leader>sm", vim.cmd.ClangdSwitchSourceHeader,
        { desc = "[S]witch between [M]odule files" })
end)

local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format()

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = "luasnip" },
        { name = 'buffer' },
        { name = "path" },
    },
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.confirm({ select = false }),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    }),
    --- (Optional) Show source name in completion menu
    formatting = cmp_format,
})

lsp_zero.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        lsp_zero.default_setup,
    },
})

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
