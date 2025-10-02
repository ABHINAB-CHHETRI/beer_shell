local M = {}   -- make a table that will hold your module's functions
--popen (pipeopen) allows to execute external system commands
--read("*l") reads first line , *a reads all 
local sys_module_var= require("sys_fetch_module")

function M.basic_commands(command)
        if command=="hi" then
            io.write("hello, how you doing ")
        elseif command=="sysfetch" then
            sys_module_var.sysfetch()
        elseif command=="clc" then
            os.execute("clear")
        else
        io.write(command .. " <- command not found")
        end
end
return M  -- return the table so other files can use it
