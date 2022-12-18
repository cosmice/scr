local vrs={}
	vrs.noclipmd=true
	vrs.funcs={}
	vrs.gluep={}
	vrs.GLUEMAXSIZE=1000
	vrs.GLUEAUTODESTROY=true
	vrs.funcs.reloadglue=function()
	for i,v in next,vrs.gluep do
	funcs.deb:AddItem(v,0)
	end
	vrs.gluecon=nil --if vrs.gluecon then vrs.gluecon=vrs.gluecon:Disconnect() end
	vrs.gluep.h = Instance.new("WeldConstraint")
	if vrs.noclipmd and powersupply.cmds['unnoclip'] then vrs.gluep.h.Destroying:Connect(powersupply.cmds['unnoclip'][1]) end
	vrs.gluep.h.Name = funcs.rndmstr(5,20)
	--vrs.gluep.h.ActuatorType=Enum.ActuatorType.None
	--vrs.gluep.h.Visible = false
	end
	
	vrs.funcs.addglue=function(with,tvr)
						if not with:IsDescendantOf(tvr.ch) and with.Size.Magnitude<vrs.GLUEMAXSIZE then
						local hrp=tvr.ch:FindFirstChild'HumanoidRootPart' or tvr.ch:FindFirstChildWhichIsA'BasePart'
						local hum=tvr.hum or tvr.ch:FindFirstChildOfClass('Humanoid')
						if hrp and hum then
						for i,v in next,tvr.touched do tvr.touched[i]=v:Disconnect() end
						local ccons={}
						for i,v in next,getconnections(tvr.ch.ChildAdded) do if v.State then table.insert(ccons,v) v:Disable() end end for i,v in next,getconnections(tvr.ch.DescendantAdded) do if v.State then table.insert(ccons,v) v:Disable() end end
						if vrs.GLUEAUTODESTROY then for i,v in next,getconnections(with.DescendantAdded) do if v.State then table.insert(ccons,v) v:Disable() end end for i,v in next,getconnections(with.ChildAdded) do if v.State then table.insert(ccons,v) v:Disable() end end end
						vrs.gluecon=true
						local strf=Instance.new('Part') vrs.gluep.gluepar=strf
						--if vrs.GLUEAUTODESTROY then local rcon,bb=nil,nil rcon=with.Destroying:Connect(function() funcs.deb:AddItem(strf,0) rcon,bb=rcon:Disconnect(),bb:Disconnect() end) bb=strf.Destroying:Connect(function() vrs.funcs.reloadglue() rcon,bb=rcon:Disconnect(),bb:Disconnect() end) end
						strf.Size=hrp.Size strf.CFrame=hrp.CFrame strf.CanCollide=false strf.Transparency=1
						strf.Name=funcs.rndmstr(5,20)
						strf.Parent=tvr.ch
						vrs.gluep.h.Parent = vrs.GLUEAUTODESTROY and with or strf
						vrs.gluep.h.Part0 = strf
						vrs.gluep.h.Part1 = with
						funcs.sendnotif("extra.glue",string.format('gluep: %s glueppath: %s gluepmag: %s',with.Name,with:GetFullName(),with.Size.Magnitude),"rbxassetid://5258751775",5)
						if vrs.noclipmd and powersupply.cmds['noclip'] then powersupply.cmds["noclip"][1]() end
				        --for _,v in next,tvr.ch:GetChildren() do if v:IsA("BasePart") then v.Massless = true end end
						for i,v in next,ccons do if v then v:Enable() end end ccons=nil
						while vrs.gluecon and hrp and strf and hum do hrp.CFrame=strf.CFrame hum.PlatformStand = true task.wait() end
						end
						hrp,hum=nil,nil
					end
	end
	
	vrs.funcs.reloadglue()

	funcs.lplr.CharacterRemoving:Connect(vrs.funcs.reloadglue)
	
local plug={
	['glue']={['func']=function(strt,parg,str,cmd,arg) 
				local tvr={} tvr.touched={}
				tvr.ch=getchar()
				tvr.hum=tvr.ch:FindFirstChildOfClass('Humanoid')
				if tvr.hum then tvr.touched[1]=tvr.hum.Touched:Connect(function(with) vrs.funcs.addglue(with,tvr) end) else
				tvr.lleg=tvr.ch and (tvr.ch:FindFirstChild'Left Leg' or tvr.ch:FindFirstChild'LeftLowerLeg') if tvr.lleg then tvr.touched[1] = tvr.lleg.Touched:Connect(function(with) vrs.funcs.addglue(with,tvr) end) end
				tvr.rleg=tvr.ch and (tvr.ch:FindFirstChild'Right Leg' or tvr.ch:FindFirstChild'RightLowerLeg') if tvr.rleg then tvr.touched[2] = tvr.rleg.Touched:Connect(function(with) vrs.funcs.addglue(with,tvr) end) end end
	 end},
	 ['unglue']={['func']=function()
				local hm=getchar('Humanoid',true) if hm then hm.PlatformStand = false end
				vrs.funcs.reloadglue()
				if hm then hm:SetStateEnabled("Landed",true) end
				for _,v in next,getchar():GetChildren() do if v:IsA("BasePart") then v.Massless = false end end 
				if powersupply.cmds['unnoclip'] then powersupply.cmds["unnoclip"][1]() end
	 end},
	 ['gluemsize']={['func']=function(a,aa)
	 vrs.GLUEMAXSIZE=aa and tonumber(aa) or vrs.GLUEMAXSIZE
	 end,['desc']='glue max part size (magnitude)'},
	 ['gluenoclip']={['func']=function() vrs.noclipmd=not vrs.noclipmd funcs.sendnotif("extra.glue\\gluenoclip",vrs.noclipmd and true,"rbxassetid://5258751775",5) end,['desc']='en/fs noclipping with glue command'},
	 ['gluedes']={['func']=function() vrs.GLUEAUTODESTROY=not vrs.GLUEAUTODESTROY end;['desc']='toggle glue destroying when part is gone'},
	['Reservedpluginname']='extra.glue'
	 }
	 
return plug
