local Library = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

function Library.CreateLib(title, theme)
    -- Theme colors
    local themes = {
        DefaultTheme = {
            MainColor = Color3.fromRGB(35, 35, 35),
            SecondaryColor = Color3.fromRGB(45, 45, 45),
            AccentColor = Color3.fromRGB(0, 170, 255),
            TextColor = Color3.fromRGB(255, 255, 255)
        }
    }
    
    local selectedTheme = themes[theme] or themes.DefaultTheme
    
    -- Create main GUI elements
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "CustomUI"
    ScreenGui.Parent = game.CoreGui
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 500, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
    MainFrame.BackgroundColor3 = selectedTheme.MainColor
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    
    -- Add corner radius
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = MainFrame
    
    -- Create title bar
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Size = UDim2.new(1, 0, 0, 30)
    TitleBar.BackgroundColor3 = selectedTheme.SecondaryColor
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 6)
    TitleCorner.Parent = TitleBar
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "Title"
    TitleLabel.Text = title
    TitleLabel.Size = UDim2.new(1, -30, 1, 0)
    TitleLabel.Position = UDim2.new(0, 10, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextColor3 = selectedTheme.TextColor
    TitleLabel.TextSize = 16
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = TitleBar
    
    -- Create close button
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Size = UDim2.new(0, 20, 0, 20)
    CloseButton.Position = UDim2.new(1, -25, 0, 5)
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
    CloseButton.Text = ""
    CloseButton.Parent = TitleBar
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 10)
    CloseCorner.Parent = CloseButton
    
    -- Create container for tabs
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.Size = UDim2.new(1, 0, 1, -30)
    TabContainer.Position = UDim2.new(0, 0, 0, 30)
    TabContainer.BackgroundTransparency = 1
    TabContainer.Parent = MainFrame
    
    -- Make the window draggable
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    -- Close button functionality
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    -- Window object with methods for adding tabs and elements
    local Window = {}
    
    function Window:CreateTab(name)
        local Tab = {}
        
        local TabButton = Instance.new("TextButton")
        TabButton.Name = name
        TabButton.Size = UDim2.new(0, 100, 0, 25)
        TabButton.BackgroundColor3 = selectedTheme.SecondaryColor
        TabButton.Text = name
        TabButton.TextColor3 = selectedTheme.TextColor
        TabButton.Font = Enum.Font.Gotham
        TabButton.TextSize = 14
        TabButton.Parent = TabContainer
        
        local TabContent = Instance.new("ScrollingFrame")
        TabContent.Name = name.."Content"
        TabContent.Size = UDim2.new(1, -110, 1, 0)
        TabContent.Position = UDim2.new(0, 105, 0, 0)
        TabContent.BackgroundTransparency = 1
        TabContent.ScrollBarThickness = 4
        TabContent.Visible = false
        TabContent.Parent = TabContainer
        
        function Tab:AddButton(buttonText, callback)
            local Button = Instance.new("TextButton")
            Button.Name = buttonText
            Button.Size = UDim2.new(1, -20, 0, 30)
            Button.Position = UDim2.new(0, 10, 0, #TabContent:GetChildren() * 35)
            Button.BackgroundColor3 = selectedTheme.SecondaryColor
            Button.Text = buttonText
            Button.TextColor3 = selectedTheme.TextColor
            Button.Font = Enum.Font.Gotham
            Button.TextSize = 14
            Button.Parent = TabContent
            
            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 4)
            ButtonCorner.Parent = Button
            
            Button.MouseButton1Click:Connect(callback)
        end
        
        return Tab
    end
    
    return Window
end

return Library
