local beer_commands= require("beer_shell_commands")
local basic_commands= require("basic_commands")

local flag = true
local RED = "\027[31m"
local YELLOW = "\027[33m"
local RE = "\027[0m"

while flag==true do
    ::reset::
    local cwd = io.popen("pwd"):read("*l")
    io.write(YELLOW .."\n Working Directory : "..cwd.." ~")
    io.write(RED .. "\nBeer Shell $ ".. RE)

    --reading user input 
    local raw_input = io.read()

    if raw_input == nil or raw_input == "" then
        print("No input entered. Please type a command.")
        goto reset
    end

    -- spliting and counting arguements 
    local inputs = {}
    local command_length=0
    for word in string.gmatch(raw_input, "%w+") do   -- %w+ allows alpha numeric values
        table.insert(inputs, word) 
        command_length=command_length+1
        if command_length>3 then 
            io.write("command length too long // only 3 words are allowed max")
            goto reset
        end
    end

    --- splitted values
    local command = inputs[1]
    local arg1= inputs[2] or nil
    local arg2= inputs[3] or nil
    --executing commands through modules

    if command_length==1 and command=="exit" then
        io.write("\n Exiting Beer Shell. Thank you for using!===!!\n")
        break
    elseif command=="beershell" then
        beer_commands.beer_commands(command,arg1)
    elseif command_length==1 then
        basic_commands.basic_commands(command)
    else
        io.write(raw_input.." <- command not found");
    end
end
