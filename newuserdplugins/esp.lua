local vars={}
vars.funcs={}
vars.cons={}
vars.funcs.espclass=function(class)
for i,v in pairs(workspace:GetDescendants()) do
if v:IsA(class) and (v.Parent:IsA('BasePart') or v.Parent:IsA('MeshPart')) then
funcs.addhook(v.Parent,{['job']=class..'esp';['color']=(class=='TouchTransmitter' and Color3.fromRGB(100,0,0) or class=='ClickDetector' and Color3.fromRGB(0,0,100) or Color3.fromRGB(255,255,255))})
end
if i%2500==0 then task.wait() end --dont crash me uwu
end
end

vars.funcs.resp=function(hdrr) funcs.deb:AddItem(funcs.getholder(hdrr),0) end

vars.funcs.chadded=function(ch)
funcs.addhook(ch:WaitForChild('Head',6),{['job']='cmd_pesp';['txt']=ch.Name})
end
vars.funcs.padded=function(plr)
if vars.pesp then table.insert(vars.cons,plr.CharacterAdded:Connect(vars.funcs.chadded)) end
end

local plug={
['tesp']={['func']=vars.funcs.espclass;['args']='TouchTransmitter',['onlypass']=true;['desc']='untesp'};
['cesp']={['func']=vars.funcs.espclass;['args']='ClickDetector',['onlypass']=true;['desc']='uncesp'};
['ppesp']={['func']=vars.funcs.espclass;['args']='ProximityPrompt',['onlypass']=true;['desc']='unppesp'};
['unppesp']={['func']=vars.funcs.resp;['args']='ProximityPromptesp',['onlypass']=true;['desc']='unppesp'};
['untesp']={['func']=vars.funcs.resp;['args']='TouchTransmitteresp',['onlypass']=true};
['uncesp']={['func']=vars.funcs.resp;['args']='ClickDetectoresp',['onlypass']=true};
['pesp']={['func']=function(a,aa)
if vars.pesp then vars.pesp:Disconnect() vars.pesp=nil for i,v in pairs(vars.cons) do v:Disconnect() end vars.cons={} funcs.deb:AddItem(funcs.getholder('cmd_pesp'),0) else 
for i,v in pairs(funcs.plrs:GetPlayers()) do if v.Character then task.spawn(vars.funcs.chadded,v.Character)  table.insert(vars.cons,v.CharacterAdded:Connect(vars.funcs.chadded)) end end vars.pesp=funcs.plrs.PlayerAdded:Connect(vars.funcs.padded)
end end;['desc']='toggle'};
['transesp']={['func']=function(a,aa)
local hlder=funcs.instanceholder:FindFirstChild('transesp')
if hlder then funcs.deb:AddItem(hlder,0) funcs.sendnotif('uncat\\transesp','disabled','rbxassetid://11012215782',5) return else hlder=funcs.getholder('transesp') funcs.sendnotif('uncat\\transesp','enabled','rbxassetid://11012215782',5) end
aa=aa and tonumber(aa) or .7
for i,v in pairs(workspace:GetDescendants()) do
if (v:IsA('BasePart') or v:IsA('MeshPart')) and v.Transparency >= aa and not v.Parent:FindFirstChildOfClass('Humanoid') then
funcs.addhook(v,{['aot']=false;['color']=Color3.fromRGB(0,35,0);['job']=hlder})
end
if i%220==0 then task.wait() end
end
end;['desc']='high transparency esp: > (arg[1] or .7)'};
['Reservedpluginname']='stupidesp'
}

return plug
