local vars={}
vars.itemtb={}
vars.funcs={}
for i,v in pairs(workspace:GetChildren()) do
if v:IsA('Folder') and string.match(v.Name,'Spawn',3) and v:FindFirstChildOfClass('ClickDetector') then 
vars.itemtb[string.split(v.Name:lower(),'spawn')[1]]=v:FindFirstChildOfClass('ClickDetector')
end
end

vars.funcs.itemgrab=function(strd,parg,str,cmd,real)
fireclickdetector(vars.itemtb[cmd])
end

vars.funcs.gotop=function(pos)
local bp=funcs.wfcofclass(getchar(),'BasePart') bp=bp and bp.AssemblyRootPart if not bp then return end local oldcf=bp.CFrame bp.CFrame=CFrame.new(-22.627584457397, -18.000005722046, 145.7900390625) task.wait() bp.CFrame=oldcf ; oldcf=nil
 end

local plug={
['allit']={['func']=function() for i,v in pairs(vars.itemtb) do fireclickdetector(v) end end;['desc']='all items'};
['flask']={['func']=function() 
local flaskmesh = workspace:FindFirstChild("FlaskMesh",true)
if not flaskmesh then funcs.sendnotif("sus haxxx","no flask :(","rbxassetid://5891926006",5) return end
if flaskmesh.Parent:FindFirstChildOfClass("ClickDetector") then
fireclickdetector(flaskmesh.Parent:FindFirstChildOfClass("ClickDetector"))
end
flaskmesh=nil
end;['desc']='retard'};
['orange']={['func']=vars.funcs.gotop;['onlypass']=true;['args']=CFrame.new(-22.627584457397, -18.000005722046, 145.7900390625)};
['green']={['func']=vars.funcs.gotop;['onlypass']=true;['args']=CFrame.new(34.918026, 3.99999905, 51.9332619, -0.0087304078, 6.14552889e-08, 0.999961913, 2.25177494e-08, 1, -6.12610336e-08, -0.999961913, 2.19820571e-08, -0.0087304078)};
['slow']={['func']=vars.funcs.gotop;['onlypass']=true;['args']= CFrame.new(5.81715441, -13.0000038, 322.74762, -0.931687415, 5.68347325e-09, 0.363260955, -4.77256012e-09, 1, -2.78863084e-08, -0.363260955, -2.77150072e-08, -0.931687415)};
['Reservedpluginname']='monkegame'
}
for i,v in pairs(vars.itemtb) do plug[i]={['func']=vars.funcs.itemgrab;['desc']='grab item'} end
return plug
