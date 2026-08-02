local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local Window = Fluent:CreateWindow({
    Title = "B Hub - Fluent",
    SubTitle = "Discord",
    TabWidth = 160,
    Size = UDim2.fromOffset(560, 360),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" })
}

Tabs.Main:AddButton({
    Title = "Executor",
    Description = "Executor Script",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/script-BHUB/Executor/refs/heads/main/Executor.lua"))()
        end)
        if not success then
            warn(err)
        end
    end
})

Tabs.Main:AddButton({
    Title = "Aimbot hub",
    Description = "Aimbot มีฟังชั่นหลากหลาย",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/script-BHUB/Aimbot-hub/refs/heads/main/Aimbot-hub"))()
        end)
        if not success then
            warn(err)
        end
    end
})

Tabs.Main:AddButton({
    Title = "Script blade ball",
    Description = "417 Auto perry",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/f72223000bf529bfa6b14e7750439a420e465d25399341decd59e10c3d56f217/download"))()
        end)
        if not success then
            warn(err)
        end
    end
})

Tabs.Main:AddButton({
    Title = "Tora lsme Hub",
    Description = "Support game 600+",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/boplsme/Scripts-/refs/heads/main/%5BBETA%5D%20Tora%20Isme%20Hub.txt"))()
        end)
        if not success then
            warn(err)
        end
    end
})

Tabs.Main:AddButton({
    Title = "Script Volleyball legends",
    Description = "Key system in Discord",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FeRk1eOp/fer4ixzlol.hub/refs/heads/main/fer4ixzhub", true))()
        end)
        if not success then
            warn(err)
        end
    end
})

Tabs.Main:AddButton({
    Title = "Murder Mystery 2",
    Description = "MM2 script Keyless",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xv3gasx/Murder-Mystery-2/refs/heads/main/Release.lua"))()
        end)
        if not success then
            warn(err)
        end
    end
})

local ToggleScreenGui = Instance.new("ScreenGui")
ToggleScreenGui.Name = "BHubToggleUI"
ToggleScreenGui.ResetOnSpawn = false
ToggleScreenGui.Parent = playerGui

local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ToggleScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ToggleButton.Position = UDim2.new(0.02, 0, 0.05, 0)
ToggleButton.Size = UDim2.new(0, 65, 0, 45)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Text = "B Hub"
ToggleButton.TextColor3 = Color3.fromRGB(0, 255, 255)
ToggleButton.TextSize = 14
ToggleButton.Active = true
ToggleButton.Draggable = true
Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(0, 10)

local ToggleGlow = Instance.new("UIStroke", ToggleButton)
ToggleGlow.Color = Color3.fromRGB(0, 255, 255)
ToggleGlow.Thickness = 1
ToggleGlow.Transparency = 0.7

local isVisible = true
ToggleButton.MouseButton1Click:Connect(function()
    isVisible = not isVisible
    Window:Minimize()
end)

Fluent:Notify({
    Title = "B Hub Loaded",
    Content = "UI size adjusted successfully!",
    Duration = 5
})
