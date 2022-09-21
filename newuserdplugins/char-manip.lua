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
		else
		vars.funcs.nclip:Disconnect()
		vars.funcs.nclip=nil
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
	nn=nn and tonumber(nn)
	if hmnoid and nn then
	if arg[2] then
	local strnd="loop"..arg[1]
	vars[strnd]=nil
	vars[strnd]=true
	while vars[strnd] and hmnoid do
	hmnoid[arg[1]]=nn
	task.wait()
	hmnoid[arg[1]]=nn
	end
	else
	hmnoid[arg[1]]=nn
	end
	
	end
	end};
	nilvar={reserved=true,func=function(strt,nn,str,cmd,arg)
	vars[arg]=nil
	end};
	view={desc="view plr",func=function(strt,plrarg) 
	local plr=plrarg and funcs.xgetplr(plrarg,true)
	if plr then
	if not (plr.Character or plr.CharacterAdded:Wait()).PrimaryPart then plr.Character.PrimaryPart:Wait() end
	local function viewchanged()
	workspace.CurrentCamera.CameraSubject=plr.Character
	end
	viewchanged()
	local function specadded(ch)
	if not ch.PrimaryPart then ch.PrimaryPart:Wait() end
	workspace.CurrentCamera.CameraSubject=ch
	end
	vars.viewchanged=workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(viewChangedFunc)
	vars.specadd=plr.CharacterAdded:Connect(specadded)
	
	end
	
	end};
	unview={func=function() workspace.CurrentCamera.CameraSubject=getchar():FindFirstChildOfClass("Humanoid") or getchar() ; if vars.specadd then vars.specadd:Disconnect() vars.viewchanged:Disconnect() vars.viewchanged=nil vars.specadd=nil return end end};
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
				fakehum:ClearAllChildren()
				fakehum.Parent=fakechar
				local ffind=table.find
				--getgenv().funcs.speedbpenabled=not getgenv().funcs.speedbpenabled
				local old_index
				old_index = hookmetamethod(game, "__index", newcclosure(function(self,getting,...)
				local mc=old_index(rawget(funcs,"lplr"),"Character")
				if not checkcaller() and old_index(self,"ClassName")=="Humanoid" and (mc and old_index(self,"Parent")==mc ) and ffind(rawget(tb,"index"),getting) then
				return old_index(fakehum,getting,...);
				--[[elseif not checkcaller() and (mc~=nil and (self==mc or (old_index(self,"ClassName")=="BasePart" or old_index(self,"ClassName")=="Part" or old_index(self,"ClassName"=="MeshPart") and old_index(self,"Parent")==mc and old_index(old_index(getcallingscript(),"Parent"),"Parent")==mc))) and ffind(rawget(tb,"chind"),getting) then
				return old_index(ffind(fakebp,old_index(self,"Name")) or self,getting,...)--]]
				end;
				return old_index(self,getting,...);
				end))
				local old_namecall
				old_namecall = hookmetamethod(game, "__namecall", newcclosure(function(instance,meth,...)
				local ncm,mc= getnamecallmethod(),old_index(rawget(funcs,"lplr"),"Character")
				if not checkcaller() and ncm=="GetPropertyChangedSignal" and instance.ClassName=="Humanoid" and instance.Parent==mc and ffind(rawget(tb,"namecall"),meth) then
                return old_namecall(fakehum,meth,...) -- FireServer() doesn't return anything, so usually there's no need to wait(9e9), unless you're trying to block a ban remote that crashes your game afterwards
				end;
				return old_namecall(instance,meth,...)
				end))
				local old_nind
				old_nind = hookmetamethod(game, "__newindex", newcclosure(function(instance,meth,...)
				local mc= old_index(rawget(funcs,"lplr"),"Character")
				if not checkcaller() and (meth=="WalkSpeed" or meth=="JumpPower") and instance.ClassName=="Humanoid" and instance.Parent==mc then
                return old_nind(fakehum,meth,...) -- FireServer() doesn't return anything, so usually there's no need to wait(9e9), unless you're trying to block a ban remote that crashes your game afterwards
				end;
				return old_nind(instance,meth,...)
				end))
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
                for _, signal in pairs(getconnections(hum.Changed)) do signal:Disable() nc+=1 end
				   for _, signal in pairs(getconnections(hum.ChildAdded)) do signal:Disable() nc+=1 end
				   				   for _, signal in pairs(getconnections(hum.ChildRemoved)) do signal:Disable() nc+=1 end
										for _, signal in pairs(getconnections(hum:GetPropertyChangedSignal("WalkSpeed"))) do signal:Disable() nc+=1 end
											for _, signal in pairs(getconnections(hum:GetPropertyChangedSignal("JumpPower"))) do signal:Disable() nc+=1 end
				--for i,v in pairs(getchar():GetChildren()) do if v:IsA("BasePart") then for _, signal in pairs(getconnections(v.ChildAdded)) do signal:Disable() nc+=1 end end end
				--for i,v in pairs(getchar():GetChildren()) do if v:IsA("BasePart") then for _, signal in pairs(getconnections(v.ChildRemoved)) do signal:Disable() nc+=1 end end end
				if parg=="" and rgtyp==0 then
				table.insert(tb.index,"StateChanged")
				for _, signal in pairs(getconnections(hum.StateChanged)) do signal:Disable() nc+=1 end
				end
				print(parg~="" and rgtyp==0 and "disabled-method2: "..nc or "disabled-method1: "..nc)
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
