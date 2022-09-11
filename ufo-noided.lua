do
local mn={}
mn.lasthit=0
mn.dmg=function(phum,a,n,pmodel,hum,hrp,c)
local rem=c:FindFirstChild("HitEvent")
--if phum then print((hrp.Position-n.Position).Magnitude) end
if rem and hrp and phum --[[and (hrp.Position-n.Position).Magnitude <= 65]] and hum.Health > 0 and os.clock()-mn.lasthit >= .2 then rem:FireServer(phum,0,Random.new():NextNumber(1,2)) mn.lasthit=os.clock() end
end	
--local cachedblocked=BlockedRemotes
--getgenv().BlockedRemotes={"AbilitiesEvent"}
if not ufo_abilitywars_anti then
getgenv().ufo_abilitywars_anti={true,true}
local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(instance, ...)
local ncm,g = getnamecallmethod(),getcallingscript()
local args={...}
        if instance.Name=="AbilitiesEvent" and ncm == "FireServer" and not checkcaller() and g and (g.Parent and g.Parent.Name~="Ability Buttons" or not g.Parent) and ufo_abilitywars_anti[2] then
		return
		end
		
        

        return oldNamecall(instance, ...)
end)
end
getgenv().ufo_abilitywars_anti={true,true}
mn.specialstartfunc=function(char,hum)
local nm=char:FindFirstChild("Head") and char.Head:FindFirstChild("Name Tag")
if nm and nm:FindFirstChild("TextLabel") then
funcs.deb:AddItem(nm.TextLabel,0)
end
local humh=hum.Health
hum.HealthChanged:Connect(function(x)
if x < humh and x>0 then
hum.Health=0
end
humh=x
end)

end
mn.specialend=function(char,hum)
--getgenv().BlockedRemotes=cachedblocked
getgenv().stopinputbs=false
getgenv().stopinputbstoggle=false
getgenv().ufo_abilitywars_anti={true,false}
end

return mn
end
