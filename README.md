# Hi welcome to my Rubber Ducky Library its still in development

heres an guide:

booting up the library: 
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RubberDucky778/Rubber-Ducky-Library/refs/heads/main/ui.lua"))()
```
Great after that lets create an window of course!

```lua
local Window = Library.CreateLib("YourTittle", "DeafultTheme")
```

if you want themes there are:
DarkTheme
LightTheme
BlueTheme
GreenTheme
RedTheme
you can always create your own by modifying the sorce code

Creating an tab:
```lua
local Tab1 = Window:NewTab("Tab1")
```

creating an button:

```lua
local Button1 = Tab1:CreateButton({
    Name = "Button Example 1",
    Callback = function()
        print("Button Example 1 Pressed")
    end,
})
```

Creating an slider
I put an walkspeed Example:
```lua
local WalkSpeedSlider = Tab1:CreateSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 100,
    Default = 16,
    Callback = function(value)
        print("WalkSpeed set to", value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end,
})
```
Creating an label:
```lua
local Label1 = Tab1:CreateLabel({
    Name = "Label Example",
    Text = "This is a label example",
})
```
Creating an toggle:
```lua
local Toggle1 = Tab1:CreateToggle({
    Name = "Toggle Example",
    Callback = function(state)
        if state then
            print("Toggle is On")
        else
            print("Toggle is Off")
        end
    end,
})
```

Creating an textbox:
```lua
local TextBox1 = Tab1:CreateTextBox({
    Name = "TextBox Example",
    Default = "Type here...",
    Callback = function(text)
        print("TextBox content:", text)
    end,
})
```

The end bye 🤑🤑😊🌐








