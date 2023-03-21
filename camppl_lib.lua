if not funcs then
loadstring(game:HttpGet("https://raw.githubusercontent.com/6yNuiC9/scr/main/funcs.lua"))()
end

if not getgenv().camppl then

local guip={['l']=Instance.new('TextButton'),['r']=Instance.new('TextButton'),['t']=Instance.new('TextLabel'),['x']=Instance.new('TextButton'),['g']=Instance.new('ScreenGui'),['form']='(%s/%s) %s'}
local cons={}

for i=1,4 do guip[i]=Instance.new('TextButton') end

local sisyphusprime = Instance.new("Frame")

--Properties:

guip.g.Name = "@deathgripz"
guip.g.Enabled=false
guip.g.Parent = game:GetService('CoreGui')
guip.g.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

sisyphusprime.Name = "sisyphus prime"
sisyphusprime.Parent = guip.g
sisyphusprime.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
sisyphusprime.BackgroundTransparency = 1.000
sisyphusprime.Position = UDim2.new(0.182973802, 0, 0.661764741, 0)
sisyphusprime.Size = UDim2.new(0.633667171, 0, 0.167112306, 0)

guip.t.Name = "my_own_hell"
guip.t.Parent = sisyphusprime
guip.t.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
guip.t.BackgroundTransparency = 0.400
guip.t.BorderSizePixel = 0
guip.t.Position = UDim2.new(0.311040819, 0, 0.185374126, 0)
guip.t.Size = UDim2.new(0.378419459, 0, 0.623556495, 0)
guip.t.Font = Enum.Font.Unknown
guip.t.Text = "53 Tracks of Positive Affirmations and Personal Attention Hypnosis"
guip.t.TextColor3 = Color3.fromRGB(255, 0, 4)
guip.t.TextScaled = true
guip.t.TextSize = 14.000
guip.t.TextWrapped = true

guip.r.Name = "jenny death"
guip.r.Parent = sisyphusprime
guip.r.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
guip.r.BackgroundTransparency = 0.400
guip.r.BorderSizePixel = 0
guip.r.Position = UDim2.new(0.809282184, 0, 0.185374141, 0)
guip.r.Size = UDim2.new(0.128924102, 0, 0.623556316, 0)
guip.r.Font = Enum.Font.SourceSans
guip.r.Text = ">"
guip.r.TextColor3 = Color3.fromRGB(255, 0, 4)
guip.r.TextScaled = true
guip.r.TextSize = 14.000
guip.r.TextWrapped = true

guip.l.Name = "niggas on the moon"
guip.l.Parent = sisyphusprime
guip.l.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
guip.l.BackgroundTransparency = 0.400
guip.l.BorderSizePixel = 0
guip.l.Position = UDim2.new(0.0766060352, 0, 0.185320914, 0)
guip.l.Size = UDim2.new(0.128999993, 0, 0.624000013, 0)
guip.l.Font = Enum.Font.SourceSans
guip.l.Text = "<"
guip.l.TextColor3 = Color3.fromRGB(255, 0, 4)
guip.l.TextScaled = true
guip.l.TextSize = 14.000
guip.l.TextWrapped = true

guip.x.Name = "snitch"
guip.x.Parent = sisyphusprime
guip.x.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
guip.x.BackgroundTransparency = 0.400
guip.x.BorderSizePixel = 0
guip.x.Position = UDim2.new(0.0904372185, 0, 0.935374081, 0)
guip.x.Size = UDim2.new(0.100000001, 0, 0.624000013, 0)
guip.x.Font = Enum.Font.Unknown
guip.x.Text = "x"
guip.x.TextColor3 = Color3.fromRGB(255, 0, 4)
guip.x.TextScaled = true
guip.x.TextSize = 14.000
guip.x.TextWrapped = true

guip[2].Name = "2"
guip[2].Parent = sisyphusprime
guip[2].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
guip[2].BackgroundTransparency = 0.400
guip[2].BorderSizePixel = 0
guip[2].Position = UDim2.new(0.449099839, 0, 0.935374379, 0)
guip[2].Size = UDim2.new(0.100048713, 0, 0.623556316, 0)
guip[2].Font = Enum.Font.Unknown
guip[2].Text = "2"
guip[2].TextColor3 = Color3.fromRGB(255, 0, 4)
guip[2].TextScaled = true
guip[2].TextSize = 14.000
guip[2].TextWrapped = true

guip[3].Name = "3"
guip[3].Parent = sisyphusprime
guip[3].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
guip[3].BackgroundTransparency = 0.400
guip[3].BorderSizePixel = 0
guip[3].Position = UDim2.new(0.588917494, 0, 0.935374379, 0)
guip[3].Size = UDim2.new(0.100048713, 0, 0.623556316, 0)
guip[3].Font = Enum.Font.Unknown
guip[3].Text = "3"
guip[3].TextColor3 = Color3.fromRGB(255, 0, 4)
guip[3].TextScaled = true
guip[3].TextSize = 14.000
guip[3].TextWrapped = true

guip[1].Name = "1"
guip[1].Parent = sisyphusprime
guip[1].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
guip[1].BackgroundTransparency = 0.400
guip[1].BorderSizePixel = 0
guip[1].Position = UDim2.new(0.310801953, 0, 0.935374081, 0)
guip[1].Size = UDim2.new(0.100000001, 0, 0.624000013, 0)
guip[1].Font = Enum.Font.Unknown
guip[1].Text = "1"
guip[1].TextColor3 = Color3.fromRGB(255, 0, 4)
guip[1].TextScaled = true
guip[1].TextSize = 14.000
guip[1].TextWrapped = true

guip[4].Name = "4"
guip[4].Parent = sisyphusprime
guip[4].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
guip[4].BackgroundTransparency = 0.400
guip[4].BorderSizePixel = 0
guip[4].Position = UDim2.new(0.822960019, 0, 0.935374379, 0)
guip[4].Size = UDim2.new(0.100048713, 0, 0.623556316, 0)
guip[4].Font = Enum.Font.Unknown
guip[4].Text = "4"
guip[4].TextColor3 = Color3.fromRGB(255, 0, 4)
guip[4].TextScaled = true
guip[4].TextSize = 14.000
guip[4].TextWrapped = true	
	local camppl={['guip']=guip,['cons']=cons,['sp']=1}

	camppl.sw=function(tb,i)
		if tb and tb[i] then
		camppl.cur=tb[i]
		guip.t.Text=string.format(guip.form,i,#tb,tb[i].Name)
		if workspace.CurrentCamera then workspace.CurrentCamera.CameraSubject=tb[i] end
		else
		guip.t.Text='53 Tracks of Positive Affirmations and Personal Attention Hypnosis'
		end
		camppl.sp=i
	end
	
	camppl.qtb=function(tb,sp)
		for i,v in next,cons do cons[i]=v:Disconnect() end
		sp=sp or camppl.sp
		camppl.sw(tb,sp)
		table.insert(cons,guip.l.Activated:Connect(function() sp=sp-1 if not tb[sp] then sp=#tb end camppl.sw(tb,sp) end))
		table.insert(cons,guip.r.Activated:Connect(function() sp=sp+1 if not tb[sp] then sp=1 end camppl.sw(tb,sp) end))
		table.insert(cons,guip.x.Activated:Connect(function() guip.g.Enabled=false for i,v in next,cons do cons[i]=v:Disconnect() end if workspace.CurrentCamera then workspace.CurrentCamera.CameraSubject=funcs.lplr.Character end end))
		guip.g.Enabled=true
	end
getgenv().camppl=camppl
end
