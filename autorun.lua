do 
getgenv().funcs = {}
local filesorder = 
{
"anti-webhook.txt",
"pr.txt"
--"screenshotban.txt"
}


local gmloadedorder = 
{
"anti-afk.txt",
"amowner.txt",
"rj.lua",
"funcs.lua",
"adoonis.txt",
"antikickcrash.txt",
"baddieblocklist4remotes.lua",
"amogus.txt",
"fpsb.txt",
"tsp.txt",
"rvfx.lua"
}

local runlast =
{
{"s.lua",.3},
{"fpscap69.lua",1},
{"infiniteyield.lua",2.3}
}

local gml = { {6708206173,'rateyourav.lua','BLJ.lua'},{10491640406,'bhopphighting.lua','god.lua'},{9143982021,"swordbattlesgui.lua","swordbattles.lua"},{{4671152546},'camera.lua'},{10243982775,'Beware-Redbox2.lua','dashscr.txt'},{198817751,'new 88.txt'},{10201298018,'vmp2remake_esp.lua'},{10087074695,'givebadge.txt'},{{2788229376},'instadeath.lua'}
}
local stats = false
------------------------------------------------------------------------------------------------------------------------
local tm = os.clock()
_G.consolelog={}
getgenv().print = function(...)
local args = {...}
local mess = ""
for i,v in pairs(args) do
mess = mess ~= "" and mess.."  "..tostring(v) or tostring(v)
end
if #_G.consolelog > 300 then
_G.consolelog={}
end
table.insert(_G.consolelog,mess)
printconsole(mess)
end

local autorunfiles = listfiles("autorun")
for i,v in ipairs(filesorder) do
v = "autorun\\"..v
if isfile(v) then
local tmstart = os.clock()
local res=coroutine.wrap(loadfile(v))()
local cs = os.clock()
if stats then print("loaded "..string.gsub(v,"autorun\\","").." in "..math.floor(cs-tmstart).." ("..math.floor(os.clock()-tm)..")") end
table.remove(autorunfiles,table.find(autorunfiles,v))
end
end
task.wait()
if not game:IsLoaded() then
game.Loaded:Wait()
end

for i,v in ipairs(gmloadedorder) do
v = "autorun\\"..v
if isfile(v) then
table.remove(autorunfiles,table.find(autorunfiles,v))
local tmstart = os.clock()+.5
local res=coroutine.wrap(loadfile(v))()
local cs = os.clock()+.5
if stats then print("loaded "..string.gsub(v,"autorun\\","").." in "..math.floor(cs-tmstart).." ("..math.floor(os.clock()-tm)..")") end
end
end

for i,v in ipairs(runlast) do
table.remove(autorunfiles,table.find(autorunfiles,"autorun\\"..v[1]))
end
for i,v in pairs(autorunfiles) do
if isfile(v) then
--coroutine.wrap(function()
local tmstart = os.clock()
--print(v)
local res=coroutine.wrap(loadfile(v))()
local cs = os.clock()
if stats then print("loaded "..string.gsub(v,"autorun\\","").." in "..math.floor(cs-tmstart).." ("..math.floor(os.clock()-tm)..")") end
--end)()
end
end

for i,v in ipairs(runlast) do
coroutine.wrap(function()
if v[2] ~= nil then task.wait(v[2]) end
v = "autorun\\"..v[1]
if isfile(v) then
local tmstart = os.clock()+.5
local res=coroutine.wrap(loadfile(v))()
local cs = os.clock()+.5
if stats then print("loaded "..string.gsub(v,"autorun\\","").." in "..math.floor(cs-tmstart).." ("..math.floor(os.clock()-tm)..")") end
end
end)()
end
local pld=game.PlaceId
for m,c in pairs(gml) do
if pld~=c[1] and (type(c[1])~="table" or not table.find(c[1],pld)) then
continue
end
c[1]=nil
for n,v in pairs(c) do
if isfile("gm\\"..v) then
coroutine.wrap(loadfile("gm\\"..v))()
end
end

end

end
