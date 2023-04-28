-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!
-- ello skid!

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
game.StarterGui:SetCore("SendNotification", {Title="Made By: Cartxrr"; Text=".gg/7gacGPFbMk"; Duration=5;})
game.StarterGui:SetCore("SendNotification", {Title="Join my Discord"; Text="Link was copied"; Duration=5;})
setclipboard("https://discord.gg/7gacGPFbMk")
wait(1)
local Window = Library.CreateLib("Cartxrr's Ware", "DarkTheme")
local ph = Window:NewTab("Player 🤠")

local s = ph:NewSection("Speed 🏃‍")
s:NewSlider("Set Speed", "Set Player Speed", 500, 0, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
s:NewButton("Reset Speed", "Reset Player Speed", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)

local j = ph:NewSection("Jump 🦘")
j:NewSlider("Set Jumpheight", "Set Player Jump Height", 500, 0, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)
j:NewButton("Reset Jumpheight", "Reset Player Jump Height", function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
end)

local f = ph:NewSection("Fly 🦸‍")
f:NewButton("Fly Script!", "injects the fly script into game", function()
    game.StarterGui:SetCore("SendNotification", {Title="Fly Script"; Text="Press Q to Enable/Disable Fly"; Duration=5;})

repeat wait()

until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")

local mouse = game.Players.LocalPlayer:GetMouse()

repeat wait() until mouse

local plr = game.Players.LocalPlayer

local torso = plr.Character.Torso

local flying = false

local deb = true

local ctrl = {f = 0, b = 0, l = 0, r = 0}

local lastctrl = {f = 0, b = 0, l = 0, r = 0}

local maxspeed = 50

local speed = 0

local flykeyyyyy = "q" 

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

if key:lower() == flykeyyyyy then

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
    
end)

local n = ph:NewSection("No Clip 👻‍")
n:NewButton("Noclip!", "hell yea", function()
   local Noclip = nil
	local Clip = nil

	function noclip()
		Clip = false
		local function Nocl()
			if Clip == false and game.Players.LocalPlayer.Character ~= nil then
				for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
					if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
						v.CanCollide = false
					end
				end
			end
			wait(0.21) -- basic optimization
		end
		Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
	end

	function clip()
		if Noclip then Noclip:Disconnect() end
		Clip = true
	end

	noclip()
end)

-- da hood

local dh = Window:NewTab("Da Hood 🔪")
local fm = dh:NewSection("Fake Macro 🏃‍")
fm:NewButton("Enable", "enables macro", function()
	
game.StarterGui:SetCore("SendNotification", {Title="Fake Macro"; Text="enjoy your macro bb  ♥ keybind: z"; Duration=5;})

plr = game:GetService('Players').LocalPlayer
     down = true

     function onButton1Down(mouse)
         down = true
         while down do
             if not down then break end
             local char = plr.Character
             char.HumanoidRootPart.Velocity = char.HumanoidRootPart.CFrame.lookVector * Speed
             wait()
         end
     end

     function onButton1Up(mouse)
         down = false
     end

     function onSelected(mouse)
         mouse.KeyDown:connect(function(q) if q:lower()=="z"then onButton1Down(mouse)end end)
         mouse.KeyUp:connect(function(q) if q:lower()=="z"then onButton1Up(mouse)end end)
     end
     onSelected(game.Players.LocalPlayer:GetMouse())
end)

fm:NewSlider("Speed", "sets speed", 500, 0, function(s)
    getgenv().Speed = s
end)

local cs = dh:NewSection("Chat Spy 📖")

cs:NewButton("Enable", "Enable chat spy", function()
    --This script reveals ALL hidden messages in the default chat
enabled = true
spyOnMyself = trues
privateProperties = {
	Color = Color3.fromRGB(255,255,255); 
	Font = Enum.Font.SourceSansBold;
	TextSize = 18;
}
--////////////////////////////////////////////////////////////////
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local instance = (_G.chatSpyInstance or 0) + 1
_G.chatSpyInstance = instance

local function onChatted(p,msg)
	if _G.chatSpyInstance == instance then
		if p==player and msg:lower():sub(1,4)=="/spy" then
			enabled = not enabled
			wait(0.3)
			privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
			StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
		elseif enabled and (spyOnMyself==true or p~=player) then
			msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
			local hidden = true
			local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
				if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and Players[packet.FromSpeaker].Team==player.Team)) then
					hidden = false
				end
			end)
			wait(1)
			conn:Disconnect()
			if hidden and enabled then
				if public then
					saymsg:FireServer((publicItalics and "/me " or '').."{SPY} [".. p.Name .."]: "..msg,"All")
				else
					privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
					StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
				end
			end
		end
	end
end

for _,p in ipairs(Players:GetPlayers()) do
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end
Players.PlayerAdded:Connect(function(p)
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end)
privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
local chatFrame = player.PlayerGui.Chat.Frame
chatFrame.ChatChannelParentFrame.Visible = true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)
end)

local sa = dh:NewSection("Silent Aim Settings ⚙‍")

sa:NewSlider("Fov Size", "sets the silent aim fov size", 500, 0, function(s)
    getgenv().FOV =  s
end)

sa:NewToggle("Show FOV", "shows the fov circle", function(state)
    if state then
        getgenv().FOV_VISIBLE = true
    else
        getgenv().FOV_VISIBLE = false
    end
end)

sa:NewTextBox("Silent Aim Key", "disables silent aim when you press this key", function(txt)
	getgenv().AimKey = txt
end)

local sae = dh:NewSection("Silent Aim 🔫 (do all settings first)")

sae:NewButton("Enable", "enable silent aim", function()

 game.StarterGui:SetCore("SendNotification", {Title="Silent Aim Enabled"; Text="enjoy bbg ;)"; Duration=5;})

    getgenv().Prediction =  (  .2  ) 
	getgenv().DontShootThesePeople = { Roblox }

local SilentAim = true
local LocalPlayer = game:GetService("Players").LocalPlayer
local Players = game:GetService("Players")
local Mouse = LocalPlayer:GetMouse()
local Camera = game:GetService("Workspace").CurrentCamera
local connections = getconnections(game:GetService("LogService").MessageOut)
for _, v in ipairs(connections) do
	v:Disable()
end

getrawmetatable = getrawmetatable
setreadonly = setreadonly
getconnections = getconnections
hookmetamethod = hookmetamethod
getgenv = getgenv
Drawing = Drawing

local FOV_CIRCLE = Drawing.new("Circle")
FOV_CIRCLE.Visible = getgenv().FOV_VISIBLE
FOV_CIRCLE.Filled = false
FOV_CIRCLE.Thickness = 1
FOV_CIRCLE.Transparency = 1
FOV_CIRCLE.Color = Color3.new(0, 1, 0)
FOV_CIRCLE.Radius = getgenv().FOV
FOV_CIRCLE.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

local Options = {
	Torso = "HumanoidRootPart";
	Head = "Head";
}

local function MoveFovCircle()
	pcall(function()
		local DoIt = true
		spawn(function()
			while DoIt do task.wait()
				FOV_CIRCLE.Position = Vector2.new(Mouse.X, (Mouse.Y + 36))
			end
		end)
	end)
end coroutine.wrap(MoveFovCircle)()

Mouse.KeyDown:Connect(function(KeyPressed)
	if KeyPressed == (getgenv().AimKey:lower()) then
		if SilentAim == false then
			FOV_CIRCLE.Color = Color3.new(0, 1, 0)
			SilentAim = true
			ItsOn()
		elseif SilentAim == true then
			FOV_CIRCLE.Color = Color3.new(1, 0, 0)
			SilentAim = false
			ItsOff()
		end
	end
end)
Mouse.KeyDown:Connect(function(Rejoin)
	if Rejoin == "=" then
		local LocalPlayer = game:GetService("Players").LocalPlayer
		game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
	end
end)

local oldIndex = nil 
oldIndex = hookmetamethod(game, "__index", function(self, Index)
	if self == Mouse and (Index == "Hit") then 
		if SilentAim then
			local Distance = 9e9
			local Target = nil
			local Players = game:GetService("Players")
			local LocalPlayer = game:GetService("Players").LocalPlayer
			local Camera = game:GetService("Workspace").CurrentCamera
			for _, v in pairs(Players:GetPlayers()) do 
				if not table.find(getgenv().DontShootThesePeople, v.Name) then
					if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Humanoid").Health > 0 then
						local Enemy = v.Character	
						local CastingFrom = CFrame.new(Camera.CFrame.Position, Enemy[Options.Torso].CFrame.Position) * CFrame.new(0, 0, -4)
						local RayCast = Ray.new(CastingFrom.Position, CastingFrom.LookVector * 9000)
						local World, ToSpace = game:GetService("Workspace"):FindPartOnRayWithIgnoreList(RayCast, {LocalPlayer.Character:FindFirstChild("Head")})
						local RootWorld = (Enemy[Options.Torso].CFrame.Position - ToSpace).magnitude
						if RootWorld < 4 then		
							local RootPartPosition, Visible = Camera:WorldToScreenPoint(Enemy[Options.Torso].Position)
							if Visible then
								local Real_Magnitude = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(RootPartPosition.X, RootPartPosition.Y)).Magnitude
								if Real_Magnitude < Distance and Real_Magnitude < FOV_CIRCLE.Radius then
									Distance = Real_Magnitude
									Target = Enemy
								end
							end
						end
					end
				end
			end

			if Target ~= nil and Target[Options.Torso] and Target:FindFirstChild("Humanoid").Health > 0 then
				if SilentAim then
					local ShootThis = Target[Options.Torso]
					local Predicted_Position = ShootThis.CFrame + (ShootThis.Velocity * getgenv().Prediction + Vector3.new(0,-.5,0))
					return ((Index == "Hit" and Predicted_Position))
				end
			end
		end
	end
	return oldIndex(self, Index)
end)
end)


-- others

local others = Window:NewTab("Others ⚙")
local othertab = others:NewSection("Game 🎮‍")

othertab:NewButton("Rejoin Game", "rejoins the game for you!", function()
	game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)

-- test

local test = Window:NewTab("Tests 🛠")
local tests = test:NewSection("stuff‍")
