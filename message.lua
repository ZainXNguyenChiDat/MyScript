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
    spawn(function()
        while wait() do
            if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
            end
        end
    end)
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


spawn(function()
	pcall(function()
		game:GetService("RunService").Stepped:Connect(function()
		  	if _G.Auto_Farm_Level or _G.Auto_New_World or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.Auto_Third_World or _G.Auto_Farm_Chest or _G.TeleportIsland or _G.Auto_Farm_Boss or _G.Autotushita or _G.Auto_Elite_Hunter or _G.Auto_Cake_Prince or _G.Auto_Farm_All_Boss or _G.Auto_Saber or _G.Auto_Pole or _G.Auto_Farm_Scrap_and_Leather or _G.Auto_Farm_Angel_Wing or _G.Auto_Factory_Farm or _G.Auto_Farm_Ectoplasm or _G.Auto_Bartilo_Quest or _G.Auto_Rengoku or _G.Auto_Farm_Radioactive or _G.Auto_Farm_Vampire_Fang or _G.Auto_Farm_Mystic_Droplet or _G.Auto_Farm_GunPowder or _G.Auto_Farm_Dragon_Scales or _G.Auto_Evo_Race_V2 or _G.Auto_Swan_Glasses or _G.Auto_Dragon_Trident or _G.Auto_Soul_Reaper or _G.Auto_Farm_Fish_Tail or _G.Auto_Farm_Mini_Tusk or _G.Auto_Farm_Magma_Ore or _G.Auto_Farm_Bone or _G.Auto_Farm_Conjured_Cocoa or _G.Auto_Open_Dough_Dungeon or _G.Auto_Rainbow_Haki or _G.Auto_Musketeer_Hat or _G.Auto_Holy_Torch or _G.Auto_Canvander or _G.d or _G.Auto_Twin_Hook or _G.Auto_Serpent_Bow or _G.AutoFarmMaterial or _G.Auto_Fully_Death_Step or _G.Auto_Fully_SharkMan_Karate or _G.Teleport_to_Player or _G.Auto_Kill_Player_Melee or _G.Auto_Kill_Player_Gun or _G.Start_Tween_Island or _G.Auto_Next_Island or _G.autoraid or AutoNextIsland or _G.Auto_Farm_Sword or _G.MeleeFarm or _G.AutoFarmSelectMonster or _G.AutoFarmKenHakivor or _G.AutoObservationHakiV2 or _G.GunMastery or _G.AutoFactory or _G.Mastery or _G.Auto_Kill_Law then
			 	if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
					local Noclip = Instance.new("BodyVelocity")
					Noclip.Name = "BodyClip"
					Noclip.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
					Noclip.MaxForce = Vector3.new(100000,100000,100000)
					Noclip.Velocity = Vector3.new(0,0,0)
			 	end
		  	else	
			 	if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
					game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
			 	end
		  	end
		end)
	end)
end)
 
spawn(function()
	pcall(function()
		game:GetService("RunService").Stepped:Connect(function()
			if _G.Auto_Farm_Level or _G.Auto_New_World or _G.TeleportIsland or _G.Auto_Third_World or _G.Auto_Farm_Chest or _G.Auto_Farm_Boss or _G.GunMastery or _G.Mastery or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.Auto_Elite_Hunter or _G.AutoFarmKenHaki or _G.AutoFactory or _G.AutoFarmSelectMonster or _G.Auto_Cake_Prince or _G.Auto_Farm_All_Boss or _G.Auto_Saber or _G.Auto_Pole or _G.Auto_Farm_Scrap_and_Leather or _G.Auto_Farm_Angel_Wing or _G.Auto_Factory_Farm or _G.Auto_Farm_Ectoplasm or _G.Auto_Bartilo_Quest or _G.d or _G.Auto_Rengoku or _G.Autotushita or _G.Auto_Farm_Radioactive or _G.Auto_Farm_Vampire_Fang or _G.Auto_Farm_Mystic_Droplet or _G.Auto_Farm_GunPowder or _G.Auto_Farm_Dragon_Scales or _G.Auto_Evo_Race_V2 or _G.Auto_Swan_Glasses or _G.Auto_Dragon_Trident or _G.Auto_Soul_Reaper or _G.Auto_Farm_Fish_Tail or _G.Auto_Farm_Mini_Tusk or _G.Auto_Farm_Magma_Ore or _G.Auto_Farm_Bone or _G.Auto_Farm_Conjured_Cocoa or _G.Auto_Open_Dough_Dungeon or _G.Auto_Rainbow_Haki or _G.Auto_Musketeer_Hat or _G.Auto_Holy_Torch or _G.Auto_Canvander or _G.AutoFarmMaterial or _G.autoraid or _G.Auto_Twin_Hook or AutoNextIsland or _G.Auto_Serpent_Bow or _G.Auto_Fully_Death_Step or _G.Auto_Fully_SharkMan_Karate or _G.Teleport_to_Player or _G.Auto_Kill_Player_Melee or _G.Auto_Kill_Player_Gun or _G.Start_Tween_Island or _G.AutoObservationHakiV2 or _G.d or _G.Auto_Next_Island or _G.Auto_Farm_Sword or _G.MeleeFarm or _G.Auto_Kill_Law then
				for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false    
					end
				end
			end
		end)
	end)
end)


spawn(function()
	while wait() do
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
			if v:IsA("Tool") then
				if v:FindFirstChild("RemoteFunctionShoot") then 
					SelectToolWeaponGun = v.Name
				end
			end
		end
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
			if v:IsA("Tool") then
				if v:FindFirstChild("RemoteFunctionShoot") then 
					SelectToolWeaponGun = v.Name
				end
			end
		end
	end
end)

spawn(function()
	local gg = getrawmetatable(game)
	local old = gg.__namecall
	setreadonly(gg,false)
	gg.__namecall = newcclosure(function(...)
		local method = getnamecallmethod()
		local args = {...}
		if tostring(method) == "FireServer" then
			if tostring(args[1]) == "RemoteEvent" then
				if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
					if UseSkillMasteryDevilFruit then
						args[2] = PositionSkillMasteryDevilFruit
						return old(unpack(args))
					elseif AimSkillNearest then
						args[2] = AimBotSkillPosition
						return old(unpack(args))
					end
				end
			end
		end
		return old(...)
	end)
end)

spawn(function()
	game:GetService("RunService").RenderStepped:Connect(function()
        if UseGun then
			pcall(function()
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == Ms then
						local args = {
							[1] = "TAP",
							[2] = v.HumanoidRootPart.Position
						}
						
						game:GetService("Players").LocalPlayer.Character.Humanoid:FindFirstChild("Soul Guitar"):InvokeServer(unpack(args))
                        local args = {
                            [1] = v.HumanoidRootPart.Position,
                            [2] = v.HumanoidRootPart
                        }
                        game:GetService("Players").LocalPlayer.Character[SelectToolWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
                    end
                end
            end)
        end
    end)
end)

spawn(function()
	game:GetService("RunService").RenderStepped:Connect(function()
        if UseGunKillPlayer then
			pcall(function()
                for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
                    if v.Name == _G.Select_Player then
                        local args = {
                            [1] = v.HumanoidRootPart.Position,
                            [2] = v.HumanoidRootPart
                        }
                        game:GetService("Players").LocalPlayer.Character[SelectToolWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
                    end
                end
            end)
        end
    end)
end)

local lp = game:GetService('Players').LocalPlayer
local mouse = lp:GetMouse()
spawn(function()
	while wait() do
		if _G.Aimbot_Skill_Fov then
			pcall(function()
				local MaxDist, Closest = math.huge
				for i,v in pairs(game:GetService("Players"):GetChildren()) do 
					local Head = v.Character:FindFirstChild("HumanoidRootPart")
					local Pos, Vis = game.Workspace.CurrentCamera.WorldToScreenPoint(game.Workspace.CurrentCamera, Head.Position)
					local MousePos, TheirPos = Vector2.new(mouse.X, mouse.Y), Vector2.new(Pos.X, Pos.Y)
					local Dist = (TheirPos - MousePos).Magnitude
					if Dist < MaxDist and Dist <= _G.Select_Size_Fov and v.Name ~= game.Players.LocalPlayer.Name then
						MaxDist = Dist
						_G.Aim_Players = v
					end
				end
			end)
		end
	end
end)

spawn(function()
	local gg = getrawmetatable(game)
	local old = gg.__namecall
	setreadonly(gg,false)
	gg.__namecall = newcclosure(function(...)
		local method = getnamecallmethod()
		local args = {...}
		if tostring(method) == "FireServer" then
			if tostring(args[1]) == "RemoteEvent" then
				if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
					if _G.Aimbot_Skill_Fov then
						args[2] = _G.Aim_Players.Character.HumanoidRootPart.Position
						return old(unpack(args))
					end
				end
			end
		end
		return old(...)
	end)
end)

--------------------------------
spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
     pcall(function()
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if _G.Auto_Farm_Ectoplasm and StartMagnetEctoplasm and string.find(v.Name, "Ship") and (v.HumanoidRootPart.Position - PosMonEctoplasm.Position).magnitude <= 350 then
      v.HumanoidRootPart.CFrame = PosMonEctoplasm
      v.HumanoidRootPart.CanCollide = false
      v.HumanoidRootPart.Size = Vector3.new(50,50,50)
      if v.Humanoid:FindFirstChild("Animator") then
      v.Humanoid.Animator:Destroy()
      end
      sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
      end
      end
      end)
     end)
    end)
   
   spawn(function()
    while wait() do
    if _G.Auto_Farm_Ectoplasm then
    pcall(function()
     if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand [Lv. 1250]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer [Lv. 1275]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward [Lv. 1300]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer [Lv. 1325]") then
     for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
     if string.find(v.Name, "Ship") then
     repeat wait()
     AutoHaki()
     EquipWeapon(_G.Select_Weapon)
     PosMonEctoplasm = v.HumanoidRootPart.CFrame
     v.HumanoidRootPart.CanCollide = false
     v.HumanoidRootPart.Size = Vector3.new(50,50,50)
     topos(v.HumanoidRootPart.CFrame * MethodFarm)
     StartMagnetEctoplasm = true
     game:GetService'VirtualUser':CaptureController()
     game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
     until _G.Auto_Farm_Ectoplasm == false or not v.Parent or v.Humanoid.Health <= 0
     StartMagnetEctoplasm = false
     else
      StartMagnetEctoplasm = false
     topos(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875))
     end
     end
     else
      StartMagnetEctoplasm = false
     local Distance = (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
     if Distance > 20000 then
     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
     end
     topos(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875))
     end
     end)
    end
    end
    end)
   
   spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
     pcall(function()
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if _G.Auto_Farm_Bone and StartMagnetBoneMon and (v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]") and (v.HumanoidRootPart.Position - PosMonBone.Position).magnitude <= 350 then
      v.HumanoidRootPart.CFrame = PosMonBone
      v.HumanoidRootPart.CanCollide = false
      v.HumanoidRootPart.Size = Vector3.new(50,50,50)
      if v.Humanoid:FindFirstChild("Animator") then
      v.Humanoid.Animator:Destroy()
      end
      sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
      end
      end
      end)
     end)
    end)

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Auto Haki", Default = false })

Toggle:OnChanged(function()
    AutoHaki()
end)

Options.MyToggle:SetValue(true)

local Toggle1 = Tabs.Main:AddToggle("MyToggle", {Title = "Farm Attack", Default = false })

Toggle:OnChanged(function(value)
    _G.FastAttack = value
end)

Options.MyToggle:SetValue(false)

xShadowFastAttackx = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)

xShadowx = debug.getupvalues(xShadowFastAttackx)[2]

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.FastAttack then
            if typeof(xShadowx) == "table" then
                pcall(function()
                    xShadowx.activeController.timeToNextAttack = (math.huge^math.huge^math.huge)
                    xShadowx.activeController.timeToNextAttack = 0
                    xShadowx.activeController.hitboxMagnitude = 200
                    xShadowx.activeController.active = false
                    xShadowx.activeController.timeToNextBlock = 0
                    xShadowx.activeController.focusStart = 0
                    xShadowx.activeController.increment = 4
                    xShadowx.activeController.blocking = false
                    xShadowx.activeController.attacking = false
                    xShadowx.activeController.humanoid.AutoRotate = 50
                end)
            end
        end
    end)
end)

local Toggle2 = Tabs.Main:AddToggle("MyToggle", {Title = "Farm Near Mode", Default = false })

Toggle:OnChanged(function()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name and v:FindFirstChild("Humanoid") then
        if v.Humanoid.Health > 0 then
        repeat game:GetService("RunService").Heartbeat:wait()
        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
        local args = {
         [1] = "Buso"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
        PosMon = v.HumanoidRootPart.CFrame
       v.HumanoidRootPart.CanCollide = false
       v.Humanoid.WalkSpeed = 0
       v.Head.CanCollide = false
       v.HumanoidRootPart.Size = Vector3.new(60,60,60)
       StartMagnet = false
       topos(v.HumanoidRootPart.CFrame * MethodFarm)
       game:GetService'VirtualUser':CaptureController()
       game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
        StartMagnet = true
        PosMon = v.HumanoidRootPart.CFrame
        until not _G.Auto_Farm_Level or not v.Parent or v.Humanoid.Health == 0 or not game.Workspace.Enemies:FindFirstChild(v.Name)
        end
              end
          end
      end
      end
      end
      end)
Options.MyToggle:SetValue(false)

----------------------------------------
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


SaveManager:IgnoreThemeSettings()

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
