local vars={
}
local maus=funcs.lplr:GetMouse()
local function cdtp(kk)
	if kk.UserInputType == Enum.UserInputType.MouseButton1 and funcs.uip:IsKeyDown(Enum.KeyCode.K) then
		getchar():PivotTo(maus.Hit)
	end
end
local function togo(strt,strd,str)
	local thp=strd and funcs.xgetplr(strd,true)
	if thp and thp.Character then
	getchar():PivotTo(thp.Character:GetPivot())
	end
end
vars.cdtp=funcs.uip.InputBegan:Connect(cdtp)
local plug={
["goto"]={func=togo,desc="goto plr (arg[1])",aliases={to="goto"}};
["boto"]={func=function(strt,strd,str) 
local oldpiv=getchar():GetPivot()
strt=strt[1] and tonumber(strt[1]) or 1
for i = 1,strt do
togo(strt,strd,str)
task.wait()
getchar():PivotTo(oldpiv)
end
end,desc="goto player and back"};
["lgoto"]={func=function(strt,strd,str)
	local thp=strd and funcs.xgetplr(strd,true)
	if not strd then vars.lgoto=nil return end
	vars.lgoto=true
	while vars.lgoto and thp and thp.Character do
	getchar():PivotTo(thp.Character:GetPivot())
	task.wait()
	end
	vars.lgoto=nil
end,desc="loopgoto plr (arg[1]), no arg to cancel"};
["cdtp"]={func=function(strt,plrarg) if vars.cdtp then vars.cdtp:Disconnect() vars.cdtp=nil else vars.cdtp=funcs.uip.InputBegan:Connect(cdtp) end if plrarg~="nn" then funcs.sendnotif("cmds/toolthing/bambi.exe",vars.cdtp and "hi" or "fucking idiot","rbxassetid://8119590978",4) end end,desc="toggle click tp (k+click)"};
Reservedpluginname="base.tp-cmds"
}
return plug
