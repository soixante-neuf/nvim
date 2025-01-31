local configureKeymaps = function()
    local map = function(mapping, callback, description, mode)
        mode = mode or "n"
        vim.keymap.set(mode, mapping, callback, { desc = description })
    end
    local withOpts = function(searchFunction, opts)
        return function()
            searchFunction(opts)
        end
    end

    local builtin = require('telescope.builtin')

    -- Search neovim config files from anywhere
    do
        local opts = require("telescope.themes").get_dropdown({ cwd = vim.fn.stdpath("config") })
        map("<leader>fc", withOpts(builtin.find_files, opts), "[F]ind [C]onfig Files")
    end

    local globalOpts = require("telescope.themes").get_ivy()

    -- Basic
    map("<leader>ff", withOpts(builtin.find_files, globalOpts), "[F]ind [F]iles")
    map("<leader>fs", withOpts(builtin.live_grep, globalOpts), "[F]ind [S]tring")

    -- Neovim
    map("<leader>fk", withOpts(builtin.keymaps, globalOpts), "[F]ind [K]eymaps")
    map("<leader>fh", withOpts(builtin.help_tags, globalOpts), "[F]ind [H]elp")
    map("<leader>fr", withOpts(builtin.registers, globalOpts), "[F]ind [R]egisters")
    map("<leader>fm", withOpts(builtin.man_pages, globalOpts), "[F]ind [M]an pages")
    map("<leader>fss", withOpts(builtin.spell_suggest, globalOpts), "[F]ind [S]pell Suggestion")

    -- Git
    map("<leader>gf", withOpts(builtin.git_files, globalOpts), "Find [G]it [F]iles")
    map("<leader>gb", withOpts(builtin.git_branches, globalOpts), "Find [G]it [B]ranches")
    map("<leader>gc", withOpts(builtin.git_commits, globalOpts), "Find [G]it [C]ommits")
end

return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
        },
        event = "VeryLazy",
        config = function()
            require('telescope').setup({
                defaults = {
                    file_ignore_patterns = {
                        ".git",
                        "node_modules",
                    },
                },
                pickers = {
                    find_files = {
                        hidden = true
                    },
                },
                extensions = {
                    fzf = {},
                },
            })
            require("telescope").load_extension("fzf")

            configureKeymaps()
        end,
    },
}
