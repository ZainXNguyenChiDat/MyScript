local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()


  local Window =
            Fluent:CreateWindow(
            {
                Title = "NguyenChiDat [ Update 20 ]",
                SubTitle = "Beta",
                TabWidth = 160,
                Size = UDim2.fromOffset(500, 390),
                Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
                Theme = "Darker",
                MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
            }
        )
           -----
        function Window:NewTab(mmb)
            local domain
            newmm = Window:AddTab(mmb)
            domain = newmm
            function newmm:NewParagraph(cf)
                local paragraphnew
                newTitle = cf.Title or "Sadnessdontsuy"
                newContent = cf.Content or "MMB"
                paragraphnew =
                    domain:AddParagraph(
                    {
                        Content = newContent,
                        Title = newTitle
                    }
                )
                function paragraphnew:Set(cf2)
                    newTitle = cf2.Title or "Sadnessdontsuy"
                    newContent = cf2.Content or "MMB"
                    paragraphnew:SetTitle(newTitle)
                    paragraphnew:SetDesc(newContent)
                end
                return paragraphnew
            end
            function newmm:NewButton(cf)
                cfreal = {}
                cfreal.Title = cf.Title or "Button"
                cfreal.Description = cf.Description or ""
                cfreal.Callback = cf.Callback or function()
                    end
                for i, v in pairs(cfreal) do
                    cf[i] = v
                end
        
                cfreal.V = domain:AddButton(cf)
                return cfreal.V
            end
            function newmm:NewDialog(cf)
                cfreal = {}
                cfreal.Title = cf.Title or ""
                cfreal.Content = cf.Content or ""
                cfreal.Buttons = cf.Buttons or {}
                for i, v in pairs(cfreal) do
                    cf[i] = v
                end
                return Window:Dialog(cf)
            end
            function newmm:NewToggle(sv, cf)
                cfreal = {}
                cfreal.Title = cf.Title or "Toggle"
                cfreal.Description = cf.Description or ""
                cfreal.Default = Config[sv]
                cfreal.Callback = cf.Callback or function()
                    end
                function cfreal:Set(bo)
                    Options[sv]:SetValue(bo)
                end
                for i, v in pairs(cfreal) do
                    cf[i] = v
                end
                cf.Callback = function(v)
                    cfreal.Callback(v)
                    Save()
                end
                fake = domain:AddToggle(sv, cf)
                for i, v in pairs(fake) do
                    if not cfreal[i] then
                        cfreal[i] = v
                    else
                        table.insert(cfreal, v)
                    end
                end
                return fake
            end
            function newmm:NewSlider(scriptitle, cf)
                DFConfig = {
                    Title = "Slider",
                    Description = "",
                    Min = 5,
                    Max = 150,
                    Default = (5 + 150) / 2,
                    Rounding = 1,
                    Callback = function(v)
                    end
                }
                if not Config[scriptitle] then 
                    Config[scriptitle] = cf.Min 
                end
                cf.Default = cf.Default or Config[scriptitle]
                DFConfig.Callback = cf.Callback or function(v)
                end
                for i, v in pairs(DFConfig) do
                    if not cf[i] then
                        cf[i] = v
                    end
                end  
                cf.Callback = function(v)
                    DFConfig.Callback(v)
                    Save()
                end
                DFSCRIPT = domain:AddSlider(scriptitle, cf)
                function DFSCRIPT:Set(v)
                    DFSCRIPT:SetValue(v)
                end
                return DFSCRIPT
            end
            function newmm:NewDropdown(title, cf)
                DefaultConfigDropdown = {
                    Title = "Drodown",
                    Values = {"MMB", "TSUO"},
                    Multi = false,
                    Default = nil
                }
                if cf.Multi then
                    if not Config[title] then
                        Config[title] = {}
                        for i, v in pairs(cf.Values) do
                            Config[title][v] = false
                        end
                    end
                end
                cf.Default = Config[title]
                local dropdown
                local dropdown = domain:AddDropdown(title, cf)
                dropdown:OnChanged(
                    function(cv)
                        pcall(
                            function(cv)
                                Save()
                            end
                        )
                    end
                )
                function dropdown:Set(v)
                    dropdown:SetValue(v)
                end
                return dropdown
            end
            function newmm:NewColorPicker(title, cf)
                DFConfig = {
                    Title = "Colorpicker",
                    Default = Color3.fromRGB(96, 205, 255)
                }
                for i, v in pairs(DefaultConfig) do
                    if not cf[i] then
                        cf[i] = v
                    end
                end
                cf.Callback = function(v)
                    DefaultConfig.Callback(v)
                    Save()
                end
                cf.Defualt = Config[title] or Color3.fromRGB(96, 205, 255)
                cl = domain:AddColorpicker(title, cf)
                function cl:Set(v)
                    cl:SetValueRGB(v)
                end
                return cl
            end
            function newmm:NewKeyBind(title, cf)
                DFConfig = {
                    Title = "gg",
                    Mode = "Toggle",
                    Default = "LeftControl"
                }
                for i, v in pairs(DFConfig) do
                    if not cf[i] then
                        cf[i] = v
                    end
                end
                cf.Callback = function(v)
                    DFConfig.Callback(v)
                    Save()
                end
                DFConfig.Defualt = Config[title]
                kb = domain:AddKeybind(title, cf)
                return kb
            end
            function newmm:NewInput(title, cf)
                DefaultConfig = {
                    Title = "Input",
                    Default = "",
                    Placeholder = "Paste Here",
                    Numeric = false, -- Only allows numbers
                    Finished = true, -- Only calls callback when you press enter
                    Callback = function(Value)
                    end
                }
                DefaultConfig.Defualt = Config[title]
                for i, v in pairs(DefaultConfig) do
                    if not cf[i] then
                        cf[i] = v
                    end
                end
                ip = domain:AddInput(title, cf)
                return ip
            end
            return newmm
        end
        DefaultTab = Window:NewTab({Title = "Settings", Icon = "settings" })
       
---------------------------------
function AutoHaki()
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
end
------------------
DefaultTab:NewToggle("Auto Haki",{
    Title = "Auto Buso",
    Callback = function()
        AutoHaki()
    end
})
spawn(function()
	while wait() do 
        if Config["Auto Haki"] or AutoHaki then 
            AutoHaki()
        end
    end
end)
---------------------------------------
        Window:SelectTab(1)
        Fluent:Notify({
            Title = "Sadnessdontsuy",
            Content = "The script has been loaded.",
            Duration = 8
        })
