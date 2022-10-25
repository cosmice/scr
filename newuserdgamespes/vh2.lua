local vars={['gdata']=workspace.GameData.Players;['role3']={['color']=Color3.fromRGB(100,0,0),['txt']=' is a vampire...';['job']='vhesp'};['role2']={['txt']=' is a detective...';['job']='vhesp'};['role1']={['txt']=' is a soon-to-be-dead...';['color']=Color3.fromRGB(0,10,10);['job']='vhesp'}}
vars.funcs={}
vars.funcs.replr=function(plr)
	local val=vars.gdata:WaitForChild(plr.Name,60)
	if not val or not val:WaitForChild('Mode',5) then return end
	local thech=plr.Character
	if thech and vars['role'..val.Mode.Value] and thech:WaitForChild('Head',2) and not table.find(funcs.hookedinst,thech:WaitForChild('Head',2)) and not table.find(funcs.hookedinst,val.Mode) then
	local tehtb=table.clone(vars['role'..val.Mode.Value])
	tehtb['dep']={plr.CharacterRemoving} tehtb['txt']=plr.DisplayName..tehtb.txt..' ('..plr.Name..')' local hk=funcs.addhook(thech:WaitForChild('Head',2),tehtb)
	tehtb=nil
	
	local thec
	thec=val.Mode.Changed:Connect(function()
	if hk and hk.box and hk.textbox then
	local tb=vars['role'..val.Mode.Value]
	if not tb then hk.justquit() thec:Disconnect() thec=nil return end
	if tb['color'] then hk.box.Color3=tb['color'] hk.textbox.TextColor3=tb['color'] end if tb['txt'] then hk.textbox.Text=tb['txt'] end
	else
	thec:Disconnect() thec=nil
	end
	end)
	
	table.insert(funcs.hookedinst,val.Mode)
	val.Mode.Changed:Connect(function()
	if plr and vars['role'..val.Mode.Value] then
	vars.funcs.replr(plr)
	end
	end)
	end

	
end
vars.funcs.ref=function()
for i,v in pairs(funcs.plrs:GetPlayers()) do
if v~=funcs.lplr then task.spawn(vars.funcs.replr,v) end
end
end
vars.funcs.onplr=function(plr)
plr.CharacterAdded:Connect(function() vars.funcs.replr(plr) end)
vars.funcs.replr(plr)
end
for i,v in pairs(funcs.plrs:GetPlayers()) do
if v~=funcs.lplr then task.spawn(vars.funcs.onplr,v) end
end
workspace.CurrentCamera.ChildAdded:Connect(function(x) if x.Name=='IntroGame' then vars.funcs.ref() end end)
funcs.plrs.PlayerAdded:Connect(vars.funcs.onplr)
vars.escvp=workspace.Events.Vampire.EscapeVampire
local plug={
['esc']={['func']=function()
if funcs.lplr:FindFirstChildOfClass('PlayerGui').GameScreen.Game.Escape.Visible then
task.wait(.3)
vars.escvp:FireServer(nil,true)
end
end;['desc']='escape vampire'};
['Reservedpluginname']='vh2'
}
vars.funcs.aescseq=function(v)
if v.Name=='GameScreen' and v:WaitForChild('Game',5) and v:WaitForChild('Game',5):WaitForChild('Escape',5) then
plug['aesc']['func']() plug['aesc']['func']()
end
end
plug['aesc']={['func']=function()
if not vars.aesc_con2 then
plug.esc.func()
vars.aesc_con=funcs.lplr:FindFirstChildOfClass('PlayerGui').GameScreen.Game.Escape:GetPropertyChangedSignal('Visible'):Connect(plug.esc.func)
vars.aesc_con2=funcs.lplr:FindFirstChildOfClass('PlayerGui').ChildAdded:Connect(vars.funcs.aescseq)
funcs.sendnotif('allistrue','see_no_evil','rbxassetid://11151804223',5)
else
if vars.aesc_con then vars.aesc_con=vars.aesc_con:Disconnect() end
vars.aesc_con2=vars.aesc_con2:Disconnect()
funcs.sendnotif('allisfalse','see_evil','rbxassetid://11151804223',5)
end
end;['desc']='autoescape vampire'}
return plug
