if not powersupply.gnn.Plugsloaded then powersupply.gnn.plugsloaded.Event:Wait() end
if powersupply.cmds['pgsave'] then
powersupply.cmds['pgsave'][1](nil,'base')
end
