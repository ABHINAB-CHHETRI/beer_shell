local M = {}   -- make a table that will hold your module's functions
--popen (pipeopen) allows to execute external system commands
--read("*l") reads first line , *a reads all 
cwd = io.popen("pwd"):read("*l")

-- ANSI color codes
local MAGENTA = "\027[35m" 
local BLUE = "\27[34m"
local RESET = "\27[0m"

function M.folder_commands(command,args1,args2)
    if args1=="" or args1==nil then
        io.write("Folder help menue");
    elseif args1=="path" then
        io.write(cwd)
    elseif args1 == "goback" then
        cwd= cwd:match("^(.*)/[^/]+$") or cwd --captures to the last /
        io.write("Moved back to: ".."[ ".. cwd.." ]".. "\n")
    else
        io.write(MAGENTA ..command.." "..arg1.." ".."<-command not found"..RESET);
    end 
end
return M  -- return the table so other files can use it
