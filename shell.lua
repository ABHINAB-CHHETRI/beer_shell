--importing
local sys_module_var= require("sys_fetch_module")  -- import mymodule.lua

local flag = true
-- ANSI color codes
local RED = "\027[31m"
local RESET = "\027[0m"

while flag == true do 
    ::reset::
    io.write(RED .. "\n Beer Shell $ ".. RESET)

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
    local arg1= inputs[2]
    local arg2= inputs[3]

    --executing commands
    --one ard command
    if command_length==1 then
        if command == "exit" then 
            goto shell_end
        elseif command=="hi" then
            io.write("hello, how you doing ")
        elseif command=="sysfetch" then
            sys_module_var.sysfetch()
        elseif command=="clc" then
            os.execute("clear")  
        end
    elseif command_length==2 then
        if command == "echo" then 
            io.write(arg1)
        end
    else 
        io.write(command .. " <- command not found")
    end
end
::shell_end:: --label/named point in code
io.write("\n Exiting Beer Shell. Thank you for using!!!\n")
os.execute("sleep " .. 0)--3 sec wait //no wait fro now
