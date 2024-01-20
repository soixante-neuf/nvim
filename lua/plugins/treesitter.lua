return {
    { "nvim-treesitter/nvim-treesitter-context" },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    "c",
                    "cpp",
                    "make",
                    "zig",
                    "rust",
                    "go",
                    "markdown",
                    "php",
                    "html",
                    "css",
                    "javascript",
                    "typescript",
                    "python",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query"
                },
                sync_install = false,
                auto_install = true,
                ignore_install = {},
                modules = {},
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                    disable = {},
                },
            })
        end
    },
}
