local vars={}
vars.funcs={}
	vars.funcs.ft=function(v,nn)
	firetouchinterest(getchar(nil,nil,nn):FindFirstChildWhichIsA("BasePart") or getchar(nil,nil,nn):FindFirstChildWhichIsA("MeshPart"),v.Parent,0) firetouchinterest(getchar(nil,nil,nn):FindFirstChildWhichIsA("BasePart") or getchar(nil,nil,nn):FindFirstChildWhichIsA("MeshPart"),v.Parent,1)
	end
	
vars.loops={}

	
local plug={
["msgb"]={["func"]=function() getgenv().msgb=not getgenv().msgb funcs.sendnotif("uncat\\msgb",getgenv().msgb and ":flushed:" or "dumbfuck","",8) end};
["ftouchinterests"]={["func"]=function(strt,nn) nn=nn and funcs.xgetplr(nn,true) or funcs.lplr ; for i,v in pairs(workspace:GetDescendants()) do if v:IsA("TouchTransmitter") then task.spawn(vars.funcs.ft,v,nn) end if i%6==0 then task.wait() end end end;["desc"]="dumbass";["aliases"]={["firetouchinterests"]='ftouchinterests';["fti"]="ftouchinterests"}};
["fcd"]={["func"]=function() 
for i,v in pairs(workspace:GetDescendants()) do
if v:IsA("ClickDetector") then 
fireclickdetector(v) end if i%6==0 then task.wait() end 
end 
end;["desc"]="firecd"};
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
end;["desc"]='loopcmd, "multithreaded"'};
['cldelay']={['func']=function(a,aa) if not vars.loops[aa] then vars.loops[aa]={} end vars.loops[aa].delay=a[1] and tonumber(a[1]) or 0 end;['desc']='specify loopdelay (arg[2] or 0) for cmd[arg[1]]'};
["stoploops"]={['func']=function(a,aa) if not aa then vars.loops={} else vars.loops[aa]=nil end end;['desc']='stoploops, specify arg[1] to stop loops for spes command'};
["Reservedpluginname"]="uncat"
}
return plug