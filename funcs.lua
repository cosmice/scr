--funcs.lua
do
getgenv().funcs = {}
local playerservice = game:GetService("Players")
local deb = game:GetService("Debris")
local lplr = playerservice.LocalPlayer
local charfuncs = false
local nofaceon = false
local runservice = game:GetService("RunService")
local rustepped = runservice.Stepped
local ruhb = runservice.Heartbeat
local sethidden = sethiddenproperty or set_hidden_property or set_hidden_prop
local tpserv = game:GetService("TeleportService")
getgenv().wait = task.wait
getgenv().spawn=task.spawn
getgenv().funcs.runs = runservice
getgenv().funcs.deb = deb
getgenv().funcs.plrs = playerservice
getgenv().funcs.lplr = playerservice.LocalPlayer
getgenv().funcs.uip=game:GetService("UserInputService")
getgenv().funcs.rawmeta=getrawmetatable(game)
getgenv().funcs.normalizeblue = function(nnnn)
return "%"..nnnn
end
getgenv().funcs.normalizemagic = function(magic,p)
local str=string.gsub(magic,"[%(+%)+%^+%*+%$+%.+%[+%]+%++%-+%?+%%+]",funcs.normalizeblue)
return p and str[1] or str
end
getgenv().getchar=function(x,y)
local ch=vars.IPityTheFool.Character or vars.IPityTheFool.CharacterAdded:Wait()
if ch and x~=nil then
return y and ch:FindFirstChildOfClass(x) or not y and ch:FindFirstChild(x)
else
return ch
end
end
getgenv().funcs.rebindsl = function(KEYS)
local mouseLockController = funcs.lplr.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("CameraModule"):WaitForChild("MouseLockController")
local obj = mouseLockController:FindFirstChild("BoundKeys")
if obj then
	obj.Value = KEYS
else
	obj = Instance.new("StringValue")
	obj.Name = "BoundKeys"
	obj.Value = KEYS
	obj.Parent = mouseLockController
end
end
local lded1 = false
local con
getgenv().funcs.autoc1 = function()
lded1 = not lded1
getgenv().XxmclickxX = true
if lded1 then
funcs.sendnotif("autoclicker","loaded","rbxassetid://8209859518",3)

local mym = funcs.lplr:GetMouse()
getgenv().XxautocxX = false
con = funcs.uip.InputBegan:Connect(function(inpuut,proc)
if inpuut.UserInputType == Enum.UserInputType.Keyboard and funcs.uip:IsKeyDown(Enum.KeyCode.Q) then
if inpuut.KeyCode == Enum.KeyCode.X then
getgenv().XxautocxX = not getgenv().XxautocxX
if XxautocxX then funcs.sendnotif("autoclicker","enabled","rbxassetid://8209859518",3) else funcs.sendnotif("autoclicker","disabled","rbxassetid://8209859518",3) end
while XxautocxX and XxmclickxX do
mouse1click()
mouse1click()
task.wait()
end
end
end
end)
else
getgenv().XxmclickxX = not XxmclickxX
lded1 = not lded1
funcs.sendnotif("autoclicker","removed","rbxassetid://8209859518",7)
con:Disconnect()
end
end
getgenv().funcs.instanceholder = funcs.instanceholder or Instance.new("Folder")
funcs.instanceholder.Name=math.random(1,99999999)
funcs.instanceholder.Parent=game:GetService("CoreGui")
--[[getgenv().funcs.addhook = function(x,txt)
				local BillboardGui = Instance.new("BillboardGui")
				local TextLabel = Instance.new("TextLabel")
				BillboardGui.Adornee = x
				BillboardGui.Name = "Sight"
				BillboardGui.Parent = ESPholder
				BillboardGui.Size = UDim2.new(0, 100, 0, 150)
				BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
				BillboardGui.AlwaysOnTop = true
				BillboardGui.MaxDistance = 99999999
				TextLabel.Parent = BillboardGui
				TextLabel.BackgroundTransparency = 1
				TextLabel.Position = UDim2.new(0, 0, 0, -50)
				TextLabel.Size = UDim2.new(0, 100, 0, 100)
				TextLabel.Font = Enum.Font.SourceSansSemibold
				TextLabel.TextSize = 20
				TextLabel.TextColor3 = Color3.new(1, 1, 1)
				TextLabel.TextStrokeTransparency = 0
				TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
				TextLabel.Text = txt
				TextLabel.ZIndex = 10
end--]]
getgenv().funcs.getholder=function(name)
local fd=name and funcs.instanceholder:FindFirstChild(name)
if not fd then
fd=Instance.new("Folder")
fd.Name=tostring(name) or #funcs.instanceholder:GetChildren()+1
fd.Parent=funcs.instanceholder
end
return fd
end
getgenv().funcs.addhook=function(v,tb)
		v=v:IsA("Model") and (v.PrimaryPart or v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Head") or v:FindFirstChildOfClass("BasePart")) or v
		if not v then return 'fish_not_found' end
		tb=tb or {}
		tb={maxdis=tb.maxdis or tb.maxdist or tb.maxdistance or math.huge,
		color=tb.color or tb.txtcolor or Color3.fromRGB(255,255,255),
		text=tb.text or v:IsA("Model") and v.Name or v.Parent.Name,
		txtcolor=tb.txtcolor or tb.textcolor or tb.color or Color3.fromRGB(255,255,255),
		job=funcs.getholder(tb.job or "generic_esp"),
		txtenabled=tb.txtenabled or tb.textenabled or false,
		autoremove=tb.autoremove or false,
		offset=tb.offset or Vector3.new(0,2,0),
		dep=tb.additionaldependencies or tb.dep or {},
		transp=tb.transp or tb.transparency or tb.trans or 0.8,
		toreturn={}
		}
		if getproperties(v).Size then
        local a = Instance.new("BoxHandleAdornment")
        a.Size = v.Size
        a.AlwaysOnTop = true
        a.Parent = tb.job
        a.ZIndex = 1
        a.Transparency = tb.transp
        a.Adornee = v
        a.Color3 = tb.color
		a.Name=v.Name
		tb.toreturn.box=a
		end
		if tb.txtenabled then
        local b = Instance.new("BillboardGui")
        b.Adornee = v
        b.MaxDistance = tb.maxdis
        b.AlwaysOnTop = true
        b.Parent = tb.job
        b.ExtentsOffset = tb.offset
        b.Size = UDim2.fromScale(4,2)
		b.Name=v.Name
		tb.toreturn.billboardgui=b
        local c = Instance.new("TextBox")
        c.Text = tb.text or v.Parent.Name
        c.BackgroundTransparency = 1
        c.Size = UDim2.fromScale(1,1)
        c.TextScaled = true
        c.Parent = b
        c.TextColor3 = tb.txtcolor
		tb.toreturn.textbox=c
		end
		tb.toreturn.justquit=function()
		for i,v in pairs(tb.toreturn) do
		tb.toreturn[i]=nil
		if typeof(v)=='Instance' then
		funcs.deb:AddItem(v,0)
		end
		end
		end
		
		if tb.autoremove then
		v.Destroying:Connect(tb.toreturn.justquit)
		end
		for i,x in pairs(tb.dep) do
		x.Destroying:Connect(tb.toreturn.justquit)
		end
		return tb.toreturn
end

getgenv().funcs.toplaceid = function(id)
funcs.lplr:Kick()
task.wait(.5)
tpserv:Teleport(id,Lplr)
end
--[[
getgenv().funcs.copyjobid = function()
setclipboard(game.JobId)
end
getgenv().funcs.copyplaceid = function()
setclipboard(game.PlaceId)
end--]]
getgenv().unfuck = function(Table,playername)
for i = 1,#Table do
local zZZ = Table[i]
if zZZ == playername then
table.remove(Table,i)
print("removed")
end
end
end

getgenv().funcs.sg = game:GetService("StarterGui")
getgenv().funcs.sendnotif = function(top,bottomtextuwu,icopain,durrrrr)
funcs.sg:SetCore("SendNotification", {
Title = top or "";
Text = bottomtextuwu or ""; -- bottom text uwu
Icon = icopain or "rbxassetid://9101806464";
Duration = durrrrr or 5; -- durrrrr in seconds

})
end
local http=game:GetService('HttpService')
getgenv().funcs.save = function(name,data,encode)
if encode then
writefile(name,http:JSONEncode(data))
else
writefile(name,data)
end
end
getgenv().funcs.load = function(name,default)

	if not isfile(name) then writefile(name, http:JSONEncode(default)) end

	return http:JSONDecode(readfile(name))
end
getgenv().funcs.sl = function()
funcs.lplr.DevEnableMouseLock = not funcs.lplr.DevEnableMouseLock
end
getgenv().funcs.xgetplr = function(String,mode) --Timeless/xFunnieuss/reviz admin/oofkohls v2
    local Found = {}
    local Target = String:lower()
        for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name:lower():sub(1, #String) == String:lower() then
                table.insert(Found,v)
            end
        end    
    return not mode and Found or Found[1]    
end
getgenv().funcs.turtlespyload = function()
loadfile("rspy.lua")()
end
getgenv().funcs.kickblur = function()
runservice:SetRobloxGuiFocused(false)
end
getgenv().funcs.rem = function(x,xx)
local im = x:WaitForChild(tostring(xx),20)
if im ~= nil then
deb:AddItem(im,0)
end
end
--[[getgenv().funcs.xxget = function(name)
return xgetplr(name,true)
end--]]
getgenv().funcs.setsim = function()
	settings().Physics.AllowSleep = false
	if sethidden then
				settings().Physics.AllowSleep = false
					sethidden(game:GetService("Players").LocalPlayer, "SimulationRadius", 1000)
					sethidden(game:GetService("Players").LocalPlayer, "MaxSimulationRadius", 1000)
					game:GetService("Players").LocalPlayer.MaximumSimulationRadius = 1000
					game:GetService("Players").LocalPlayer.ReplicationFocus = workspace
	else
	error("incompatible")
	end
end
getgenv().WaitForChildOfClass = function(parent, class)
	local child = parent:FindFirstChildOfClass(class)
	while parent and not child or not child:IsA(class) do
		child = parent.ChildAdded:Wait()
	end
	return child
end
--proximity and touchinterest
--[[getgenv().funcs.prox = function()
for i,v in pairs(workspace:GetDescendants()) do
if v:IsA("ProximityPrompt") then
coroutine.wrap(function()
v.Enabled = true
fireproximityprompt(v,0)
end)()
end
end
end--]]
if charfuncs == true then
--[[local looptouching = {}
getgenv().funcs.looptouch = function(interest,val)
local plrh = getchar() and getchar():WaitForChild("HumanoidRootPart",40)
local intt
local totalnum = 0
if interest:IsA("TouchTransmitter") then
intt = interest.Parent
elseif interest:FindFirstChildOfClass("TouchTransmitter") then
intt = interest
else
print("next time give me something with a touchinterest idiot")
return
end
local inttn = intt:GetFullName()
if not table.find(looptouching,inttn) then
table.insert(looptouching,inttn)
wait(0)
if tonumber(val) == nil then
coroutine.wrap(function()
while ruhb:Wait() and table.find(looptouching,inttn) do
firetouchinterest(plrh,intt,0)
firetouchinterest(plrh,intt,1)
totalnum = totalnum + 1
if not table.find(looptouching,inttn) then
break
end
end
print(totalnum)
end)()
print("FIRE!")
elseif tonumber(val) ~= nil then
coroutine.wrap(function()
local nn = tonumber(val)
while wait(nn) and table.find(looptouching,inttn) do
firetouchinterest(plrh,intt,0)
firetouchinterest(plrh,intt,1)
totalnum = totalnum + 1
if not table.find(looptouching,inttn) then
break
end
end
print(totalnum)
end)()
print("FIRE!")
end
else
unfuck(looptouching,inttn)
print("disabled")
end

end--]]

end
--END
--no clue who released printbeenest code
getgenv().funcs.printbeenest = function(xx,mm) --thread idk
local rettable
if mm == nil then
rettable = "{"
else
rettable = mm .. " = " .. "{"
end
local pparent = ""
	for x, y in pairs(xx) do
	local isxokay=not tonumber(x) and tostring(x).." = "
	if type(y) == "string" then
		coroutine.wrap(function()
			rettable = rettable ..isxokay.. '"'.. tostring(y) ..'", '
		end)()
	elseif type(y) == "number" then
		coroutine.wrap(function()
			rettable = rettable ..isxokay.. tostring(y) ..','
		end)()
	elseif typeof(y):lower() == "boolean" then
		coroutine.wrap(function()
			rettable = rettable ..isxokay..tostring(y) .. ","
		end)()
	elseif type(y):lower() == "table" then
		if pparent ~= "" then
			rettable = rettable ..isxokay.. tostring(pparent) .. "." .. x .. " = {" .. tostring(table.concat(y,",")) .. "},"
			coroutine.wrap(function()
			print(funcs.printbeenest(y,tostring(x)))
			end)()
		else
			rettable = rettable .. x .. " = {" .. tostring(table.concat(y,",")) .. "},"
			coroutine.wrap(function()
			print(funcs.printbeenest(y,tostring(x)))
			end)()
		end
	elseif typeof(y):lower() == "function" then
		coroutine.wrap(function()
		rettable = rettable ..isxokay.. ","
		end)()
	elseif type(y):lower() == "instance" then
		coroutine.wrap(function()
		rettable = rettable ..isxokay.. y:GetFullName() .. ","
		end)()
	else
		if pparent ~= "" then
		rettable = rettable .. tostring(pparent) .. "." .. tostring(y) .. " = " .. tostring(y) .. ","
		else
		rettable = rettable .. tostring(y) .. "=" .. tostring(y) .. ","
		end
	end
	pparent = tostring(x)
	end
	rettable = rettable .. "}"
	wait(0)
return rettable
end
--infinite yield fe code (rj)
getgenv().rj = function() --infinite yield
	if #playerservice:GetPlayers() <= 1 then
		funcs.lplr:Kick("\nRejoining...")
		task.wait(.5)
		game:GetService('TeleportService'):Teleport(game.PlaceId, funcs.lplr)
	else
		funcs.lplr:Kick("\nRejoining...")
		task.wait(.5)
		game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, funcs.lplr)
end
end


if charfuncs == true then
--ex: toenable: noface(true,"Head")

getgenv().funcs.noface = function(x,head)
if x ~= true then
nofaceon = false
else
nofaceon = true
local lchar = lplr.Character or lplr.CharacterAdded:Wait()

deb:AddItem(lchar:WaitForChild(head),0)
lplr.CharacterAdded:Connect(function(del)
deb:AddItem(lchar:WaitForChild(head),0)
end)

end
--if x ~= ^
end
--noface^
local ch = lplr.Character or lplr.CharacterAdded:Wait()
if game.PlaceId == 6003728526 then
getgenv().ulanonametag = function()
ch = lplr.Character or lplr.CharacterAdded:Wait()
if ch:FindFirstChild("Head"):FindFirstChildOfClass("BillboardGui") then
deb:AddItem(ch:FindFirstChild("Head"):FindFirstChildOfClass("BillboardGui"),0)
end
lplr.CharacterAdded:Connect(function(cha)
ch = cha or lplr.CharacterAdded:Wait()
local xh = ch:WaitForChild("Head")
WaitForChildOfClass(xh,"BillboardGui")
if xh:FindFirstChildOfClass("BillboardGui") then
deb:AddItem(xh:FindFirstChildOfClass("BillboardGui"),0)
end
end)
end
local morphpath = game:GetService("Workspace").Spawn
getgenv().charchoose = function(name)
ch = lplr.Character or lplr.CharacterAdded:Wait()
local choosenf
for i,v in pairs(morphpath:GetDescendants()) do
if v:IsA("Folder") and v.Name == name then
for b,x in pairs(v:GetDescendants()) do
--second arg below might have to be removed later on
if x:IsA("TouchTransmitter") and x:IsDescendantOf(v) then
firetouchinterest(ch:FindFirstChild("HumanoidRootPart"),x.Parent,0)
firetouchinterest(ch:FindFirstChild("HumanoidRootPart"),x.Parent,1)
print("done -")
end
end
end
end

end

end
--ula gameid check end ^
end
--charfuncs ^
--[[
if game.PlaceId == 6907620011 then
loadfile('ccessentials.lua')()
end
--]]
--funcs.turtlespyload()
getgenv().funcs_loaded = true
--[[for i,v in pairs(listfiles("funcsdependents")) do
loadfile(v)()
end--]]
charfuncs = nil
end
