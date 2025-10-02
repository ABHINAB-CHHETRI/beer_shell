local M = {}   -- make a table that will hold your module's functions
--popen (pipeopen) allows to execute external system commands
--read("*l") reads first line , *a reads all 
local version = "1.0.0" 
local MAGENTA = "\027[35m" 
local RESET = "\027[0m"

function M.beer_commands(command,arg1)
    if  arg1=="info" or arg1==nil then
        io.write("Beer Shell : ".. version.."\n")
        io.write("Made by Abhinab B. Chhetri")
    elseif arg1=="version" then
        io.write("Beer Shell : ".. version)
    else 
        io.write(MAGENTA ..command.." "..arg1.." ".."<-command not found"..RESET);
    end
end
return M  -- return the table so other files can use it
