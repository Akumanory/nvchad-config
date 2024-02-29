local M = {}

M.dap = {
    plugin = true,
    n = {
        -- debug stuff start
        ["<F8>"] = {
          "<cmd> DapToggleBreakpoint <CR>",
          "Add breakpoint at line",
        },
        ["<F5>"] = {
            function ()
                require('dap.ext.vscode').load_launchjs(nil, { cppdbg = {'c', 'cpp'} })
                require('dap').continue()
            end,
          "Start or continue the debugger",
        },
        ["<F17>"] = {
          "<cmd> DapTerminate <CR>",
          "Terminate the debugger",
        },
        ["<C-F17>"] = {
          "<cmd> DapRestartFrame <CR>",
          "Restart frame of the debugger",
        },
        ["<F21>"] = {
          "<cmd> DapStepOver <CR>",
          "Stepping over while debugging",
        },
        ["<F23>"] = {
          "<cmd> DapStepInto <CR>",
          "Stepping into while debugging",
        },
        ["<F24>"] = {
          "<cmd> DapStepOut <CR>",
          "Stepping out while debugging",
        },

        -- cmake stuff 
        ["<F7>"] = {
          "<cmd> CMakeBuild <CR>",
          "Cmake build - works with generated config of cmake",
        },
    }
}

return M
