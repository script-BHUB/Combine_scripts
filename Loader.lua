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
