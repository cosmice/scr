getgenv().tspyen = true
--[[
local funcs = {}
funcs.normalizeblue = function(nnnn)
return "%"..nnnn
end
funcs.normalizemagic = function(magic)
return string.gsub(magic,"[%(+%)+%^+%*+%$+%.+%[+%]+%++%-+%?+%%+]",funcs.normalizeblue)
end
funcs.plrs = game:GetService("Players")--]]
local newf = Instance.new("Folder")
newf.Parent = game:GetService("CoreGui")
newf.Name = "smx"
local function addn(plr)
local nm = plr.Character and plr.Character:GetChildren()
local v = nm and plr.Character:WaitForChild("Head",10)
if v ~= nil then
local BillboardGui = Instance.new("BillboardGui")
local TextLabel = Instance.new("TextLabel")
BillboardGui.Parent = newf
BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
BillboardGui.Active = true
BillboardGui.Adornee = v
BillboardGui.AlwaysOnTop = true
BillboardGui.MaxDistance = 10000
BillboardGui.Size = UDim2.new(4, 0, 1, 0)
BillboardGui.SizeOffset = Vector2.new(0, 4.5)
local con
con = plr.CharacterRemoving:Connect(function()
BillboardGui:Destroy()
tooltb=nil
con:Disconnect()
end)
local tooltb={}
local toolstring = ""
TextLabel.Parent = BillboardGui
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.SourceSansSemibold
TextLabel.TextTransparency  = .5
local tm = ""

if plr.Neutral ~= true and plr.Team then
tm = " ("..plr.Team.Name..")"
TextLabel.TextColor3 = plr.TeamColor.Color
else
tm = " (Neutral)"
TextLabel.TextColor3 = Color3.new(1,1,1)
end
TextLabel.TextSize = 15
TextLabel.TextYAlignment = Enum.TextYAlignment.Top
local p = plr.Backpack and plr.Backpack:GetChildren()
local nu = 1
local hpt = ""
local hm = plr.Character:FindFirstChildOfClass("Humanoid") or plr.Character:WaitForChild("Humanoid",10)
if hm then
hpt = plr.DisplayName..": "..math.ceil(hm.Health).."/"..math.ceil(hm.MaxHealth)..tm.."\n"
TextLabel.Text = hpt..toolstring
hm.HealthChanged:Connect(function()
hpt = plr.DisplayName..": "..math.ceil(hm.Health).."/"..math.ceil(hm.MaxHealth)..tm.."\n"
TextLabel.Text = hpt..toolstring
end)
end

plr:GetPropertyChangedSignal("Team"):Connect(function()
if plr.Neutral ~= true and plr.Team then
tm = " ("..plr.Team.Name..")"
TextLabel.TextColor3 = plr.TeamColor.Color
else
tm = " (Neutral)"
TextLabel.TextColor3 = Color3.new(1,1,1)
end
hpt = (hm and plr.DisplayName..": "..math.ceil(hm.Health).."/"..math.ceil(hm.MaxHealth)..tm.."\n") or plr.DisplayName..tm.."\n"
TextLabel.Text = hpt..toolstring
end)

for m,x in pairs(nm) do
if x:IsA("Tool") then
local tn = string.gsub(x.Name,"\n"," ")
if x ~= nil and nu%4 == 0  then
toolstring = toolstring.."\n"..tn
TextLabel.Text = hpt..toolstring
nu=1
elseif x ~= nil then
toolstring = toolstring..tn..","
TextLabel.Text = hpt..toolstring
nu=nu+1
end
tooltb[x]=tn
BillboardGui.SizeOffset = BillboardGui.SizeOffset+Vector2.new(0,.35)
end
end

plr.Character.ChildAdded:Connect(function(n)
local tn = string.gsub(n.Name,"\n"," ")
if n:IsA("Tool") then
if tooltb[n] then
return
elseif nu%4 == 0 and n:IsA("Tool") then
toolstring = toolstring.."\n"..tn.." (EQUIPPED),"
TextLabel.Text = hpt..toolstring
nu=1
elseif n:IsA("Tool") then
toolstring = toolstring..tn.." (EQUIPPED),"
TextLabel.Text = hpt..toolstring
nu=nu+1
end
tooltb[n]=tn
BillboardGui.SizeOffset = BillboardGui.SizeOffset+Vector2.new(0,.35)
end
end)

plr.Character.ChildRemoved:Connect(function(n)
if tooltb[n] then
local tn = funcs.normalizemagic(tooltb[n])
local repl = (string.find(toolstring,"\n"..tn.." %(EQUIPPED%),") and string.gsub(toolstring,"\n"..tn.." %(EQUIPPED%),","",1)) or (string.find(toolstring,tn.." %(EQUIPPED%),",1) and string.gsub(toolstring,tn.." %(EQUIPPED%),","",1)) or toolstring
toolstring = repl
TextLabel.Text = hpt..toolstring
nu=nu-1
BillboardGui.SizeOffset = BillboardGui.SizeOffset-Vector2.new(0,.35)
tooltb[n]=nil
end

end)

if p then

for m,x in pairs(p) do
local tn = string.gsub(x.Name,"\n"," ")
if tooltb[n] then
continue
elseif x ~= nil and x:IsA("Tool") and nu%4 == 0 then
toolstring = toolstring.."\n"..tn..","
TextLabel.Text = hpt..toolstring
nu = 1
elseif x ~= nil and x:IsA("Tool") then
toolstring = toolstring..tn..","
TextLabel.Text = hpt..toolstring
nu=nu+1
end
tooltb[x]=tn
BillboardGui.SizeOffset = BillboardGui.SizeOffset+Vector2.new(0,.35)

end

plr.Backpack.ChildAdded:Connect(function(n)
local tn = string.gsub(n.Name,"\n"," ")
if n:IsA("Tool") then
if tooltb[n] then

elseif nu%4 == 0 then
toolstring = toolstring.."\n"..tn..","
TextLabel.Text = hpt..toolstring
nu = 1
else
toolstring = toolstring..tn..","
TextLabel.Text = hpt..toolstring
nu=nu+1
end
tooltb[n]=tn
BillboardGui.SizeOffset = BillboardGui.SizeOffset+Vector2.new(0,.35)

end
end)

plr.Backpack.ChildRemoved:Connect(function(n)
local tn = funcs.normalizemagic(string.gsub(n.Name,"\n"," "))
if tooltb[n] then
local repl = (string.find(toolstring,"\n"..tn..",") and string.gsub(toolstring,"\n"..tn..",","",1)) or (string.find(toolstring,tn..",") and string.gsub(toolstring,tn..",","",1)) or toolstring
toolstring = repl
TextLabel.Text = hpt..toolstring
nu-=1
BillboardGui.SizeOffset = BillboardGui.SizeOffset-Vector2.new(0,.35)
tooltb[n]=nil
end
end)

end
end
end

local function plrj(ml)
if getgenv().tspyen then
addn(ml)
ml.CharacterAdded:Connect(function(L)
local hd = L:WaitForChild("Head",200)
if hd then
addn(ml)
end
end)
end
end
for i,plr in pairs(funcs.plrs:GetPlayers()) do
plrj(plr)
end
funcs.plrs.PlayerAdded:Connect(plrj)
