local Library = {}
local TweenService = game:GetService("TweenService")

function Library.CreateLib(title, theme)
    -- Create ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Create Main Frame
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 400, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui

    -- UI Corner for rounded edges
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = MainFrame

    -- Title Bar
    local TitleBar = Instance.new("Frame")
    TitleBar.Size = UDim2.new(1, 0, 0, 30)
    TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TitleBar.Parent = MainFrame

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, 0, 1, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Color3.fromRGB(255, 165, 0)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextSize = 16
    TitleLabel.Parent = TitleBar

    -- Tab Holder
    local TabHolder = Instance.new("Frame")
    TabHolder.Size = UDim2.new(1, 0, 0, 30)
    TabHolder.Position = UDim2.new(0, 0, 0, 30)
    TabHolder.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TabHolder.Parent = MainFrame

    local TabsLayout = Instance.new("UIListLayout")
    TabsLayout.FillDirection = Enum.FillDirection.Horizontal
    TabsLayout.Parent = TabHolder

    -- Buttons Holder
    local ButtonsHolder = Instance.new("Frame")
    ButtonsHolder.Size = UDim2.new(1, -20, 1, -70)
    ButtonsHolder.Position = UDim2.new(0, 10, 0, 60)
    ButtonsHolder.BackgroundTransparency = 1
    ButtonsHolder.Parent = MainFrame

    local ButtonsLayout = Instance.new("UIListLayout")
    ButtonsLayout.Parent = ButtonsHolder

    return {
        MainFrame = MainFrame,
        TabHolder = TabHolder,
        ButtonsHolder = ButtonsHolder
    }
end

-- Button Function
function Library:CreateButton(parent, text, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 40)
    Button.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
    Button.Text = text
    Button.Font = Enum.Font.GothamBold
    Button.TextSize = 14
    Button.Parent = parent.ButtonsHolder

    Button.MouseButton1Click:Connect(callback)
end

-- Tab Function
function Library:CreateTab(parent, name)
    local TabButton = Instance.new("TextButton")
    TabButton.Size = UDim2.new(0, 80, 1, 0)
    TabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TabButton.Text = name
    TabButton.Font = Enum.Font.GothamBold
    TabButton.TextSize = 14
    TabButton.Parent = parent.TabHolder
end

return Library
