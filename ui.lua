-- ui.lua

local Library = {}

-- Create the main library function
function Library.CreateLib(name, theme)
    local ui = Instance.new("ScreenGui")
    ui.Name = name
    ui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Create a frame to hold the UI elements
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 400, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    MainFrame.BackgroundColor3 = theme == "DefaultTheme" and Color3.fromRGB(30, 30, 30) or Color3.fromRGB(255, 255, 255)
    MainFrame.Parent = ui

    -- Create a title
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(0, 400, 0, 50)
    Title.Text = name
    Title.BackgroundTransparency = 1
    Title.TextColor3 = Color3.fromRGB(255, 165, 0)  -- Orange color for title
    Title.TextSize = 24
    Title.Parent = MainFrame

    -- Draggable functionality
    local dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    Title.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragStart = input.Position
            startPos = MainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    game:GetService("UserInputService").InputChanged:Disconnect(update)
                end
            end)
            game:GetService("UserInputService").InputChanged:Connect(update)
        end
    end)

    -- Function to create buttons
    function ui:CreateButton(buttonText, callback)
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(0, 200, 0, 50)
        Button.Position = UDim2.new(0, 100, 0, 80)
        Button.Text = buttonText
        Button.BackgroundColor3 = Color3.fromRGB(255, 165, 0) -- Orange button color
        Button.TextColor3 = Color3.fromRGB(0, 0, 0)
        Button.TextSize = 18
        Button.Parent = MainFrame
        
        Button.MouseButton1Click:Connect(callback)
    end

    -- Function to create sliders
    function ui:CreateSlider(sliderText, min, max, defaultValue, callback)
        local SliderFrame = Instance.new("Frame")
        SliderFrame.Size = UDim2.new(0, 350, 0, 50)
        SliderFrame.Position = UDim2.new(0, 25, 0, 120)
        SliderFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        SliderFrame.Parent = MainFrame

        local SliderLabel = Instance.new("TextLabel")
        SliderLabel.Size = UDim2.new(0, 350, 0, 20)
        SliderLabel.Text = sliderText
        SliderLabel.BackgroundTransparency = 1
        SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        SliderLabel.TextSize = 14
        SliderLabel.Parent = SliderFrame

        local Slider = Instance.new("Slider")
        Slider.Size = UDim2.new(0, 350, 0, 5)
        Slider.Position = UDim2.new(0, 0, 0, 25)
        Slider.MinValue = min
        Slider.MaxValue = max
        Slider.Value = defaultValue
        Slider.Parent = SliderFrame

        Slider.Changed:Connect(function(newValue)
            callback(newValue)
        end)
    end

    return ui
end

return Library
