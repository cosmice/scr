--Only True Love Is Yandere Love
--In Mighty Flowers Our Poor Hearts Will Bloom
local vrs={}
vrs.chngvhcp=function(strt,nn,str,cmd,arg)
nn=nn and tonumber(nn) if nn then local hum=getchar('Humanoid',true) hum=hum and hum.SeatPart if hum and hum:IsA('VehicleSeat') then hum[arg]=nn end end
end
local cc={
['vhspeed']={['desc']='vehicleular mal- vehicle speed',['func']=vrs.chngvhcp,['args']='MaxSpeed'},
['vhtorque']={['desc']='VEHICULAR MALFUNCTION!!- change vehicle torque (the greater the number, the faster it will reach the maximum speed -roblox)',['func']=vrs.chngvhcp,['args']='Torque'},
['vhsteerp']={['desc']='chng vhcle steerfloat',['func']=vrs.chngvhcp,['args']='SteerFloat'},
['vhturn']={['desc'='description~ being: turn speed vehciluar changing!!',['func']=vrs.chngvhcp,['args']='TurnSpeed'},
['Reservedpluginname']='manipulation.manipulation!!'
}

return cc
