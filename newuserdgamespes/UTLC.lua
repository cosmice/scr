local rtb={}
rtb.kb=function(x)
if x.Name=="Boss" and x:IsA("Model") and funcs.wfcofclass(x,"Humanoid") and powersupply.cmds['tk'] then
local mbp=funcs.wfcofclass(funcs.lplr,"Backpack")
mbp=mbp and funcs.wfcofclass(mbp,"Tool",10,false,{['Name']='RealKnife'})
if mbp then mbp.Parent=getchar() mbp=nil end
powersupply.cmds['tk'][1]({},x)
end
end

rtb.kbr=function(x)
if x.Name=="Boss" and x:IsA("Model") and rtb.cboss then
local st=os.clock() ; repeat getchar():PivotTo(rtb.cboss.Parent:GetPivot()) task.wait(1) fireclickdetector(rtb.cboss,3) until not rtb.cboss or workspace:FindFirstChild("Boss") and workspace:FindFirstChild("Boss")~=x or os.clock()-st>10 ; st=nil
end
end
local plug={
['Reservedpluginname']='UTLC:S';
['akillb']={['func']=function() 
if rtb.kbc then rtb.kbc=rtb.kbc:Disconnect() rtb.kbcc=rtb.kbcc:Disconnect() for i,v in pairs(rtb.cbcon) do v:Disconnect() end rtb.cbcon=nil  else rtb.kbc=workspace.ChildAdded:Connect(rtb.kb) rtb.kbcc=workspace.ChildRemoved:Connect(rtb.kbr) for i,v in pairs(workspace:GetChildren()) do rtb.kb(v) end 
rtb.cbcon={} for i,v in pairs(workspace.Doors:GetDescendants()) do if v:IsA("ClickDetector") then table.insert(rtb.cbcon,v.MouseClick:Connect(function() if rtb.cboss~=v then rtb.cboss=v funcs.sendnotif("UTLC:S\\B",rtb.cboss.Parent.Name,rtb.cboss.Parent:FindFirstChildOfClass("Decal").Texture,5) end end)) end end end
funcs.deb:AddItem(workspace:FindFirstChild("Attacks"),0)
funcs.sendnotif("sutpiddumb\\comedygoldhook\\UTLC:S",rtb.kbc and "autokillboss" or "snailmode","",5)
end;['desc']='requires char-manip plugin'}
}
if not powersupply.cmds['tk'] then
funcs.sendnotif('retardhook','hubshitfound - no char-manip plugin 4 dis tho :(',"",5)
end
return plug
