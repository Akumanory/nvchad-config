
local M = {}

M.dap = {
    name = "DapLoadLaunchJsonUpd",
    cmd_function = function ()
        require('dap.ext.vscode').load_launchjs(nil, { cppdbg = {'c', 'cpp'} })
    end
}

return M
