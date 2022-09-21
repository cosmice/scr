 getgenv().sus_cmds={}
if not isfolder("November") or not isfile("November\\icepoolshook.lua") then sus_cmds.ExtraPlugins={'https://raw.githubusercontent.com/exceptional0/scr/main/newuserdplugins/icepoolshook.lua'} end
if not isfolder("November") or not isfile("November\\tp_cmds.lua") then sus_cmds.ExtraPlugins={'https://raw.githubusercontent.com/exceptional0/scr/main/newuserdplugins/tp_cmds.lua'} end
if not isfolder("November") or not isfile("November\\char-manip.lua") then sus_cmds.ExtraPlugins={'https://raw.githubusercontent.com/exceptional0/scr/main/newuserdplugins/char-manip.lua'} end
loadstring(game:HttpGet("https://raw.githubusercontent.com/exceptional0/scr/main/hughjazz.lua"))()
