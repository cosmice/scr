local vars={
gamereq=true,
}
vars.funcs={}
local tween
local function kinesomona(input,gameprocessed)
if (not vars.gamereq or not gameprocessed) then
if input.KeyCode == Enum.KeyCode.Z then
funcs.lplr:ClearCharacterAppearance()
local h = getchar():WaitForChild("Humanoid",10)
local hc=h:Clone()
hc.Parent = getchar()
hc.Name = "Human"

h:Destroy()

for _,v in pairs(funcs.lplr:WaitForChild("Backpack",20):GetDescendants()) do
    if v.ClassName == "Tool" then
        v.Parent = getchar()
    end
end
vars.reddevredemption=true
elseif input.KeyCode == Enum.KeyCode.M and vars.reddevredemption then
vars.reddevredemption=false
local tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(300, Enum.EasingStyle.Linear)
local ch=getchar()
tween = tweenService:Create(ch.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(0, -1000, 0)})
tween:Play()
task.wait(5)
if ch and funcs.lplr.Character==ch and ch.Parent then
plug.ref()
end
elseif input.KeyCode == Enum.KeyCode.N and vars.reddevredemption then
vars.reddevredemption=false
getchar():PivotTo(CFrame.new(Random.new():NextNumber(60000000000,100000000000),Random.new():NextNumber(60000000000,100000000000),Random.new():NextNumber(60000000000,100000000000)))
elseif input.KeyCode == Enum.KeyCode.B and vars.reddevredemption then
vars.reddevredemption=false
plug.ref()
end

end
end

vars.funcs.eqtool=function(wheneverythinggoeswrong)
local hmnoid=funcs.wfcofclass(getchar(),'Humanoid')
if hmnoid and wheneverythinggoeswrong and wheneverythinggoeswrong.Parent and wheneverythinggoeswrong:IsA('BackpackItem') then
task.defer(hmnoid.EquipTool,hmnoid,wheneverythinggoeswrong)
end
hmnoid=nil
end

local plug={
["desc"]={desc="Z - kidnap M - hell N - Void B - Refresh"};
["tky"]={func=function(strt,plrarg) if vars.keysen then vars.keysen:Disconnect() vars.keysen=nil else vars.keysen=funcs.uip.InputBegan:Connect(kinesomona) end if plrarg~="nn" then funcs.sendnotif("cmds/toolthing/tky",vars.keysen and "Z - kidnap M - hell N - Void B - Refresh" or "false","rbxassetid://6678521436",10) end end,desc="toggle keybinds (default: off)"};
["proc"]={func=function(strt,plrarg) vars.gamereq=not vars.gamereq; if plrarg~="nn" then funcs.sendnotif("cmds/toolthing/proc",vars.gamereq and "true" or "false","rbxassetid://6678521436",5) end end,desc="disables gamereq requirement, use if keybinds dont work"};
["ref"]={func=function()
local Char=getchar()
	if Char:FindFirstChildOfClass("Humanoid") then Char:FindFirstChildOfClass("Humanoid"):ChangeState(15) end
	Char:ClearAllChildren()
	local newChar = Instance.new("Model")
	newChar.Parent = workspace
	funcs.lplr.Character = newChar
	task.wait()
	funcs.lplr.Character = Char
	funcs.deb:AddItem(newChar,0) Char=nil
end,desc="refresh character"};
['f3x']={['func']=function() loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)() end;['desc']='building tools, untrustworthy loadstring'};
['grabtools']={['func']=function(a,aa)
if not funcs.wfcofclass(getchar(),'Humanoid') then return end
for i,v in pairs(workspace[aa and 'GetDescendants' or 'GetChildren'](workspace)) do
if v:IsA('BackpackItem') then
vars.funcs.eqtool(v)
end
if i%3200==0 then task.wait() end
end
if vars.grabcon then vars.grabcon=vars.grabcon:Disconnect() end
vars.grabcon=workspace[aa and 'DescendantAdded' or 'ChildAdded']:Connect(vars.funcs.eqtool)
funcs.sendnotif('toolthing\\grabtools\\'..(aa and 'DescendantAdded' or 'ChildAdded'),vars.grabcon~=nil and 'true' or 'false','rbxassetid://11012215782',5) 
end;['desc']='specify arg[1] for descendants, default GetChildren'};
['ungrabtools']={['func']=function() if vars.grabcon then vars.grabcon=vars.grabcon:Disconnect() funcs.sendnotif('toolthing\\grabtools','false','rbxassetid://11012215782',5) end end};
['rjgtool']={['func']=function(strt,strd,str) powersupply.cmds['gtool'][1](strt,strd,str) end;['desc']='givetools and then rejoin'};
['equiptools']={['func']=function() local bp=funcs.wfcofclass(funcs.lplr,'Backpack') if bp then for i,v in pairs(bp:GetChildren()) do if v:IsA('Tool') then v.Parent=getchar() end end bp=nil end end;['aliases']={['eqtools']='equiptools'}};
['Reservedpluginname']="base.tool-manipulation"
}



plug["gtool"]={func=function(strt,strd,str)
	local thp=strd and funcs.xgetplr(strd,true)
	if not thp then return end
	local v = thp.Character or thp.CharacterAdded:Wait()
	workspace.CurrentCamera.CameraSubject = v
	local Char = getchar()
	local hum = Char:FindFirstChildWhichIsA('Humanoid')
	local hrp = hum and hum.RootPart
	local hrppos = hrp.CFrame
	if strt[1] then
	local bp=funcs.lplr:FindFirstChildWhichIsA("Backpack") 
	if bp then
	for i,v in pairs(bp:GetChildren()) do
	if v:IsA("Tool") then
	v.Parent=getchar()
	end
	end
	end
	end
	if not Char:FindFirstChildOfClass("Tool") then funcs.sendnotif("cmds/toolthing/bambi.exe","fucking idiot","rbxassetid://8119590978",4) workspace.CurrentCamera.CameraSubject=hum return end
	hum = hum:Destroy() or hum:Clone()
	hum.Parent = Char
	hum:ClearAllChildren()
	task.spawn(function()
		funcs.lplr.CharacterAdded:Wait():PivotTo(task.wait() and hrppos)
	end)
	local vHRP = v:WaitForChild("HumanoidRootPart",20)
	while Char and Char.Parent and vHRP and vHRP.Parent do
		funcs.lplr:ClearCharacterAppearance()
		local Tools = false
		for _, v in ipairs(Char:GetChildren()) do
			if v:IsA('BackpackItem') and v:FindFirstChild('Handle') then
				Tools = true
				firetouchinterest(v.Handle, vHRP, 0)
				firetouchinterest(v.Handle, vHRP, 1)
			end
		end
		if not Tools then
			break
		end
		hrp.CFrame = vHRP.CFrame
		task.wait()
	end
	plug.ref()
	if strt[2]~="nn" then funcs.sendnotif("cmds/toolthing/gtool","gave tools to "..thp.DisplayName.." ("..thp.Name..")","rbxassetid://6678521436",4) end
end,desc="give equipped tools to player in arg[2], specify a arg[3] to equip all";['aliases']={['givetools']='gtool'}}
plug["void"]={func=function(strt,strd,str)
	local thp=strd and funcs.xgetplr(strd,true)
	if not thp then return end
	local v = thp.Character or thp.CharacterAdded:Wait()
	workspace.CurrentCamera.CameraSubject = v
	local Char = getchar()
	local hum = Char:FindFirstChildWhichIsA('Humanoid')
	local hrp = hum and hum.RootPart
	local hrppos = Char:GetPivot()
	
	if strt[1] then
	local bp=funcs.lplr:FindFirstChildWhichIsA("Backpack") 
	if strt[1]=="2" and bp then
	if bp then
	for i,v in pairs(bp:GetChildren()) do
	if v:IsA("Tool") then
	v.Parent=getchar()
	end
	end
	end
	elseif strt[1]=="1" and bp then
	bp:FindFirstChildOfClass("Tool").Parent=Char
	end
	end
	if not getchar():FindFirstChildOfClass("Tool") then
	funcs.sendnotif("cmds/toolthing/kill","no bitches (tools) "..thp.DisplayName.." ("..thp.Name..")","rbxassetid://6678521436",4) workspace.CurrentCamera.CameraSubject=hum return
	end
	hum = hum:Destroy() or hum:Clone()
	hum.Parent = Char
	hum:ClearAllChildren()
	task.spawn(function()
		speaker.CharacterAdded:Wait():PivotTo(task.wait() and hrppos)
	end)
	local vHRP = v:WaitForChild("HumanoidRootPart",20)
	while Char and Char.Parent and vHRP and vHRP.Parent do
		funcs.lplr:ClearCharacterAppearance()
		local Tools = false
		for _, v in ipairs(Char:GetChildren()) do
			if v:IsA('BackpackItem') and v:FindFirstChild('Handle') then
				Tools = true
				firetouchinterest(v.Handle, vHRP, 0)
				firetouchinterest(v.Handle, vHRP, 1)
			end
		end
		if not Tools then
			break
		end
		hrp.CFrame = vHRP.CFrame
		task.wait()
	end
	getchar():PivotTo(CFrame.new(Random.new():NextNumber(60000000000,100000000000),Random.new():NextNumber(60000000000,100000000000),Random.new():NextNumber(60000000000,100000000000)))
	plug.ref()
	if strt[2]~="nn" then funcs.sendnotif("cmds/toolthing/void","voided "..thp.DisplayName.." ("..thp.Name..")","rbxassetid://6678521436",4) end
end}
plug["bring"]={func=function(strt,strd,str)
	local thp=strd and funcs.xgetplr(strd,true)
	if not thp then return end
	local v = thp.Character or thp.CharacterAdded:Wait()
	workspace.CurrentCamera.CameraSubject = v
	local Char = getchar()
	local hum = Char:FindFirstChildWhichIsA('Humanoid')
	local hrp = hum and hum.RootPart
	local hrppos = Char:GetPivot()
	
	if strt[1] then
	local bp=funcs.lplr:FindFirstChildWhichIsA("Backpack") 
	if strt[1]=="2" and bp then
	if bp then
	for i,v in pairs(bp:GetChildren()) do
	if v:IsA("Tool") then
	v.Parent=getchar()
	end
	end
	end
	elseif strt[1]=="1" and bp then
	bp:FindFirstChildOfClass("Tool").Parent=Char
	end
	end
	if not getchar():FindFirstChildOfClass("Tool") then
	funcs.sendnotif("cmds/toolthing/kill","no bitches (tools) "..thp.DisplayName.." ("..thp.Name..")","rbxassetid://6678521436",4) workspace.CurrentCamera.CameraSubject=hum return
	end
	hum = hum:Destroy() or hum:Clone()
	hum.Parent = Char
	hum:ClearAllChildren()
	task.spawn(function()
		speaker.CharacterAdded:Wait():PivotTo(task.wait() and hrppos)
	end)
	local vHRP = v:WaitForChild("HumanoidRootPart",20)
	while Char and Char.Parent and vHRP and vHRP.Parent do
		funcs.lplr:ClearCharacterAppearance()
		local Tools = false
		for _, v in ipairs(Char:GetChildren()) do
			if v:IsA('BackpackItem') and v:FindFirstChild('Handle') then
				Tools = true
				firetouchinterest(v.Handle, vHRP, 0)
				firetouchinterest(v.Handle, vHRP, 1)
			end
		end
		if not Tools then
			break
		end
		hrp.CFrame = vHRP.CFrame
		task.wait()
	end
	getchar():PivotTo(hrppos)
	plug.ref()
	if strt[2]~="nn" then funcs.sendnotif("cmds/toolthing/void","voided "..thp.DisplayName.." ("..thp.Name..")","rbxassetid://6678521436",4) end
end;desc="barely working my code is dogshit"}

return plug
