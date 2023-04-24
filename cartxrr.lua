local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
game.StarterGui:SetCore("SendNotification", {Title="Hello"; Text="enjoy my shitty script"; Duration=5;})
wait(1)
local Window = Library.CreateLib("Cartxrr's Awful Script", "DarkTheme")
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





-- da hood

local dh = Window:NewTab("Da Hood 🔪")
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

sae:NewButton("Silent Aim Enable", "silent aim for dahood", function()
    getgenv().Prediction =  (  .1239592  ) 
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
