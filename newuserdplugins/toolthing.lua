local vars={
gamereq=true,
keysen=false
}
local plug={
["desc"]={desc="Z - kidnap M - hell N - Void B - Refresh"};
["tky"]={func=function(strt) vars.keysen=not vars.keysen; if strt[1]~="nn" then funcs.sendnotif("cmds/toolthing/tky",vars.keysen and "Z - kidnap M - hell N - Void B - Refresh" or "false","rbxassetid://6678521436",10) end end,desc="toggle keybinds (default: off)"};
["proc"]={func=function(strt) vars.gamereq=not vars.gamereq; if strt[1]~="nn" then funcs.sendnotif("cmds/toolthing/proc",vars.gamereq,"rbxassetid://6678521436",5) end end,desc="disables gamereq requirement, use if keybinds dont work"};
["ref"]={func=function()
local Char=getchar()
	if Char:FindFirstChildOfClass("Humanoid") then Char:FindFirstChildOfClass("Humanoid"):ChangeState(15) end
	Char:ClearAllChildren()
	local newChar = Instance.new("Model")
	newChar.Parent = workspace
	funcs.lplr.Character = newChar
	task.wait()
	funcs.lplr.Character = Char
	funcs.deb:AddItem(newChar,0)
end,desc="refresh character"};
["god"]={func=function()
local Cam = workspace.CurrentCamera
	local Pos, Char = Cam.CFrame, getchar()
	local Human = Char and Char:FindFirstChildWhichIsA("Humanoid")
	local nHuman = Human:Clone(Human)
	nHuman.Parent, speaker.Character = Char, nil
	nHuman:SetStateEnabled(15, false)
	nHuman:SetStateEnabled(1, false)
	nHuman:SetStateEnabled(0, false)
	nHuman.BreakJointsOnDeath, Human = true, Human.Destroy(Human)
	speaker.Character, Cam.CameraSubject, Cam.CFrame = Char, nHuman, task.wait() and Pos
	nHuman.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	local Script = Char:FindFirstChild("Animate")
	if Script then
		Script.Disabled = true
		task.wait()
		Script.Disabled = false
	end
	nHuman.Health = nHuman.MaxHealth
end};
["reset"]={func=function()
local hnn=getchar():FindFirstChildOfClass("Humanoid")
if hnn then
hnn:SetStateEnabled(15, true)
hnn.Health=0
end
end,desc="suicide"}
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
	plug.ref()
	if strt[2]~="nn" then funcs.sendnotif("cmds/toolthing/gtool","gave tools to "..thp.DisplayName.." ("..thp.Name..")","rbxassetid://6678521436",4) end
end,desc="give equipped tools to player in arg[2], specify a arg[3] to equip all"}
plug["void"]={func=function(strt,strd,str)
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
	funcs.sendnotif("cmds/toolthing/kill","no tools"..thp.DisplayName.." ("..thp.Name..")","rbxassetid://6678521436",4) return
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

local tween
funcs.uip.InputBegan:Connect(function(input,gameprocessed)
if (not vars.gamereq or not gameprocessed) and vars.keysen then
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
end)

return plug