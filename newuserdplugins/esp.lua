local vars={}
vars.funcs={}
vars.cons={}
vars.funcs.espclass=function(class)
for i,v in pairs(workspace:GetDescendants()) do
if v:IsA(class) and (v.Parent:IsA('BasePart') or v.Parent:IsA('MeshPart')) then
funcs.addhook(v.Parent,{['job']=class..'esp';['color']=(class=='TouchTransmitter' and Color3.fromRGB(100,0,0) or class=='ClickDetector' and Color3.fromRGB(0,0,100) or Color3.fromRGB(255,255,255))})
end
if i%3200==0 then task.wait() end --dont crash me uwu
end
end

vars.funcs.resp=function(hdrr) funcs.deb:AddItem(funcs.getholder(hdrr),0) end

vars.funcs.chadded=function(ch)
local hmnoidr=funcs.wfcofclass(ch,'Humanoid',20)
hmnoidr=hmnoidr.RootPart or hmnoidr:GetPropertyChangedSignal'RootPart':Wait()
funcs.addhook(ch,{['job']='cmd_pesp'})
end
vars.funcs.padded=function(plr)
if vars.pesp then table.insert(vars.cons,plr.CharacterAdded:Connect(vars.funcs.chadded)) end
end

local plug={
['tesp']={['func']=vars.funcs.espclass;['args']='TouchTransmitter',['onlypass']=true;['desc']='untesp'};
['cesp']={['func']=vars.funcs.espclass;['args']='ClickDetector',['onlypass']=true;['desc']='uncesp'};
['untesp']={['func']=vars.funcs.resp;['args']='TouchTransmitteresp',['onlypass']=true};
['uncesp']={['func']=vars.funcs.resp;['args']='ClickDetectoresp',['onlypass']=true};
['pesp']={['func']=function(a,aa)
if vars.pesp then vars.pesp:Disconnect() vars.pesp=nil for i,v in pairs(vars.cons) do v:Disconnect() end vars.cons={} funcs.deb:AddItem(funcs.getholder('cmd_pesp'),0) else 
for i,v in pairs(funcs.plrs:GetPlayers()) do if v.Character then vars.funcs.chadded(v.Character) end end vars.pesp=funcs.plrs.PlayerAdded:Connect(vars.funcs.padded)
end end;['desc']='toggle'};
['Reservedpluginname']='stupidesp'
}

return plug
