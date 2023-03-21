local ftb={}
if not ftb[game.PlaceId] then
local function ascr(ch,Humanoid)
local Torso = ch:WaitForChild("Torso",5)
local RightShoulder = Torso:WaitForChild("Right Shoulder",5)
local LeftShoulder = Torso:WaitForChild("Left Shoulder",5)
local RightHip = Torso:WaitForChild("Right Hip",5)
local LeftHip = Torso:WaitForChild("Left Hip",5)
local Neck = Torso:WaitForChild("Neck",5)
local pose = "Standing"

local toolAnim = "None"
local toolAnimTime = 0

local jumpMaxLimbVelocity = 0.75

local function onRunning(speed)
	if speed>0 then
		pose = "Running"
	else
		pose = "Standing"
	end
end

local function onDied()
	pose = "Dead"
end

local function onJumping()
	pose = "Jumping"
end

local function onClimbing()
	pose = "Climbing"
end

local function onGettingUp()
	pose = "GettingUp"
end

local function onFreeFall()
	pose = "FreeFall"
end

local function onFallingDown()
	pose = "FallingDown"
end

local function onSeated()
	pose = "Seated"
end

local function onPlatformStanding()
	pose = "PlatformStanding"
end

local function onSwimming(speed)
	if speed>0 then
		pose = "Running"
	else
		pose = "Standing"
	end
end

local function moveJump()
	RightShoulder.MaxVelocity = jumpMaxLimbVelocity
	LeftShoulder.MaxVelocity = jumpMaxLimbVelocity
  RightShoulder:SetDesiredAngle(3.14)
	LeftShoulder:SetDesiredAngle(-3.14)
	RightHip:SetDesiredAngle(0)
	LeftHip:SetDesiredAngle(0)
end


local function moveFreeFall()
	RightShoulder.MaxVelocity = jumpMaxLimbVelocity
	LeftShoulder.MaxVelocity = jumpMaxLimbVelocity
	RightShoulder:SetDesiredAngle(3.14)
	LeftShoulder:SetDesiredAngle(-3.14)
	RightHip:SetDesiredAngle(0)
	LeftHip:SetDesiredAngle(0)
end

local function moveSit()
	RightShoulder.MaxVelocity = 0.15
	LeftShoulder.MaxVelocity = 0.15
	RightShoulder:SetDesiredAngle(3.14 /2)
	LeftShoulder:SetDesiredAngle(-3.14 /2)
	RightHip:SetDesiredAngle(3.14 /2)
	LeftHip:SetDesiredAngle(-3.14 /2)
end

local function getTool()	
	for _, kid in ipairs(ch:GetChildren()) do
		if kid.className == "Tool" then return kid end
	end
	return nil
end

local function getToolAnim(tool)
	for _, c in ipairs(tool:GetChildren()) do
		if c.Name == "toolanim" and c.className == "StringValue" then
			return c
		end
	end
	return nil
end

local function move(time)
	local amplitude
	local frequency
  
	if (pose == "Jumping") then
		moveJump()
		return
	end

	if (pose == "FreeFall") then
		moveFreeFall()
		return
	end
 
	if (pose == "Seated") then
		moveSit()
		return
	end

	local climbFudge = 0
	
	if (pose == "Running") then
    if (RightShoulder.CurrentAngle > 1.5 or RightShoulder.CurrentAngle < -1.5) then
			RightShoulder.MaxVelocity = jumpMaxLimbVelocity
		else			
			RightShoulder.MaxVelocity = 0.15
		end
		if (LeftShoulder.CurrentAngle > 1.5 or LeftShoulder.CurrentAngle < -1.5) then
			LeftShoulder.MaxVelocity = jumpMaxLimbVelocity
		else			
			LeftShoulder.MaxVelocity = 0.15
		end
		amplitude = 1
		frequency = 9
	elseif (pose == "Climbing") then
		RightShoulder.MaxVelocity = 0.5 
		LeftShoulder.MaxVelocity = 0.5
		amplitude = 1
		frequency = 9
		climbFudge = 3.14
	else
		amplitude = 0.1
		frequency = 1
	end

	desiredAngle = amplitude * math.sin(time*frequency)

	RightShoulder:SetDesiredAngle(desiredAngle + climbFudge)
	LeftShoulder:SetDesiredAngle(desiredAngle - climbFudge)
	RightHip:SetDesiredAngle(-desiredAngle)
	LeftHip:SetDesiredAngle(-desiredAngle)


	local tool = getTool()

	if tool then
	
		animStringValueObject = getToolAnim(tool)

		if animStringValueObject then
			toolAnim = animStringValueObject.Value
			-- message recieved, delete StringValue
			animStringValueObject.Parent = nil
			toolAnimTime = time + .3
		end

		if time > toolAnimTime then
			toolAnimTime = 0
			toolAnim = "None"
		end

		animateTool()

		
	else
		toolAnim = "None"
		toolAnimTime = 0
	end
end


Humanoid.Died:connect(onDied)
Humanoid.Running:connect(onRunning)
Humanoid.Jumping:connect(onJumping)
Humanoid.Climbing:connect(onClimbing)
Humanoid.GettingUp:connect(onGettingUp)
Humanoid.FreeFalling:connect(onFreeFall)
Humanoid.FallingDown:connect(onFallingDown)
Humanoid.Seated:connect(onSeated)
Humanoid.PlatformStanding:connect(onPlatformStanding)
Humanoid.Swimming:connect(onSwimming)

while ch.Parent~=nil do
		local _, time = oldwait(0.1)
	move(time)
end

end
local function chadd(char)
	local hum=funcs.wfcofclass(char,'Humanoid')
	if hum and hum.RigType==Enum.HumanoidRigType.R6 then
		local anim=char:WaitForChild('Animate',10) if getscripthash(anim)=='d8ba6256ecc06b399773a9d2d87b4d6dcb501cd9806796dac755187438a74af7b300d2f9113a2f9755463ababb5c0a89' then if anim then anim.Disabled=true end
		local animtr=funcs.wfcofclass(hum,'Animator') if animtr then for i,v in next,animtr:GetPlayingAnimationTracks() do v:Stop() end end
		coroutine.wrap(ascr)(char,hum) end
	end	
	hum,char=nil,nil
		
end

if funcs.lplr.Character then chadd(funcs.lplr.Character) end
funcs.lplr.CharacterAdded:Connect(chadd)
end
