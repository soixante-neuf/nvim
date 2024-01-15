return {
    { "nvim-treesitter/nvim-treesitter-context" },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require('nvim-treesitter.configs').setup {
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
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    },
}
