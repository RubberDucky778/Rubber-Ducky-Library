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

    if theme == "DarkTheme" then
        MainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        TitleLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        TabButtons.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        TabContainer.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    elseif theme == "LightTheme" then
        MainFrame.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
        TitleLabel.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
        TitleLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
        TabButtons.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
        TabContainer.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
    elseif theme == "BlueTheme" then
        MainFrame.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
        TitleLabel.BackgroundColor3 = Color3.fromRGB(60, 120, 170)
        TabButtons.BackgroundColor3 = Color3.fromRGB(60, 120, 170)
        TabContainer.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
    elseif theme == "GreenTheme" then
        MainFrame.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
        TitleLabel.BackgroundColor3 = Color3.fromRGB(30, 130, 30)
        TabButtons.BackgroundColor3 = Color3.fromRGB(30, 130, 30)
        TabContainer.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
    elseif theme == "RedTheme" then
        MainFrame.BackgroundColor3 = Color3.fromRGB(220, 20, 60)
        TitleLabel.BackgroundColor3 = Color3.fromRGB(210, 10, 50)
        TabButtons.BackgroundColor3 = Color3.fromRGB(210, 10, 50)
        TabContainer.BackgroundColor3 = Color3.fromRGB(220, 20, 60)
    end

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
        ScrollingFrame.CanvasSize = UDim2.new(0, 0, 2, 0) -- Adjust as needed
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

        function Tab:CreateSlider(sliderData)
            local SliderFrame = Instance.new("Frame")
            local SliderLabel = Instance.new("TextLabel")
            local Slider = Instance.new("TextButton")
            local SliderBar = Instance.new("Frame")

            SliderFrame.Name = sliderData.Name .. "Frame"
            SliderFrame.Parent = ScrollingFrame
            SliderFrame.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            SliderFrame.Size = UDim2.new(1, -20, 0, 50)
            SliderFrame.Position = UDim2.new(0, 10, 0, 10 + (#ScrollingFrame:GetChildren() - 1) * 60)
            AddCorners(SliderFrame, 6)

            SliderLabel.Name = sliderData.Name .. "Label"
            SliderLabel.Parent = SliderFrame
            SliderLabel.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            SliderLabel.Size = UDim2.new(0, 100, 1, 0)
            SliderLabel.Font = Enum.Font.Gotham
            SliderLabel.Text = "  " .. sliderData.Name
            SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderLabel.TextSize = 14
            AddCorners(SliderLabel, 6)

            SliderBar.Name = sliderData.Name .. "Bar"
            SliderBar.Parent = SliderFrame
            SliderBar.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
            SliderBar.Position = UDim2.new(0, 110, 0.5, -5)
            SliderBar.Size = UDim2.new(1, -120, 0, 10)
            AddCorners(SliderBar, 6)

            Slider.Name = sliderData.Name
            Slider.Parent = SliderBar
            Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Slider.Size = UDim2.new(0, 20, 1, 0)
            Slider.Position = UDim2.new((sliderData.Default - sliderData.Min) / (sliderData.Max - sliderData.Min), -10, 0, 0)
            Slider.Text = ""
            AddCorners(Slider, 6)

            local dragging = false
            local function updateSlider(input)
                local pos = UDim2.new(math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1), -10, 0, 0)
                Slider.Position = pos
                local value = math.floor(sliderData.Min + (pos.X.Scale * (sliderData.Max - sliderData.Min)))
                sliderData.Callback(value)
            end

            Slider.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                end
            end)

            Slider.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)

            game:GetService("UserInputService").InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    updateSlider(input)
                end
            end)
        end

        function Tab:CreateLabel(labelData)
            local Label = Instance.new("TextLabel")

            Label.Name = labelData.Name
            Label.Parent = ScrollingFrame
            Label.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            Label.Size = UDim2.new(1, -20, 0, 35)
            Label.Position = UDim2.new(0, 10, 0, 10 + (#ScrollingFrame:GetChildren() - 1) * 45)
            Label.Font = Enum.Font.Gotham
            Label.Text = "  " .. labelData.Text
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextSize = 14
            Label.TextXAlignment = Enum.TextXAlignment.Left
            AddCorners(Label, 6)
            AddStroke(Label)
        end

        function Tab:CreateToggle(toggleData)
            local ToggleFrame = Instance.new("Frame")
            local ToggleLabel = Instance.new("TextLabel")
            local Toggle = Instance.new("TextButton")

            ToggleFrame.Name = toggleData.Name .. "Frame"
            ToggleFrame.Parent = ScrollingFrame
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            ToggleFrame.Size = UDim2.new(1, -20, 0, 50)
            ToggleFrame.Position = UDim2.new(0, 10, 0, 10 + (#ScrollingFrame:GetChildren() - 1) * 60)
            AddCorners(ToggleFrame, 6)

            ToggleLabel.Name = toggleData.Name .. "Label"
            ToggleLabel.Parent = ToggleFrame
            ToggleLabel.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            ToggleLabel.Size = UDim2.new(0.8, 0, 1, 0)
            ToggleLabel.Font = Enum.Font.Gotham
            ToggleLabel.Text = "  " .. toggleData.Name
            ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleLabel.TextSize = 14
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            AddCorners(ToggleLabel, 6)

            Toggle.Name = toggleData.Name
            Toggle.Parent = ToggleFrame
            Toggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            Toggle.Size = UDim2.new(0.2, 0, 1, 0)
            Toggle.Position = UDim2.new(0.8, 0, 0, 0)
            Toggle.Text = "Off"
            AddCorners(Toggle, 6)

            local toggled = false
            Toggle.MouseButton1Click:Connect(function()
                toggled = not toggled
                Toggle.BackgroundColor3 = toggled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
                Toggle.Text = toggled and "On" or "Off"
                toggleData.Callback(toggled)
            end)
        end

        function Tab:CreateTextBox(textBoxData)
            local TextBoxFrame = Instance.new("Frame")
            local TextBoxLabel = Instance.new("TextLabel")
            local TextBox = Instance.new("TextBox")

            TextBoxFrame.Name = textBoxData.Name .. "Frame"
            TextBoxFrame.Parent = ScrollingFrame
            TextBoxFrame.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            TextBoxFrame.Size = UDim2.new(1, -20, 0, 50)
            TextBoxFrame.Position = UDim2.new(0, 10, 0, 10 + (#ScrollingFrame:GetChildren() - 1) * 60)
            AddCorners(TextBoxFrame, 6)

            TextBoxLabel.Name = textBoxData.Name .. "Label"
            TextBoxLabel.Parent = TextBoxFrame
            TextBoxLabel.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            TextBoxLabel.Size = UDim2.new(0.3, 0, 1, 0)
            TextBoxLabel.Font = Enum.Font.Gotham
            TextBoxLabel.Text = "  " .. textBoxData.Name
            TextBoxLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextBoxLabel.TextSize = 14
            TextBoxLabel.TextXAlignment = Enum.TextXAlignment.Left
            AddCorners(TextBoxLabel, 6)

            TextBox.Name = textBoxData.Name
            TextBox.Parent = TextBoxFrame
            TextBox.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
            TextBox.Position = UDim2.new(0.3, 10, 0, 10)
            TextBox.Size = UDim2.new(0.65, -20, 0.8, -20)
            TextBox.Font = Enum.Font.Gotham
            TextBox.Text = textBoxData.Default or ""
            TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.TextSize = 14
            AddCorners(TextBox, 6)
            TextBox.FocusLost:Connect(function(enterPressed)
                if enterPressed then
                    textBoxData.Callback(TextBox.Text)
                end
            end)
        end

        return Tab
    end

    MinimizeButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
        Notification.Visible = true
        delay(5, function()
            if Notification then
                Notification.Visible = false
            end
        end)
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
