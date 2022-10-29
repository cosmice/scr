local vars={['rev']=game:GetService('ReplicatedStorage'):WaitForChild("Ragdoll",40):WaitForChild("revivePlayer",40);['ab']=game:GetService("ReplicatedStorage").Remotes.Ability.Server}
local plug={
['stam']={['func']=function()
getchar():SetAttribute('StaminaRegenerationRate',10^5)
funcs.sendnotif('NightOfNights\\bamb','stamina regen big','rbxassetid://8119590978',5)
end;['desc']='instantly regen stamina'};
['ltesp']={['func']=function()
if not workspace:FindFirstChild('Map') then funcs.sendnotif('nomap','nomap','',5) return end
for i,v in pairs(game:GetService("Workspace").Map.Scripted.Safes:GetChildren()) do funcs.addhook(v) end
for i,v in pairs(game:GetService("Workspace").Map.Scripted.Misc:GetChildren()) do funcs.addhook(v) end
funcs.sendnotif('NightOfNights\\bamb','ltesp','rbxassetid://8119590978',5)
end;['desc']='esp stuff'};
['rev']={['func']=function(a,aa)
aa=aa and funcs.xgetplr(aa,true)
if aa then
vars.rev:FireServer(aa)
vars.rev:FireServer(aa,'Hold')
vars.rev:FireServer(aa)
vars.rev:FireServer(aa,'StopHold')
vars.rev:FireServer(aa)
funcs.sendnotif('NightOfNights\\thebamb','rev: '..aa.DisplayName,'rbxassetid://8119590978',5)
end
end;['desc']='revive plr'};
['shk']={['func']=function(a,aa)
aa=aa and funcs.xgetplr(aa,true)
if aa then vars.ab:FireServer("Shock",{aa}) end
end};
['Reservedpluginname']='Night Of Nights'
}
return plug
