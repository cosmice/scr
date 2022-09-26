local vars={
}
local maus=funcs.lplr:GetMouse()
local function cdtp(kk)
	if kk.UserInputType == Enum.UserInputType.MouseButton3 and funcs.uip:IsKeyDown(Enum.KeyCode.K) then
		getchar():PivotTo(maus.Hit*CFrame.new(0,2.45,0))
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
str=strt[1] and tonumber(strt[1]) or 1
for i = 1,str do
togo(strt,strd,str)
task.wait(strt[2] and tonumber(strt[2]) or .05)
getchar():PivotTo(oldpiv)
end
end,desc="goto arg[1] plr and back arg[2] amount of times for arg[3] each"};
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
["tovoid"]={["func"]=function() vars.outvoid=vars.outvoid or getchar():GetPivot() ; local prr=getchar().PrimaryPart or getchar():GetPropertyChangedSignal("PrimaryPart"):Wait() ; if prr then prr.Anchored=true end getchar():PivotTo(CFrame.new(Random.new():NextNumber(80000000000,100000000000),Random.new():NextNumber(80000000000,100000000000),Random.new():NextNumber(80000000000,100000000000))) end;["desc"]="tp yourself to void, anchors your root too"};
["outvoid"]={["func"]=function() if vars.outvoid then  local prr=getchar().PrimaryPart or getchar():GetPropertyChangedSignal("PrimaryPart"):Wait() ; if prr then prr.Anchored=false end getchar():PivotTo(vars.outvoid) vars.outvoid=nil end end;["desc"]="tp where you were before tping to void, unanchors your root too"};
["b"]={["func"]=function(strt,nn,str,cmd,arg) nn=tonumber(nn) or 1.5 cmd=getchar() for i = 1,30 do if not funcs.lplr.Character==cmd then break end local piv=cmd:GetPivot() cmd:PivotTo(piv + (-piv.LookVector * nn/4)) ; piv=cmd:GetPivot() cmd:PivotTo(piv + (-piv.LookVector * nn/4)) task.wait(0) end end;["desc"]="tp backwards arg[1] or 6"};
["f"]={["func"]=function(strt,nn,str,cmd,arg) nn=tonumber(nn) or 1.5 cmd=getchar() for i = 1,30 do if not funcs.lplr.Character==cmd then break end local piv=cmd:GetPivot() cmd:PivotTo(piv + (piv.LookVector * nn/4)) ; piv=cmd:GetPivot() cmd:PivotTo(piv + (piv.LookVector * nn/4))  task.wait(0) end end;["desc"]="tp forwards arg[1] or 6"};
["cdtp"]={func=function(strt,plrarg) if vars.cdtp then vars.cdtp:Disconnect() vars.cdtp=nil else vars.cdtp=funcs.uip.InputBegan:Connect(cdtp) end if plrarg~="nn" then funcs.sendnotif("cmds/toolthing/bambi.exe",vars.cdtp and "hi" or "fucking idiot","rbxassetid://8119590978",4) end end,desc="toggle click tp (k+middleclick)"};
Reservedpluginname="base.tp-cmds"
}
return plug
