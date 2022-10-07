local vars={}
vars.funcs={}
	vars.funcs.ft=function(v,nn)
	firetouchinterest(getchar(nil,nil,nn):FindFirstChildWhichIsA("BasePart") or getchar(nil,nil,nn):FindFirstChildWhichIsA("MeshPart"),v.Parent,0) firetouchinterest(getchar(nil,nil,nn):FindFirstChildWhichIsA("BasePart") or getchar(nil,nil,nn):FindFirstChildWhichIsA("MeshPart"),v.Parent,1)
	end
	
	
	
	
local plug={
["msgb"]={["func"]=function() getgenv().msgb=not getgenv().msgb funcs.sendnotif("uncat/msgb",getgenv().msgb and ":flushed:" or "dumbfuck","",8 end};
["ftouchinterests"]={["func"]=function(strt,nn) nn=nn and funcs.xgetplr(nn,true) or funcs.lplr ; for i,v in pairs(workspace:GetDescendants()) do if v:IsA("TouchTransmitter") then task.spawn(vars.funcs.ft,v,nn) end if i%3 then task.wait() end end end;["desc"]="dumbass";["aliases"]={["firetouchinterests"]='ftouchinterests';["fti"]="ftouchinterests"}};
["fcd"]={["func"]=function() 
for i,v in pairs(workspace:GetDescendants()) do
if v:IsA("ClickDetector") then 
fireclickdetector(v) end if i%3==0 then task.wait() end 
end 
end;["desc"]="firecd"};
["Reservedpluginname"]="uncat"
}
return plug
