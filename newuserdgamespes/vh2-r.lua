task.wait(2)
getgenv().funcs.vmp={}
local vmpdata={}
funcs.vmp.outfits=funcs.load("vmp_outfits.lua",{})
for i,v in pairs(workspace:GetDescendants()) do
if v:IsA("Sound") and v.SoundId=="rbxassetid://9116267995" then
v:Stop()
v.SoundId=""
v.Volume=0
v.MaxDistance=0
end
end
funcs.vmp.unlock=function(x)
local spicelife=funcs.lplr.DataFolder.UnlockableItems:FindFirstChild(x,true)
if spicelife then
spicelife.Value=not spicelife.Value
end
end
funcs.vmp.saveoutfit=function(outfitname,whitelist)
whitelist=whitelist or {VampireAbility=true,HumanGadget=true}
funcs.vmp.outfits[outfitname]={}
for i,v in pairs(funcs.lplr.DataFolder.CurrentOutfit:GetChildren()) do
if not v.Name:lower():match("custom") and not table.find(whitelist,v.Name) then
table.insert(funcs.vmp.outfits[outfitname],{v.Name=="CharacterName" and "ChangeName" or v.Name,v.Value})
end
end
funcs.save("vmp_outfits.lua",funcs.vmp.outfits,true)
funcs.sendnotif("outfit: "..outfitname,"saved!","",5)
return funcs.vmp.outfits[outfitname]
end
local unlockalwayscat={"Shirts","Extra","Pants","Faces","HairColours","GunSkins"}
funcs.vmp.unlockoffsale=function()
for i,v in pairs(funcs.lplr.DataFolder.UnlockableItems:GetDescendants()) do
local myend=game:GetService("ReplicatedStorage").Storage.CharacterStuff:FindFirstChild(v.Name,true)
if v:IsA("BoolValue") and (not myend or myend and myend:FindFirstChild("Offsale") or table.find(unlockalwayscat,v.Parent.Name)) then
v.Value=true
elseif v:IsA("BoolValue") then
v.Value=false
end
end
end
funcs.vmp.loadoutfit = function(outfit)
local fit=funcs.vmp.outfits[outfit]
if fit then
local rem=getchar():WaitForChild("MainLocal",10):WaitForChild("Customize",10)
for i,v in pairs(fit) do
rem:FireServer(unpack(v))
task.wait(.6)
end
task.wait(.1)
funcs.sendnotif("outfit: "..outfit,"loaded","",5)
else
funcs.sendnotif("outfit: "..outfit,"not found","",5)
end

end
funcs.vmp.unlockall=function()
for i,v in pairs(funcs.lplr.DataFolder.UnlockableItems:GetDescendants()) do
if v:IsA("BoolValue") then
vmpdata[v]=v.Value
v.Value=true
end
task.wait()
end
funcs.sendnotif("unlocked","shirts,pants,abilities dont save","rbxassetid://9101806464",5)
end
funcs.vmp.default=function(x)
if not x then
for i,v in pairs(vmpdata) do
i.Value=v
end
vmpdata={}
funcs.sendnotif("locked","reset to default","rbxassetid://9101806464",5)
else
for i,v in pairs(funcs.lplr.DataFolder.UnlockableItems:GetDescendants()) do
if v.ClassName:match("Value") then
vmpdata[v]=v.Value
end
task.wait()
end
end
end
local replicated=game:GetService("ReplicatedStorage")
local function getsetting(values,setting,nm)
if setting==2 then
return values[3].Value and Color3.fromRGB(0,0,0) or values[1].Value and Color3.fromRGB(140,0,0) or values[2].Value and Color3.fromRGB(184,184,184) or Color3.fromRGB(150,81,107)
else
return values[3].Value and nm.." is dead (told you so)" or values[1].Value and nm.." is a uwu vampire" or values[2].Value and nm.." is a stupid detective" or nm.." is a 'survivor' (yikes)"
end
end
local function linkedsword(v)
local linkedcharacter=funcs.plrs:FindFirstChild(v.Name)
if not linkedcharacter or linkedcharacter.Name==funcs.lplr.Name or not linkedcharacter.Character then return end
local values={v:WaitForChild("vampire",10),v:WaitForChild("detective",10),v:WaitForChild("died",10)}
local hook=funcs.addhook(linkedcharacter.Character,{color=getsetting(values,2),txtenabled=true,text=getsetting(values,1,v.Name),autoremove=true,dep=values,transp=0.6})
for i,x in pairs(values) do
x.Changed:Connect(function()
local color=getsetting(values,2)
hook.box.Color3=color
if hook.textbox then
hook.textbox.Text=getsetting(values,1,v.Name)
hook.textbox.TextColor3=color
end
end)
end
return {hook,values}
end
			local old_namecall
				old_namecall = hookmetamethod(game, "__namecall", newcclosure(function(instance,...)
				local ncm= getnamecallmethod()
				local args={...}
				if not checkcaller() and ncm=="FireServer" and (table.find(args,"Walkspeed Exploit") or table.find(args,"?") or table.find(args,"exploit") or table.find(args,"kick") or (#args>=3 and args[3]:lower():match("exploit"))) or type(args[1])=="string" and args[1]=="Hitbox Extension Check" then
                return
				end;
				return old_namecall(instance,...)
				end))

for i,v in pairs(replicated.InGamePlayerValues:GetChildren()) do
linkedsword(v)
end
local gunt=false
workspace.ChildAdded:Connect(function(gun)
if gun.Name=="gundropped" then
funcs.addhook(gun,{color=Color3.fromRGB(100,0,0),txtenabled=true,text="gun",autoremove=true,dep=values,transp=0.33})
if gunt and replicated.InGamePlayerValues:FindFirstChild(funcs.lplr.Name) then local piv=getchar():GetPivot() getchar():PivotTo(gun:GetPivot()) task.wait() getchar():PivotTo(piv) end
end
end)
funcs.vmp.con=replicated.InGamePlayerValues.ChildAdded:Connect(linkedsword)
local cu=funcs.lplr.Character:WaitForChild("MainLocal",10):WaitForChild("Customize",10)
cu:FireServer("GunSkin", "Chocolate")
cu:FireServer("VampireAbility", "Time")
--cu:FireServer("HumanGadget", "Strength")
local is_auto_enabled=false
local function garlic(car)
local garlicboyrepell=car:WaitForChild("charvalues",10)
garlicboyrepell=garlicboyrepell and garlicboyrepell:WaitForChild("caught",10)
if garlicboyrepell then
garlicboyrepell.Changed:Connect(function(x)
if x and is_auto_enabled then
local rem=car:WaitForChild("MainLocal",10)
rem=rem and rem:WaitForChild("RemoteEvent",10)
while rem and garlicboyrepell.Value==true and is_auto_enabled do
local cc =garlicboyrepell:WaitForChild("clickcounter",10)
if cc then cc.Value=6 end
--garlicboyrepell.Value=false
rem:FireServer("escape")
task.wait(.5)
end

end
end)

end
end
garlic(getchar())
funcs.lplr.CharacterAdded:Connect(garlic)
local plug={
esc={func=function()
is_auto_enabled=not is_auto_enabled
funcs.sendnotif("autoesc","status: "..tostring(is_auto_enabled),"rbxassetid://6678521436",5)
end,desc="enable autoescape"};
gg={func=function()
local gn=workspace:FindFirstChild("gundropped")
if gn then firetouchinterest(getchar():WaitForChild("HumanoidRootPart",20),gn,0) end end,desc="gungrab"};
ag={func=function() gunt=not gunt
funcs.sendnotif("auto-gun","status: "..tostring(gunt),"rbxassetid://6678521436",5) end,desc="autogg"};
Reservedpluginname="VH2R"
}

return plug
