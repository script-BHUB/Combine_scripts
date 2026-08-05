local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

if playerGui:FindFirstChild("BHubSupremeUI") then
    playerGui.BHubSupremeUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BHubSupremeUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 999999999
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function()
    ScreenGui.Parent = game:GetService("CoreGui")
end)

if not ScreenGui.Parent then
    ScreenGui.Parent = playerGui
end

local Window = Fluent:CreateWindow({
    Title = "B Hub - Fluent",
    SubTitle = "UI",
    TabWidth = 160,
    Size = UDim2.fromOffset(560, 315),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    BoostFps = Window:AddTab({ Title = "Boost fps", Icon = "" })
}

Tabs.Main:AddButton({
    Title = "Executor",
    Description = "Executor Script",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/script-BHUB/Executor/refs/heads/main/Executor.lua"))()
        end)
    end
})

Tabs.Main:AddButton({
    Title = "Aimbot hub",
    Description = "Aimbot มีฟังชั่นหลากหลาย",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/script-BHUB/Aimbot-hub/refs/heads/main/Aimbot-hub"))()
        end)
    end
})

Tabs.Main:AddButton({
    Title = "Script blade ball",
    Description = "417 Auto perry",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/f72223000bf529bfa6b14e7750439a420e465d25399341decd59e10c3d56f217/download"))()
        end)
    end
})

Tabs.Main:AddButton({
    Title = "Script blox fruit",
    Description = "Banana Cat hub free",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/aloaloalo322/sssdas/refs/heads/main/cc"))()
        end)
    end
})

Tabs.Main:AddButton({
    Title = "JN HH Gaming",
    Description = "Rivals Wall bang",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/JNHHGaming/Rivals5/refs/heads/main/JN%20HH%20Gaming", true))()
        end)
    end
})

Tabs.Main:AddButton({
    Title = "Jujutsu Shenanigans",
    Description = "Silt hub Key system in Discord",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/72bf00835f242f72e7942ed051574eac.lua"))()
        end)
    end
})

Tabs.Main:AddButton({
    Title = "Script Grow a Garden 2",
    Description = "SP Hub",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/as6cd0/SP_Hub/refs/heads/main/Loader"))()
        end)
    end
})

Tabs.Main:AddButton({
    Title = "Pet Simulator 99",
    Description = "PS99 Script",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://vss.pandauth.com/virtual/file/a429e26ef87e49ba"))()
        end)
    end
})

Tabs.Main:AddButton({
    Title = "Galactic hub Keyless",
    Description = "Keyboard Escape (+1 Speed)",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GalacticScripts/Galactic-Hub/refs/heads/main/WindUI"))()
        end)
    end
})

Tabs.Main:AddButton({
    Title = "Tora lsme Hub",
    Description = "Support game 600+",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/boplsme/Scripts-/refs/heads/main/%5BBETA%5D%20Tora%20Isme%20Hub.txt"))()
        end)
    end
})

Tabs.Main:AddButton({
    Title = "Script Volleyball legends",
    Description = "Key system in Discord",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FeRk1eOp/fer4ixzlol.hub/refs/heads/main/fer4ixzhub", true))()
        end)
    end
})

Tabs.Main:AddButton({
    Title = "Murder Mystery 2",
    Description = "MM2 script Keyless",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xv3gasx/Murder-Mystery-2/refs/heads/main/Release.lua"))()
        end)
    end
})

local StatLabel = Instance.new("TextLabel")
StatLabel.Name = "StatLabel"
StatLabel.Parent = ScreenGui
StatLabel.BackgroundTransparency = 0.2
StatLabel.BackgroundColor3 = Color3.fromRGB(18, 20, 24)
StatLabel.AnchorPoint = Vector2.new(0.5, 0)
StatLabel.Position = UDim2.new(0.5, 0, 0, 15)
StatLabel.Size = UDim2.new(0, 200, 0, 28)
StatLabel.Font = Enum.Font.GothamBold
StatLabel.TextColor3 = Color3.fromRGB(215, 220, 230)
StatLabel.TextSize = 11
StatLabel.Text = "FPS: -- | PING: --ms"
StatLabel.Active = true
StatLabel.Draggable = true
StatLabel.ZIndex = 10
StatLabel.Visible = false

Instance.new("UICorner", StatLabel).CornerRadius = UDim.new(0, 8)
local statStroke = Instance.new("UIStroke", StatLabel)
statStroke.Color = Color3.fromRGB(55, 62, 75)
statStroke.Thickness = 1.2

local origShadows = Lighting.GlobalShadows
local origFog = Lighting.FogEnd
local modifiedParts = {}
local ultraOrigEffects = {}
local ultraOrigParts = {}
local ultraOrigMaterials = {}
local ultraConnection = nil

local terrain = Workspace:FindFirstChildOfClass("Terrain")
local origTerrain = {
    Size = terrain and terrain.WaterWaveSize,
    Speed = terrain and terrain.WaterWaveSpeed,
    Reflectance = terrain and terrain.WaterReflectance,
    Transparency = terrain and terrain.WaterTransparency
}

local function isBall(v)
    local name = v.Name:lower()
    return string.find(name, "ball") or string.find(name, "volleyball")
end

Tabs.BoostFps:AddToggle("BoostFpsToggle", {
    Title = "Boost fps",
    Description = "Smooth graphics & optimize game",
    Default = false,
    Callback = function(Value)
        pcall(function()
            if Value then
                origShadows = Lighting.GlobalShadows
                origFog = Lighting.FogEnd
                Lighting.GlobalShadows = false
                Lighting.FogEnd = 9e9
                settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

                task.spawn(function()
                    for _, v in ipairs(Workspace:GetDescendants()) do
                        if v:IsA("BasePart") and not isBall(v) then
                            modifiedParts[v] = v.Material
                            v.Material = Enum.Material.SmoothPlastic
                            v.CastShadow = false
                        end
                    end
                end)
            else
                Lighting.GlobalShadows = origShadows
                Lighting.FogEnd = origFog
                settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic

                for v, mat in pairs(modifiedParts) do
                    if v and v.Parent then
                        v.Material = mat
                        v.CastShadow = true
                    end
                end
                table.clear(modifiedParts)
            end
        end)
    end
})

Tabs.BoostFps:AddToggle("UltraBoostToggle", {
    Title = "Ultra boost fps",
    Description = "⚠️ โทรศัพท์มือถือสเปคต่ำไม่แนะนำให้ใช้ + วนลูปทุกๆวินาที",
    Default = false,
    Callback = function(Value)
        pcall(function()
            if Value then
                for _, v in ipairs(Lighting:GetChildren()) do
                    if v:IsA("PostEffect") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("Atmosphere") or v:IsA("Clouds") then
                        ultraOrigEffects[v] = v.Enabled
                        v.Enabled = false
                    end
                end

                task.spawn(function()
                    for _, v in ipairs(Workspace:GetDescendants()) do
                        pcall(function()
                            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") or v:IsA("Highlight") then
                                if ultraOrigParts[v] == nil then
                                    ultraOrigParts[v] = v.Enabled
                                end
                                v.Enabled = false
                            elseif v:IsA("Decal") or v:IsA("Texture") then
                                if ultraOrigParts[v] == nil then
                                    ultraOrigParts[v] = v.Transparency
                                end
                                v.Transparency = 1
                            elseif v:IsA("Shirt") or v:IsA("Pants") or v:IsA("Clothing") or v:IsA("ShirtGraphic") then
                                if ultraOrigParts[v] == nil then
                                    ultraOrigParts[v] = v.Parent
                                end
                                v.Parent = nil
                            elseif v:IsA("BasePart") and not isBall(v) then
                                if ultraOrigMaterials[v] == nil then
                                    ultraOrigMaterials[v] = v.Material
                                end
                                v.Material = Enum.Material.SmoothPlastic
                                v.CastShadow = false
                                v.Reflectance = 0
                            end
                        end)
                    end
                end)

                if not ultraConnection then
                    ultraConnection = Workspace.DescendantAdded:Connect(function(v)
                        pcall(function()
                            task.wait(0.05)
                            if v:IsA("BasePart") and not isBall(v) then
                                if ultraOrigMaterials[v] == nil then
                                    ultraOrigMaterials[v] = v.Material
                                end
                                v.Material = Enum.Material.SmoothPlastic
                                v.CastShadow = false
                                v.Reflectance = 0
                            elseif v:IsA("Shirt") or v:IsA("Pants") or v:IsA("Clothing") or v:IsA("ShirtGraphic") then
                                if ultraOrigParts[v] == nil then
                                    ultraOrigParts[v] = v.Parent
                                end
                                v.Parent = nil
                            elseif v:IsA("Decal") or v:IsA("Texture") then
                                if ultraOrigParts[v] == nil then
                                    ultraOrigParts[v] = v.Transparency
                                end
                                v.Transparency = 1
                            end
                        end)
                    end)
                end

                if terrain then
                    terrain.WaterWaveSize = 0
                    terrain.WaterWaveSpeed = 0
                    terrain.WaterReflectance = 0
                    terrain.WaterTransparency = 0
                end

                Fluent:Notify({
                    Title = "Ultra Boost Active",
                    Content = "เปิดโหมด Ultra boost fps สำเร็จ!",
                    Duration = 3
                })
            else
                if ultraConnection then
                    ultraConnection:Disconnect()
                    ultraConnection = nil
                end

                for v, state in pairs(ultraOrigEffects) do
                    if v and v.Parent then
                        v.Enabled = state
                    end
                end

                for v, state in pairs(ultraOrigParts) do
                    if v then
                        if v:IsA("Decal") or v:IsA("Texture") then
                            if v.Parent then
                                v.Transparency = state
                            end
                        elseif v:IsA("Shirt") or v:IsA("Pants") or v:IsA("Clothing") or v:IsA("ShirtGraphic") then
                            if state and state.Parent then
                                v.Parent = state
                            end
                        else
                            if v.Parent then
                                v.Enabled = state
                            end
                        end
                    end
                end

                for v, mat in pairs(ultraOrigMaterials) do
                    if v and v.Parent then
                        v.Material = mat
                        v.CastShadow = true
                        v.Reflectance = 0
                    end
                end

                table.clear(ultraOrigEffects)
                table.clear(ultraOrigParts)
                table.clear(ultraOrigMaterials)

                if terrain and origTerrain.Size then
                    terrain.WaterWaveSize = origTerrain.Size
                    terrain.WaterWaveSpeed = origTerrain.Speed
                    terrain.WaterReflectance = origTerrain.Reflectance
                    terrain.WaterTransparency = origTerrain.Transparency
                end

                Fluent:Notify({
                    Title = "Ultra Boost Disabled",
                    Content = "คืนค่าแมพและพื้นผิวเดิมเรียบร้อย!",
                    Duration = 3
                })
            end
        end)
    end
})

Tabs.BoostFps:AddToggle("ShowFpsPingToggle", {
    Title = "Show FPS & Ping",
    Description = "Display draggable FPS and Ping counter",
    Default = false,
    Callback = function(Value)
        StatLabel.Visible = Value
    end
})

local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ToggleButton.Position = UDim2.new(0.02, 0, 0.16, 0)
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

task.spawn(function()
    local lastTime, frameCount = os.clock(), 0
    RunService.Heartbeat:Connect(function(dt)
        frameCount = frameCount + 1
        local cT = os.clock()
        if cT - lastTime >= 1.0 then
            local fps = math.floor(frameCount / (cT - lastTime))
            frameCount, lastTime = 0, cT
            local ping = 0
            pcall(function()
                ping = math.floor(player:GetNetworkPing() * 1000)
            end)
            if StatLabel.Visible then
                StatLabel.Text = string.format("FPS: %d | PING: %dms", fps, ping)
            end
        end
    end)
end)

Fluent:Notify({
    Title = "B Hub Loaded",
    Content = "B Hub Ultra Boost Ready!",
    Duration = 5
})
