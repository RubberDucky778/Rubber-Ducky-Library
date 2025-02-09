local Library = {}

function Library.CreateLib(title, theme)
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local TitleLabel = Instance.new("TextLabel")
    
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

    if theme == "DarkTheme" then
        MainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        TitleLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    elseif theme == "LightTheme" then
        MainFrame.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
        TitleLabel.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
        TitleLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    end

    print("UI Library created with title:", title)

    return {
        ScreenGui = ScreenGui,
        MainFrame = MainFrame
    }
end

return Library
