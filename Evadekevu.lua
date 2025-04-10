local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/linlinj1/KevoV2/main/Library.lua"))()
local Window = Library:Window("Custom Evade Script", Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)

-- Tabs
local MovementTab = Window:Tab("Movement")
local EmoteTab = Window:Tab("Emote")

-- Toggles + Sliders for Movement
MovementTab:Toggle("Bhop", false, function(state)
    getgenv().Bhop = state
end)

MovementTab:Toggle("Infinite Sprint Slide", false, function(state)
    getgenv().Slide = state
end)

MovementTab:Slider("Speed", 16, 200, 100, function(val)
    getgenv().Speed = val
end)

MovementTab:Slider("Strafe Acceleration", 100, 600, 120, function(val)
    getgenv().StrafeAccel = val
end)

-- Toggles + Sliders for Emotes
EmoteTab:Slider("Emote Dash Speed", 10, 200, 60, function(val)
    getgenv().EmoteDash = val
end)

EmoteTab:Slider("Emote Bounce", 0, 100, 20, function(val)
    getgenv().EmoteBounce = val
end)

-- Looping actions (example)
game:GetService("RunService").Heartbeat:Connect(function()
    pcall(function()
        local plr = game.Players.LocalPlayer
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            local hum = plr.Character.Humanoid

            if getgenv().Speed then
                hum.WalkSpeed = getgenv().Speed
            end

            if getgenv().Bhop then
                if hum.FloorMaterial ~= Enum.Material.Air then
                    hum:ChangeState("Jumping")
                end
            end

            if getgenv().Slide then
                hum.UseJumpPower = false
                hum.JumpPower = 0
            end
        end
    end)
end)
