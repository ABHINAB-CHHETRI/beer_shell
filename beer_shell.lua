local sys_module_var = require("sys_fetch_module")
local commands = require("commands")
local utils = require("utils")

local version = "1.0.0"
local cwd = io.popen("pwd"):read("*l")

local flag = true
local RED = "\027[31m"
local RESET = "\027[0m"

while flag do
    utils.printInitialPrompt()

    local raw_input = io.read()
    --empty conditions
    if not raw_input or raw_input == "" then
        print("No input entered. Please type a command.")

    --executing commands through modules
    else
        local inputs = utils.parseInput(raw_input)
        commands.execute(inputs, raw_input, version, sys_module_var)  -- call centralized command executor
    end
end
