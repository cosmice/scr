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
	
local plug={
["msgb"]={["func"]=function() getgenv().msgb=not getgenv().msgb funcs.sendnotif("uncat\\msgb",getgenv().msgb and ":flushed:" or "dumbfuck","",8) end};
["ftouchinterests"]={["func"]=function(strt,nn) nn=nn and funcs.xgetplr(nn,true) or funcs.lplr ; for i,v in pairs(workspace:GetDescendants()) do if v:IsA("TouchTransmitter") then task.spawn(vars.funcs.ft,v,nn) end if i%1000==0 then task.wait() end end end;["desc"]="dumbass";["aliases"]={["firetouchinterests"]='ftouchinterests';["fti"]="ftouchinterests"}};
["fcd"]={["func"]=function() 
for i,v in pairs(workspace:GetDescendants()) do
if v:IsA("ClickDetector") then 
fireclickdetector(v) end if i%1000==0 then task.wait() end 
end 
end;["desc"]="firecd"};
['nofog']={['func']=function()
	vars.nfogen=not vars.nfogen
if not vars.nfogen then
	vars.oldfogend=vars.lighting.FogEnd
	vars.lighting.FogEnd = 9e9
	for i,v in pairs(vars.lighting:GetDescendants()) do
		if v:IsA("Atmosphere") then
			v.Parent=funcs.getholder(vars.nfogstr)
		end
	end
else
	--vars.lighting.FogEnd=vars.oldfogend
	for i,v in pairs(funcs.getholder(vars.nfogstr)) do
	v.Parent=vars.lighting
	end
end
end};
["instapp"]={['func']=function(a,aa)
aa=aa and tonumber(aa)
if vars.iprox then vars.iprox:Disconnect() vars.iprox=nil else
vars.iprox=vars.proxsrv.PromptButtonHoldBegan:Connect(function(pro)
		for i = 1,(aa or 1) do fireproximityprompt(pro) end
end) end funcs.sendnotif('uncat\\instapp',vars.iprox and 'gaming' or 'babymode','rbxassetid://10515999022',8)
end;['desc']='instantproximityprompts arg[1] amount upon beginning proxprompt'};

["notifcmd"]={["func"]=function(n,n,thud)
funcs.sendnotif("uncat\\notifcmd",thud,"",5)
end};
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
["Reservedpluginname"]=math.random(5,10)>3 and "uncat" or "Cat Destroyer - Improvised Violence"
}
return plug
