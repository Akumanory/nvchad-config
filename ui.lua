local M = {}

M.statusline = {
    theme = "default",
    overriden_modules = function(modules)
        table.insert(modules, 5,
        (require("custom.configs.cmake-statusline"))())
    end
}

return M
