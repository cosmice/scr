local vars={floatn=3.1,sz=Vector3.new(2,0.2,1.5),fn=tostring(Random.new():NextNumber(1245,99999))}
vars.funcs={}
	vars.funcs.nclip=function()
	local ch=getchar()
		if ch ~= nil then
			for _, child in pairs(ch:GetDescendants()) do
				if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= fn then
					funcs.rawmeta.__newindex(child,"CanCollide",false)
				end
			end
		end
	end

local plug={noclip={func=function()
	if vars.noclipping then vars.noclipping:Disconnect() vars.noclipping=nil else vars.noclipping = funcs.runs.Stepped:Connect(vars.funcs.nclip) end end};
	float={func=function() if vars.float then funcs.deb:AddItem(vars.float,0) vars.float=nil return end
	vars.float=Instance.new("Part")
	funcs.rawmeta.__newindex(vars.float,"Name",vars.fn) 
	funcs.rawmeta.__newindex(vars.float,"Size",vars.sz) 
	funcs.rawmeta.__newindex(vars.float,"Parent",getchar())  --i am retarded
	vars.float.Transparency=1
	local rp=getchar():FindFirstChild("HumanoidRootPart")
	while vars.float and rp and rp.Parent do 
	funcs.rawmeta.__newindex(vars.float,"CFrame",rp.CFrame*CFrame.new(0,-vars.floatn,0))
	task.wait()
	end
	funcs.deb:AddItem(vars.float,0) vars.float=nil
	end};
	cprop={reserved=true,func=function(strt,nn,str,cmd,arg) 
	local hmnoid=getchar():FindFirstChildOfClass("Humanoid")
	nn=tonumber(nn)
	if hmnoid and nn then
	if arg[2] then
	local strnd="loop"..arg[1]
	vars[strnd]=nil
	vars[strnd]=nn
	while vars[strnd] and hmnoid do
	hmnoid[arg[1]]=nn
	task.wait()
	end
	else
	hmnoid[arg[1]]=nn
	end
	
	end
	end};
	nilvar={reserved=true,func=function(strt,nn,str,cmd,arg)
	vars[arg]=nil
	end};
	--[[failed_floatt={func=function() 
	vars.failed_floatt=not vars.failed_floatt
	local hmnoid=getchar():FindFirstChildOfClass("Humanoid")
	local tor=hmnoid and hmnoid.RigType==1 and getchar():FindFirstChild("LowerTorso") or getchar():FindFirstChild("Torso")
	while vars.failed_floatt and hmnoid and tor do
	funcs.rawmeta.__newindex(hmnoid,"HipHeight",(0.5 * hmnoid.RootPart.Size.Y)+(tor.Position.Y))
	task.wait()
	hmnoid=getchar():FindFirstChildOfClass("Humanoid")
	tor=hmnoid and hmnoid.RigType==1 and getchar():FindFirstChild("LowerTorso") or getchar():FindFirstChild("Torso")
	end
	end};--]]
	floatn={func=function(strt,plrarg) local nn=tonumber(plrarg) if nn then vars.floatn=nn end end,desc="set how under float part goes"};
	["god"]={func=function()
	local Cam = workspace.CurrentCamera
	local Pos, Char = Cam.CFrame, getchar()
	local Human = Char and Char:FindFirstChildWhichIsA("Humanoid")
	local nHuman = Human:Clone(Human)
	nHuman.Parent, funcs.lplr.Character = Char, nil
	nHuman:SetStateEnabled(15, false)
	nHuman:SetStateEnabled(1, false)
	nHuman:SetStateEnabled(0, false)
	nHuman.BreakJointsOnDeath, Human = true, Human.Destroy(Human)
	funcs.lplr.Character, Cam.CameraSubject, Cam.CFrame = Char, nHuman, task.wait() and Pos
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
	hnn:ChangeState(15)
	end
	end,desc="suicide-state=died"};
	["dreset"]={func=function()
	local hnn=getchar():FindFirstChildOfClass("Humanoid")
	if hnn then
	hnn.Health=0
	end
	end,desc="suicide-hp=0"};
	Reservedpluginname="base.char-manipulation"
	}

	plug.loopws={func=plug.cprop.func,args={"WalkSpeed",true}}
	plug.loopjp={func=plug.cprop.func,args={"JumpPower",true}}
	plug.unloopws={func=plug.nilvar.func,args="loopWalkSpeed"}
	plug.unloopjp={func=plug.nilvar.func,args="loopJumpPower"}
	plug.ws={func=plug.cprop.func,args={"WalkSpeed"}}
	plug.jp={func=plug.cprop.func,args={"JumpPower"}}

return plug
