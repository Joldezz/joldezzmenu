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
local Joldezz = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local player = game:GetService("Players").LocalPlayer
local char = player.Character
local rootpart = char.HumanoidRootPart

local JoldezzMenu = Joldezz.Load({
     Title = "Joldezz Menu || Lumber Tycoon 2",
     Style = 3,
     SizeX = 500,
     SizeY = 350,
     Theme = "Dark"
})

local Main = JoldezzMenu.New({
    Title = "Main"
})
local Player = JoldezzMenu.New({
    Title = "Player"
})
local Game = JoldezzMenu.New({
    Title = "Game"
})
local Slot = JoldezzMenu.New({
    Title = "Slot"
})
local Items = JoldezzMenu.New({
    Title = "Items"
})
local Bases = JoldezzMenu.New({
    Title = "Bases"
})
local Teleport = JoldezzMenu.New({
    Title = "Teleport"
})
----Функции
--Спидхак
Player.Slider({
	Text = "Speed Hack",
	Callback = function(Value)
_G.HackedWalkSpeed = Value

local Plrs = game:GetService("Players")

local MyPlr = Plrs.LocalPlayer
local MyChar = MyPlr.Character

if MyChar then
local Hum = MyChar.Humanoid
Hum.Changed:connect(function()
Hum.WalkSpeed = _G.HackedWalkSpeed
end)
Hum.WalkSpeed = _G.HackedWalkSpeed
end


MyPlr.CharacterAdded:connect(function(Char)
MyChar = Char
repeat wait() until Char:FindFirstChild("Humanoid")
local Hum = Char.Humanoid
Hum.Changed:connect(function()
Hum.WalkSpeed = _G.HackedWalkSpeed
end)
Hum.WalkSpeed = _G.HackedWalkSpeed
end)
	end,
	Min = 16,
	Max = 250,
	Def = 16
})
--Джамп Буст
Player.Slider({
	Text = "Jump Power",
	Callback = function(Value)
    game:GetService('Players').LocalPlayer.Character.Humanoid.JumpPower = Value
	end,
	Min = 50,
	Max = 500,
	Def = 50
})
--Ресет скорости и прыжка
Player.Button({
	Text = "Reset JP and WS",
	Callback = function()
		_G.HackedWalkSpeed = 16

local Plrs = game:GetService("Players")

local MyPlr = Plrs.LocalPlayer
local MyChar = MyPlr.Character

if MyChar then
local Hum = MyChar.Humanoid
Hum.Changed:connect(function()
Hum.WalkSpeed = _G.HackedWalkSpeed
end)
Hum.WalkSpeed = _G.HackedWalkSpeed
end


MyPlr.CharacterAdded:connect(function(Char)
MyChar = Char
repeat wait() until Char:FindFirstChild("Humanoid")
local Hum = Char.Humanoid
Hum.Changed:connect(function()
Hum.WalkSpeed = _G.HackedWalkSpeed
end)
Hum.WalkSpeed = _G.HackedWalkSpeed
end)
      wait()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
	end,
})
--Ктрл tp
Player.Button({
	Text = "CTRL TP",
	Callback = function(Value)
		local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse()

Mouse.Button1Down:connect(function()
if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
if not Mouse.Target then return end
Plr.Character:MoveTo(Mouse.Hit.p)
end)
end,
})
--Алт delete
Player.Button({
	Text = "ALT Delete",
	Callback = function(Value)
		local player = game:GetService("Players").LocalPlayer
local mouse = player:GetMouse()
local altDown = false

mouse.Button1Down:Connect(function()
if mouse.Target then
if altDown == true then
mouse.Target:Destroy()
end
end
end)

mouse.KeyDown:Connect(function(key)
if key:byte() == 52 and altDown == false then
altDown = true
spawn(function()
while altDown == true do
wait()
end
end)
end
end)

mouse.KeyUp:Connect(function(key)
if key:byte() == 52 then
altDown = false
end
end)
end,
})

--Создатели
Main.Dropdown({
	Text = "Founders",
	Callback = function(Value)
		print(Value)
	end,
	Options = {
		"Joldezz#0001",
		"TheSharkke#3113"
	},
})
--Скриптер
Main.Dropdown({
	Text = "Scripters",
	Callback = function(Value)
		print(Value)
	end,
	Options = {
        "Joldezz#0001",
        "HighSet#6666"
	},
})
--Партнёры
Main.Dropdown({
	Text = "Partners",
	Callback = function(Value)
		print(Value)
	end,
	Options = {
		"HxED | Vimer#4687"
	},
})
Main.Dropdown({
	Text = "Special Thanks",
	Callback = function(Value)
		print(Value)
	end,
	Options = {
        "Kama#1229",
        "OfCommunity#1502"
	},
})
--Список Изменений
Main.Dropdown({
	Text = "Change Logs V.1.2",
	Callback = function(Value)
		print(Value)
	end,
	Options = {
		"Add Tree Destroy",
        "New Ui",
        "New Co-Founder",
        "Add New Verify System",
        "New Coder"
	},
})
--Удалить деревья
Game.Button({
	Text = "Delete Trees [May Lag]",
	Callback = function()
		    for i,v in pairs(game.Workspace:GetDescendants()) do
        if v.Name == "WoodSection" and v.Parent:FindFirstChild("CutEvent") then
            game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(v.Parent)
            game.ReplicatedStorage.Interaction.DestroyStructure:FireServer(v.Parent)
        end
    end
    game.Workspace.DescendantAdded:connect(function(Thing)
        wait(0.1)
        if Thing.Name == "WoodSection" and Thing.Parent:FindFirstChild("CutEvent") then
            game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(Thing.Parent)
            game.ReplicatedStorage.Interaction.DestroyStructure:FireServer(Thing.Parent)
        end
    end)
	end,
})
--Флай
Player.Button({
	Text = "Fly [E]",
	Callback = function()
  repeat wait()
  until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
  local mouse = game.Players.LocalPlayer:GetMouse()
  repeat wait() until mouse
  local plr = game.Players.LocalPlayer
  local torso = plr.Character.Torso
  local flying = true
  local deb = true
  local ctrl = {f = 0, b = 0, l = 0, r = 0}
  local lastctrl = {f = 0, b = 0, l = 0, r = 0}
  local maxspeed = 100
  local speed = 0

function Fly()
local bg = Instance.new("BodyGyro", torso)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.cframe = torso.CFrame
local bv = Instance.new("BodyVelocity", torso)
bv.velocity = Vector3.new(0,0.1,0)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
repeat wait()
plr.Character.Humanoid.PlatformStand = true
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
speed = speed+.5+(speed/maxspeed)
if speed > maxspeed then
speed = maxspeed
end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
speed = speed-1
if speed < 0 then
speed = 0
end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
else
bv.velocity = Vector3.new(0,0.1,0)
end
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
until not flying
ctrl = {f = 0, b = 0, l = 0, r = 0}
lastctrl = {f = 0, b = 0, l = 0, r = 0}
speed = 0
bg:Destroy()
bv:Destroy()
plr.Character.Humanoid.PlatformStand = false
end
mouse.KeyDown:connect(function(key)
if key:lower() == "e" then
if flying then flying = false
else
flying = true
Fly()
end
elseif key:lower() == "w" then
ctrl.f = 1
elseif key:lower() == "s" then
ctrl.b = -1
elseif key:lower() == "a" then
ctrl.l = -1
elseif key:lower() == "d" then
ctrl.r = 1
end
end)
mouse.KeyUp:connect(function(key)
if key:lower() == "w" then
ctrl.f = 0
elseif key:lower() == "s" then
ctrl.b = 0
elseif key:lower() == "a" then
ctrl.l = 0
elseif key:lower() == "d" then
ctrl.r = 0
end
end)
Fly()
	end,
})
--бесконечные прыжки
Player.Button({
	Text = "Infinity Jump [F]",
	Callback = function()
  _G.infinjump = true

local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
Mouse.KeyDown:connect(function(k)
if _G.infinjump then
if k:byte() == 32 then
Humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
Humanoid:ChangeState("Jumping")
wait(0.1)
Humanoid:ChangeState("Seated")
end
end
end)

local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
Mouse.KeyDown:connect(function(k)
k = k:lower()
if k == "f" then
if _G.infinjump == true then
_G.infinjump = false
else
_G.infinjump = true
end
end
end)
	end,
})
--Телепорты
Teleport.Button({
	Text = "Wood Rous",
	Callback = function(Value)
	local plr = game:service"Players".LocalPlayer;
local tween_s = game:service"TweenService";
local info = TweenInfo.new(0.2,Enum.EasingStyle.Quad);
function tp(...)
   local tic_k = tick();
   local params = {...};
   local cframe = CFrame.new(params[1],params[2],params[3]);
   local tween,err = pcall(function()
       local tween = tween_s:Create(plr.Character["HumanoidRootPart"],info,{CFrame=cframe});
       tween:Play();
   end)
   if not tween then return err end
end
tp( 251.615341, 3, 57.8892059 );
    
end,
})

Teleport.Button({
	Text = "Land Store",
	Callback = function(Value)
	local plr = game:service"Players".LocalPlayer;
local tween_s = game:service"TweenService";
local info = TweenInfo.new(0.2,Enum.EasingStyle.Quad);
function tp(...)
   local tic_k = tick();
   local params = {...};
   local cframe = CFrame.new(params[1],params[2],params[3]);
   local tween,err = pcall(function()
       local tween = tween_s:Create(plr.Character["HumanoidRootPart"],info,{CFrame=cframe});
       tween:Play();
   end)
   if not tween then return err end
end
tp( 244.184799, 3, -98.5241013 );
    
end,
})

Teleport.Button({
	Text = "Fancy Furnishing",
	Callback = function(Value)
	local plr = game:service"Players".LocalPlayer;
local tween_s = game:service"TweenService";
local info = TweenInfo.new(0.2,Enum.EasingStyle.Quad);
function tp(...)
   local tic_k = tick();
   local params = {...};
   local cframe = CFrame.new(params[1],params[2],params[3]);
   local tween,err = pcall(function()
       local tween = tween_s:Create(plr.Character["HumanoidRootPart"],info,{CFrame=cframe});
       tween:Play();
   end)
   if not tween then return err end
end
tp( 491.735687, 3, -1702.80176 );
    
end,
})
Teleport.Button({
	Text = "Boxed Cars",
	Callback = function(Value)
	local plr = game:service"Players".LocalPlayer;
local tween_s = game:service"TweenService";
local info = TweenInfo.new(0.2,Enum.EasingStyle.Quad);
function tp(...)
   local tic_k = tick();
   local params = {...};
   local cframe = CFrame.new(params[1],params[2],params[3]);
   local tween,err = pcall(function()
       local tween = tween_s:Create(plr.Character["HumanoidRootPart"],info,{CFrame=cframe});
       tween:Play();
   end)
   if not tween then return err end
end
tp( 508.631012, 3, -1473.50708 );
    
end,
})
Teleport.Button({
	Text = "Link's Logic",
	Callback = function(Value)
	local plr = game:service"Players".LocalPlayer;
local tween_s = game:service"TweenService";
local info = TweenInfo.new(0.2,Enum.EasingStyle.Quad);
function tp(...)
   local tic_k = tick();
   local params = {...};
   local cframe = CFrame.new(params[1],params[2],params[3]);
   local tween,err = pcall(function()
       local tween = tween_s:Create(plr.Character["HumanoidRootPart"],info,{CFrame=cframe});
       tween:Play();
   end)
   if not tween then return err end
end
tp( 4608.54102, 7.00082207, -768.763855 );
    
end,
})
--Тул ктп
Player.Button({
	Text = "Tool Click TP [Tween Service]",
	Callback = function()
mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Click TP"
tool.Activated:connect(function()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
local plr = game:service"Players".LocalPlayer;
local tween_s = game:service"TweenService";
local info = TweenInfo.new(0.2,Enum.EasingStyle.Quad);
function tp(...)
   local tic_k = tick();
   local params = {...};
   local cframe = CFrame.new(params[1],params[2],params[3]);
   local tween,err = pcall(function()
       local tween = tween_s:Create(plr.Character["HumanoidRootPart"],info,{CFrame=cframe});
       tween:Play();
   end)
   if not tween then return err end
end
tp( pos.X,pos.Y,pos.Z );
end)
tool.Parent = game.Players.LocalPlayer.Backpack
      
      end,
})
