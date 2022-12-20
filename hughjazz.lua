-- Gui to Lua
if not funcs then
loadstring(game:HttpGet("https://raw.githubusercontent.com/6yNuiC9/scr/main/funcs.lua"))()
end
local cmds=getgenv().sus_cmds and table.clone(getgenv().sus_cmds) or {}
getgenv().sus_cmds=nil
local gnn={
main = Instance.new("ScreenGui");
_txtbox = Instance.new("TextBox");
cmdframe = Instance.new("ScrollingFrame");
txt = Instance.new("TextLabel");
_close = Instance.new("TextButton");
event = Instance.new("BindableEvent");
plugsloaded = Instance.new("BindableEvent");
_acplbl=Instance.new('TextLabel');
gprot = gethui or get_hidden_ui or get_hidden_gui or hiddenUI or syn and syn.protect_gui and (function(x) syn.protect_gui(x) return game:GetService("CoreGui") end) or function() return game:GetService("CoreGui") end}
gnn.cmds_sorted={}
gnn.main.Name = "main"
gnn.main.Parent = gnn.gprot(gnn.main)
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
gnn._acplbl.Name=funcs.rndmstr(5,20)
gnn._acplbl.BackgroundTransparency=1
gnn._acplbl.Font=Enum.Font.SourceSans
gnn._acplbl.Size=UDim2.new(1,0,1,0)
gnn._acplbl.Text=''
gnn._acplbl.TextTransparency=.5
gnn._acplbl.TextScaled=true
gnn._acplbl.TextWrapped=true
gnn._acplbl.TextColor3=Color3.fromRGB(255,255,255)
gnn._acplbl.ZIndex=10
gnn._acplbl.TextTransparency=.63
gnn._acplbl.Parent=gnn._txtbox

gnn.cmdframe.Name = "cmdframe"
gnn.cmdframe.Active = false
gnn.cmdframe.Parent = gnn.main
gnn.cmdframe.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
gnn.cmdframe.Position = UDim2.new(0.376870751, 0, 0.309890121, 0)
gnn.cmdframe.Size = UDim2.new(0.245578229, 0, 0.376923114, 0)
gnn.cmdframe.Visible = false
--gnn.cmdframe.CanvasSize = UDim2.new(0, 0, 0.529999971, 0)
gnn.cmdframe.Draggable=true
gnn.cmdframe.AutomaticCanvasSize=3
gnn.cmdframe.CanvasSize=UDim2.new(0.5,0,0,0)

gnn.txt.Name = "txt"
gnn.txt.Parent = gnn.cmdframe
gnn.txt.BackgroundTransparency = 1.000
gnn.txt.Position = UDim2.new(0, 0, -0.000313895056, 0)
gnn.txt.Size = UDim2.new(0.963989615, 0, 1.00031388, 0)
gnn.txt.Font = Enum.Font.SourceSans
gnn.txt.Text = cmds['Ctxt'] or [[! - lastcmd (cmd) !! - lastcmd with args (cmd oldargs newargs)
all,others, allt (prefix+t=multithread)
wip: strangers,nteam,team

commands:
rj
usave - save settings
saves - toggle autosave (off by default)
savesint - change autosave interval (arg[1]) (default: off, 15)
rainbow - toggles rainbow ui, specify arg[1] to toggle 'full' ui rainbow
kbind - changes keybind to next keypressed
gclose - deletegui
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
local mvars=getgenv().sus_cmds_mvars or {['kbind']=Enum.KeyCode.L;['rainbow']=true;['rainbowset']=true;['saveintv']=15;['historylength']=300;['mainthr']=coroutine.running()}
gnn.fcks={}
gnn.cns={}
gnn.cmdhistory={}
if not getgenv().sus_cmds_mvars and isfile('FailedNovember.lua') then mvars=funcs.load('FailedNovember.lua',mvars) end
mvars.rainbowins={gnn.txt,gnn._txtbox,gnn.txt2,gnn._close,gnn.cmdframe,gnn._acplbl}
cmds["cmds"]=cmds["cmds"] or function()
		gnn._close.Active = true
		gnn.cmdframe.Active = true
		gnn._close.Visible = true
		gnn.cmdframe.Visible = true
		gnn.txt.Visible=true gnn.txt.Active=true gnn.txt2.Visible=false gnn.txt2.Active=false
end
cmds["gclose"]=cmds["gclose"] or function()
local function aaaaaaaaAAaa()
local mainthr=mvars.mainthr
for i,v in pairs(mvars) do if typeof(v)=='Instance' then funcs.deb:AddItem(v,0) elseif typeof(v)=='RBXScriptConnection' then v:Disconnect() end task.wait() end mvars=nil
for i,v in pairs(gnn) do if typeof(v)=='Instance' then funcs.deb:AddItem(v,0) elseif typeof(v)=='RBXScriptConnection' then v:Disconnect() end task.wait() end gnn=nil
for i,v in pairs(cmds) do if typeof(v)=='Instance' then funcs.deb:AddItem(v,0) elseif typeof(v)=='RBXScriptConnection' then v:Disconnect() end task.wait() end cmds=nil
task.cancel(mainthr)
mainthr=nil
end
task.spawn(aaaaaaaaAAaa)
end
cmds['usave']=cmds['usave'] or function(x)
funcs.save('FailedNovember.lua',mvars,true)
end
cmds['saves']=cmds['saves'] or function()
if gnn.cns.saves then gnn.cns.saves:Disconnect() gnn.cns.saves=nil else gnn.cns.saves=game.Close:Connect(cmds['usave']) while gnn.cns.saves do cmds['usave']() task.wait(mvars.saveintv) end end  
funcs.sendnotif("cmds/bambi.exe",vars.cns.saves and "hi" or "fucking idiot","rbxassetid://8119590978",4) 
end
cmds['savesint']=cmds['savesint'] or function(strd,plrarg)
plrarg=tonumber(plrarg or 15) if plrarg > .9 then mvars.saveintv=plrarg end
end
gnn.fcks.rnbow=function()
if mvars.rainbow then for i,v in pairs(gnn) do if typeof(v)=='Instance' then local function satr(x,y) local z=x:lower() if z:match('color') or z:match('image') then v:SetAttribute(x,y) end end table.foreach(getproperties(v),satr) satr=nil end end 
else
for i,v in pairs(gnn) do if typeof(v)=='Instance' then local function ratr(x,y) v[x]=y v:SetAttribute(x,nil) end table.foreach(v:GetAttributes(),ratr) end end
end
while gnn and gnn._txtbox and mvars and mvars.rainbow do
local col=Color3.fromHSV(os.clock() % 5/5, 1, 1)
gnn._txtbox.TextColor3=col
gnn._txtbox.PlaceholderColor3=col
if mvars.rainbowset then for i,v in pairs(mvars.rainbowins) do local propZ=getproperties(v) if propZ.TextColor3 then v.TextColor3=col elseif propZ.ScrollBarImageColor3 then v.ScrollBarImageColor3=col end propZ=nil end end task.wait()
end
end

if mvars.rainbow then task.spawn(gnn.fcks.rnbow) end
cmds["rainbow"]=cmds["rainbow"] or function(strd,plrarg)
mvars.rainbow=not mvars.rainbow
mvars.rainbowset=plrarg and mvars.rainbow
task.spawn(gnn.fcks.rnbow)
end

mvars.ck=function(kk)
if kk.KeyCode~=Enum.KeyCode.Return then
mvars.kbind=kk.KeyCode or mvars.kbind
mvars.con:Disconnect() mvars.con=nil
funcs.sendnotif("cmds\\amogus",tostring(mvars.kbind),"rbxassetid://6678521436",5)
end
end
cmds["rj"]=cmds["rj"] or rj
cmds["kbind"]=cmds["kbind"] or function()
if not mvars.con then
mvars.con=funcs.uip.InputBegan:Connect(mvars.ck)
else mvars.con:Disconnect() mvars.con=nil end
end

for i,v in next,cmds do
local firstch=string.sub(i,1,2)
if not gnn.cmds_sorted[firstch] then gnn.cmds_sorted[firstch]={} end
table.insert(gnn.cmds_sorted[firstch],i)
end

local aliases={}

-- Scripts:

gnn.cmdfunc=function(x,realx) 
local strd=string.split(x," ")
if #gnn.cmdhistory>0 then local dd if strd[1]=="!" then dd=true strd[1]=string.gsub(strd[1],"!",string.split(gnn.cmdhistory[#gnn.cmdhistory]," ")[1]) elseif strd[1]=="!!" then dd=true strd=string.split(gnn.cmdhistory[#gnn.cmdhistory]..x:gsub(strd[1],"",1)," ") end if dd then x=table.concat(strd," ") end end
 if #gnn.cmdhistory+1>mvars.historylength then gnn.cmdhistory={} end if x~="" and realx~=-1 then table.insert(gnn.cmdhistory,x) end
local cmdsequel,plrarg=strd[1],strd[2]
if plrarg=="all" then for i,v in pairs(funcs.plrs:GetPlayers()) do strd[2]=v.Name ; gnn.cmdfunc(table.concat(strd," ")) end return elseif plrarg=="allt" then for i,v in pairs(funcs.plrs:GetPlayers()) do strd[2]=v.Name ; task.spawn(gnn.cmdfunc,table.concat(strd," "),-1) end 
elseif plrarg=="others" then for i,v in pairs(funcs.plrs:GetPlayers()) do if v~=funcs.lplr then strd[2]=v.Name ; gnn.cmdfunc(table.concat(strd," "),-1) end end elseif plrarg=="otherst" then for i,v in pairs(funcs.plrs:GetPlayers()) do if v~=funcs.lplr then strd[2]=v.Name ; task.spawn(gnn.cmdfunc,table.concat(strd," "),-1) end end 
return end
table.remove(strd,1) table.remove(strd,1)
if aliases[cmdsequel] then cmdsequel=aliases[cmdsequel] end if plrarg=='inf' or plrarg=='math.huge' then plrarg=math.huge end
local TheSequelGenre=type(cmds[cmdsequel])
if TheSequelGenre=='function' then
cmds[cmdsequel](strd,plrarg,x,cmdsequel,realx)
elseif TheSequelGenre=='table' and not cmds[cmdsequel][3] then
cmds[cmdsequel][1](strd,plrarg,x,cmdsequel,cmds[cmdsequel][2],realx)
elseif TheSequelGenre=='table' then
cmds[cmdsequel][1](type(cmds[cmdsequel][2])=='table' and unpack(cmds[cmdsequel][2]) or cmds[cmdsequel][2])
end
end

	local function onfocus(x)
		if x then
			gnn.cmdfunc(gnn._txtbox.Text:lower(),gnn._txtbox.Text)
		end
	end
	gnn.Reserved_onfocus=gnn._txtbox.FocusLost:Connect(onfocus)
	local function onclick()
		gnn._close.Active = not gnn._close.Active
		gnn.cmdframe.Active = not gnn.cmdframe.Active
		gnn._close.Visible = not gnn._close.Visible
		gnn.cmdframe.Visible = not gnn.cmdframe.Visible
		gnn.txt.Visible=false gnn.txt.Active=false gnn.txt2.Visible=false gnn.txt2.Active=false
	end
	gnn.Reserved_onclick=gnn._close.MouseButton1Click:Connect(onclick)
local function stfu()
gnn._txtbox.Text = '' gnn._acplbl.Text='' gnn.acpval=nil
end

local function onkeydown(x)
local txtfocused = funcs.uip:GetFocusedTextBox()
local stxt=txtfocused==gnn._txtbox and gnn._txtbox.Text local slen=stxt and #stxt
if txtfocused and not stxt then return end
if x.KeyCode == mvars.kbind and not stxt then
gnn._txtbox:CaptureFocus()
task.defer(stfu,"")
elseif stxt then
if x.KeyCode==Enum.KeyCode.Up then
local lastcmd=gnn.cmdhistory[#gnn.cmdhistory] if lastcmd then gnn._txtbox.Text=lastcmd gnn._txtbox.CursorPosition=string.len(lastcmd)+1 end lastcmd=nil
elseif x.KeyCode==Enum.KeyCode.Backspace then
gnn._acplbl.Text=''
elseif x.KeyCode==Enum.KeyCode.Tab and gnn.acpval then
gnn._txtbox.Text=gnn.acpval gnn._acplbl.Text='' gnn._txtbox.CursorPosition=#gnn._txtbox.Text+1
elseif slen>1 and not stxt:find(' ') and gnn.cmds_sorted[stxt:sub(1,2)] then

local lowestmatch={['txt']='',['len']=9e5}
for i,v in next,gnn.cmds_sorted[stxt:sub(1,2)] do
 if v:sub(1,slen)==gnn._txtbox.Text and #v<lowestmatch.len then
lowestmatch.txt=v lowestmatch.len=#v
 elseif stxt~=gnn._txtbox.Text then
 lowestmatch=nil
 break
 end
 end
if lowestmatch and lowestmatch~='' then gnn._acplbl.Text=lowestmatch.txt gnn.acpval=lowestmatch.txt lowestmatch=nil end

end
end
txtfocused,cmdfocused=nil,nil
end
gnn.Reserved_maintype=funcs.uip.InputEnded:Connect(onkeydown)

--plugins

local pst={["powersupply"]={["cmds"]=cmds;["gnn"]=gnn;["mvars"]=mvars}}
local function merge(t,v)
pst[t]=v
end
table.foreach(getrenv(),merge)
table.foreach(getgenv(),merge)
pst.powersupply.pst=pst
merge=nil

local counter=cmds.ExtraPlugins and #cmds.ExtraPlugins or 0
local fym=isfolder("November") and listfiles("November")
counter+=fym and #fym or 0
local function ldplug(v)
local tnstr={}
local function HandlePluginError(err)
printconsole(v.."- "..err,171,199,80)
end
local nnnnnn
local ldfile
local function pl() ldfile=type(v)=='function' and v or loadfile(v); if type(ldfile)=='function' then setfenv(ldfile,pst) nnnnnn,ldfile=xpcall(ldfile,HandlePluginError) end if type(ldfile)=='table' and ldfile.Init then ldfile=ldfile.Init(HandlePluginError,ldplug,gnn) end end
xpcall(pl,HandlePluginError) pl=nil
if not ldfile or type(ldfile)~='table' or not nnnnnn then counter-=1 if counter <=0 then gnn.Plugsloaded=true gnn.plugsloaded:Fire() end return end
local nm=ldfile.Reservedpluginname or v
table.insert(tnstr,nm.." cmds:")
for x,c in next,ldfile do
if type(c)~='table' or c.reserved then continue end
if c.func then
cmds[x]={c.func,c.args,c.onlypass}
end
local xsub=x:sub(1,2) if not gnn.cmds_sorted[xsub] then gnn.cmds_sorted[xsub]={} end table.insert(gnn.cmds_sorted[xsub],x)
if c.desc then
table.insert(tnstr,x.."- "..c.desc)
else
table.insert(tnstr,x)
end
if c.aliases then
for i,v in next,c.aliases do
aliases[i]=v
end
end
end
gnn.txt.Text=gnn.txt.Text..'\n'..table.concat(tnstr,"\n").."\n"
counter-=1
if counter <=0 then gnn.Plugsloaded=true gnn.plugsloaded:Fire() end
end
pst.powersupply.ldplug=ldplug

if fym then
for i,v in next,fym do
coroutine.wrap(ldplug)(v)
task.wait(0)
end
end
if cmds.ExtraPlugins then
for i,v in next,cmds.ExtraPlugins do
coroutine.wrap(ldplug)(type(v)=='string' and loadstring(game:HttpGet(v)) or v)
task.wait(0)
end
end

funcs.sendnotif("cmds r sus","loaded","rbxassetid://6678521436",5)
