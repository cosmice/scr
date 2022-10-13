local vars={['gdata']=workspace.GameData.Players}
vars.funcs={}
vars.funcs.chck=function(val)
local theplr=funcs.plrs:FindFirstChild(val.Name)
if not theplr or not theplr:IsA('Player') or not theplr.Character or not val:FindFirstChild('Mode') then return end
local hk
local con
local con2
if val.Mode.Value==3 then
hk=funcs.addhook(theplr.Character,{['color']=Color3.fromRGB(100,0,0);['txt']=theplr.Name..' is a vampire..';['job']='vhesp';['dep']={theplr.CharacterRemoving}})
elseif val.Mode.Value==2 then
hk=funcs.addhook(theplr.Character,{['txt']=theplr.Name..' is a detective..';['job']='vhesp';['dep']={theplr.CharacterRemoving}})
end
if hk then
local desfunc=function()
if con then con:Disconnect() con=nil end if con2 then con2:Disconnect() con2=nil end if hk and hk.justquit then hk.justquit() end if val and val.Parent then vars.funcs.chck(val) end
end
con=val.Mode.Changed:Connect(desfunc)
con2=val.Mode.Destroying:Connect(desfunc)
end

end

vars.gdata.ChildAdded:Connect(vars.funcs.chck)
for i,v in pairs(vars.gdata:GetChildren()) do vars.funcs.chck(v) end
