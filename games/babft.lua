local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local autofarmSeconds = 10

local Window = Fluent:CreateWindow({
    Title = "build a boat script from your garbage",
    SubTitle = "by Frosty",
    TabWidth = 140,
    Size = UDim2.fromOffset(620, 350),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Info", Icon = "info" }),
    Autofarm = Window:AddTab({ Title = "Autofarm", Icon = "scroll" }),
}

local Options = Fluent.Options

Tabs.Main:AddParagraph({
        Title = "info",
        Content = "this is a build a boat for treasure script made by frosty\nenjoy i guess\n\nversion 1.0"
})

Tabs.Main:AddParagraph({
        Title = "credits",
        Content = "scripter: FrostyPandoras / @eternallfrost"
})

local function autofarmer()
    if(Options.autofarmToggle.Value == true) then
        local tweenInfo1 = TweenInfo.new(autofarmSeconds, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
        local tweenInfo2 = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
        local tweenService = game:GetService("TweenService")
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-54.2182083, 20.6637287, -160.283997, -1, 2.8077773e-08, -4.95155916e-07, 8.24063928e-09, 0.999198973, 0.040016979, 4.95882887e-07, 0.040016979, -0.999198973)
        task.wait(0.1)
        tweenService:Create(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, tweenInfo1, {CFrame = CFrame.new(-23.6643219, 42.1960449, 8819.40527, 0, 0, -1, 0, 1, 0, 1, 0, 0)}):Play()
        task.wait(autofarmSeconds+0.1)
        tweenService:Create(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, tweenInfo2, {CFrame = workspace.BoatStages.NormalStages.TheEnd.GoldenChest.Trigger.CFrame}):Play()
    end
end

local autofarmToggle = Tabs.Autofarm:AddToggle("autofarmToggle", {Title = "treasure autofarm", Default = false })

autofarmToggle:OnChanged(function()
    if(Options.autofarmToggle.Value == true) then
        autofarmer()
    end
end)

local autofarmSlider = Tabs.Autofarm:AddSlider("autofarmSlider", {
    Title = "autofarm duration (seconds)",
    Description = "this is a slider for how many seconds it takes to get to the treasure chest",
    Default = 10,
    Min = 1,
    Max = 60,
    Rounding = 0.1,
    Callback = function(Value)
        autofarmSeconds = tonumber(Value)
    end
})

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(character)
    task.wait(1)
    if(Options.autofarmToggle.Value == true) then
        autofarmer()
    end
end)
