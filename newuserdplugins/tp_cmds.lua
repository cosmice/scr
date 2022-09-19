local vars={
}
local plug={
["goto"]={func=function(strt,strd,str)
	local thp=strd and funcs.xgetplr(strd,true)
	if thp and thp.Character then
	getchar():PivotTo(thp.Character:GetPivot())
	end
end,desc="goto plr (arg[1])",aliases={to="goto"}},
["lgoto"]={func=function(strt,strd,str)
	local thp=strd and funcs.xgetplr(strd,true)
	if not strd then vars.lgoto=nil return end
	vars.lgoto=true
	while vars.lgoto and thp and thp.Character do
	getchar():PivotTo(thp.Character:GetPivot())
	task.wait()
	end
	vars.lgoto=nil
end,desc="loopgoto plr (arg[1]), no arg to cancel"}
}
return plug
