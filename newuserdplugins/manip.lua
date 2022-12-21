--Only True Love Is Yandere Love
--In Mighty Flowers Our Poor Hearts Will Bloom
local vrs={}
vrs.chngvhcp=function(strt,nn,str,cmd,arg)
local tmp={} nn=nn and tonumber(nn) if nn then tmp.hum=getchar('Humanoid',true) tmp.hum=tmp.hum and tmp.hum.SeatPart if tmp.hum:IsA('VehicleSeat') then tmp.hum[arg]=nn end end
end
local cc={
['vhspeed']={['desc']='vehicleular mal- vehicle speed',['func']=vrs.chngvhcp,['args']='MaxSpeed'},
['vhtorque']={['desc']='VEHICULAR MALFUNCTION!!- change vehicle torque (the greater the number, the faster it will reach the maximum speed -roblox)',['func']=vrs.chngvhcp,['args']='Torque'},
['vhsteerp']={['desc']='chng vhcle steerfloat',['func']=vrs.chngvhcp,['args']='SteerFloat'},
['Reservedpluginname']='manipulation.manipulation!!'
}

return cc
