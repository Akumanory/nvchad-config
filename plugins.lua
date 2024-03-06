local plugins = {
    {
        'NvChad/nvim-colorizer.lua',
        event = "VeryLazy",
        config = function ()
          require "custom.configs.colorizer_config"
        end
    },
    {
        "rebelot/kanagawa.nvim",
        event = "VeryLazy",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
            -- defaults 
            "lua",
            -- low level
            "c",
            "cpp",
            -- other stuff 
            "comment",
            "cmake",
            "make",
            "ninja",
            "styled",
            "markdown",
            "markdown_inline",
            -- shaders
            "glsl",
            "hlsl",
            -- git stuff
            "diff",
            },
        },
    },
    {
        "NvChad/ui",
        branch = "v2.0",
        lazy = true,
    },
    {
        "Civitasv/cmake-tools.nvim",
        event = "VeryLazy",
        config = function ()
          require "custom.configs.cmake-tools"
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/overseer.nvim"
        },
    },
    {
        "stevearc/overseer.nvim",
        event = "VeryLazy",
        opts = {},
        config = function ()
            require("overseer").setup();
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function ()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
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
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
        },
    },
    {
        "mfussenegger/nvim-dap",
        config = function(_, _)
            require("core.utils").load_mappings("dap")
            local dap = require("dap")
            dap.configurations.cpp ={
                {
                    name = "(gdb) Lauch from plugins lua",
                    type = "cppdbg",
                    request = "launch",
                    environment = {},
                    externalConsole = false,
                    MIMode = "gdb",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    args = {},
                    stopAtEntry = false,
                    setupCommands = {
                      {
                         text = '-enable-pretty-printing',
                         description =  'enable pretty printing',
                         ignoreFailures = false
                      },
                    },
                }
            }
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
          require "plugins.configs.lspconfig"
          require "custom.configs.lspconfig"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
          ensure_installed = {
            "clangd",
            "codelldb"
          }
        }
    }
}
return plugins
