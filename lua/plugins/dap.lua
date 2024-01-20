return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")

            vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "[D]ebug [C]ontinue" })
            vim.keymap.set("n", "<leader>o", function() dap.step_over() end, { desc = "Debug Step [O]ver" })
            vim.keymap.set("n", "<leader>dsi", function() dap.step_into() end, { desc = "[D]ebug [S]tep [I]nto" })
            vim.keymap.set("n", "<leader>dso", function() dap.step_out() end, { desc = "[D]ebug [S]tep [O]ut" })
            vim.keymap.set("n", "<Leader>b", function() dap.toggle_breakpoint() end, { desc = "Toggle [B]reakpoint" })

            vim.keymap.set("n", "<Leader>dt", function() dap.terminate() end, { desc = "[D]ebug [T]erminate" })

            vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
                require('dap.ui.widgets').hover()
            end, { desc = "[D]ebug [H]over" })
            vim.keymap.set('n', '<Leader>df', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.frames)
            end, { desc = "[D]ebug [F]rames" })
            vim.keymap.set('n', '<Leader>ds', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.scopes)
            end, { desc = "[D]ebug [S]copes" })

            dap.adapters.lldb = {
                type = 'executable',
                command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
                name = 'lldb'
            }

            dap.configurations.c = {
                {
                    name = 'Launch',
                    type = 'lldb',
                    request = 'launch',
                    program = function()
                        return vim.fn.input('Path to executable: ' .. vim.fn.getcwd() .. '/')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                    args = {},
                },
            }

            dap.configurations.cpp = dap.configurations.c
        end
    },

    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        config = function()
            require("mason").setup()
            require("mason-nvim-dap").setup({
                automatic_installation = true,
                ensure_installed = {
                    "codelldb",
                },
            })
        end
    },

    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup({

                controls = {
                    element = "repl",
                    enabled = true,
                    icons = {
                        disconnect = "",
                        pause = "",
                        play = "",
                        run_last = "",
                        step_back = "",
                        step_into = "",
                        step_out = "",
                        step_over = "",
                        terminate = ""
                    }
                },
                element_mappings = {},
                expand_lines = true,
                floating = {
                    border = "single",
                    mappings = {
                        close = { "q", "<Esc>" }
                    }
                },
                force_buffers = true,
                icons = {
                    collapsed = "",
                    current_frame = "",
                    expanded = ""
                },
                layouts = { {
                    elements = {
                        {
                            id = "watches",
                            size = 0.25
                        },
                        {
                            id = "breakpoints",
                            size = 0.25
                        },
                        {
                            id = "scopes",
                            size = 0.5
                        },
                    },
                    position = "left",
                    size = 30
                }, {
                    elements = {
                        {
                            id = "repl",
                            size = 1.0
                        }
                    },
                    position = "bottom",
                    size = 10
                } },
                mappings = {
                    edit = "e",
                    expand = { "<CR>", "<2-LeftMouse>" },
                    open = "o",
                    remove = "d",
                    repl = "r",
                    toggle = "t"
                },
                render = {
                    indent = 1,
                    max_value_lines = 100
                }
            })

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    },
}
