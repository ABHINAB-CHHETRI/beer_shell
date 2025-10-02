local M = {}   -- make a table that will hold your module's functions
--popen (pipeopen) allows to execute external system commands
--read("*l") reads first line , *a reads all 

-- ANSI color codes
local BLUE = "\27[34m"
local RESET = "\27[0m"

function M.sysfetch()
    local os_name = io.popen("uname -s"):read("*l") or "Unknown"
    local hostname = io.popen("hostname"):read("*l") or "Unknown"
    local uptime = io.popen("uptime -p"):read("*l") or "Unknown"

    io.write(BLUE .."Operating System:", os_name, "\nHostname:", hostname, "\nUptime:", uptime.. RESET) 
end
return M  -- return the table so other files can use it
