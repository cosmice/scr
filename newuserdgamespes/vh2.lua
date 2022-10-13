local vars={['gdata']=workspace.GameData.Players}
vars.funcs={}
vars.funcs.chck=function(val) task.wait(1)
local theplr=funcs.plrs:WaitForChild(val.Name,3)
if not theplr or not theplr:IsA('Player') or not val:WaitForChild('Mode',3) then return end
local thech=getchar(nil,nil,theplr)
if not thech then return end
local hk
local cons={}
if val.Mode.Value==3 then
hk=funcs.addhook(thech:WaitForChild('Head',2),{['color']=Color3.fromRGB(100,0,0);['txt']=theplr.Name..' is a vampire..';['job']='vhesp';['dep']={theplr.CharacterRemoving}})
elseif val.Mode.Value==2 then
hk=funcs.addhook(thech:WaitForChild('Head',2),{['txt']=theplr.Name..' is a detective..';['job']='vhesp';['dep']={theplr.CharacterRemoving}})
end
if hk then
local function desfunc()
for i,v in pairs(cons) do if v then v:Disconnect() end end cons=nil if hk and hk.justquit then hk.justquit() end if val and val.Parent then vars.funcs.chck(val) end desfunc=nil
end
cons[1]=val.Mode.Changed:Connect(desfunc)
cons[2]=val.ChildAdded:Connect(desfunc)
end

end

for i,v in pairs(vars.gdata:GetChildren()) do vars.funcs.chck(v) end
vars.gdata.ChildAdded:Connect(vars.funcs.chck)
