local vars={['rev']=game:GetService('ReplicatedStorage'):WaitForChild("Ragdoll",40):WaitForChild("revivePlayer",40)}
local plug={
['stam']={['func']=function()
getchar():SetAttribute('StaminaRegenerationRate',10^5)
end;['desc']='instantly regen stamina'};
['ltesp']={['func']=function()
if not workspace:FindFirstChild('Map') then funcs.sendnotif('nomap','nomap','',5) return end
for i,v in pairs(game:GetService("Workspace").Map.Scripted.Safes:GetChildren()) do funcs.addhook(v) end
for i,v in pairs(game:GetService("Workspace").Map.Scripted.Misc:GetChildren()) do funcs.addhook(v) end
end;['desc']='esp stuff'};
['rev']={['func']=function(a,aa)
aa=aa and funcs.xgetplr(aa,true)
if aa then
vars.rev:FireServer(aa)
vars.rev:FireServer(aa,'Hold')
vars.rev:FireServer(aa)
vars.rev:FireServer(aa,'StopHold')
vars.rev:FireServer(aa)
end
end;['desc']='revive plr'};
['Reservedpluginname']='Night Of Nights'
}
return plug
