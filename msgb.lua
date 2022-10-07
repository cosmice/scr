--[[local bannedgameids={8713127334}
if not table.find(bannedgameids,game.PlaceId) then
if game.CreatorType == Enum.CreatorType.User and game.CreatorId ~= 161531666 or game.CreatorType ~= Enum.CreatorType.User then
local player = funcs.lplr;
local LP = game:GetService('Players').LocalPlayer
local PlayerScripts = LP ~= nil and LP:FindFirstChild('PlayerScripts') or nil
local ChatScript = PlayerScripts ~= nil and PlayerScripts:FindFirstChild('ChatScript') or nil
local ChatMain = ChatScript ~= nil and ChatScript:FindFirstChild('ChatMain') or nil

if LP and ChatMain ~= nil then
    local Old, Chatted, OldChatted = nil, Instance.new('BindableEvent'), LP.Chatted; Chatted.Name = LP.Name..'_Chatted_Event'
    Old = hookmetamethod(game, '__index', newcclosure(function(self, Index)
        if checkcaller() and self == LP and Index == 'Chatted' then
            return Chatted.Event
        elseif not checkcaller() and self == LP and Index == 'Chatted' then
            return OldChatted
        end
   
        return Old(self, Index)
    end))
   
    local Old2, MessagePosted = nil, require(ChatMain).MessagePosted
    if MessagePosted then
        Old2 = hookfunction(MessagePosted.fire, function(self, ...)
            if not checkcaller() then
                return Chatted:Fire(...)
            end
        end)
    end
end--]]
--[[
local player_scripts = funcs.lplr ~= nil and funcs.lplr:FindFirstChild('PlayerScripts')
local chat_script = player_scripts  ~= nil and player_scripts:FindFirstChild('ChatScript')
local chat_main = chat_script ~= nil and chat_script:FindFirstChild('ChatMain')
if chat_main and chat_main:IsA("ModuleScript") then
local mp = require(chat_main).MessagePosted
chat_script,chat_main,player_scripts = nil,nil,nil
local chatted_bindable = Instance.new("BindableEvent");
local chatted_event = chatted_bindable.Event;
local chatted_fire = chatted_bindable.Fire
chatted_bindable.Name = player.Name .. "_Chatted_Event";
getgenv().c_messageposted = mp
getgenv().c_messagepost = function(x)
mp.fire(funcs.lplr,x)
end
local old_function
old_function = hookfunction(mp.fire, function(self, ...)
        if not checkcaller() then
			return chatted_bindable:Fire(...)
       end
			return old_function(self,...)
end)--]]
--[[
local old_namecall
old_namecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
   if self.Name == "MessagePosted" and not checkcaller() and getnamecallmethod() == "Fire" then
   print(checkcaller())
       return old_namecall(chatted_bindable, ...);
   end;
 
   return old_namecall(self, ...);
end));--]]
--[[
local old_index;
old_index = hookmetamethod(game, "__index", function(self, index)
   if self == funcs.lplr and index == "Chatted" then
       return chatted_event;
   end;
 
   return old_index(self, index);
end);
print("en")
print("bp status: on")
end
end

end--]]
-- // Wait for the game to load

-- // Services

-- // Vars
local ChatMain = funcs.lplr:WaitForChild("PlayerScripts",10):WaitForChild("ChatScript"):WaitForChild("ChatMain")


-- // Locate the MessagePosted BindableEvent
local MessagePostedEvent
--[[for _, object in ipairs(getgc(true)) do
    -- // Make sure is a table
    if (type(object) ~= "table") then
        continue
    end

    -- // Make sure has all of the stuff and matches
    local MessagePosted = rawget(object, "MessagePosted")
    if (not MessagePosted) then
        continue
    end

    local Fire = rawget(MessagePosted, "fire")
    if (not Fire) then
        continue
    end

    local FunctionScript = getfenv(Fire).script
    if (FunctionScript ~= ChatMain) then
        continue
    end

    -- // Get the event
    for _, Event in ipairs(debug.getupvalues(Fire)) do
        if (typeof(Event) == "Instance") then
            MessagePostedEvent = Event
        end
    end
end--]]
for _, object in next, getgc(true) do
    if type(object) ~= "table" then continue end
    local MessagePosted = rawget(object, "MessagePosted")
    if not MessagePosted then continue end
    local Fire = rawget(MessagePosted, "fire")
    if not Fire then continue end
    local FunctionScript = getfenv(Fire).script
    if FunctionScript ~= ChatMain then continue end
    for _, Event in next, debug.getupvalues(Fire) do
        if typeof(Event) == "Instance" then
            MessagePostedEvent = Event
        end
    end
end

-- //
local bannable={10201298018,10162018620,112420803,115670532}
getgenv().msgb=true
local __namecall
__namecall = hookmetamethod(game,"__namecall", function(self,...)
    -- // Vars
    local method = getnamecallmethod()

    -- // Make sure Synapse is not firing this
    if not checkcaller() then
        -- // Vars
        local selfstring = tostring(self)

        -- // SayMessageRequest method
        if (method == "FireServer" and selfstring == "SayMessageRequest" and tostring(getcallingscript()) ~= "ChatMain") and not table.find(bannable,game.PlaceId) then
            print("Game tried to chat for the player through the SayMessageRequest remote event. Attempt denied.")
            return
        end

        -- // CaptureFocus method
        if (method == "CaptureMethod" and selfstring == "ChatBar") then
            print("Game tried to send a legit message through the chat as the local player via capturing the chat focus. Attempt denied")
            return
        end

        -- // ReportAbuse method
        if (method == "ReportAbuse" and self == funcs.plrs) then
            print("Game tried to report the player. Attempt denied")
            return
        end

        -- // MessagePosted Fire method
        if (method == "Fire" and self == MessagePostedEvent) and not table.find(bannable,game.PlaceId) and getgenv().msgb then
            --print("Game tried using the MessagePosted bindable event. Attempt denied.")
            return
        end
    end

    -- // Return
    return __namecall(self, ...)
end)
print(MessagePostedEvent~=nil and "en" or "cb-disabled")
