local vars={}
vars.funcs={}
	vars.funcs.ft=function(v,nn)
	firetouchinterest(getchar(nil,nil,nn):FindFirstChildWhichIsA("BasePart") or getchar(nil,nil,nn):FindFirstChildWhichIsA("MeshPart"),v.Parent,0) firetouchinterest(getchar(nil,nil,nn):FindFirstChildWhichIsA("BasePart") or getchar(nil,nil,nn):FindFirstChildWhichIsA("MeshPart"),v.Parent,1)
	end
	
	vars.funcs.povyouarefrankiepalmeri=function(strd,parg,x,cmd,args,realx)
	local cons={unpack(getconnections(funcs.lplr.Changed)),unpack(getconnections(funcs.lplr:GetPropertyChangedSignal'CameraMode'))} for i,v in pairs(cons) do v:Disable() end funcs.lplr.CameraMode = args for i,v in pairs(cons) do v:Enable() end
	end
	
			vars.loops={}
	
	vars.lighting=game:GetService('Lighting')
	vars.proxsrv=game:GetService('ProximityPromptService')
	vars.nfogstr=funcs.rndmstr()
	vars.bav = Instance.new("BodyAngularVelocity")
	vars.bav.Name=funcs.rndmstr(90,130)
	table.insert(funcs.protectedlist,vars.bav)
	vars.bav.AngularVelocity=Vector3.new(0,-9e9*20,0)
	vars.bav.MaxTorque= Vector3.new(0,math.huge,0)
	vars.funcs.theloop=function(x)
	local stt=os.clock()
	local con
	con=funcs.runs.Heartbeat:Connect(function()
	if x and x.Parent and vars.flingnet and os.clock()-stt<6 then x.AngularVelocity=x.AngularVelocity==Vector3.zero and vars.bav.AngularVelocity or Vector3.zero else funcs.deb:AddItem(x,0) x=nil con:Disconnect() con,stt,x=nil,nil,nil end
	end)
	end
	vars.funcs.setsimradius=function(x,y)
	if y then sethiddenproperty(funcs.lplr,'MaximumSimulationRadius',y) end sethiddenproperty(funcs.lplr,'SimulationRadius',x) 
	end
local plug={
["msgb"]={["func"]=function() getgenv().msgb=not getgenv().msgb funcs.sendnotif("uncat\\msgb",getgenv().msgb and ":flushed:" or "dumbfuck","",8) end};
["ftouchinterests"]={["func"]=function(strt,nn) nn=nn and funcs.xgetplr(nn,true) or funcs.lplr ; for i,v in pairs(workspace:GetDescendants()) do if v:IsA("TouchTransmitter") then task.spawn(vars.funcs.ft,v,nn) end if i%3200==0 then task.wait() end end end;["desc"]="dumbass";["aliases"]={["firetouchinterests"]='ftouchinterests';["fti"]="ftouchinterests"}};
["fcd"]={["func"]=function() 
for i,v in pairs(workspace:GetDescendants()) do
if v:IsA("ClickDetector") then 
fireclickdetector(v) end if i%3200==0 then task.wait() end 
end 
end;["desc"]="firecd"};
['nofog']={['func']=function(a,aa)
	vars.nfogen=not vars.nfogen
if vars.nfogen or aa and aa~=1 then
	vars.oldfogend=vars.lighting.FogEnd
	vars.lighting.FogEnd = 9e9
	for i,v in pairs(vars.lighting:GetChildren()) do
		if v:IsA("Atmosphere") then
			v.Parent=funcs.getholder(vars.nfogstr)
		end
	end
elseif not vars.nfogen or aa=='1' then
	--vars.lighting.FogEnd=vars.oldfogend
	for i,v in pairs(funcs.getholder(vars.nfogstr):GetChildren()) do
	v.Parent=vars.lighting
	end
end
end};
["instapp"]={['func']=function(a,aa)
aa=aa and tonumber(aa)
if vars.iprox then vars.iprox:Disconnect() vars.iprox=nil else
vars.iprox=vars.proxsrv.PromptButtonHoldBegan:Connect(function(pro)
		for i = 1,(aa or 1) do fireproximityprompt(pro) task.wait() end
end) end funcs.sendnotif('uncat\\instapp',vars.iprox and 'gaming' or 'babymode','rbxassetid://10515999022',8)
end;['desc']='instantproximityprompts arg[1] amount upon beginning proxprompt'};
["notifcmd"]={["func"]=function(n,n,thud)
funcs.sendnotif("uncat\\notifcmd",thud,"",5)
end};
['noclipcc']={['func']=function() vars.oldcam=funcs.lplr.DevCameraOcclusionMode funcs.lplr.DevCameraOcclusionMode = "Invisicam" end;['desc']='clipcc, noclipcam, detectable?'};
['clipcc']={['func']=function() if vars.oldcam then funcs.lplr.DevCameraOcclusionMode=vars.oldcam end end;['desc']='clipscamera'};
["lcmd"]={["func"]=function(n,plrarg,thud)
if not n[1] then return end
plrarg=plrarg and tonumber(plrarg)
if plrarg and powersupply.cmds[n[1]] then
local lstr,tm=table.concat(n," "),'loop '..tostring(os.clock())
if not vars.loops[n[1]] then vars.loops[n[1]]={['delay']=0} end
vars.loops[n[1]][tm]=true
for i =1,plrarg do if not vars.loops[n[1]] or not vars.loops[n[1]][tm] then break end powersupply.gnn.cmdfunc(lstr) task.wait(vars.loops[n[1]].delay) end vars.loops[n[1]][tm]=nil
end
end;["desc"]='loopcmd, not "multithreaded"'};
["tlcmd"]={["func"]=function(n,plrarg,thud)
if not n[1] then return end
plrarg=plrarg and tonumber(plrarg)
if plrarg and powersupply.cmds[n[1]] then
local lstr,tm=table.concat(n," "),'loop '..tostring(os.clock())
if not vars.loops[n[1]] then vars.loops[n[1]]={['delay']=0} end
vars.loops[n[1]][tm]=true
for i =1,plrarg do if not vars.loops[n[1]] or not vars.loops[n[1]][tm] then break end task.spawn(powersupply.gnn.cmdfunc,lstr) task.wait(vars.loops[n[1]].delay) end vars.loops[n[1]][tm]=nil
end
end;["desc"]='loopcmd (arg[1] amount of times arg[2+] being cmd+args), "multithreaded"'};
['cldelay']={['func']=function(a,aa) if not vars.loops[aa] then vars.loops[aa]={} end vars.loops[aa].delay=a[1] and tonumber(a[1]) or 0 end;['desc']='specify loopdelay (arg[2] or 0) for cmd[arg[1]]'};
["stoploops"]={['func']=function(a,aa) if not aa then vars.loops={} else vars.loops[aa]=nil end end;['desc']='stoploops, specify arg[1] to stop loops for spes command'};
["rebindsl"]={['func']=function(a,a,a,a,a,aa) aa=string.split(aa," ") if aa[2] then funcs.rebindsl(aa[2]) end end};
["thirdp"]={['func']=vars.funcs.povyouarefrankiepalmeri;['args']='Classic'};
["firstp"]={['func']=vars.funcs.povyouarefrankiepalmeri;['args']='LockFirstPerson'};
["norender"]={['func']=funcs.runs.Set3dRenderingEnabled;['args']={funcs.runs;false};['onlypass']=true};
["render"]={['func']=funcs.runs.Set3dRenderingEnabled;['args']={funcs.runs;true};['onlypass']=true};
['autoc1']={['func']=funcs.autoc1};
['flingnet']={['func']=function() 
vars.flingnet=not vars.flingnet
settings().Physics.AllowSleep = false
funcs.sendnotif('uncat\\flingnet',vars.flingnet and 'skynet is real 2022' or 'tinfoil hat','rbxassetid://1037078104',7)
while vars.flingnet do
vars.funcs.setsimradius(9e9,9e9)
local chc,chz=getchar():GetBoundingBox()
chz*=6
for i,v in pairs(workspace:GetPartBoundsInBox(chc,chz)) do if not v:IsDescendantOf(getchar()) and not v:FindFirstChild(vars.bav.Name) and (v:IsA'BasePart' or v:IsA'MeshPart') and not v.Anchored and isnetworkowner(v) then local tcl=vars.bav:Clone() vars.funcs.theloop(tcl) tcl.Parent=v end task.wait() end
funcs.runs.RenderStepped:Wait()
end vars.funcs.setsimradius(130.75393676758,1000)
end;['desc']='the flingnet is real 2022'};
["Reservedpluginname"]=math.random(5,10)>3 and "uncat" or "Cat Destroyer - Improvised Violence"
}
return plug
