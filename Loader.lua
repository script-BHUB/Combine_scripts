local coreGui = game:GetService("CoreGui")
local player = game.Players.LocalPlayer
local targetParent = coreGui
if pcall(function() return coreGui:GetChildren() end) then
    targetParent = coreGui
else
    targetParent = player:WaitForChild("PlayerGui")
end

if targetParent:FindFirstChild("BH_UI") then
    targetParent.BH_UI:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BH_UI"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 2147483647
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
screenGui.Parent = targetParent

local defaultMainPos = UDim2.new(0.5, -250, 0.5, -175)
local defaultMainSize = UDim2.new(0, 500, 0, 350)
local defaultTogglePos = UDim2.new(0, 20, 0, 100)

local toggleButton = Instance.new("TextButton")
toggleButton.Name = "BH"
toggleButton.Size = UDim2.new(0, 80, 0, 40)
toggleButton.Position = defaultTogglePos
toggleButton.BackgroundColor3 = Color3.fromRGB(24, 24, 37)
toggleButton.TextColor3 = Color3.fromRGB(205, 214, 244)
toggleButton.TextSize = 16
toggleButton.Font = Enum.Font.GothamBold
toggleButton.Text = "B Hub"
toggleButton.ZIndex = 2147483647
toggleButton.Parent = screenGui

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)
buttonCorner.Parent = toggleButton

local toggleStroke = Instance.new("UIStroke")
toggleStroke.Color = Color3.fromRGB(0, 255, 255)
toggleStroke.Thickness = 1
toggleStroke.Transparency = 0.7
toggleStroke.Parent = toggleButton

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = defaultMainSize
mainFrame.Position = defaultMainPos
mainFrame.BackgroundColor3 = Color3.fromRGB(17, 17, 27)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = true
mainFrame.ZIndex = 2147483646
mainFrame.Parent = screenGui

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(137, 180, 250)
mainStroke.Thickness = 1.5
mainStroke.Parent = mainFrame

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 16)
frameCorner.Parent = mainFrame

local resizeButton = Instance.new("TextButton")
resizeButton.Name = "ResizeButton"
resizeButton.Size = UDim2.new(0, 25, 0, 25)
resizeButton.Position = UDim2.new(1, -25, 1, -25)
resizeButton.BackgroundTransparency = 1
resizeButton.Text = "◢"
resizeButton.TextColor3 = Color3.fromRGB(137, 180, 250)
resizeButton.TextSize = 12
resizeButton.Font = Enum.Font.GothamBold
resizeButton.ZIndex = 2147483647
resizeButton.Parent = mainFrame

local tabContainer = Instance.new("ScrollingFrame")
tabContainer.Name = "TabContainer"
tabContainer.Size = UDim2.new(0, 120, 1, -20)
tabContainer.Position = UDim2.new(0, 10, 0, 10)
tabContainer.BackgroundTransparency = 1
tabContainer.CanvasSize = UDim2.new(0, 0, 0, 260)
tabContainer.ScrollBarThickness = 4
tabContainer.ZIndex = 2147483647
tabContainer.Parent = mainFrame

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 8)
uiListLayout.Parent = tabContainer

local contentArea = Instance.new("Frame")
contentArea.Name = "ContentArea"
contentArea.Size = UDim2.new(1, -150, 1, -20)
contentArea.Position = UDim2.new(0, 140, 0, 10)
contentArea.BackgroundColor3 = Color3.fromRGB(30, 30, 46)
contentArea.BorderSizePixel = 0
contentArea.ZIndex = 2147483647
contentArea.Parent = mainFrame

local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 10)
contentCorner.Parent = contentArea

local tabs = {"Main", "Player", "Visual", "Teleport", "Misc", "Settings"}
local pages = {}

for i, tabName in ipairs(tabs) do
    local tabButton = Instance.new("TextButton")
    tabButton.Name = tabName
    tabButton.Size = UDim2.new(1, 0, 0, 35)
    tabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 46)
    tabButton.TextColor3 = Color3.fromRGB(205, 214, 244)
    tabButton.TextSize = 14
    tabButton.Font = Enum.Font.GothamBold
    tabButton.Text = tabName
    tabButton.LayoutOrder = i
    tabButton.ZIndex = 2147483647
    tabButton.Parent = tabContainer

    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 8)
    tabCorner.Parent = tabButton

    local indicator = Instance.new("Frame")
    indicator.Name = "Indicator"
    indicator.Size = UDim2.new(1, -10, 0, 3)
    indicator.Position = UDim2.new(0, 5, 1, -4)
    indicator.BackgroundColor3 = Color3.fromRGB(137, 180, 250)
    indicator.BorderSizePixel = 0
    indicator.Visible = false
    indicator.ZIndex = 2147483647
    indicator.Parent = tabButton

    local indicatorCorner = Instance.new("UICorner")
    indicatorCorner.CornerRadius = UDim.new(1, 0)
    indicatorCorner.Parent = indicator

    local page = Instance.new("ScrollingFrame")
    page.Name = tabName .. "Page"
    page.Size = UDim2.new(1, -20, 1, -20)
    page.Position = UDim2.new(0, 10, 0, 10)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.ScrollBarThickness = 4
    page.ZIndex = 2147483647
    page.Parent = contentArea

    local pageLayout = Instance.new("UIListLayout")
    pageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    pageLayout.Padding = UDim.new(0, 8)
    pageLayout.Parent = page
    
    local pagePadding = Instance.new("UIPadding")
    pagePadding.PaddingTop = UDim.new(0, 5)
    pagePadding.PaddingBottom = UDim.new(0, 5)
    pagePadding.PaddingLeft = UDim.new(0, 5)
    pagePadding.PaddingRight = UDim.new(0, 5)
    pagePadding.Parent = page

    pages[tabName] = page

    tabButton.MouseButton1Click:Connect(function()
        for _, p in pairs(pages) do
            p.Visible = false
        end
        page.Visible = true
        for _, child in ipairs(tabContainer:GetChildren()) do
            if child:IsA("TextButton") then
                local ind = child:FindFirstChild("Indicator")
                if ind then
                    ind.Visible = false
                end
            end
        end
        indicator.Visible = true
    end)
end

pages["Main"].Visible = true
tabContainer:FindFirstChild("Main").Indicator.Visible = true

local function addButton(parentPage, title, description, callback)
    local buttonFrame = Instance.new("TextButton")
    buttonFrame.Size = UDim2.new(1, 0, 0, 45)
    buttonFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    buttonFrame.Text = ""
    buttonFrame.AutoButtonColor = true
    buttonFrame.ZIndex = 2147483647
    buttonFrame.Parent = parentPage

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = buttonFrame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -15, 0, 20)
    titleLabel.Position = UDim2.new(0, 10, 0, 4)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(205, 214, 244)
    titleLabel.TextSize = 13
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.ZIndex = 2147483647
    titleLabel.Parent = buttonFrame

    local descLabel = Instance.new("TextLabel")
    descLabel.Size = UDim2.new(1, -15, 0, 15)
    descLabel.Position = UDim2.new(0, 10, 0, 24)
    descLabel.BackgroundTransparency = 1
    descLabel.Font = Enum.Font.Gotham
    descLabel.Text = description
    descLabel.TextColor3 = Color3.fromRGB(160, 170, 200)
    descLabel.TextSize = 11
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.ZIndex = 2147483647
    descLabel.Parent = buttonFrame

    buttonFrame.MouseButton1Click:Connect(callback)
    parentPage.CanvasSize = UDim2.new(0, 0, 0, parentPage.UIListLayout.AbsoluteContentSize.Y + 20)
end

local function addToggle(parentPage, title, description, defaultState, callback)
    local toggleFrame = Instance.new("TextButton")
    toggleFrame.Size = UDim2.new(1, 0, 0, 45)
    toggleFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    toggleFrame.Text = ""
    toggleFrame.AutoButtonColor = false
    toggleFrame.ZIndex = 2147483647
    toggleFrame.Parent = parentPage

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = toggleFrame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -60, 0, 20)
    titleLabel.Position = UDim2.new(0, 10, 0, 4)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(205, 214, 244)
    titleLabel.TextSize = 13
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.ZIndex = 2147483647
    titleLabel.Parent = toggleFrame

    local descLabel = Instance.new("TextLabel")
    descLabel.Size = UDim2.new(1, -60, 0, 15)
    descLabel.Position = UDim2.new(0, 10, 0, 24)
    descLabel.BackgroundTransparency = 1
    descLabel.Font = Enum.Font.Gotham
    descLabel.Text = description
    descLabel.TextColor3 = Color3.fromRGB(160, 170, 200)
    descLabel.TextSize = 11
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.ZIndex = 2147483647
    descLabel.Parent = toggleFrame

    local switch = Instance.new("Frame")
    switch.Size = UDim2.new(0, 40, 0, 20)
    switch.Position = UDim2.new(1, -50, 0.5, -10)
    switch.BackgroundColor3 = defaultState and Color3.fromRGB(137, 180, 250) or Color3.fromRGB(60, 60, 80)
    switch.ZIndex = 2147483647
    switch.Parent = toggleFrame

    local switchCorner = Instance.new("UICorner")
    switchCorner.CornerRadius = UDim.new(1, 0)
    switchCorner.Parent = switch

    local circle = Instance.new("Frame")
    circle.Size = UDim2.new(0, 16, 0, 16)
    circle.Position = defaultState and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
    circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    circle.ZIndex = 2147483647
    circle.Parent = switch

    local circleCorner = Instance.new("UICorner")
    circleCorner.CornerRadius = UDim.new(1, 0)
    circleCorner.Parent = circle

    local toggled = defaultState

    toggleFrame.MouseButton1Click:Connect(function()
        toggled = not toggled
        switch.BackgroundColor3 = toggled and Color3.fromRGB(137, 180, 250) or Color3.fromRGB(60, 60, 80)
        circle.Position = toggled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
        callback(toggled)
    end)

    parentPage.CanvasSize = UDim2.new(0, 0, 0, parentPage.UIListLayout.AbsoluteContentSize.Y + 20)
end

local function addToggleSlider(parentPage, title, minVal, maxVal, defaultVal, callback)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.new(1, 0, 0, 65)
    sliderFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    sliderFrame.ZIndex = 2147483647
    sliderFrame.Parent = parentPage

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = sliderFrame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -110, 0, 20)
    titleLabel.Position = UDim2.new(0, 10, 0, 4)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(205, 214, 244)
    titleLabel.TextSize = 13
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.ZIndex = 2147483647
    titleLabel.Parent = sliderFrame

    local valueLabel = Instance.new("TextLabel")
    valueLabel.Size = UDim2.new(0, 50, 0, 20)
    valueLabel.Position = UDim2.new(1, -120, 0, 4)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Font = Enum.Font.GothamBold
    valueLabel.Text = tostring(defaultVal)
    valueLabel.TextColor3 = Color3.fromRGB(137, 180, 250)
    valueLabel.TextSize = 13
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    valueLabel.ZIndex = 2147483647
    valueLabel.Parent = sliderFrame

    local switch = Instance.new("Frame")
    switch.Size = UDim2.new(0, 40, 0, 20)
    switch.Position = UDim2.new(1, -50, 0, 4)
    switch.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    switch.ZIndex = 2147483647
    switch.Parent = sliderFrame

    local switchCorner = Instance.new("UICorner")
    switchCorner.CornerRadius = UDim.new(1, 0)
    switchCorner.Parent = switch

    local circle = Instance.new("Frame")
    circle.Size = UDim2.new(0, 16, 0, 16)
    circle.Position = UDim2.new(0, 2, 0.5, -8)
    circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    circle.ZIndex = 2147483647
    circle.Parent = switch

    local circleCorner = Instance.new("UICorner")
    circleCorner.CornerRadius = UDim.new(1, 0)
    circleCorner.Parent = circle

    local sliderBar = Instance.new("Frame")
    sliderBar.Size = UDim2.new(1, -20, 0, 6)
    sliderBar.Position = UDim2.new(0, 10, 0, 42)
    sliderBar.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    sliderBar.BorderSizePixel = 0
    sliderBar.ZIndex = 2147483647
    sliderBar.Parent = sliderFrame

    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(1, 0)
    barCorner.Parent = sliderBar

    local sliderFill = Instance.new("Frame")
    sliderFill.Size = UDim2.new((defaultVal - minVal) / (maxVal - minVal), 0, 1, 0)
    sliderFill.BackgroundColor3 = Color3.fromRGB(137, 180, 250)
    sliderFill.BorderSizePixel = 0
    sliderFill.ZIndex = 2147483647
    sliderFill.Parent = sliderBar

    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = sliderFill

    local UserInputService = game:GetService("UserInputService")
    local dragging = false
    local enabled = false
    local currentValue = defaultVal

    local function updateValue(input)
        local pos = sliderBar.AbsolutePosition.X
        local size = sliderBar.AbsoluteSize.X
        local mouseX = input.Position.X
        local scale = math.clamp((mouseX - pos) / size, 0, 1)
        currentValue = math.floor(minVal + ((maxVal - minVal) * scale))
        
        sliderFill.Size = UDim2.new(scale, 0, 1, 0)
        valueLabel.Text = tostring(currentValue)
        
        if enabled then
            callback(currentValue, true)
        end
    end

    sliderBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            updateValue(input)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateValue(input)
        end
    end)

    local toggleButtonHitbox = Instance.new("TextButton")
    toggleButtonHitbox.Size = UDim2.new(1, 0, 1, 0)
    toggleButtonHitbox.BackgroundTransparency = 1
    toggleButtonHitbox.Text = ""
    toggleButtonHitbox.ZIndex = 2147483647
    toggleButtonHitbox.Parent = switch

    toggleButtonHitbox.MouseButton1Click:Connect(function()
        enabled = not enabled
        switch.BackgroundColor3 = enabled and Color3.fromRGB(137, 180, 250) or Color3.fromRGB(60, 60, 80)
        circle.Position = enabled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
        callback(currentValue, enabled)
    end)

    parentPage.CanvasSize = UDim2.new(0, 0, 0, parentPage.UIListLayout.AbsoluteContentSize.Y + 20)
end

local function addInputBox(parentPage, title, description, placeholder, callback)
    local inputFrame = Instance.new("Frame")
    inputFrame.Size = UDim2.new(1, 0, 0, 65)
    inputFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    inputFrame.ZIndex = 2147483647
    inputFrame.Parent = parentPage

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = inputFrame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -15, 0, 20)
    titleLabel.Position = UDim2.new(0, 10, 0, 4)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(205, 214, 244)
    titleLabel.TextSize = 13
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.ZIndex = 2147483647
    titleLabel.Parent = inputFrame

    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(1, -20, 0, 30)
    textBox.Position = UDim2.new(0, 10, 0, 28)
    textBox.BackgroundColor3 = Color3.fromRGB(25, 25, 38)
    textBox.TextColor3 = Color3.fromRGB(205, 214, 244)
    textBox.PlaceholderText = placeholder
    textBox.Text = ""
    textBox.TextSize = 12
    textBox.Font = Enum.Font.Gotham
    textBox.ZIndex = 2147483647
    textBox.Parent = inputFrame

    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = UDim.new(0, 6)
    boxCorner.Parent = textBox

    textBox.FocusLost:Connect(function(enterPressed)
        callback(textBox.Text)
    end)

    parentPage.CanvasSize = UDim2.new(0, 0, 0, parentPage.UIListLayout.AbsoluteContentSize.Y + 20)
end

local function addDropdown(parentPage, title, items, defaultItem, callback)
    local dropFrame = Instance.new("Frame")
    dropFrame.Size = UDim2.new(1, 0, 0, 65)
    dropFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    dropFrame.ZIndex = 2147483647
    dropFrame.Parent = parentPage

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = dropFrame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -15, 0, 20)
    titleLabel.Position = UDim2.new(0, 10, 0, 4)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(205, 214, 244)
    titleLabel.TextSize = 13
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.ZIndex = 2147483647
    titleLabel.Parent = dropFrame

    local selectButton = Instance.new("TextButton")
    selectButton.Size = UDim2.new(1, -20, 0, 30)
    selectButton.Position = UDim2.new(0, 10, 0, 28)
    selectButton.BackgroundColor3 = Color3.fromRGB(25, 25, 38)
    selectButton.TextColor3 = Color3.fromRGB(137, 180, 250)
    selectButton.Text = tostring(defaultItem)
    selectButton.TextSize = 12
    selectButton.Font = Enum.Font.GothamBold
    selectButton.ZIndex = 2147483647
    selectButton.Parent = dropFrame

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = selectButton

    local listFrame = Instance.new("ScrollingFrame")
    listFrame.Size = UDim2.new(1, -20, 0, 0)
    listFrame.Position = UDim2.new(0, 10, 0, 60)
    listFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    listFrame.BorderSizePixel = 0
    listFrame.Visible = false
    listFrame.ZIndex = 2147483648
    listFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    listFrame.ScrollBarThickness = 3
    listFrame.Parent = dropFrame

    local listCorner = Instance.new("UICorner")
    listCorner.CornerRadius = UDim.new(0, 6)
    listCorner.Parent = listFrame

    local listLayout = Instance.new("UIListLayout")
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Parent = listFrame

    local isOpen = false
    local selectedValue = defaultItem

    local function refreshItems(newItems)
        for _, c in ipairs(listFrame:GetChildren()) do
            if c:IsA("TextButton") then c:Destroy() end
        end
        for _, item in ipairs(newItems) do
            local itemBtn = Instance.new("TextButton")
            itemBtn.Size = UDim2.new(1, 0, 0, 25)
            itemBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
            itemBtn.TextColor3 = Color3.fromRGB(205, 214, 244)
            itemBtn.Text = tostring(item)
            itemBtn.TextSize = 11
            itemBtn.Font = Enum.Font.Gotham
            itemBtn.ZIndex = 2147483649
            itemBtn.Parent = listFrame

            itemBtn.MouseButton1Click:Connect(function()
                selectedValue = item
                selectButton.Text = tostring(item)
                isOpen = false
                listFrame.Visible = false
                dropFrame.Size = UDim2.new(1, 0, 0, 65)
                callback(item)
            end)
        end
        listFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y)
    end

    refreshItems(items)

    selectButton.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        listFrame.Visible = isOpen
        if isOpen then
            local targetH = math.min(listLayout.AbsoluteContentSize.Y, 120)
            listFrame.Size = UDim2.new(1, -20, 0, targetH)
            dropFrame.Size = UDim2.new(1, 0, 0, 65 + targetH + 5)
        else
            listFrame.Size = UDim2.new(1, -20, 0, 0)
            dropFrame.Size = UDim2.new(1, 0, 0, 65)
        end
    end)

    parentPage.CanvasSize = UDim2.new(0, 0, 0, parentPage.UIListLayout.AbsoluteContentSize.Y + 20)

    return {
        Refresh = function(newVals, defVal)
            if defVal then selectedValue = defVal selectButton.Text = tostring(defVal) end
            refreshItems(newVals)
        end
    }
end

local mainPage = pages["Main"]
addButton(mainPage, "Executor", "Executor Script", function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/script-BHUB/Executor/refs/heads/main/Executor.lua"))() end)
end)
addButton(mainPage, "Aimbot hub", "Aimbot มีฟังชั่นหลากหลาย", function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/script-BHUB/Aimbot-hub/refs/heads/main/Aimbot-hub"))() end)
end)
addButton(mainPage, "Script blade ball", "417 Auto perry", function()
    pcall(function() loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/f72223000bf529bfa6b14e7750439a420e465d25399341decd59e10c3d56f217/download"))() end)
end)
addButton(mainPage, "Script blox fruit", "Banana Cat hub free", function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/aloaloalo322/sssdas/refs/heads/main/cc"))() end)
end)
addButton(mainPage, "JN HH Gaming", "Rivals Wall bang", function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/JNHHGaming/Rivals5/refs/heads/main/JN%20HH%20Gaming", true))() end)
end)
addButton(mainPage, "Jujutsu Shenanigans", "Silt hub Key system in Discord", function()
    pcall(function() loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/72bf00835f242f72e7942ed051574eac.lua"))() end)
end)
addButton(mainPage, "Script Grow a Garden 2", "SP Hub", function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/as6cd0/SP_Hub/refs/heads/main/Loader"))() end)
end)
addButton(mainPage, "Pet Simulator 99", "PS99 Script", function()
    pcall(function() loadstring(game:HttpGet("https://vss.pandauth.com/virtual/file/a429e26ef87e49ba"))() end)
end)
addButton(mainPage, "Galactic hub Keyless", "Keyboard Escape (+1 Speed)", function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/GalacticScripts/Galactic-Hub/refs/heads/main/WindUI"))() end)
end)
addButton(mainPage, "Tora lsme Hub", "Support game 600+", function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/boplsme/Scripts-/refs/heads/main/%5BBETA%5D%20Tora%20Isme%20Hub.txt"))() end)
end)
addButton(mainPage, "Script Volleyball legends", "Key system in Discord", function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/FeRk1eOp/fer4ixzlol.hub/refs/heads/main/fer4ixzhub", true))() end)
end)
addButton(mainPage, "Murder Mystery 2", "MM2 script Keyless", function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/xv3gasx/Murder-Mystery-2/refs/heads/main/Release.lua"))() end)
end)

local playerPage = pages["Player"]

addToggleSlider(playerPage, "WalkSpeed", 16, 1000, 16, function(value, state)
    pcall(function()
        local character = player.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid.WalkSpeed = state and value or 16
        end
    end)
end)

addToggleSlider(playerPage, "JumpPower", 50, 1000, 50, function(value, state)
    pcall(function()
        local character = player.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid.JumpPower = state and value or 50
        end
    end)
end)

local camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local flying = false
local flySpeed = 50
local bodyVelocity = nil
local bodyGyro = nil
local flyConnection = nil

local function startFlying(character)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoidRootPart or not humanoid then return end
    
    humanoid.PlatformStand = true
    humanoid.AutoRotate = false
    
    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(1, 1, 1) * 10^6
    bodyVelocity.Velocity = Vector3.zero
    bodyVelocity.Parent = humanoidRootPart
    
    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.MaxTorque = Vector3.new(1, 1, 1) * 10^6
    bodyGyro.P = 10000
    bodyGyro.CFrame = camera.CFrame
    bodyGyro.Parent = humanoidRootPart

    flyConnection = RunService.RenderStepped:Connect(function()
        if not flying then return end
        if not humanoidRootPart or not humanoid or not bodyVelocity or not bodyGyro then return end
        
        bodyGyro.CFrame = camera.CFrame
        local moveDir = humanoid.MoveDirection
        
        if moveDir.Magnitude > 0 then
            local camCFrame = camera.CFrame
            local lookVector = camCFrame.LookVector
            local rightVector = camCFrame.RightVector
            local flatLook = Vector3.new(lookVector.X, 0, lookVector.Z)
            if flatLook.Magnitude > 0 then flatLook = flatLook.Unit end
            local flatRight = Vector3.new(rightVector.X, 0, rightVector.Z)
            if flatRight.Magnitude > 0 then flatRight = flatRight.Unit end
            
            local forwardInput = moveDir:Dot(flatLook)
            local rightInput = moveDir:Dot(flatRight)
            local flyVector = (lookVector * forwardInput) + (rightVector * rightInput)
            if flyVector.Magnitude > 0 then flyVector = flyVector.Unit end
            
            bodyVelocity.Velocity = flyVector * flySpeed
        else
            bodyVelocity.Velocity = Vector3.zero
        end
    end)
end

local function stopFlying(character)
    if flyConnection then
        flyConnection:Disconnect()
        flyConnection = nil
    end
    
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.PlatformStand = false
        humanoid.AutoRotate = true
    end
    
    if bodyVelocity then bodyVelocity:Destroy() bodyVelocity = nil end
    if bodyGyro then bodyGyro:Destroy() bodyGyro = nil end
end

local function setFlyState(state, speed)
    flying = state
    if speed then flySpeed = speed end
    
    local character = player.Character
    if not character then return end
    
    if flying then
        startFlying(character)
    else
        stopFlying(character)
    end
end

player.CharacterAdded:Connect(function(character)
    if flying then
        setFlyState(false)
    end
end)

addToggleSlider(playerPage, "Fly", 10, 500, 50, function(value, state)
    pcall(function()
        setFlyState(state, value)
    end)
end)

addToggleSlider(playerPage, "FOV Changer", 70, 120, 70, function(value, state)
    pcall(function()
        if state then
            workspace.CurrentCamera.FieldOfView = value
        else
            workspace.CurrentCamera.FieldOfView = 70
        end
    end)
end)

local spinBotConnection = nil
local spinBotSpeed = 50
local currentSpinAngle = 0
addToggleSlider(playerPage, "SpinBot", 10, 500, 50, function(value, state)
    pcall(function()
        spinBotSpeed = value
        if state then
            if spinBotConnection then spinBotConnection:Disconnect() end
            spinBotConnection = RunService.RenderStepped:Connect(function()
                local character = player.Character
                if character and character:FindFirstChild("HumanoidRootPart") and character:FindFirstChildOfClass("Humanoid") then
                    local hrp = character.HumanoidRootPart
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    
                    currentSpinAngle = (currentSpinAngle + spinBotSpeed) % 360
                    
                    local camLook = camera.CFrame.LookVector
                    local flatCamLook = Vector3.new(camLook.X, 0, camLook.Z)
                    if flatCamLook.Magnitude > 0 then
                        flatCamLook = flatCamLook.Unit
                    else
                        flatCamLook = Vector3.new(0, 0, -1)
                    end
                    
                    local baseCFrame = CFrame.new(hrp.Position, hrp.Position + flatCamLook)
                    hrp.CFrame = baseCFrame * CFrame.Angles(0, math.rad(currentSpinAngle), 0)
                    
                    if humanoid.MoveDirection.Magnitude > 0 then
                        hrp.Velocity = humanoid.MoveDirection * humanoid.WalkSpeed + Vector3.new(0, hrp.Velocity.Y, 0)
                    end
                end
            end)
        else
            if spinBotConnection then
                spinBotConnection:Disconnect()
                spinBotConnection = nil
            end
        end
    end)
end)

local antiDamageConn = nil
addToggle(playerPage, "Anti-Damage (God Mode)", "เลือดเต็ม 100% ตลอดเวลาไม่มีวันตาย", false, function(Value)
    pcall(function()
        if Value then
            antiDamageConn = RunService.Heartbeat:Connect(function()
                local character = player.Character
                if character and character:FindFirstChildOfClass("Humanoid") then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    humanoid.Health = humanoid.MaxHealth
                end
            end)
        else
            if antiDamageConn then
                antiDamageConn:Disconnect()
                antiDamageConn = nil
            end
        end
    end)
end)

local noclipConnection = nil
addToggle(playerPage, "Noclip", "เดินทะลุวัตถุและกำแพง", false, function(Value)
    pcall(function()
        local RunService = game:GetService("RunService")
        if Value then
            noclipConnection = RunService.Stepped:Connect(function()
                local character = player.Character
                if character then
                    for _, part in ipairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
            local character = player.Character
            if character then
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
        end
    end)
end)

addToggle(playerPage, "Infinite Jump", "กระโดดกลางอากาศได้ไม่จำกัด", false, function(Value)
    pcall(function()
        local UIS = game:GetService("UserInputService")
        if Value then
            _G.InfJumpConn = UIS.JumpRequest:Connect(function()
                local character = player.Character
                if character and character:FindFirstChild("Humanoid") then
                    character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        else
            if _G.InfJumpConn then
                _G.InfJumpConn:Disconnect()
                _G.InfJumpConn = nil
            end
        end
    end)
end)

local waterWalkConn = nil
addToggle(playerPage, "Water Walk", "เดินบนผิวน้ำได้โดยไม่จม", false, function(Value)
    pcall(function()
        if Value then
            waterWalkConn = RunService.Heartbeat:Connect(function()
                local character = player.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local hrp = character.HumanoidRootPart
                    local raycastParams = RaycastParams.new()
                    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
                    raycastParams.FilterDescendantsInstances = {character}
                    local raycastResult = workspace:Raycast(hrp.Position, Vector3.new(0, -10, 0), raycastParams)
                    if raycastResult and raycastResult.Instance then
                        local material = raycastResult.Instance.Material
                        if material == Enum.Material.Water then
                            if hrp.Position.Y < raycastResult.Position.Y + 3 then
                                hrp.CFrame = CFrame.new(hrp.Position.X, raycastResult.Position.Y + 3, hrp.Position.Z) * hrp.CFrame.Rotation
                                hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z)
                            end
                        end
                    end
                end
            end)
        else
            if waterWalkConn then
                waterWalkConn:Disconnect()
                waterWalkConn = nil
            end
        end
    end)
end)

local StatLabel = Instance.new("TextLabel")
StatLabel.Name = "StatLabel"
StatLabel.Parent = screenGui
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
StatLabel.ZIndex = 2147483647
StatLabel.Visible = false

Instance.new("UICorner", StatLabel).CornerRadius = UDim.new(0, 8)
local statStroke = Instance.new("UIStroke", StatLabel)
statStroke.Color = Color3.fromRGB(55, 62, 75)
statStroke.Thickness = 1.2

local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")

local origShadows = Lighting.GlobalShadows
local origFog = Lighting.FogEnd
local modifiedParts = {}

local function isBall(v)
    local name = v.Name:lower()
    return string.find(name, "ball") or string.find(name, "volleyball")
end

local visualPage = pages["Visual"]

addToggle(visualPage, "Fullbright", "สว่างพิเศษทั่วแมพตลอดเวลา", false, function(Value)
    pcall(function()
        local lighting = game:GetService("Lighting")
        if Value then
            _G.OldBrightness = lighting.Brightness
            _G.OldClockTime = lighting.ClockTime
            _G.OldFogEnd = lighting.FogEnd
            _G.OldGlobalShadows = lighting.GlobalShadows
            
            lighting.Brightness = 2
            lighting.ClockTime = 12
            lighting.FogEnd = 9e9
            lighting.GlobalShadows = false
        else
            if _G.OldBrightness then lighting.Brightness = _G.OldBrightness end
            if _G.OldClockTime then lighting.ClockTime = _G.OldClockTime end
            if _G.OldFogEnd then lighting.FogEnd = _G.OldFogEnd end
            if _G.OldGlobalShadows ~= nil then lighting.GlobalShadows = _G.OldGlobalShadows end
        end
    end)
end)

addToggle(visualPage, "Boost fps", "Smooth graphics & optimize game", false, function(Value)
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
end)

addToggle(visualPage, "Show FPS & Ping", "Display draggable FPS and Ping counter", false, function(Value)
    StatLabel.Visible = Value
end)

local removedSkyInstances = {}
addToggle(visualPage, "Remove sky", "ลบฟ้า/ท้องฟ้าออก", false, function(Value)
    pcall(function()
        if Value then
            for _, v in ipairs(Lighting:GetChildren()) do
                if v:IsA("Sky") then
                    removedSkyInstances[v] = v.Parent
                    v.Parent = nil
                end
            end
        else
            for v, parent in pairs(removedSkyInstances) do
                if v then
                    v.Parent = parent
                end
            end
            table.clear(removedSkyInstances)
        end
    end)
end)

local origFogEnd = Lighting.FogEnd
local origAtmosphereDensity = nil
addToggle(visualPage, "Remove fog", "ลบหมอกและบรรยากาศออก", false, function(Value)
    pcall(function()
        if Value then
            origFogEnd = Lighting.FogEnd
            Lighting.FogEnd = 9e98
            for _, v in ipairs(Lighting:GetChildren()) do
                if v:IsA("Atmosphere") then
                    origAtmosphereDensity = v.Density
                    v.Density = 0
                end
            end
        else
            Lighting.FogEnd = origFogEnd
            for _, v in ipairs(Lighting:GetChildren()) do
                if v:IsA("Atmosphere") and origAtmosphereDensity then
                    v.Density = origAtmosphereDensity
                end
            end
        end
    end)
end)

local settingsPage = pages["Settings"]
local currentConfigInputName = ""
local selectedConfigToLoad = "None"
local configDropdownWidget = nil

local function getAllConfigs()
    local configs = {"None"}
    pcall(function()
        if isfolder and listfiles then
            if not isfolder("BHub_Configs") then
                makefolder("BHub_Configs")
            end
            for _, file in ipairs(listfiles("BHub_Configs")) do
                local name = file:match("([^/]+)$"):gsub(".json", "")
                table.insert(configs, name)
            end
        end
    end)
    return configs
end

local function saveNamedConfig(name)
    pcall(function()
        if name and name ~= "" then
            if not isfolder("BHub_Configs") then
                makefolder("BHub_Configs")
            end
            writefile("BHub_Configs/" .. name .. ".json", "{}")
        end
    end)
end

local function loadNamedConfig(name)
    pcall(function()
        if name and name ~= "None" then
            print("Loaded Config: " .. name)
        end
    end)
end

local function deleteNamedConfig(name)
    pcall(function()
        if name and name ~= "None" then
            if delfile and isfile("BHub_Configs/" .. name .. ".json") then
                delfile("BHub_Configs/" .. name .. ".json")
            end
        end
    end)
end

addInputBox(settingsPage, "Config Name", "Config Name...", "Config Name...", function(text)
    currentConfigInputName = text
end)

addButton(settingsPage, "Save Config", "บันทึกการตั้งค่าปัจจุบัน", function()
    saveNamedConfig(currentConfigInputName)
end)

local currentConfigs = getAllConfigs()
configDropdownWidget = addDropdown(settingsPage, "Select Config File", currentConfigs, "None", function(option)
    selectedConfigToLoad = option
end)

local function refreshConfigList()
    local updatedConfigs = getAllConfigs()
    if configDropdownWidget and configDropdownWidget.Refresh then
        configDropdownWidget.Refresh(updatedConfigs, "None")
        selectedConfigToLoad = "None"
    end
end

addButton(settingsPage, "Refresh Config List", "รีเฟรชรายชื่อไฟล์ Config", function()
    refreshConfigList()
end)

addButton(settingsPage, "Load Selected Config", "โหลดการตั้งค่าที่เลือก", function()
    loadNamedConfig(selectedConfigToLoad)
end)

addButton(settingsPage, "Delete Selected Config", "ลบการตั้งค่าที่เลือก", function()
    deleteNamedConfig(selectedConfigToLoad)
    refreshConfigList()
end)

local function makeDraggable(guiObject)
    local UserInputService = game:GetService("UserInputService")
    local dragging = false
    local dragInput, dragStart, startPos
    guiObject.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = guiObject.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    guiObject.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            guiObject.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

makeDraggable(mainFrame)

local UserInputService = game:GetService("UserInputService")
local resizing = false
local resizeStart, startSize

resizeButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        resizing = true
        resizeStart = input.Position
        startSize = mainFrame.Size
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                resizing = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - resizeStart
        local newWidth = math.clamp(startSize.X.Offset + delta.X, 400, 900)
        local newHeight = math.clamp(startSize.Y.Offset + delta.Y, 250, 600)
        mainFrame.Size = UDim2.new(0, newWidth, 0, newHeight)
    end
end)

local toggleDragging = false
local toggleDragInput, toggleDragStart, toggleStartPos
local hasMoved = false

toggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        toggleDragging = true
        toggleDragStart = input.Position
        toggleStartPos = toggleButton.Position
        hasMoved = false
        input.Changed:Connect(function(inputState)
            if inputState.UserInputState == Enum.UserInputState.End then
                toggleDragging = false
            end
        end)
    end
end)

toggleButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        toggleDragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == toggleDragInput and toggleDragging then
        local delta = input.Position - toggleDragStart
        if math.abs(delta.X) > 4 or math.abs(delta.Y) > 4 then
            hasMoved = true
        end
        toggleButton.Position = UDim2.new(toggleStartPos.X.Scale, toggleStartPos.X.Offset + delta.X, toggleStartPos.Y.Scale, toggleStartPos.Y.Offset + delta.Y)
    end
end)

toggleButton.MouseButton1Click:Connect(function()
    if not hasMoved then
        mainFrame.Visible = not mainFrame.Visible
    end
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
