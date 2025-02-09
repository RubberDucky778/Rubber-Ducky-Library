local Library = {}

function Library.CreateLib(title, theme)
    local function AddCorners(instance, radius)
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, radius or 6)
        corner.Parent = instance
        return corner
    end

    local function AddStroke(instance, color, thickness)
        local stroke = Instance.new("UIStroke")
        stroke.Color = color or Color3.fromRGB(65, 65, 70)
        stroke.Thickness = thickness or 1
        stroke.Parent = instance
        return stroke
    end

    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local TitleLabel = Instance.new("TextLabel")
    local TabContainer = Instance.new("Frame")
    local TabButtons = Instance.new("Frame")
    local MinimizeButton = Instance.new("TextButton")
    local CloseButton = Instance.new("TextButton")
    local Notification = Instance.new("TextLabel")
    
    ScreenGui.Name = "EnhancedUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = game.CoreGui

    -- Main Frame with enhanced corners and stroke
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
    MainFrame.Size = UDim2.new(0, 500, 0, 400)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.Active = true
    MainFrame.Draggable = true
    AddCorners(MainFrame, 10)
    AddStroke(MainFrame)

    -- Drop shadow effect
    local DropShadow = Instance.new("ImageLabel")
    DropShadow.Name = "DropShadow"
    DropShadow.Parent = MainFrame
    DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    DropShadow.BackgroundTransparency = 1
    DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    DropShadow.Size = UDim2.new(1, 47, 1, 47)
    DropShadow.ZIndex = -1
    DropShadow.Image = "rbxassetid://6014261993"
    DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    DropShadow.ImageTransparency = 0.5
    DropShadow.ScaleType = Enum.ScaleType.Slice
    DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

    -- Title with enhanced appearance
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Parent = MainFrame
    TitleLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
    TitleLabel.Size = UDim2.new(1, 0, 0, 40)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = "   " .. title
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 18
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    AddCorners(TitleLabel, 8)
    AddStroke(TitleLabel)

    -- Tab buttons container with rounded corners
    TabButtons.Name = "TabButtons"
    TabButtons.Parent = MainFrame
    TabButtons.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
    TabButtons.Position = UDim2.new(0, 10, 0, 50)
    TabButtons.Size = UDim2.new(0, 120, 1, -60)
    AddCorners(TabButtons, 8)
    AddStroke(TabButtons)

    -- Tab container with rounded corners
    TabContainer.Name = "TabContainer"
    TabContainer.Parent = MainFrame
    TabContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
    TabContainer.Position = UDim2.new(0, 140, 0, 50)
    TabContainer.Size = UDim2.new(1, -150, 1, -60)
    TabContainer.ClipsDescendants = true
    AddCorners(TabContainer, 8)
    AddStroke(TabContainer)

    -- Enhanced button styling
    local function CreateButton(name, color)
        local Button = Instance.new("TextButton")
        Button.Name = name
        Button.Parent = MainFrame
        Button.BackgroundColor3 = color
        Button.Position = name == "CloseButton" and UDim2.new(1, -35, 0, 8) or UDim2.new(1, -65, 0, 8)
        Button.Size = UDim2.new(0, 25, 0, 25)
        Button.Font = Enum.Font.GothamBold
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.TextSize = 14
        Button.Text = name == "CloseButton" and "×" or "-"
        AddCorners(Button, 6)
        AddStroke(Button, Color3.fromRGB(255, 255, 255), 1)
        
        -- Hover effect
        local originalColor = color
        Button.MouseEnter:Connect(function()
            game:GetService("TweenService"):Create(Button, TweenInfo.new(0.2), {
                BackgroundColor3 = color:Lerp(Color3.fromRGB(255, 255, 255), 0.2)
            }):Play()
        end)
        
        Button.MouseLeave:Connect(function()
            game:GetService("TweenService"):Create(Button, TweenInfo.new(0.2), {
                BackgroundColor3 = originalColor
            }):Play()
        end)
        
        return Button
    end

    MinimizeButton = CreateButton("MinimizeButton", Color3.fromRGB(255, 180, 0))
    CloseButton = CreateButton("CloseButton", Color3.fromRGB(255, 70, 70))

    -- Enhanced notification with rounded corners
    Notification.Name = "Notification"
    Notification.Parent = ScreenGui
    Notification.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
    Notification.Position = UDim2.new(1, -250, 1, -80)
    Notification.Size = UDim2.new(0, 240, 0, 40)
    Notification.Font = Enum.Font.Gotham
    Notification.Text = "  Press Right Control to restore UI"
    Notification.TextColor3 = Color3.fromRGB(255, 255, 255)
    Notification.TextSize = 14
    Notification.TextXAlignment = Enum.TextXAlignment.Left
    Notification.Visible = false
    AddCorners(Notification, 8)
    AddStroke(Notification)

    local Window = {}
    local tabs = {}

    function Window:NewTab(tabName)
        local TabButton = Instance.new("TextButton")
        local TabFrame = Instance.new("Frame")
        
        -- Enhanced tab button
        TabButton.Name = tabName .. "Button"
        TabButton.Parent = TabButtons
        TabButton.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
        TabButton.Size = UDim2.new(1, -10, 0, 30)
        TabButton.Position = UDim2.new(0, 5, 0, 5 + (#tabs * 35))
        TabButton.Font = Enum.Font.Gotham
        TabButton.Text = "  " .. tabName
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextSize = 14
        TabButton.TextXAlignment = Enum.TextXAlignment.Left
        AddCorners(TabButton, 6)
        AddStroke(TabButton)

        -- Tab content frame with rounded corners
        TabFrame.Name = tabName .. "Frame"
        TabFrame.Parent = TabContainer
        TabFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        TabFrame.Size = UDim2.new(1, -10, 1, -10)
        TabFrame.Position = UDim2.new(0, 5, 0, 5)
        TabFrame.Visible = #tabs == 0
        AddCorners(TabFrame, 6)
        
        -- Create ScrollingFrame for content
        local ScrollingFrame = Instance.new("ScrollingFrame")
        ScrollingFrame.Parent = TabFrame
        ScrollingFrame.BackgroundTransparency = 1
        ScrollingFrame.Size = UDim2.new(1, -10, 1, -10)
        ScrollingFrame.Position = UDim2.new(0, 5, 0, 5)
        ScrollingFrame.ScrollBarThickness = 3
        ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(65, 65, 70)
        AddCorners(ScrollingFrame, 6)

        table.insert(tabs, TabFrame)

        -- Tab button click handler
        TabButton.MouseButton1Click:Connect(function()
            for _, tab in pairs(tabs) do
                tab.Visible = false
            end
            TabFrame.Visible = true
        end)

        local Tab = {}
        
        -- Enhanced component creation functions
        function Tab:CreateButton(buttonData)
            local Button = Instance.new("TextButton")
            Button.Name = buttonData.Name
            Button.Parent = ScrollingFrame
            Button.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
            Button.Size = UDim2.new(1, -20, 0, 35)
            Button.Position = UDim2.new(0, 10, 0, 10 + (#ScrollingFrame:GetChildren() - 1) * 45)
            Button.Font = Enum.Font.Gotham
            Button.Text = "  " .. buttonData.Name
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 14
            Button.TextXAlignment = Enum.TextXAlignment.Left
            AddCorners(Button, 6)
            AddStroke(Button)

            Button.MouseButton1Click:Connect(buttonData.Callback)
            return Button
        end

        -- Similar enhancements for other component creation functions...
        
        return Tab
    end

    -- Window controls
    MinimizeButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
        Notification.Visible = true
        wait(3)
        if Notification.Visible then
            Notification.Visible = false
        end
    end)

    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == Enum.KeyCode.RightControl and not gameProcessed then
            MainFrame.Visible = true
            Notification.Visible = false
        end
    end)

    return Window
end

return Library
