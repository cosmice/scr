--baddie blocklist
getgenv().BlockedRemotes = {
    "RagdollEvent",
	"FallDamage",
	"SetHP",
	"WalkSpeedChanged",
	"AFK",
--	"reportPlatform",
	"ye"
} --// block, spoof, {remove} (wip)
local gmargs={
[2788229376]={MainEvent={actiontype="block","TeleportDetect",1,"CHECKER_1",1,"OneMoreTime",1},SpoofStudio=true,anticrash=true	},
[9115994499]={reportPlatform={actiontype="spoof","Mobile",1}	},
[9143982021]={RemoteEvent={actiontype="block",CheckParent="ItemGui","cloud",1}	}
}

local getnamecallmethod = getnamecallmethod
local checkcaller = checkcaller
local ffind=table.find
local plid=game.PlaceId
local oldNamecall
if gmargs[plid] and gmargs[plid].anticrash then
task.delay(16,function()
game:GetService("ScriptContext"):SetTimeout(1/15)
funcs.sendnotif("h","ready")
end)
end
oldNamecall = hookmetamethod(game, "__namecall", function(instance, ...)
local ncm = getnamecallmethod()
local args={...}
local gmarg=gmargs[plid]~=nil and gmargs[plid][instance.Name]
		if instance==funcs.runs and gmargs[plid] and gmargs[plid].SpoofStudio and ncm=="IsStudio" then
		return true
		elseif ffind(BlockedRemotes,instance.Name) and (ncm == "FireServer" or ncm == "InvokeServer") and not checkcaller() then
        return -- FireServer() doesn't return anything, so usually there's no need to wait(9e9), unless you're trying to block a ban remote that crashes your game afterwards
		elseif not checkcaller() and gmarg and (ncm=="FireServer" or ncm=="InvokeServer") then
		if gmarg.CheckParent and instance.Parent.Name==gmarg.CheckParent or not gmarg.CheckParent then
		if gmarg.actiontype=="block" then
		for i=1,#gmarg,2 do
		local found=ffind(args,gmarg[i])
		if found and found==gmarg[i+1] then
		--print("attempted")
		return
		end
		end
		elseif gmarg.actiontype=="spoof" then
		for i=1,#gmarg,2 do
		args[gmarg[i+1]]=gmarg[i]
		end
		
		end
		
		end
		
		end
		
        

        return oldNamecall(instance, table.unpack(args))
end)
