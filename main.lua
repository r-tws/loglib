local ts=game:GetService("TestService")
local log={}
log.INFO="INFO" log.WARN="WARN" log.ERROR="ERROR"
function log:print(msg,lvl)
lvl=lvl or log.INFO
local m="["..lvl.."] "..tostring(msg)
if lvl==log.WARN then warn(m)
elseif lvl==log.ERROR then task.spawn(function()error(m,0)end)
elseif lvl==log.INFO then ts:Message(m)
else print(m) end
end
return log
