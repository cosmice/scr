getgenv().fpsthingenabled = true
getgenv().fpsthing = {}
getgenv().fpsthing.maxfpswhen = 65
getgenv().fpsthing.minfpswhen = 35
setfpscap(fpsthing.maxfpswhen)
local oldsetts={settings().Rendering.QualityLevel}
local uis = game:GetService("UserInputService")
local con1,con2 = nil,nil
local ru=game:GetService("RunService")
local settings=clonefunction(settings)
con1 = uis.WindowFocused:Connect(function()
	if getgenv().fpsthingenabled == true then
	settings().Rendering.QualityLevel=oldsetts[1]
	--settings().Physics.PhysicsEnvironmentalThrottle=oldsetts[1]
	ru:Set3dRenderingEnabled(true)
    setfpscap(getgenv().fpsthing.maxfpswhen)
	--[[else
	con1:Disconnect()
	con2:Disconnect()
	con1,con2=nil,nil--]]
	end
end)
con2 = uis.WindowFocusReleased:Connect(function() 
	if getgenv().fpsthingenabled == true then
    setfpscap(getgenv().fpsthing.minfpswhen)
	ru:Set3dRenderingEnabled(false)
	--oldsetts[1]=settings().Physics.PhysicsEnvironmentalThrottle
	--settings().Physics.PhysicsEnvironmentalThrottle = 1
	oldsetts[1]=settings().Rendering.QualityLevel
	settings().Rendering.QualityLevel = 'Level01'
	--[[else
	con1:Disconnect()
	con2:Disconnect()
	con1,con2=nil,nil--]]
	end
end)
uis = nil
