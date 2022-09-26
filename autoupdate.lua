if not isfile("lastautoupdate.txt") or os.time()-tonumber(readfile("lastautoupdate.txt"))>=21600 then -- autoupdate frequency in seconds, only updates when you join game
local autoupdate={
["autorun\\funcs.lua"]="https://raw.githubusercontent.com/exceptional0/scr/main/funcs.lua";
["autorun\\baddieblocklist4remotes.lua"]="https://raw.githubusercontent.com/exceptional0/scr/main/baddieblocklist4remotes.lua";
["autorun\\fpscap69.lua"]="https://raw.githubusercontent.com/exceptional0/scr/main/fpscap69.lua";
}
for i,v in pairs(autoupdate) do
local s,cc=pcall(game.HttpGet,game,v)
if s and isfile(i) and readfile(i)~=cc or s and not isfile(i) then
writefile(i,cc)
end
task.wait()
end
writefile("lastautoupdate.txt",tostring(os.time()))
end
--loadfile("autorun.lua")()
