local pind={}
pind["base"]={
["avatar-edit"]={'https://github.com/exceptional0/scr/raw/main/newuserdplugins/avatar_edit.lua',"2/avatar editing cmds"};
["char-manip"]={'https://github.com/exceptional0/scr/raw/main/newuserdplugins/char_manip.lua',"character manipulation/float,noclip,god,reset,dreset,etc."};
["icepoolshook"]={'https://github.com/exceptional0/scr/raw/main/newuserdplugins/icepoolshook.lua',"game specific commands, makes hughjazz be a hub."};
["toolthing"]={'https://github.com/exceptional0/scr/raw/main/newuserdplugins/toolthing.lua',"Z - kidnap M - hell N - Void B - Refresh/refresh,gtool,void,etc"};
["tp-cmds"]={'https://github.com/exceptional0/scr/raw/main/newuserdplugins/tp_cmds.lua',"teleport commands/goto/to/lgoto"};
["plugstore"]={'https://raw.githubusercontent.com/exceptional0/scr/main/newuserdplugins/plugstore.lua',"plug store"};
["ex"]={'https://raw.githubusercontent.com/exceptional0/scr/main/newuserdplugins/example.lua',"example"}
}
local plugss={
Init=function(err,ldplug,gui)
local plug={}
plug.pstore={func=function(strt,parg) 
local tx={}
for i,v in pairs(pind) do
for n,x in pairs(v) do
table.insert(tx,i.."/"..n.."/"..x[2])
end
end
gui.txt2.Text=table.concat(tx,"\n\n")
gui._close.Active = true
gui.cmdframe.Active = true
gui._close.Visible = true
gui.cmdframe.Visible = true
gui.txt2.Visible=true gui.txt2.Active=true gui.txt.Active=false gui.txt.Visible=false
if parg~="nn" then funcs.sendnotif("cmds/pstore","waaaa","rbxassetid://8119590978",5) end
end,desc="lists plugs in internal ui"}

plug.padd={func=function(strt,plrarg,str)
if not strt[1] or not plrarg or not pind[plrarg] or not pind[plrarg][strt[1]] then funcs.sendnotif("cmds/padd/failed","exact plug not found","",5) end
ldplug(loadstring(game:HttpGet(pind[plrarg][strt[1]][1]))())
funcs.sendnotif("loaded/plrarg/"..strt[1],"loaded",5)
end,desc="adds plug from store: padd base toolthing"}

plug.psave={func=function(strt,plrarg,str)
if not strt[1] or not plrarg or not pind[plrarg] or not pind[plrarg][strt[1]] then funcs.sendnotif("cmds/psave/failed","exact plug not found","",5) end
if not isfolder("November") then makefolder("November") end
local plug=game:HttpGet(pind[plrarg][strt[1]][1])
writefile("November\\"..strt[1]..".lua",plug)
ldplug(loadstring(plug)())
funcs.sendnotif("loaded/plrarg/"..strt[1],"loaded",5)
end,desc="saves plug from store: psave base plugstore"}
plug.Reservedpluginname="base.plug-store" --a
return plug
end
}
return plugss
