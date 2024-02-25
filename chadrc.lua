---@type ChadrcConfig
-- local test_ = "custom.configs.cmake-statusline".get_test()

local vim = vim
local opt = vim.opt

-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

-- New custom cmd commands 
local new_cmd = vim.api.nvim_create_user_command
local cmd_config = require("custom.configs.cmd_commands")

new_cmd(cmd_config.dap.name, cmd_config.dap.cmd_function, {})

local M = {}

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

M.ui = require("custom.ui")
M.ui.lsp_semantic_tokens = true;
M.ui.theme = 'radium'

return M
