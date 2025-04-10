local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/linlinj1/KevoV2/main/Library.lua"))()
local Window = Library:Window("Custom Evade Script", Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)

-- Tabs
local MovementTab = Window:Tab("Movement")
local EmoteTab = Window:Tab("Emote")

-- Toggles + Sliders for Movement
MovementTab:Toggle("Bhop", false, function(state)
    _G.Bhop = state
end)

MovementTab:Toggle("Infinite Sprint Slide", false, function(state)
    _G.Slide = state
end)

MovementTab:Slider("Speed", 16, 5000, 100, function(val)
    _G.Speed = val
end)

MovementTab:Slider("Strafe Acceleration", 100, 5000, 120, function(val)
    _G.StrafeAccel = val
end)

-- Toggles + Sliders for Emotes
EmoteTab:Slider("Emote Dash Speed", 10, 5000, 60, function(val)
    _G.EmoteDash = val
end)

EmoteTab:Slider("Emote Bounce", 0, 5000, 20, function(val)
    _G.EmoteBounce = val
end)

-- Looping actions (example)
game:GetService("RunService").Heartbeat:Connect(function()
    pcall(function()
        local plr = game.Players.LocalPlayer
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            local hum = plr.Character.Humanoid
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")

            -- Set WalkSpeed if Speed is set
            if _G.Speed then
                hum.WalkSpeed = _G.Speed
            end

            -- Bhop functionality
            if _G.Bhop then
                if hum.FloorMaterial ~= Enum.Material.Air then
                    hum:ChangeState("Jumping")
                end
            end

            -- Infinite Sprint Slide
            if _G.Slide then
                hum.UseJumpPower = false
                hum.JumpPower = 0
            end

            -- Emote Bounce functionality
            if _G.EmoteBounce > 0 and hrp then
                local bounceIntensity = _G.EmoteBounce / 10  -- Adjust the scale of the bounce
                if hum:GetState() == Enum.HumanoidStateType.Physics then
                    hrp.Velocity = Vector3.new(hrp.Velocity.X, bounceIntensity, hrp.Velocity.Z)
                end
            end
        end
    end)
end)
