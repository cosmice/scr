-- Gui to Lua
if not funcs then
loadstring(game:HttpGet("https://raw.githubusercontent.com/exceptional0/scr/main/funcs.lua"))()
end
local main = Instance.new("ScreenGui")
local _txtbox = Instance.new("TextBox")
local cmdframe = Instance.new("ScrollingFrame")
local txt = Instance.new("TextLabel")
local _close = Instance.new("TextButton")
local lplr = funcs.lplr

main.Name = "main"
main.Parent = game:GetService("CoreGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_txtbox.Name = "_txtbox"
_txtbox.Parent = main
_txtbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_txtbox.BackgroundTransparency = 0.350
_txtbox.Draggable = true
_txtbox.Position = UDim2.new(0.61360544, 0, 0.0637362674, 0)
_txtbox.Size = UDim2.new(0.136734694, 0, 0.0802197829, 0)
_txtbox.Font = Enum.Font.SourceSans
_txtbox.PlaceholderText = "cmds r sus"
_txtbox.Text = ""
_txtbox.TextColor3 = Color3.fromRGB(255, 255, 255)
_txtbox.TextScaled = true
_txtbox.TextSize = 14.000
_txtbox.TextWrapped = true

cmdframe.Name = "cmdframe"
cmdframe.Active = false
cmdframe.Parent = main
cmdframe.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
cmdframe.Position = UDim2.new(0.376870751, 0, 0.309890121, 0)
cmdframe.Size = UDim2.new(0.245578229, 0, 0.376923114, 0)
cmdframe.Visible = false
cmdframe.CanvasSize = UDim2.new(0, 0, 0.529999971, 0)
cmdframe.Draggable=true
cmdframe.AutomaticCanvasSize=3
cmdframe.CanvasSize=UDim2.new(0.5,0,0,0)

txt.Name = "txt"
txt.Parent = cmdframe
txt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
txt.BackgroundTransparency = 1.000
txt.Position = UDim2.new(0, 0, -0.000313895056, 0)
txt.Size = UDim2.new(0.963989615, 0, 1.00031388, 0)
txt.Font = Enum.Font.SourceSans
txt.Text = [[commands:
rj
plugin commands:
]]
txt.TextColor3 = Color3.fromRGB(255, 255, 255)
txt.TextSize = 14.000
txt.TextXAlignment = Enum.TextXAlignment.Left
txt.TextYAlignment = Enum.TextYAlignment.Top
txt.AutomaticSize=3
local txt2=txt:Clone()
txt2.Parent=cmdframe
txt2.Text=""
txt2.Visible=false txt2.Active=false
_close.Name = "_close"
_close.Parent = main
_close.Active = false
_close.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_close.Position = UDim2.new(0.376870751, 0, 0.686813176, 0)
_close.Size = UDim2.new(0.245578229, 0, 0.0582417585, 0)
_close.Visible = false
_close.Font = Enum.Font.SourceSans
_close.Text = "close"
_close.TextColor3 = Color3.fromRGB(255, 255, 255)
_close.TextSize = 14.000
local cmds=sus_cmds or {}
cmds["cmds"]=cmds["cmds"] or function()
		_close.Active = not _close.Active
		cmdframe.Active = not cmdframe.Active
		_close.Visible = not _close.Visible
		cmdframe.Visible = not cmdframe.Visible
		txt.Visible=true txt.Active=true txt2.Visible=false txt2.Active=false
end
cmds["rj"]=cmds["rj"] or rj
local aliases={}

-- Scripts:
local function cmd(x) 
local strd=string.split(x," ")
local cmd,plrarg=strd[1],strd[2]
table.remove(strd,1) table.remove(strd,1)
if aliases[cmd] then cmd=aliases[cmd] end
if type(cmds[cmd])=='function' then
cmds[cmd](strd,plrarg,x,cmd)
elseif type(cmds[cmd])=='table' then
cmds[cmd][1](strd,plrarg,x,cmd,cmds[cmd][2])
end

end
local function OVTEMO_fake_script() -- _txtbox.txt 
	local script = Instance.new('LocalScript', _txtbox)

	local function onfocus(x)
		if x then
			cmd(_txtbox.Text:lower())
		end
	end
	_txtbox.FocusLost:Connect(onfocus)
end
coroutine.wrap(OVTEMO_fake_script)()
local function ZURHG_fake_script() -- _close.LocalScript 
	local script = Instance.new('LocalScript', _close)
	local function onclick()
		_close.Active = not _close.Active
		cmdframe.Active = not cmdframe.Active
		_close.Visible = not _close.Visible
		cmdframe.Visible = not cmdframe.Visible
		txt.Visible=false txt.Active=false txt2.Visible=false txt2.Active=false
	end
	_close.MouseButton1Click:Connect(onclick)
end
coroutine.wrap(ZURHG_fake_script)()
local us = game:GetService("UserInputService")
local function stfu()
_txtbox.Text = ""
end
local function onkeydown(x)
local txtfocused = us:GetFocusedTextBox()
if txtfocused then return end
if x.KeyCode == Enum.KeyCode.BackSlash then
_txtbox:CaptureFocus()
task.defer(stfu,"")
end
end
us.InputBegan:Connect(onkeydown)

local function ldplug(v)
local tnstr={}
local function HandlePluginError(err)
printconsole(v.."- "..err,171,199,80)
end
local ldfile
local function pl() ldfile=type(v)=='table' and v or loadfile(v)() if ldfile and ldfile.Init then ldfile=ldfile.Init(HandlePluginError,ldplug,{["txt2"]=txt2,["txt"]=txt,["cmdframe"]=cmdframe,["_close"]=_close}) end end
xpcall(pl,HandlePluginError)
if not ldfile then return end
local nm=ldfile.Reservedpluginname or v
table.insert(tnstr,nm.." cmds:")
for x,c in pairs(ldfile) do
local typ=type(c)
if typ~='table' or c.reserved then continue end
if c.func then
cmds[x]={c.func,c.args}
end
if c.desc then
table.insert(tnstr,x.."- "..c.desc)
else
table.insert(tnstr,x)
end
if c.aliases then
for i,v in pairs(c.aliases) do
aliases[i]=v
end
end
end
txt.Text=txt.Text..'\n'..table.concat(tnstr,"\n").."\n"
end


--plugins
if isfolder("November") then
for i,v in pairs(listfiles("November")) do
task.spawn(ldplug,v)
task.wait()
end
end
if cmds.ExtraPlugins then
for i,v in pairs(cmds.ExtraPlugins) do
task.spawn(ldplug,type(v)=='string' and loadstring(game:HttpGet(v))() or v)
task.wait()
end
end
getgenv().sus_cmds=nil
funcs.sendnotif("cmds r sus","loaded","rbxassetid://6678521436",5)
