local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Star's Gui", "BloodTheme")

-- Main
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Main")
MainSection:NewKeybind("Open/Close menu", "Opens and closes the menu", Enum.KeyCode.E, function()
    Library:ToggleUI()
end)

--------------
-- fly
--------------

MainSection:NewButton("Fly", "bird mode", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/BypassedFly.lua"))() 

    Fly(true)
end)
 
--------------
-- Toggle stuff
--------------
local Toggle = Window:NewTab("Toggle")
local ToggleSection = Toggle:NewSection("Toggle")


--------------
-- infinite jump
--------------

ToggleSection:NewToggle("Infinite Jump", "Lets you infinitely jump", function()
    local InfiniteJumpEnabled = true
    game:GetService("UserInputService").JumpRequest:connect(function()
        if InfiniteJumpEnabled then
            game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
        end
    end)
end)


--------------
-- auto drop
--------------

getgenv().auttodropval = false

local function autoDrop()
    task.spawn(function()
        while getgenv().auttodropval and task.wait() do
            if not getgenv().auttodropval then
                break
            end
            game:GetService("ReplicatedStorage").MainEvent:FireServer("DropMoney", "10000")
        end
    end)
end

ToggleSection:NewToggle("Autodrop", "Lets u autodrop", function(Value)
    getgenv().auttodropval = Value
    autoDrop()
end)



--------------
-- cash aura
--------------

getgenv().cashaura = false

ToggleSection:NewToggle("Cash Aura", "automatically picks up cash near you", function(Value)
  getgenv().cashaura = Value
  while game:GetService("RunService").Heartbeat:wait() do
    if not getgenv().cashaura then break end
    for i,v in pairs(game:GetService("Workspace").Ignored.Drop:GetChildren()) do
            if v.Name == "MoneyDrop" then      
            if game.Players.LocalPlayer:DistanceFromCharacter(v.Position) < 11 then
            fireclickdetector(v.ClickDetector)      
          end  
        end
    end
  end
end