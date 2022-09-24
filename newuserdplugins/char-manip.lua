local vars={floatn=3.1,sz=Vector3.new(2,0.2,1.5),fn=tostring(Random.new():NextNumber(1245,99999));["funcs"]={};["flingtime"]=3}
vars.mouse=funcs.lplr:GetMouse()
vars.funcs.getproperties=getproperties or function(x)
return x:IsA("BasePart") or x:IsA("MeshPart")
end
	vars.zerozerozero=Vector3.new(0,0,0)
	vars.funcs.nclip=function()
	local ch=getchar()
		if ch ~= nil then
			for _, child in pairs(ch:GetDescendants()) do
				if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= fn then
					funcs.rawmeta.__newindex(child,"CanCollide",false)
				end
			end
		else
		vars.funcs.nclip:Disconnect()
		vars.funcs.nclip=nil
		end
	end
	vars.funcs.lay=function(strt,nn,str,cmd,arg) 
	local human = funcs.lplr.Character and funcs.lplr.Character:FindFirstChildOfClass('Humanoid')
	if not human then
		return
	end
	task.wait(.1)
	for _, v in ipairs(human:GetPlayingAnimationTracks()) do
		v:Stop()
	end
	if cmd=="layh" then --skip checking other elseifs if cmd=="layh"
	elseif cmd=="lay" then
	human.PlatformStand = true
	elseif cmd=="lays" then
	human.Sit=true
	end
	getchar():PivotTo(getchar():GetPivot() * CFrame.Angles(math.pi * .5, 0, 0))
	end
  vars.funcs.checkgr= function(char,setg)
  local ray = Ray.new(char:WaitForChild("HumanoidRootPart",5).Position,-(char:WaitForChild("HumanoidRootPart",5).CFrame.UpVector * 100))
  local part, pos = workspace:FindPartOnRay(ray,char)
 
  if part and pos then
  return part   
  end
  end
	vars.cdcolg=true
	vars.funcs.cdcol=function(kk)
	local hh=vars.mouse.Target
		if kk.UserInputType == Enum.UserInputType.MouseButton3 and hh and vars.funcs.getproperties(hh).CanCollide~=nil and (not vars.cdcolg or vars.funcs.checkgr(getchar())~=hh) then
			hh.CanCollide=not hh.CanCollide
			if not hh.CanCollide then
			local hook=funcs.addhook(hh,{autoremove=true,transp=0.9,txtenabled=true})
			local con
			local function cc()
			if hh.CanCollide then
			con:Disconnect()
			con=nil
			hook.justquit()
			end
			end
			con=hh:GetPropertyChangedSignal("CanCollide"):Connect(cc)
			end
		end
	end
	vars.funcs.nilvar=function(strt,nn,str,cmd,arg)
	if vars[arg] then vars[arg]:Disconnect() vars[arg]=nil end
	end
	vars.funcs.togglevar=function(strt,nn,str,cmd,arg)
	vars[arg]=not vars[arg]
	if nn~="nn" then funcs.sendnotif(arg,vars[arg] and "true" or "false","rbxassetid://8119590978",5) end
	end;
	vars.funcs.cprop=function(strt,nn,str,cmd,arg)
	local hmnoid=getchar():FindFirstChildOfClass("Humanoid")
	if #arg>=3 then nn=arg[3] funcs.sendnotif("cprop/"..cmd,tostring(arg[3]),"rbxassetid://8119590978",5) else nn=nn and tonumber(nn) end
	if hmnoid and nn~=nil then
	if arg[2] then
	local strnd="loop"..arg[1]
	if vars[strnd] then vars[strnd]:Disconnect() vars[strnd]=nil end
	local function res()
	hmnoid[arg[1]]=nn
	end
	local function ochar(ch)
	if not vars[strnd] and vars[strnd.."1"] then vars[strnd.."1"]:Disconnect() vars[strnd.."1"]=nil return end
	local hmnoid=WaitForChildOfClass(ch,"Humanoid")
	if hmnoid then
	vars[strnd]=hmnoid:GetPropertyChangedSignal(arg[1]):Connect(res)
	end
	end
	vars[strnd]=hmnoid:GetPropertyChangedSignal(arg[1]):Connect(res)
	vars[strnd.."1"]=funcs.lplr.CharacterAdded:Connect(ochar)
	res()
	else
	hmnoid[arg[1]]=nn
	end
	
	end
	end
	vars.funcs.DestroyLonely=function()
	funcs.deb:AddItem(vars.light,0)
	vars.light=nil
	end
local plug={noclip={func=function()
	if vars.noclipping then vars.noclipping:Disconnect() vars.noclipping=nil else vars.noclipping = funcs.runs.Stepped:Connect(vars.funcs.nclip) end end};
	float={func=function() if vars.float then funcs.deb:AddItem(vars.float,0) vars.float=nil return end
	vars.float=Instance.new("Part")
	funcs.rawmeta.__newindex(vars.float,"Name",vars.fn) 
	funcs.rawmeta.__newindex(vars.float,"Size",vars.sz) 
	funcs.rawmeta.__newindex(vars.float,"Parent",getchar())  --i am retarded
	funcs.rawmeta.__newindex(vars.float,"Transparency",1)
	local rp=getchar():FindFirstChild("HumanoidRootPart")
	while vars.float and rp and rp.Parent do 
	funcs.rawmeta.__newindex(vars.float,"CFrame",rp.CFrame*CFrame.new(0,-vars.floatn,0))
	task.wait()
	end
	funcs.deb:AddItem(vars.float,0) vars.float=nil
	end};
	lay={func=vars.funcs.lay;desc="character horizontal, stuns you too"};
	lays={func=vars.funcs.lay;desc="character horizontal, also makes you sit"};
	layh={func=vars.funcs.lay;desc="turns your character horizontal"};
	view={desc="view plr",func=function(strt,plrarg) 
	local plr=plrarg and funcs.xgetplr(plrarg,true)
	if vars.specadd then vars.specadd:Disconnect() vars.viewchanged:Disconnect() vars.viewchanged=nil vars.specadd=nil end 
	if plr then
	if not (plr.Character or plr.CharacterAdded:Wait()).PrimaryPart then plr.Character:GetPropertyChangedSignal("PrimaryPart"):Wait() end
	local function viewchanged()
	workspace.CurrentCamera.CameraSubject=plr.Character
	end
	viewchanged()
	local function specadded(ch)
	if ch and not ch.PrimaryPart then ch:GetPropertyChangedSignal("PrimaryPart"):Wait() end
	workspace.CurrentCamera.CameraSubject=ch
	end
	vars.viewchanged=workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(viewChangedFunc)
	vars.specadd=plr.CharacterAdded:Connect(specadded)
	
	end
	
	end};
	unview={func=function() workspace.CurrentCamera.CameraSubject=getchar():FindFirstChildOfClass("Humanoid") or getchar() ; if vars.specadd then vars.specadd:Disconnect() vars.viewchanged:Disconnect() vars.viewchanged=nil vars.specadd=nil return end end};
	klink={["func"]=function(strt,nn,str,cmd,arg) 
		local tvars={}	
		tvars.target = nn and funcs.xgetplr(nn,true)
		if tvars.target==nil then return end
		workspace.FallenPartsDestroyHeight = 0 / 0;
		tvars.tchr = getchar(nil,nil,tvars.target)
		tvars.thum = tvars.tchr:FindFirstChildOfClass("Humanoid")
		if tvars.thum.SeatPart then tvars=nil return end
		tvars.ftime = os.clock()
		tvars.rot = 0
		tvars.tools = {}
		tvars.originalDeathGrips = {}
		tvars.hum = getchar("Humanoid",true)
		tvars.root = tvars.hum.RootPart or tvars.hum:GetPropertyChangedSignal("RootPart"):Wait(4.2)
		tvars.troot = tvars.tchr:FindFirstChild("HumanoidRootPart")
		tvars.origCF = getchar():GetPivot()
		tvars.otrig = tvars.hum.PlatformStand --tvars.hum:GetState()
		tvars.origFpdh = workspace.FallenPartsDestroyHeight;
		tvars.sittingen=tvars.hum:GetStateEnabled(Enum.HumanoidStateType.Seated);		
		tvars.vel1=Vector3.new(0,999999*9,0)
		tvars.PhysProps={}
		--tvars.hum:ChangeState(16)
		tvars.hum:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
		tvars.hum:UnequipTools()
		--[[tvars.at0=Instance.new("Attachment")
		tvars.at0.Name=vars.fn
		tvars.at0.Parent=tvars.root
		tvars.at1=tvars.at0:Clone()
		tvars.at1.Parent=tvars.troot--]]
		--[[for i,v in ipairs(funcs.lplr.Backpack:GetChildren()) do
			if v:IsA("Tool") and v:FindFirstChild("Handle") then
				table.insert(tvars.tools, v)
				table.insert(tvars.originalDeathGrips, v.Grip)
				v.Handle.Massless = true
				v.Grip = CFrame.new(5773, 5774, 5773)
				v.Parent = getchar()
			end
		end--]]
		tvars.gcons={}
		for i,v in pairs(getconnections(tvars.root.ChildAdded)) do table.insert(tvars.gcons,v) end
		for i,v in pairs(getconnections(tvars.root.DescendantAdded)) do table.insert(tvars.gcons,v) end
		for i,v in pairs(tvars.gcons) do if v then v:Disable() end end
		tvars.bav = Instance.new("BodyAngularVelocity")
		table.insert(funcs.protectedlist,tvars.bav)
		tvars.bav.AngularVelocity = tvars.vel1
		tvars.bav.MaxTorque = Vector3.new(0,math.huge,0)
	--[[tvars.ap = Instance.new("AlignPosition")
	tvars.ap.RigidityEnabled=true
	tvars.ap.Attachment0=tvars.at0
	tvars.ap.Attachment1=tvars.at1
	tvars.ap.Parent=tvars.root--]]
	for i,child in pairs(getchar():GetDescendants()) do
		if child:IsA("BasePart") then
			table.insert(tvars.PhysProps,{child,child.CustomPhysicalProperties})
			child.CustomPhysicalProperties = PhysicalProperties.new(math.huge, 0.3, 0.5)
		end
	end
	if vars.noclipping then vars.noclipping:Disconnect() vars.noclipping=nil end vars.noclipping = funcs.runs.Stepped:Connect(vars.funcs.nclip)
	tvars.con=funcs.runs.Heartbeat:Connect(function()
		if tvars and os.clock() - tvars.ftime >= vars.flingtime then
			tvars.con:Disconnect()
		elseif tvars and tvars.root and tvars.bav and tvars.hum then
			tvars.hum.PlatformStand=true
			tvars.root.CFrame=((tvars.troot.CFrame*CFrame.new(0,1.7,0))*tvars.root.CFrame.Rotation --[[CFrame.Angles(0,math.rad(tvars.rot),0)--]] + tvars.troot.Velocity * (1.181 / 10)) --[[tvars.thum.MoveDirection * tvars.thum.WalkSpeed * .4--]]
			tvars.bav.AngularVelocity = tvars.bav.AngularVelocity==vars.zerozerozero and tvars.vel1 or vars.zerozerozero
			--tvars.rot=tvars.rot==93.4 and 0 or 93.4
		end
	end)
	tvars.bav.Parent = tvars.root
	--tvars.bv.Parent = tvars.root
	task.wait(vars.flingtime)
	if vars.noclipping then vars.noclipping:Disconnect() vars.noclipping=nil end
		tvars.hum.PlatformStand=false
		tvars.hum:SetStateEnabled(Enum.HumanoidStateType.Seated,tvars.hum:GetStateEnabled(Enum.HumanoidStateType.Seated) or tvars.sittingen)
		--funcs.deb:AddItem(tvars.at0,0)
		--funcs.deb:AddItem(tvars.at1,0)
		table.remove(funcs.protectedlist,table.find(funcs.protectedlist,tvars.bav))
		funcs.deb:AddItem(tvars.bav,0)
		tvars.root.Velocity = vars.zerozerozero
		tvars.root.RotVelocity = vars.zerozerozero
		getchar():PivotTo(tvars.origCF);
		workspace.FallenPartsDestroyHeight = tvars.origFpdh
		for i,v in pairs(tvars.PhysProps) do
		if v[1] ~= nil then
		v[1].CustomPhysicalProperties=v[2]
		end
		end
		for i,v in pairs(tvars.gcons) do if v then v:Enable() end end
		--[[for i,v in ipairs(tvars.tools) do
			if tvars.originalDeathGrips[i] then
				v.Grip = tvars.originalDeathGrips[i]
			end
		end--]]
		tvars.hum:UnequipTools(); tvars=nil; end;["desc"]="flingkill";["aliases"]={["pling"]="klink";["flingkill"]="klink"}};
	antiac={desc="attempt to bypass speed checks",func=function(strt,parg)
				if vars.antiac then return end
				vars.antiac=true
				local nc=0
				local tb={index={"Changed","WalkSpeed","JumpPower","ChildAdded","ChildRemoved"},namecall={"WalkSpeed","JumpPower"},chind={"ChildAdded","ChildRemoved"}}
				local fakechar=Instance.new("Model")
				fakechar.Name=getchar().Name
				local fakebp={}
				for i,v in pairs(getchar():GetChildren()) do
				if v:IsA("BasePart") or v:IsA("MeshPart") then
				fakebp[v.Name]=v:Clone()
				fakebp.Parent=fakechar
				end
				end
				local fakehum=WaitForChildOfClass(getchar(),"Humanoid"):Clone()
				fakehum.Parent=fakechar
				local ffind=table.find
				--getgenv().funcs.speedbpenabled=not getgenv().funcs.speedbpenabled
				local old_index
				old_index = hookmetamethod(game, "__index", newcclosure(function(self,getting,...)
				local mc=old_index(rawget(funcs,"lplr"),"Character")
				if not checkcaller() and old_index(self,"ClassName")=="Humanoid" and typeof(self)=='Instance' and (mc and old_index(self,"Parent")==mc ) and ffind(rawget(tb,"index"),getting) then
				return old_index(fakehum,getting,...)
				--[[elseif not checkcaller() and (mc~=nil and (self==mc or (old_index(self,"ClassName")=="BasePart" or old_index(self,"ClassName")=="Part" or old_index(self,"ClassName"=="MeshPart") and old_index(self,"Parent")==mc and old_index(old_index(getcallingscript(),"Parent"),"Parent")==mc))) and ffind(rawget(tb,"chind"),getting) then
				return old_index(ffind(fakebp,old_index(self,"Name")) or self,getting,...)--]]
				end
				return old_index(self,getting,...)
				end))
				local old_namecall
				old_namecall = hookmetamethod(game, "__namecall", newcclosure(function(instance,meth,...)
				local ncm,mc= getnamecallmethod(),old_index(rawget(funcs,"lplr"),"Character")
				if not checkcaller() and ncm=="GetPropertyChangedSignal" and typeof(instance)=='Instance' and old_index(instance,"ClassName")=="Humanoid"  and (mc and old_index(instance,"Parent")==mc) and ffind(rawget(tb,"namecall"),meth) then
                return old_namecall(fakehum,meth,...) -- FireServer() doesn't return anything, so usually there's no need to wait(9e9), unless you're trying to block a ban remote that crashes your game afterwards
				end
				return old_namecall(instance,meth,...)
				end))
				--[[if parg then
				local old_nind
				old_nind = hookmetamethod(game, "__newindex", newcclosure(function(instance,meth,ack)
				local mc= old_index(rawget(funcs,"lplr"),"Character")
				local rn=old_index(instance,meth)
				if not checkcaller() and (meth=="WalkSpeed" or meth=="JumpPower") and typeof(instance)=='Instance' and old_index(instance,"ClassName")=="Humanoid" and (mc and old_index(instance,"Parent")==mc) and rn and rn>(tonumber(ack) or rn) then
                return old_nind(fakehum,meth,ack) -- FireServer() doesn't return anything, so usually there's no need to wait(9e9), unless you're trying to block a ban remote that crashes your game afterwards
				end
				return old_nind(instance,meth,ack)
				end))
				end--]]
				--[[local old_newindex
				old_newindex = hookmetamethod(game, "__newindex", newcclosure(function(self,ind,newval,...)
				local mc=funcs.lplr.Character
				if not checkcaller() and typeof(self)=="Instance" and self.ClassName=="Humanoid" and (mc and self.Parent==mc or not mc) and ffind(rawget(tb,"namecall"),ind) and type(newval)=="number" and newval<getproperties(WaitForChildOfClass(getchar(),"Humanoid"))[ind] or newval+1 then
				return old_newindex(fakehum,ind,newval,...);
				end;
				return old_newindex(self,ind,newval,...);
				end))--]]
				local hum=WaitForChildOfClass(getchar(),"Humanoid")
				local rgtyp=hum.RigType
                for _, signal in pairs(getconnections(hum.Changed)) do signal:Disable() nc+=1 task.wait() end
				   for _, signal in pairs(getconnections(hum.ChildAdded)) do signal:Disable() nc+=1 task.wait() end
				   				   for _, signal in pairs(getconnections(hum.ChildRemoved)) do signal:Disable() nc+=1 task.wait() end
										for _, signal in pairs(getconnections(hum:GetPropertyChangedSignal("WalkSpeed"))) do signal:Disable() nc+=1 task.wait() end
											for _, signal in pairs(getconnections(hum:GetPropertyChangedSignal("JumpPower"))) do signal:Disable() nc+=1 task.wait() end
				--for i,v in pairs(getchar():GetChildren()) do if v:IsA("BasePart") then for _, signal in pairs(getconnections(v.ChildAdded)) do signal:Disable() nc+=1 end end end
				--for i,v in pairs(getchar():GetChildren()) do if v:IsA("BasePart") then for _, signal in pairs(getconnections(v.ChildRemoved)) do signal:Disable() nc+=1 end end end
				--[[if parg=="" and rgtyp==0 then
				table.insert(tb.index,"StateChanged")
				for _, signal in pairs(getconnections(hum.StateChanged)) do signal:Disable() nc+=1 end
				end--]]
				print(parg and "disabled-method2: "..nc or "disabled-method1: "..nc)
				print(#getconnections(hum.Changed),#getconnections(hum:GetPropertyChangedSignal("WalkSpeed")),#getconnections(hum:GetPropertyChangedSignal("JumpPower")),#getconnections(hum.StateChanged),#getconnections(hum.ChildAdded),#getconnections(hum.ChildRemoved))
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
	["ftouchinterests"]={["func"]=function(strt,nn) nn=nn and funcs.xgetplr(nn,true) or funcs.lplr for i,v in pairs(workspace:GetDescendants()) do if v:IsA("TouchTransmitter") then firetouchinterest(getchar(nil,nil,nn):FindFirstChildOfClass("BasePart") or getchar(nil,nil,nn):FindFirstChildOfClass("MeshPart"),v.Parent,0) firetouchinterest(getchar(nil,nil,nn):FindFirstChildOfClass("BasePart") or getchar(nil,nil,nn):FindFirstChildOfClass("MeshPart"),v.Parent,1) end task.wait() end end;["desc"]="dumbass"};
	["fcd"]={["func"]=function() for i,v in pairs(workspace:GetDescendants()) do if v:IsA("ClickDetector") then fireclickdetector(v) end task.wait() end end;["desc"]="firecd"};
	["loopws"]={["func"]=vars.funcs.cprop,["args"]={"WalkSpeed",true},["desc"]="repeatedly sets your WalkSpeed"};
	["loopjp"]={["func"]=vars.funcs.cprop,["args"]={"JumpPower",true},["desc"]="repeatedly sets your JumpPower"};
	["unloopws"]={["func"]=vars.funcs.nilvar,["args"]="loopWalkSpeed"};
	["unloopjp"]={["func"]=vars.funcs.nilvar,["args"]="loopJumpPower"};
	["nstun"]={["func"]=vars.funcs.cprop;["args"]={"PlatformStand",true,false},["aliases"]={["nostun"]="nstun";["enstun"]="estun"}};
	["estun"]={["func"]=vars.funcs.nilvar;["args"]="loopPlatformStand"};
	["ws"]={["func"]=vars.funcs.cprop,["args"]={"WalkSpeed"};["desc"]="sets walkspeed"};
	["jp"]={["func"]=vars.funcs.cprop,["args"]={"JumpPower"};["desc"]="sets jumppower"};
	["unstun"]={["func"]=vars.funcs.cprop;["args"]={"PlatformStand",false,false};["aliases"]={["unlay"]="unstun"}};
	["stun"]={["func"]=vars.funcs.cprop;["args"]={"PlatformStand",false,true}};
	["sp"]={["func"]=function(strt,nn,str,cmd,arg) vars["sp"..(nn or "1")]=getchar():GetPivot() end;["desc"]="caches current pos (arg[1] or 1)"};
	["lp"]={["func"]=function(strt,nn,str,cmd,arg) nn="sp"..(nn or 1) if vars[nn] then getchar():PivotTo(vars[nn]) end end;["desc"]="loads cached pos (arg[1] or 1)"};
	["sit"]={["func"]=vars.funcs.cprop;["args"]={"Sit",false,true}};
	["unsit"]={["func"]=vars.funcs.cprop;["args"]={"Sit",false,false}};
	["maxzoom"]={["func"]=function(strt,nn,str,cmd,arg)
	funcs.lplr.CameraMaxZoomDistance=nn
	end;["aliases"]={["mz"]="maxzoom";["nz"]="minzoom"}};
	["minzoom"]={["func"]=function(strt,nn,str,cmd,arg)
	funcs.lplr.CameraMinZoomDistance=nn
	end};
	["nzoom"]={["func"]=function() funcs.sendnotif("zoom:","min: "..funcs.lplr.CameraMinZoomDistance.." max: "..funcs.lplr.CameraMaxZoomDistance,"rbxassetid://6678521436",5) end;["desc"]="notifies your min/max zoom"};
	["cdcol"]={["desc"]="toggle: makes parts you click on with middlemouse not collide, exluding the part you're standing on";["func"]=function() if vars.cdcol then vars.cdcol:Disconnect() vars.cdcol=nil else vars.cdcol = funcs.uip.InputBegan:Connect(vars.funcs.cdcol) end funcs.sendnotif("cdcol",vars.cdcol and "true" or "false","rbxassetid://8119590978",5) end};
	["cdcolg"]={["desc"]="toggle: ground collision on m3";["func"]=vars.funcs.togglevar;["args"]="cdcolg"};
	["nh"]={["desc"]="notify humanoid stats";["func"]=function() local hmnoid=getchar():FindFirstChildOfClass("Humanoid")
	if hmnoid then funcs.sendnotif("nh","ws: "..tostring(hmnoid.WalkSpeed).." jp:"..tostring(hmnoid.JumpPower).." HP:"..tostring(hmnoid.Health).."/"..tostring(hmnoid.MaxHealth),"rbxassetid://8119590978",5)
	end 
	end};
	["light"]={["desc"]="arg[1]=range,arg[2]=brightness";["func"]=function(strt,parg)  if vars.light then funcs.deb:AddItem(vars.light,0) vars.light=nil return end vars.light = Instance.new("PointLight")
	vars.light.Parent = getchar().PrimaryPart or getchar():GetPropertyChangedSignal("PrimaryPart"):Wait()
	vars.light.Name=vars.fn+1
	vars.light.Range = parg or 9
	vars.light.Brightness=strt[1] or 5
	vars.light.Parent.Destroying:Connect(vars.funcs.DestroyLonely)
	end};
	["reset"]={["func"]=function()
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


return plug
