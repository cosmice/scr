-- Gui to Lua
if not funcs then
loadstring(game:HttpGet("https://raw.githubusercontent.com/exceptional0/scr/main/funcs.lua"))()
end
if not game:IsLoaded() then game.Loaded:Wait() end
local gnn={
main = Instance.new("ScreenGui");
_txtbox = Instance.new("TextBox");
cmdframe = Instance.new("ScrollingFrame");
txt = Instance.new("TextLabel");
_close = Instance.new("TextButton");
event = Instance.new("BindableEvent");
gprot = gethui or get_hidden_ui or get_hidden_gui or hiddenUI or syn and syn.protectgui and (function(x) syn.protectgui(x) return game:GetService("CoreGui") end) or function() return game:GetService("CoreGui") end}
gnn.main.Name = "main"
gnn.main.Parent = gnn.gprot(x)
gnn.main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gnn._txtbox.Name = "_txtbox"
gnn._txtbox.Parent = gnn.main
gnn._txtbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
gnn._txtbox.BackgroundTransparency = 0.350
gnn._txtbox.Draggable = true
gnn._txtbox.Position = UDim2.new(0.61360544, 0, 0.0637362674, 0)
gnn._txtbox.Size = UDim2.new(0.136734694, 0, 0.0802197829, 0)
gnn._txtbox.Font = Enum.Font.SourceSans
gnn._txtbox.PlaceholderText = "cmds r sus"
gnn._txtbox.Text = ""
gnn._txtbox.TextColor3 = Color3.fromRGB(255, 255, 255)
gnn._txtbox.TextScaled = true
gnn._txtbox.TextSize = 14.000
gnn._txtbox.TextWrapped = true

gnn.cmdframe.Name = "cmdframe"
gnn.cmdframe.Active = false
gnn.cmdframe.Parent = gnn.main
gnn.cmdframe.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
gnn.cmdframe.Position = UDim2.new(0.376870751, 0, 0.309890121, 0)
gnn.cmdframe.Size = UDim2.new(0.245578229, 0, 0.376923114, 0)
gnn.cmdframe.Visible = false
gnn.cmdframe.CanvasSize = UDim2.new(0, 0, 0.529999971, 0)
gnn.cmdframe.Draggable=true
gnn.cmdframe.AutomaticCanvasSize=3
gnn.cmdframe.CanvasSize=UDim2.new(0.5,0,0,0)

gnn.txt.Name = "txt"
gnn.txt.Parent = gnn.cmdframe
gnn.txt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
gnn.txt.BackgroundTransparency = 1.000
gnn.txt.Position = UDim2.new(0, 0, -0.000313895056, 0)
gnn.txt.Size = UDim2.new(0.963989615, 0, 1.00031388, 0)
gnn.txt.Font = Enum.Font.SourceSans
gnn.txt.Text = [[commands:
rj
plugin commands:
]]
gnn.txt.TextColor3 = Color3.fromRGB(255, 255, 255)
gnn.txt.TextSize = 14.000
gnn.txt.TextXAlignment = Enum.TextXAlignment.Left
gnn.txt.TextYAlignment = Enum.TextYAlignment.Top
gnn.txt.AutomaticSize=3
gnn.txt2=gnn.txt:Clone()
gnn.txt2.Parent=gnn.cmdframe
gnn.txt2.Text=""
gnn.txt2.Visible=false gnn.txt2.Active=false
gnn._close.Name = "_close"
gnn._close.Parent = gnn.main
gnn._close.Active = false
gnn._close.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
gnn._close.Position = UDim2.new(0.376870751, 0, 0.686813176, 0)
gnn._close.Size = UDim2.new(0.245578229, 0, 0.0582417585, 0)
gnn._close.Visible = false
gnn._close.Font = Enum.Font.SourceSans
gnn._close.Text = "close"
gnn._close.TextColor3 = Color3.fromRGB(255, 255, 255)
gnn._close.TextSize = 14.000
local mvars={}
mvars.kbind=Enum.KeyCode.BackSlash
local cmds=sus_cmds or {}
cmds["cmds"]=cmds["cmds"] or function()
		gnn._close.Active = true
		gnn.cmdframe.Active = true
		gnn._close.Visible = true
		gnn.cmdframe.Visible = true
		gnn.txt.Visible=true gnn.txt.Active=true gnn.txt2.Visible=false gnn.txt2.Active=false
end
mvars.ck=function(kk)
if kk.KeyCode~=Enum.KeyCode.Return then
mvars.kbind=kk.KeyCode or mvars.kbind
mvars.con:Disconnect() mvars.con=nil
end
end
cmds["rj"]=cmds["rj"] or rj
cmds["kbind"]=cmds["kbind"] or function()
if not mvars.con then
mvars.con=funcs.uip.InputBegan:Connect(mvars.ck)
else mvars.con:Disconnect() mvars.con=nil end
end
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
local function OVTEMO_fake_script() -- gnn._txtbox.txt 
	local script = Instance.new('LocalScript', _txtbox)

	local function onfocus(x)
		if x then
			cmd(gnn._txtbox.Text:lower())
		end
	end
	gnn._txtbox.FocusLost:Connect(onfocus)
end
coroutine.wrap(OVTEMO_fake_script)()
local function ZURHG_fake_script() -- gnn._close.LocalScript 
	local script = Instance.new('LocalScript', _close)
	local function onclick()
		gnn._close.Active = not gnn._close.Active
		gnn.cmdframe.Active = not gnn.cmdframe.Active
		gnn._close.Visible = not gnn._close.Visible
		gnn.cmdframe.Visible = not gnn.cmdframe.Visible
		gnn.txt.Visible=false gnn.txt.Active=false gnn.txt2.Visible=false gnn.txt2.Active=false
	end
	gnn._close.MouseButton1Click:Connect(onclick)
end
coroutine.wrap(ZURHG_fake_script)()
local function stfu()
gnn._txtbox.Text = ""
end
local function onkeydown(x)
local txtfocused = funcs.uip:GetFocusedTextBox()
if txtfocused then return end
if x.KeyCode == mvars.kbind then
gnn._txtbox:CaptureFocus()
task.defer(stfu,"")
end
end
funcs.uip.InputBegan:Connect(onkeydown)
local pst={["powersupply"]={["cmds"]=cmds;["gnn"]=gnn}}
local function merge(t,v)
pst[t]=v
end
table.foreach(getrenv(),merge)
table.foreach(getgenv(),merge)
pst.powersupply.pst=pst
merge=nil
local function ldplug(v)
local tnstr={}
local function HandlePluginError(err)
printconsole(v.."- "..err,171,199,80)
end
local nnnnnn
local ldfile
local function pl() ldfile=type(v)=='table' and v or loadfile(v); if type(ldfile)=='function' then setfenv(ldfile,pst) nnnnnn,ldfile=xpcall(ldfile,HandlePluginError) end ; if ldfile and ldfile.Init then ldfile=ldfile.Init(HandlePluginError,ldplug,gnn) end end
xpcall(pl,HandlePluginError)
if not ldfile or not nnnnnn then return end
local nm=type(ldfile)=='table' and ldfile.Reservedpluginname or v
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
gnn.txt.Text=gnn.txt.Text..'\n'..table.concat(tnstr,"\n").."\n"
end
pst.powersupply.ldplug=ldplug

--plugins
if isfolder("November") then
for i,v in pairs(listfiles("November")) do
task.spawn(ldplug,v)
task.wait(0)
end
end
if cmds.ExtraPlugins then
for i,v in pairs(cmds.ExtraPlugins) do
task.spawn(ldplug,type(v)=='string' and loadstring(game:HttpGet(v))() or v)
task.wait(0)
end
end
getgenv().sus_cmds=nil
funcs.sendnotif("cmds r sus","loaded","rbxassetid://6678521436",5)
