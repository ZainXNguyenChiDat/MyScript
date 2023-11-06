local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "ChiDat-Hub " .. Fluent.Version,
    SubTitle = "By ChiDat",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Transparenct = false,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})



local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "activity" }),
    Shop = Window:AddTab({ Title = "Shop", Icon = "shopping-cart" }),
    Race = Window:AddTab({ Title = "Race V4", Icon = "heart" }),
    Travel = Window:AddTab({ Title = "Travel", Icon = "map-pin" }),
    Others = Window:AddTab({ Title = "Others", Icon = "hexagon" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
}
local Options = Fluent.Options

local mouse = game.Players.LocalPlayer:GetMouse()
 local uis = game:GetService("UserInputService")
 
 if Value == nil then
 Value = set
 pcall(function()
  callback(Value)
  end)
 end

 function hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                -- delfile("NotSameServers.json")
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        -- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end
    function Teleport()
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end
 function AutoHaki()
	if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
	end
end
function topos(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
    pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/210, Enum.EasingStyle.Linear),{CFrame = Pos}) end)
    tween:Play()
    if Distance <= 250 then
        tween:Cancel()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
    end
    if _G.StopTween == true then
        tween:Cancel()
        _G.Clip = false
    end
end

--------------------------------
Tabs.Race:AddButton({
    Title = "Teleport To Timple Of Time",
    Description = "Help you Teleport To Timple Of Time",
    Callback = function()
        Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
    end
})
Tabs.Race:AddButton({
    Title = "Teleport To Lever Pull",
    Callback = function()
        topos(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
    end
})
Tabs.Race:AddButton({
    Title = "Teleport Cyborg Door",
    Description = "Must Be in Temple Of Time",
    Callback = function()
        topos(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
    end
})
Tabs.Race:AddButton({
    Title = "Teleport Fish Door",
    Description = "Must Be in Temple Of Time",
    Callback = function()
        topos(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
    end
})
Tabs.Race:AddButton({
    Title = "Teleport Ghoul Door",
    Description = "Must Be in Temple Of Time",
    Callback = function()
        topos(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))
    end
})
Tabs.Race:AddButton({
    Title = "Teleport Human Door",
    Description = "Must Be in Temple Of Time",
    Callback = function()
        topos(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
    end
})
Tabs.Race:AddButton({
    Title = "Teleport Mink Door",
    Description = "Must Be in Temple Of Time",
    Callback = function()
        topos(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))
    end
})
Tabs.Race:AddButton({
    Title = "Teleport Sky Door",
    Description = "Must Be in Temple Of Time",
    Callback = function()
        topos(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
    end
})


---------------------------------------
Tabs.Shop:AddButton({
    Title = "Buy Black Leg",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
    end
})
Tabs.Shop:AddButton({
    Title = "Buy Electro",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
    end
})
Tabs.Shop:AddButton({
    Title = "Buy Fishman Karate",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    end
})
Tabs.Shop:AddButton({
    Title = "Buy Dragon Claw",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
    end
})
Tabs.Shop:AddButton({
    Title = "Buy Super Human",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
    end
})
Tabs.Shop:AddButton({
    Title = "Buy Death Step",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
    end
})
Tabs.Shop:AddButton({
    Title = "Buy Sharkman Karate",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")

    end
})
Tabs.Shop:AddButton({
    Title = "Buy Electric Claw",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
    end
})
Tabs.Shop:AddButton({
    Title = "Buy Dragon Talon",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
    end
})
Tabs.Shop:AddButton({
    Title = "Buy GodHuman",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
    end
})

--------------------------------
Tabs.Travel:AddButton({
    Title = "Teleport Old World",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
    end
})
Tabs.Travel:AddButton({
    Title = "Teleport Second Sea",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
})
Tabs.Travel:AddButton({
    Title = "Teleport Third Sea",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end
})
--------------------------------
Tabs.Others:AddButton({
    Title = "Rejoin",
    Callback = function()
        local ts = game:GetService("TeleportService")
		local p = game:GetService("Players").LocalPlayer
		ts:Teleport(game.PlaceId, p)
    end
})

Tabs.Others:AddButton({
    Title = "Hop Server",
    Callback = function()
        hop()
    end
})

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)


--SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "ChiDatHub",
    Content = "The script has been loaded.",
    Duration = 8
})


SaveManager:LoadAutoloadConfig()
