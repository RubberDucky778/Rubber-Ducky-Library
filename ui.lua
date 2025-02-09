local Library = {}

function Library.CreateLib(title, theme)
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local TitleLabel = Instance.new("TextLabel")
    local TabContainer = Instance.new("Frame")
    local TabButtons = Instance.new("Frame")
    local MinimizeButton = Instance.new("TextButton")
    local CloseButton = Instance.new("TextButton")
    local Notification = Instance.new("TextLabel")
    
    ScreenGui.Name = "LibraryUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = game.CoreGui

    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    MainFrame.Size = UDim2.new(0, 400, 0, 300)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.Active = true
    MainFrame.Draggable = true

    TitleLabel.Name = "TitleLabel"
    TitleLabel.Parent = MainFrame
    TitleLabel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TitleLabel.Size = UDim2.new(1, 0, 0, 50)
    TitleLabel.Font = Enum.Font.SourceSans
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 24

    TabButtons.Name = "TabButtons"
    TabButtons.Parent = MainFrame
    TabButtons.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TabButtons.Position = UDim2.new(0, 0, 0, 50)
    TabButtons.Size = UDim2.new(1, 0, 0, 30)

    TabContainer.Name = "TabContainer"
    TabContainer.Parent = MainFrame
    TabContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TabContainer.Position = UDim2.new(0, 0, 0, 80)
    TabContainer.Size = UDim2.new(1, 0, 1, -80)
    TabContainer.ClipsDescendants = true

    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Parent = MainFrame
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
    MinimizeButton.Position = UDim2.new(1, -60, 0, 10)
    MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
    MinimizeButton.Font = Enum.Font.SourceSans
    MinimizeButton.Text = "-"
    MinimizeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    MinimizeButton.TextSize = 24

    CloseButton.Name = "CloseButton"
    CloseButton.Parent = MainFrame
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    CloseButton.Position = UDim2.new(1, -30, 0, 10)
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Font = Enum.Font.SourceSans
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    CloseButton.TextSize = 24

    Notification.Name = "Notification"
    Notification.Parent = ScreenGui
    Notification.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Notification.BackgroundTransparency = 0.5
    Notification.Position = UDim2.new(1, -250, 1, -50)
    Notification.Size = UDim2.new(0, 240, 0, 40)
    Notification.Font = Enum.Font.SourceSans
    Notification.Text = "Press Right Control to restore UI"
    Notification.TextColor3 = Color3.fromRGB(255, 255, 255)
    Notification.TextSize = 18
    Notification.Visible = false

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
    end

    local Window = {}
    local tabs = {}

    function Window:NewTab(tabName)
        local TabButton = Instance.new("TextButton")
        local TabFrame = Instance.new("Frame")

        TabButton.Name = tabName .. "Button"
        TabButton.Parent = TabButtons
        TabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        TabButton.Size = UDim2.new(0, 100, 1, 0)
        TabButton.Position = UDim2.new(#tabs * 0.25, 0, 0, 0)
        TabButton.Font = Enum.Font.SourceSans
        TabButton.Text = tabName
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextSize = 18

        TabFrame.Name = tabName .. "Frame"
        TabFrame.Parent = TabContainer
        TabFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        TabFrame.Size = UDim2.new(1, 0, 1, 0)
        TabFrame.Visible = #tabs == 0

        table.insert(tabs, TabFrame)

        TabButton.MouseButton1Click:Connect(function()
            for _, tab in pairs(tabs) do
                tab.Visible = false
            end
            TabFrame.Visible = true
        end)

        return {
            TabButton = TabButton,
            TabFrame = TabFrame
        }
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

    print("UI Library created with title:", title)

    return Window
end

return Library
