local tb={
[10201298018]='https://raw.githubusercontent.com/6yNuiC9/scr/main/newuserdgamespes/vh2-r.lua';
[198817751]='https://raw.githubusercontent.com/6yNuiC9/scr/main/newuserdgamespes/vh2.lua';
[11305669230]='https://raw.githubusercontent.com/6yNuiC9/scr/main/newuserdgamespes/UTLC.lua';
[9928218161]='https://raw.githubusercontent.com/6yNuiC9/scr/main/newuserdgamespes/NightOfNights.lua'
}
tb=tb[game.PlaceId]
if type(tb)=='function' then return tb() elseif type(tb)=='string' then local fun=loadstring(game:HttpGet(tb)) setfenv(fun,getfenv()) fun=fun() return fun end
return tb
