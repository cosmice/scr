local tb={
[10201298018]='https://raw.githubusercontent.com/6yNuiC9/scr/main/newuserdgamespes/vh2-r.lua';
[198817751]='https://raw.githubusercontent.com/6yNuiC9/scr/main/newuserdgamespes/vh2.lua';
[11305669230]='https://raw.githubusercontent.com/6yNuiC9/scr/main/newuserdgamespes/UTLC.lua'
}
tb=tb[game.PlaceId]
if type(tb)=='function' then return tb() elseif type(tb)=='string' then powersupply.ldplug(tb) return end
return tb
