local tb={
[10201298018]='https://raw.githubusercontent.com/exceptional0/scr/main/newuserdgamespes/vh2-r.lua' --[[function()
local plug={
esc={func=function()
is_auto_enabled=not is_auto_enabled
funcs.sendnotif("autoesc","status: "..tostring(is_auto_enabled),"rbxassetid://6678521436",5)
end,desc="enable autoescape"};
gg={func=function()
local gn=workspace:FindFirstChild("gundropped")
if gn then firetouchinterest(getchar():WaitForChild("HumanoidRootPart",20),gn,0) end end,desc="gungrab"};
ag={func=function() gunt=not gunt
funcs.sendnotif("auto-gun","status: "..tostring(gunt),"rbxassetid://6678521436",5) end,desc="autogg"}
--
Reservedpluginname="VH2R"
}

return plug
end--]]
}
tb=tb[game.PlaceId]
return tb and (type(tb)=='function' and tb() or type(tb)=='string' and loadstring(game:HttpGet(tb))() ) or tb
