local config = function ()
    local cmake = require("cmake-tools")

    if cmake.is_cmake_project() then
        local hl_core = "%#St_gitIcons#"
        local hl_sub = "%#todo#"
        local hl_reset = "%#blank#"
        local preset = " " .. hl_core .. "CMake:"
        local build_type = cmake.get_build_type()
        preset = preset .. "[" .. hl_sub .. (build_type and build_type or "X") .. hl_core .. "]"
        local kit = cmake.get_kit()
        preset = preset .. " Kit:[" .. hl_sub .. (kit and kit or "X") .. hl_core .. "]"
        -- local target = cmake.get_build_target()
        -- preset = preset .. " Target:[" .. hl_sub .. (target and target or "X") .. hl_core .. "]"
        -- local exec = cmake.get_launch_target()
        -- preset = preset .. " Exec:[" .. hl_sub .. (exec and exec or "X") .. hl_core .. "]"

        preset = preset .. hl_reset
        return preset;
    end
end

return config


