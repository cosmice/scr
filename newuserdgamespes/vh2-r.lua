local plug={
esc={
func=function()
is_auto_enabled=not is_auto_enabled
funcs.sendnotif("autoesc","status: "..tostring(is_auto_enabled),"rbxassetid://6678521436",5) end,desc="enable autoescape"};
gg={func=function()
local gn=workspace:FindFirstChild("gundropped")
if gn then firetouchinterest(getchar():WaitForChild("HumanoidRootPart",20),gn,0) end end,desc="gungrab"};
ag={func=function() gunt=not gunt
funcs.sendnotif("auto-gun","status: "..tostring(gunt),"rbxassetid://6678521436",5) end,desc="autogg"};
--
Reservedpluginname="VH2R"
}

return plug
