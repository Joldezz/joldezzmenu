game.StarterGui:SetCore("SendNotification", {
    Title = "Joldezz Menu";
    Text = "Loading";
    Icon = "rbxassetid://6108728129";
    Duration = 2;
})
wait(1.5)
game.StarterGui:SetCore("SendNotification", {
    Title = "Joldezz Menu";
    Text = "Loading Sucessfull";
    Icon = "rbxassetid://6108728129";
    Duration = 10;
})
sound = Instance.new("Sound")

sound.SoundId = "rbxassetid://6034656129"

sound.Parent = game.Workspace

sound.Volume = 50

sound:Play()
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local player = game:GetService("Players").LocalPlayer
local char = player.Character
local rootpart = char.HumanoidRootPart
local isfolder = game:GetService("Workspace").islandUnlockParts
local rankfolder = game:GetService("ReplicatedStorage").Ranks
local coinsfolder = game:GetService("Workspace").spawnedCoins.Valley
local hoopfolder = game:GetService("Workspace").Hoops
local bossfolder = game:GetService("Workspace").bossFolder

local UI = Material.Load({
     Title = "Joldezz Menu || Ninja Legends",
     Style = 1,
     SizeX = 400,
     SizeY = 300,
     Theme = "Dark"
})

local Page = UI.New({
    Title = "AutoFarm"
})

Page.Toggle({
    Text = "Auto Rank",
    Callback = function(value)
        _G.rank = value

        while true do
        if not _G.rank then return end
        local A_1 = "buyRank"
        local A_2 = game:GetService("ReplicatedStorage").Ranks.Ground:GetChildren()
        for i = 1,#A_2 do
        game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(A_1, A_2[i].Name)
        end
        wait()
        end
    Enabled = false
end,
Menu = {
    Information = function(self)
        UI.Banner({
            Text = "Automatically buys the next rank"            
        })
    end
}
})

Page.Toggle({
    Text = "Auto Swing",
    Callback = function(value)
        _G.swing = value

        while true do
        if not _G.swing then return end
        local A_1 = "swingKatana" -- args
        local Event = player.ninjaEvent -- event
        Event:FireServer(A_1)
        wait()
        end
    Enabled = false
end,
Menu = {
    Information = function(self)
        UI.Banner({
            Text = "Automatically swings sword once again made by me"            
        })
    end
}
})

Page.Toggle({
    Text = "Auto Sword",
    Callback = function(value)
        _G.sword = value

        while true do
        if not _G.sword then return end
            local A_1 = "buyAllSwords" -- buys swords not belts
            local A_2 = "Inner Peace Island" -- Max Island
            local Event = player.ninjaEvent
            Event:FireServer(A_1, A_2)
            wait()
        end
    Enabled = false
end,
Menu = {
    Information = function(self)
        UI.Banner({
            Text = "Automatically buys swords once again made by me"            
        })
    end
}
})

Page.Toggle({
    Text = "Auto Belt",
    Callback = function(value)
        _G.belt = value

        while true do 
        if not _G.belt then return end
            local A_1 = "buyAllBelts" -- buys belts not swords
            local A_2 = "Inner Peace Island" -- Max Island
            local Event = player.ninjaEvent
            Event:FireServer(A_1, A_2)
            wait()
        end
    Enabled = false
end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Automatically buys belts once again made by me"            
            })
        end
    }
})

Page.Toggle({
    Text = "Auto Sell",
    Callback = function(value)
        _G.sell = value

        while true do
        if not _G.sell then return end
            local circle = game:GetService("Workspace").sellAreaCircles.sellAreaCircle16.circleInner
            circle.CFrame = rootpart.CFrame
            wait(1)
        end
    Enabled = false
end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Have to be moving for it to work made by me :)"            
            })
        end
    }
})


local Page = UI.New({
    Title = "Misc"
})

Page.Toggle({
    Text = "Farm Robot",
    Callback = function(value)
        _G.robot = value
        
        while true do
        if not _G.robot then return end
        local check = bossfolder:FindFirstChild("RobotBoss")
        if check == nil then return end
        rootpart.CFrame = bossfolder["RobotBoss"].HumanoidRootPart.CFrame
        local A_1 = "swingKatana"
        local Event = game:GetService("Players").LocalPlayer.ninjaEvent
        Event:FireServer(A_1)
        wait()
        end
    Enabled = false
end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "AutoFarms Robot"            
            })
        end
    }
})

Page.Toggle({
    Text = "Farm Eternal Boss",
    Callback = function(value)
        _G.robot = value
        
        while true do
        if not _G.robot then return end
        local check = bossfolder:FindFirstChild("EternalBoss")
        if check == nil then return end
        rootpart.CFrame = bossfolder["EternalBoss"].HumanoidRootPart.CFrame
        local A_1 = "swingKatana"
        local Event = game:GetService("Players").LocalPlayer.ninjaEvent
        Event:FireServer(A_1)
        wait()
        end
    Enabled = false
end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "AutoFarms Eternal Boss"            
            })
        end
    }
})

Page.Toggle({
    Text = "Farm Magma Boss",
    Callback = function(value)
        _G.robot = value
        
        while true do
        if not _G.robot then return end
        local check = bossfolder:FindFirstChild("AncientMagmaBoss")
        if check == nil then return end
        rootpart.CFrame = bossfolder["AncientMagmaBoss"].HumanoidRootPart.CFrame
        local A_1 = "swingKatana"
        local Event = game:GetService("Players").LocalPlayer.ninjaEvent
        Event:FireServer(A_1)
        wait()
        end
    Enabled = false
end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "AutoFarms Magma Boss"            
            })
        end
    }
})

Page.Button({
    Text = "Unlock All Islands",
    Callback = function()
        local cfbeforetp = rootpart.CFrame
        for i,v in pairs(isfolder:GetChildren()) do
            rootpart.CFrame = v.CFrame
            wait(0.25)
        end
        rootpart.Cframe = cfbeforetp
    end,
Menu = {
    Information = function(self)
        UI.Banner({
            Text = "Does what the name says"            
        })
    end
}
})

Page.Button({
    Text = "Teleport to coins",
    Callback = function()
        for i,v in pairs(coinsfolder:GetChildren()) do
            rootpart.CFrame = v.CFrame
            wait(0.5)
        end
    end,
Menu = {
    Information = function(self)
        UI.Banner({
            Text = "Will go on for a long time so don't recommend"            
        })
    end
}
})

Page.Button({
    Text = "Teleport to Hoops",
    Callback = function()
        for i,v in pairs(hoopfolder:GetChildren()) do
            rootpart.CFrame = v.touchPart.CFrame
            wait(0.5)
        end
    end,
Menu = {
    Information = function(self)
        UI.Banner({
            Text = "Will go on for a long time so don't recommend"            
        })
    end
}
})

Page.Dropdown({
    Text = "Unlock an Element",
    Callback = function(value)
        game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer(value)
    end,
    Options = {"Inferno", "Frost", "Lightning", "Electral Chaos", "Masterful Wrath", "Shadow Charge", "Eternity Storm", "ShadowFire"}
})

local Page2 = UI.New({
    Title = "Credits"
})

Page2.Dropdown({
    Text = "Founders",
    Callback = function(value)
        print("Founders")
    end,
    Options = {"Joldezz"}
})
Page2.Dropdown({
    Text = "UI Maker",
    Callback = function(value)
        print("UI MAKER")
    end,
    Options = {"TheSharkke"}
})
