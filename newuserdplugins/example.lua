local example_plug={
expo={func=function(a,aaa,aaaa) funcs.sendnotif("cmds/example",aaaa,"rbxassetid://8119590978",5) end,desc="example: notify args"}
}
funcs.sendnotif(
powersupply and powersupply.gnn and "powered: gnn" or "false", --gui/gooey
"powersupply",
"",
5)
funcs.sendnotif(
powersupply and powersupply.cmds and "powered: cmds" or "false", --cmdstb
"powersupply",
"",
5)
return example_plug
