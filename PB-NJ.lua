local clonefunction=clonefunction(clonefunction)
local modif_funcs={}

modif_funcs.req=clonefunction(syn.request)
--modif_funcs.islclosure=clonefunction(islclosure)
--modif_funcs.oldhf=clonefunction(hookfunction)
--modif_funcs.clonefunction=clonefunction(clonefunction)
local checkcaller=clonefunction(checkcaller)
local print=clonefunction(print) --prevent scripts attempting to log logs
local type=clonefunction(type)
local ffind=clonefunction(table.find)
local concat=clonefunction(table.concat) --prevent scripts manipulating globals to break firewall
local rawget=clonefunction(rawget)
local rawset=clonefunction(rawset)
local remve=clonefunction(table.remove)
local fe=clonefunction(table.foreach)
local ww=clonefunction(task.wait)
local pairs=clonefunction(pairs)
local typeof=clonefunction(typeof)
local unpack=clonefunction(unpack)
local hookfunction=clonefunction(hookfunction)
local hashfunc=clonefunction(syn.crypt.hash)
local getgenv=clonefunction(getgenv)
local hookmetamethod=clonefunction(hookmetamethod)
local getn=clonefunction(table.getn)
local tbi=clonefunction(table.insert)
local setreadonly=clonefunction(setreadonly)
local rndmmath=clonefunction(math.random)
local shar=clonefunction(string.char)
local getnamecallmethod=clonefunction(getnamecallmethod)
--local dothetostring=clonefunction(tostring)
local glen=clonefunction(string.len)

local srvs={["http"]=game:GetService("HttpService");["rhttp"]=game:GetService('HttpRbxApiService');["ky"]=''} --script should be ran at runtime before any other so we can safely cache services normally.
local rawm=getrawmetatable(game)
local indr=clonefunction(rawm.__index)
local rnind=clonefunction(rawm.__newindex)
--local rf=function(bx,x) for i,v in pairs(bx) do if rawequal(v,x) then return i end end end
modif_funcs.modif={}
modif_funcs.modif.req=newcclosure(function(...) local args={...} if type(rawget(arg,1))=='string' and hashfunc(rawget(arg,1))==rawget(srvs,'ky') then remve(args,1) args=unpack(args) print("request succeeded: ",args) rawget(modif_funcs,'req')(args) else print("request attempted: ",...) return true end end)
--modif_funcs.modif.islclosure=function(x,...) if x and rf(modif_funcs.modif,x) then return false else modif_funcs.islclosure(x,...) end end
--modif_funcs.modif.clonefunction=newcclosure(function(x,...) if x and rf(modif_funcs.modif,x) then local nn=modif_funcs.clonefunction tbi(modif_funcs.modif,nn) return nn else return modif_funcs.clonefunction(x,...) end end)
--modif_funcs.modif.hookfunction=function(gaslight,...) local inn=gaslight and rf(modif_funcs,gaslight)  if inn then gaslight=modif_funcs.modif[inn] print(inn.."has been hookfunctioned") end return modif_funcs.oldhf(gaslight,...) end

modif_funcs.toradora={}
modif_funcs.superprotnms={}
modif_funcs.protinst={}
modif_funcs.superprotinst={}
modif_funcs.propn={}
--modif_funcs.sinnerstring={}
modif_funcs.modif.newprot=function(x,y,sy)
tbi(rawget(modif_funcs,'protinst'),indr(x,y))
rawset(rawget(modif_funcs,'toradora'),y,hookfunction(indr(x,y),newcclosure(function(...)
if checkcaller() and x and ffind(rawget(modif_funcs,'protinst'),indr(x,y)) then print(...) return true end
return rawget(rawget(modif_funcs,'toradora'),y)(...)
end)))
if not ffind(rawget(modif_funcs,'superprotnms'),y) then tbi(rawget(modif_funcs,'superprotnms'),y) end
end 
modif_funcs.modif.blockins=function(x,y)
if not ffind(rawget(modif_funcs,'superprotinst'),indr(x,y)) then  
--tbi(rawget(modif_funcs,'protinst'),x)
tbi(rawget(modif_funcs,'superprotinst'),indr(x,y))
--tbi(rawget(modif_funcs,'propn'),y) 
end
end
modif_funcs.modif.pureblock=function(x,y)
if not ffind(rawget(modif_funcs,'superprotinst'),indr(x,y)) then tbi(rawget(modif_funcs,'propn'),y)
tbi(rawget(modif_funcs,'protinst'),x)
tbi(rawget(modif_funcs,'superprotinst'),indr(x,y)) end
end
modif_funcs.modif.newprot(game,'HttpPostAsync')
modif_funcs.modif.newprot(game,'HttpGetAsync')
modif_funcs.modif.newprot(game,'HttpGet')
modif_funcs.modif.newprot(game,'HttpPost')
modif_funcs.modif.blockins(game,'ScreenshotReady')
modif_funcs.modif.newprot(rawget(srvs,'http'),'PostAsync')
modif_funcs.modif.newprot(rawget(srvs,'http'),'GetAsync') -- attempt to block PI revealing functions/events
modif_funcs.modif.newprot(rawget(srvs,'http'),'RequestAsync')
modif_funcs.modif.newprot(rawget(srvs,'rhttp'),'RequestAsync')
modif_funcs.modif.newprot(rawget(srvs,'rhttp'),'RequestLimitedAsync')
modif_funcs.modif.newprot(rawget(srvs,'rhttp'),'PostAsyncFullUrl')
modif_funcs.modif.newprot(rawget(srvs,'rhttp'),'PostAsync')
modif_funcs.modif.newprot(rawget(srvs,'rhttp'),'GetAsync')
modif_funcs.modif.newprot(rawget(srvs,'rhttp'),'GetAsyncFullUrl')
print('step 1 - request block ; loaded')
print(not getgenv().islclosure(getgenv().syn.request) and "spoof: [syn.request] succeeded" or "spoof: [syn.request] failed")

if not game:IsLoaded() then game.Loaded:Wait() end

modif_funcs.modif.blockins(game:GetService'Players'.LocalPlayer or game:GetService'Players':GetPropertyChangedSignal('LocalPlayer'):Wait(),'Name')
modif_funcs.modif.blockins(game:GetService'Players'.LocalPlayer,'DisplayName')

print('step 2 - property spoof ; loaded')

if getn(rawget(modif_funcs,'superprotinst'))>0 then
local function rndmstr(minim,lenim)
local array = {}
	local length = rndmmath(minim or 10,lenim or 20)
	for i = 1, length do
		rawset(array,i,shar(rndmmath(32, 126)))
	end
	array=concat(array)
	local rndm=rndmmath(1,4);
	if rndm==1 then
		array=array..dothetostring(rndmmath(1,9999999))
	elseif rndm==2 then
		array=dothetostring(rndmmath(1,9999999))..array
	end
return array
end

local newinsh
newinsh=hookmetamethod(game,'__index',newcclosure(function(x,y,...)
local cach=newinsh(x,y,...)
if checkcaller() and cach and y and x and (ffind(rawget(modif_funcs,'superprotinst'),cach) or ffind(rawget(modif_funcs,'protinst'),x) and ffind(rawget(modif_funcs,'propn'),y) ) then
print('attemped ind prot inst: '..y)
if type(cach)=='string' then return rndmstr(5,30) else
return end
end

return cach
end))
local ongp=getproperties
getgenv().getproperties=newcclosure(function(x,...)
local ins=ongp(x,...)
if not x or not ffind(rawget(modif_funcs,'protinst'),x) then return ins end
for unholy,sinner in pairs(ins) do
if ffind(rawget(modif_funcs,'propn'),unholy) or ffind(rawget(modif_funcs,'superprotinst'),sinner) then  
local sin=type(sinner)
if sin=='string' then rawset(ins,unholy,rndmstr(4,glen(sinner))) elseif sin=='number' then rawset(ins,unholy,rndmmath(1,148541421)) end
end
end
return ins
end)

end

local oem
oem=hookmetamethod(game,'__namecall',newcclosure(function(x,anacalmonds,...)
local nmc=getnamecallmethod()
if checkcaller() and nmc and indr(x,nmc) and ffind(rawget(modif_funcs,'superprotnms'),nmc) and (not anacalmonds or not type(anacalmonds)=='string' or hashfunc(anacalmonds)~=rawget(srvs,'ky')) then --rawget to prevent .__index spying on firewall
print('attempt on life: '..nmc..'     ..First Five Years Of Life')
return true
end
return oem(x,anacalmonds,...)
end))
setreadonly(syn,false)
getgenv().syn.request=modif_funcs.modif.req
setreadonly(syn,true)
--getgenv().islclosure=modif_funcs.modif.islclosure
--getgenv().clonefunction=modif_funcs.modif.clonefunction
--getgenv().hookfunction=modif_funcs.modif.hookfunction
--hookfunction(srvs.http.PostAsync,newcclosure(modif_funcs.modif.postasync))
print('PrivacyBlock v2.1 loaded (nobuiz requests blocked, properties spoofed.)')
