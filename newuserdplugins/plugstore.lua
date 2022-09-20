local pindex={
base={
["avatar-edit"]={'https://github.com/exceptional0/scr/raw/main/newuserdplugins/avatar_edit.lua',"2/avatar editing cmds"};
["char-manip"]={'https://github.com/exceptional0/scr/raw/main/newuserdplugins/char_manip.lua',"character manipulation/float,noclip,god,reset,dreset,etc."};
["gamespes"]={'https://github.com/exceptional0/scr/raw/main/newuserdplugins/gamespes.lua',"game specific commands, makes hughjazz be a hub."};
["tool-manip"]={'https://github.com/exceptional0/scr/raw/main/newuserdplugins/toolthing.lua',"/Z - kidnap M - hell N - Void B - Refresh/refresh,gtool,void,etc"};
["tp-cmds"]={'https://github.com/exceptional0/scr/raw/main/newuserdplugins/tp_cmds.lua',"teleport commands/goto/to/lgoto"};
}
}
local plug={
pstore={func=function() 
for i,v in pairs(pindex) do
for n,x in pairs(v) do
print(n.."/"..v[2])
end
end

end,desc="lists plugs"};
padd={func=function(strt,plrarg,str)
if not strt[1] or not pindex[plrarg] or not pindex[strt[1]] then funcs.sendnotif("cmds/pstore/failed","plugin not found (exact words)",5) end
ldplug(loadstring(game:HttpGet(pindex[plrarg][strt[1]))())
funcs.sendnotif("loaded/plrarg/"..strt[1],"",5)
end,desc="adds plug from store"};
psave={func=function(strt,plrarg,str)
if not strt[1] or not pindex[plrarg] or not pindex[strt[1]] then funcs.sendnotif("cmds/pstore/failed","plugin not found (exact words)",5) end
if not isfolder("NonstopPeanutNovember") then makefolder("NonstopPeanutNovember") end
writefile("NonstopPeanutNovember\\"..strt[1]..".lua",game:HttpGet(pindex[plrarg][strt[1]))
funcs.sendnotif("loaded/plrarg/"..strt[1],"",5)
end,desc="saves plug from store"};
Reservedpluginname="plug store"
}

return plug