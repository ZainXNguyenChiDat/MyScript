local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window("discord library")

local serv = win:Server("Preview", "")

local btns = serv:Channel("Buttons")

btns:Button("Kill all", function()
DiscordLib:Notification("Notification", "Killed everyone!", "Okay!")
end)

btns:Seperator()

btns:Button("Get max level", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
end)

local tgls = serv:Channel("Toggles")

tgls:Toggle("Auto Haki",false, function(bool)
    spawn(function()
        while wait() do
            if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
            end
        end
    end)
end

local sldrs = serv:Channel("Sliders")

local sldr = sldrs:Slider("Slide me!", 0, 1000, 400, function(t)
print(t)
end)

sldrs:Button("Change to 50", function()
sldr:Change(50)
end)

local drops = serv:Channel("Dropdowns")


local drop = drops:Dropdown("Pick me!",{"Option 1","Option 2","Option 3","Option 4","Option 5"}, function(bool)
print(bool)
end)

drops:Button("Clear", function()
drop:Clear()
end)

drops:Button("Add option", function()
drop:Add("Option")
end)

local clrs = serv:Channel("Colorpickers")

clrs:Colorpicker("ESP Color", Color3.fromRGB(255,1,1), function(t)
print(t)
end)

local textbs = serv:Channel("Textboxes")

textbs:Textbox("Gun power", "Type here!", true, function(t)
print(t)
end)

local lbls = serv:Channel("Labels")

lbls:Label("This is just a label.")

local bnds = serv:Channel("Binds")

bnds:Bind("Kill bind", Enum.KeyCode.RightShift, function()
print("Killed everyone!")
end)

serv:Channel("by dawid#7205")


win:Server("Main", "http://www.roblox.com/asset/?id=6031075938")
