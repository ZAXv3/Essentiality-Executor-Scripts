-- Aimbot Script with Advanced GUI
-- Designed to be mobile-friendly and customizable

local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- GUI Creation
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AimbotGUI"
ScreenGui.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 250, 0, 180)
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -90)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BackgroundTransparency = 0.2
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 8)
Corner.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 30)
TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
TopBar.Parent = MainFrame

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 8)
TopCorner.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(0, 150, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Advanced Aimbot"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.Parent = TopBar

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -60, 0, 0)
MinimizeButton.BackgroundTransparency = 1
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 18
MinimizeButton.Parent = TopBar

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.BackgroundTransparency = 1
CloseButton.Text = "x"
CloseButton.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 18
CloseButton.Parent = TopBar

local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, -20, 1, -50)
ContentFrame.Position = UDim2.new(0, 10, 0, 40)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

-- Aimbot Toggle
local ToggleFrame = Instance.new("Frame")
ToggleFrame.Name = "ToggleFrame"
ToggleFrame.Size = UDim2.new(1, 0, 0, 40)
ToggleFrame.BackgroundTransparency = 1
ToggleFrame.Parent = ContentFrame

local ToggleLabel = Instance.new("TextLabel")
ToggleLabel.Name = "ToggleLabel"
ToggleLabel.Size = UDim2.new(0, 100, 1, 0)
ToggleLabel.BackgroundTransparency = 1
ToggleLabel.Text = "Aimbot:"
ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
ToggleLabel.Font = Enum.Font.Gotham
ToggleLabel.TextSize = 14
ToggleLabel.Parent = ToggleFrame

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 50, 0, 25)
ToggleButton.Position = UDim2.new(1, -50, 0.5, -12)
ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
ToggleButton.AutoButtonColor = false
ToggleButton.Text = "OFF"
ToggleButton.TextColor3 = Color3.fromRGB(255, 100, 100)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 12
ToggleButton.Parent = ToggleFrame

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 12)
ToggleCorner.Parent = ToggleButton

local ToggleInner = Instance.new("Frame")
ToggleInner.Name = "ToggleInner"
ToggleInner.Size = UDim2.new(0, 21, 0, 21)
ToggleInner.Position = UDim2.new(0, 2, 0.5, -10)
ToggleInner.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
ToggleInner.Parent = ToggleButton

local ToggleInnerCorner = Instance.new("UICorner")
ToggleInnerCorner.CornerRadius = UDim.new(0, 10)
ToggleInnerCorner.Parent = ToggleInner

-- Settings
local SettingsFrame = Instance.new("Frame")
SettingsFrame.Name = "SettingsFrame"
SettingsFrame.Size = UDim2.new(1, 0, 0, 80)
SettingsFrame.Position = UDim2.new(0, 0, 0, 45)
SettingsFrame.BackgroundTransparency = 1
SettingsFrame.Parent = ContentFrame

local SmoothnessLabel = Instance.new("TextLabel")
SmoothnessLabel.Name = "SmoothnessLabel"
SmoothnessLabel.Size = UDim2.new(1, 0, 0, 20)
SmoothnessLabel.BackgroundTransparency = 1
SmoothnessLabel.Text = "Smoothness: 50%"
SmoothnessLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SmoothnessLabel.TextXAlignment = Enum.TextXAlignment.Left
SmoothnessLabel.Font = Enum.Font.Gotham
SmoothnessLabel.TextSize = 12
SmoothnessLabel.Parent = SettingsFrame

local SmoothnessSlider = Instance.new("Frame")
SmoothnessSlider.Name = "SmoothnessSlider"
SmoothnessSlider.Size = UDim2.new(1, 0, 0, 10)
SmoothnessSlider.Position = UDim2.new(0, 0, 0, 25)
SmoothnessSlider.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
SmoothnessSlider.Parent = SettingsFrame

local SliderCorner = Instance.new("UICorner")
SliderCorner.CornerRadius = UDim.new(0, 5)
SliderCorner.Parent = SmoothnessSlider

local SmoothnessFill = Instance.new("Frame")
SmoothnessFill.Name = "SmoothnessFill"
SmoothnessFill.Size = UDim2.new(0.5, 0, 1, 0)
SmoothnessFill.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
SmoothnessFill.Parent = SmoothnessSlider

local FillCorner = Instance.new("UICorner")
FillCorner.CornerRadius = UDim.new(0, 5)
FillCorner.Parent = SmoothnessFill

local SmoothnessHandle = Instance.new("TextButton")
SmoothnessHandle.Name = "SmoothnessHandle"
SmoothnessHandle.Size = UDim2.new(0, 15, 0, 15)
SmoothnessHandle.Position = UDim2.new(0.5, -7, 0.5, -7)
SmoothnessHandle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SmoothnessHandle.Text = ""
SmoothnessHandle.Parent = SmoothnessSlider

local HandleCorner = Instance.new("UICorner")
HandleCorner.CornerRadius = UDim.new(0, 7)
HandleCorner.Parent = SmoothnessHandle

local TeamCheckLabel = Instance.new("TextLabel")
TeamCheckLabel.Name = "TeamCheckLabel"
TeamCheckLabel.Size = UDim2.new(0, 100, 0, 20)
TeamCheckLabel.Position = UDim2.new(0, 0, 0, 40)
TeamCheckLabel.BackgroundTransparency = 1
TeamCheckLabel.Text = "Team Check:"
TeamCheckLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TeamCheckLabel.TextXAlignment = Enum.TextXAlignment.Left
TeamCheckLabel.Font = Enum.Font.Gotham
TeamCheckLabel.TextSize = 12
TeamCheckLabel.Parent = SettingsFrame

local TeamCheckButton = Instance.new("TextButton")
TeamCheckButton.Name = "TeamCheckButton"
TeamCheckButton.Size = UDim2.new(0, 50, 0, 20)
TeamCheckButton.Position = UDim2.new(1, -50, 0, 40)
TeamCheckButton.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
TeamCheckButton.AutoButtonColor = false
TeamCheckButton.Text = "ON"
TeamCheckButton.TextColor3 = Color3.fromRGB(100, 255, 100)
TeamCheckButton.Font = Enum.Font.GothamBold
TeamCheckButton.TextSize = 12
TeamCheckButton.Parent = SettingsFrame

local TeamCheckCorner = Instance.new("UICorner")
TeamCheckCorner.CornerRadius = UDim.new(0, 10)
TeamCheckCorner.Parent = TeamCheckButton

-- Mobile Controls
local MobileButton = Instance.new("TextButton")
MobileButton.Name = "MobileButton"
MobileButton.Size = UDim2.new(0, 100, 0, 30)
MobileButton.Position = UDim2.new(0.5, -50, 1, -40)
MobileButton.BackgroundColor3 = Color3.fromRGB(80, 80, 90)
MobileButton.Text = "MOBILE MODE"
MobileButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MobileButton.Font = Enum.Font.GothamBold
MobileButton.TextSize = 12
MobileButton.Visible = false
MobileButton.Parent = MainFrame

local MobileCorner = Instance.new("UICorner")
MobileCorner.CornerRadius = UDim.new(0, 8)
MobileCorner.Parent = MobileButton

-- Variables
local aimbotEnabled = false
local smoothness = 0.5
local teamCheck = true
local minimized = false
local isMobile = false

-- Check if mobile
if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
    isMobile = true
    MobileButton.Visible = true
    MainFrame.Size = UDim2.new(0, 250, 0, 220)
end

-- Animation functions
local function tweenGui(obj, props, duration, style, dir)
    local tweenInfo = TweenInfo.new(
        duration,
        style or Enum.EasingStyle.Quad,
        dir or Enum.EasingDirection.Out,
        0,
        false,
        0
    )
    local tween = TweenService:Create(obj, tweenInfo, props)
    tween:Play()
    return tween
end

-- Toggle animations
local function toggleOn()
    tweenGui(ToggleInner, {Position = UDim2.new(1, -23, 0.5, -10), BackgroundColor3 = Color3.fromRGB(100, 255, 100)}, 0.2)
    tweenGui(ToggleButton, {BackgroundColor3 = Color3.fromRGB(70, 70, 80)}, 0.2)
    ToggleButton.Text = "ON"
    ToggleButton.TextColor3 = Color3.fromRGB(100, 255, 100)
end

local function toggleOff()
    tweenGui(ToggleInner, {Position = UDim2.new(0, 2, 0.5, -10), BackgroundColor3 = Color3.fromRGB(255, 100, 100)}, 0.2)
    tweenGui(ToggleButton, {BackgroundColor3 = Color3.fromRGB(60, 60, 70)}, 0.2)
    ToggleButton.Text = "OFF"
    ToggleButton.TextColor3 = Color3.fromRGB(255, 100, 100)
end

local function teamCheckOn()
    tweenGui(TeamCheckButton, {BackgroundColor3 = Color3.fromRGB(70, 70, 80)}, 0.2)
    TeamCheckButton.TextColor3 = Color3.fromRGB(100, 255, 100)
end

local function teamCheckOff()
    tweenGui(TeamCheckButton, {BackgroundColor3 = Color3.fromRGB(60, 60, 70)}, 0.2)
    TeamCheckButton.TextColor3 = Color3.fromRGB(255, 100, 100)
end

-- Minimize/maximize functions
local function minimizeGui()
    tweenGui(MainFrame, {Size = UDim2.new(0, 250, 0, 30)}, 0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    minimized = true
    MinimizeButton.Text = "+"
end

local function maximizeGui()
    tweenGui(MainFrame, {Size = isMobile and UDim2.new(0, 250, 0, 220) or UDim2.new(0, 250, 0, 180)}, 0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    minimized = false
    MinimizeButton.Text = "-"
end

-- Button events
ToggleButton.MouseButton1Click:Connect(function()
    aimbotEnabled = not aimbotEnabled
    if aimbotEnabled then
        toggleOn()
    else
        toggleOff()
    end
end)

TeamCheckButton.MouseButton1Click:Connect(function()
    teamCheck = not teamCheck
    if teamCheck then
        TeamCheckButton.Text = "ON"
        teamCheckOn()
    else
        TeamCheckButton.Text = "OFF"
        teamCheckOff()
    end
end)

MinimizeButton.MouseButton1Click:Connect(function()
    if minimized then
        maximizeGui()
    else
        minimizeGui()
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    tweenGui(MainFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.3)
    wait(0.3)
    ScreenGui:Destroy()
end)

-- Slider functionality
local sliding = false
local function updateSmoothness(value)
    smoothness = math.clamp(value, 0.1, 1)
    SmoothnessFill.Size = UDim2.new(smoothness, 0, 1, 0)
    SmoothnessHandle.Position = UDim2.new(smoothness, -7, 0.5, -7)
    SmoothnessLabel.Text = "Smoothness: " .. math.floor(smoothness * 100) .. "%"
end

SmoothnessHandle.MouseButton1Down:Connect(function()
    sliding = true
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        sliding = false
    end
end)

Mouse.Move:Connect(function()
    if sliding then
        local x = Mouse.X - SmoothnessSlider.AbsolutePosition.X
        local percent = math.clamp(x / SmoothnessSlider.AbsoluteSize.X, 0, 1)
        updateSmoothness(percent)
    end
end)

-- Mobile slider functionality
if isMobile then
    SmoothnessHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            sliding = true
        end
    end)
    
    UserInputService.TouchEnded:Connect(function(input)
        sliding = false
    end)
    
    UserInputService.TouchMoved:Connect(function(input, gameProcessed)
        if sliding and not gameProcessed then
            local x = input.Position.X - SmoothnessSlider.AbsolutePosition.X
            local percent = math.clamp(x / SmoothnessSlider.AbsoluteSize.X, 0, 1)
            updateSmoothness(percent)
        end
    end)
end

-- Aimbot functionality
local function getClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge
    
    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
        if player ~= Player and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 and player.Character:FindFirstChild("Head") then
            if teamCheck and player.Team == Player.Team then
                continue
            end
            
            local screenPoint, onScreen = workspace.CurrentCamera:WorldToViewportPoint(player.Character.Head.Position)
            if onScreen then
                local distance = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(screenPoint.X, screenPoint.Y)
                distance = distance.Magnitude
                
                if distance < shortestDistance then
                    closestPlayer = player
                    shortestDistance = distance
                end
            end
        end
    end
    
    return closestPlayer
end

RunService.RenderStepped:Connect(function()
    if aimbotEnabled then
        local closestPlayer = getClosestPlayer()
        if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("Head") then
            local head = closestPlayer.Character.Head
            local camera = workspace.CurrentCamera
            
            if camera then
                local cameraPosition = camera.CFrame.Position
                local headPosition = head.Position
                local direction = (headPosition - cameraPosition).Unit
                
                -- Smooth aiming
                local currentLook = camera.CFrame.LookVector
                local newLook = currentLook:Lerp(direction, smoothness * 0.1)
                
                -- Calculate new CFrame
                local newCFrame = CFrame.new(cameraPosition, cameraPosition + newLook)
                camera.CFrame = newCFrame
            end
        end
    end
end)

-- Mobile mode button
MobileButton.MouseButton1Click:Connect(function()
    if MainFrame.Size.Y.Offset == 220 then
        tweenGui(MainFrame, {Size = UDim2.new(0, 250, 0, 30)}, 0.3)
    else
        tweenGui(MainFrame, {Size = UDim2.new(0, 250, 0, 220)}, 0.3)
    end
end)

-- Initial setup
updateSmoothness(0.5)
teamCheckOn()
toggleOff()
