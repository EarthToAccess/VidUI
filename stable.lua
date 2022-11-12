if not(game:IsLoaded()) then
	game.Loaded:Wait()
end

if (game.CoreGui:FindFirstChild("vidui")) then
	game.CoreGui.vidui:Destroy()
end

local players = game:GetService("Players")
local player = players.LocalPlayer
local ID = player.UserId
local isBlocked = false
local isMaster = false

local blocklist = {}
local masterlist = {
	32573334,
}

for i,v in pairs(blocklist) do
    if v == ID then
        isBlocked = true
        break
    end
end

for i,v in pairs(masterlist) do
    if v == ID then
        isMaster = true
        break
    end
end

if isBlocked then
    warn("=======================[[ ATTENTION ]]=======================")
    warn("|                                                           |")
    warn("|              This account has been blocked.               |")
    warn("|    Please visit the EBGui Discord for more information.   |")
    warn("|                                                           |")
    warn("=============================================================")
else
	local verNum = "v1.3"
	local dumbQuotes = {
		"Jeez, when'd it get so hot in here?",
		"Is it just me or is that *too* blue?",
		"Like taking candy from a baby.",
		"Deez nuts are too square!",
		"Also try Minecraft!",
		"Also try Terraria!",
		"Meh, I liked Risk of Rain 2 better.",
		"You need a fairly high IQ to understand VidUI.",
		"Jake, from State Farm?!",
		"What would *you* do for a Klondike bar?",
		"Now with 100% more Gold!",
		"Made in Lua!",
		"IF %ERRORLEVEL% EQU 1 GOTO:EOF",
		"bruh nerf solar already",
		"Because the devs won't do it.",
		"Petition YOUR local developer for more updates!",
		"why are you buying clothes at the soup store",
		"I just wanna be a normal GUI with normal knees.",
		"I like gradients. A lot.",
		":(){:|:&};:"
	}

    warn([[          
 #     #             #     #  ### 
 #     #             #     #   #  
 #     #  #  #####   #     #   #
 #     #  #  #    #  #     #   #  
  #   #   #  #    #  #     #   #  
   # #    #  #    #  #     #   #  
    #     #  #####    #####   ### ]] .. verNum)
	print("------------------------")
	print(dumbQuotes[math.random(1,20)])
	print("------------------------")
	warn("Welcome to VidUI, " .. player.Name .. "!")
	warn("You're on the Canary branch of VidUI")
	warn("Questions or concerns? Let us know in the Discord,")
	warn("or email Earth himself at earthtoaccess@gmail.com!")
	wait(0.5)
	
	if isMaster then
		warn("---------------------------------------------------------")   
		warn("Loaded in using the Master List! Overriding access given.")
		warn("---------------------------------------------------------")
	end

	-- GUI Instances, Events and Functions

	local vidui = Instance.new("ScreenGui")
	vidui.Name = "vidui"
	vidui.Parent = game:WaitForChild("CoreGui")

	game.CoreGui.ChildRemoved:connect(function(child)
		if child.Name == "vidui" then
			closedforever = true
			buttonsopened = false
			commandsopened = false
			buttonsdebounce = true
			commanddebounce = true
			terminateuis = true
			UIS = nil
			viewing = nil
			ChangeViewEnabled = nil
			ESPEnabled = nil
		end
	end)

	local playerlist = {}

	local HB = game:GetService("RunService").Heartbeat

	local mouse = player:GetMouse()

	local borders = {}

	local buttonsmain = Instance.new("Frame")
	buttonsmain.Name = "buttonsmain"
	buttonsmain.Position = UDim2.new(1.25, 0, 0.65, 0)
	buttonsmain.Size = UDim2.new(0.4, 0, 0.225, 0)
	table.insert(borders, buttonsmain)

	buttonsdebounce = false
	buttonsopened = true

	local commandsmain = Instance.new("Frame")
	commandsmain.Name = "commandsmain"
	commandsmain.Position = UDim2.new(1.25, 0, 0.45, 0)
	commandsmain.Size = UDim2.new(0.3, 0, 0.175, 0)
	table.insert(borders, commandsmain)

	commanddebounce = false
	commandsopened = true

	closedforever = false

	local frames = {}

	-- Frame for around the buttons.
	local buttonsframe = Instance.new("Frame")
	buttonsframe.Name = "buttonsframe"
	buttonsframe.BackgroundColor3 = Color3.fromRGB(76, 0, 134)
	buttonsframe.BorderColor3 = Color3.fromRGB(128, 128, 128)
	buttonsframe.BorderSizePixel = 2
	buttonsframe.AnchorPoint = Vector2.new(0.5, 0.5)
	buttonsframe.Position = UDim2.new(0.5, 0, 0.5, 0)
	buttonsframe.Size = UDim2.new(0.9, 0, 0.85, 0)
	table.insert(frames, buttonsframe)
	buttonsframe.Parent = buttonsmain

	-- Frame for around the command box.
	local commandsframe = Instance.new("Frame")
	commandsframe.Name = "commandsframe"
	commandsframe.AnchorPoint = Vector2.new(0.5, 0.5)
	commandsframe.BackgroundColor3 = Color3.fromRGB(76, 0, 134)
	commandsframe.BorderColor3 = Color3.fromRGB(128, 128, 128)
	commandsframe.BorderSizePixel = 2
	commandsframe.Position = UDim2.new(0.5, 0, 0.5, 0)
	commandsframe.Size = UDim2.new(0.9, 0, 0.85, 0)
	table.insert(frames, commandsframe)
	commandsframe.Parent = commandsmain

	-- Command box. This is where users type in commands and targets.
	local commandBox = Instance.new("TextBox")
	commandBox.Name = "commandBox"
	commandBox.AnchorPoint = Vector2.new(0.5, 0.5)
	commandBox.BackgroundColor3 = Color3.fromRGB(25, 40, 40)
	commandBox.BorderColor3 = Color3.fromRGB(128, 128, 128)
	commandBox.BorderSizePixel = 2
	commandBox.Position = UDim2.new(0.5, 0, 0.3, 0)
	commandBox.Size = UDim2.new(0.85, 0, 0.20, 0)
	commandBox.Font = Enum.Font.JosefinSans
	commandBox.Text = ""
	commandBox.TextColor3 = Color3.fromRGB(251, 251, 255)
	commandBox.TextScaled = true
	commandBox.TextSize = 14.000
	commandBox.TextWrapped = true
	commandBox.ClearTextOnFocus = false
	commandBox.Parent = commandsframe

	local labels = {}

	-- The output for the command box, AKA the white text below that lists your target.
	local commandBoxOutput = Instance.new("TextLabel")
	commandBoxOutput.Name = "commandBoxOutput"
	commandBoxOutput.AnchorPoint = Vector2.new(0.5, 0.5)
	commandBoxOutput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	commandBoxOutput.BackgroundTransparency = 1.000
	commandBoxOutput.BorderColor3 = Color3.fromRGB(128, 128, 128)
	commandBoxOutput.BorderSizePixel = 0
	commandBoxOutput.Position = UDim2.new(0.5, 0, 0.6, 0)
	commandBoxOutput.Size = UDim2.new(0.9, 0, 0.2, 0)
	commandBoxOutput.Font = Enum.Font.JosefinSans
	commandBoxOutput.Text = "Player list | (None)"
	commandBoxOutput.TextColor3 = Color3.fromRGB(251, 251, 255)
	commandBoxOutput.TextScaled = true
	commandBoxOutput.TextSize = 14.000
	commandBoxOutput.TextWrapped = true
	table.insert(labels, commandBoxOutput)
	commandBoxOutput.Parent = commandsframe

	-- The information above the buttons, e.g. user's name, channel
	local Details = Instance.new("TextLabel")
	Details.Name = "Details"
	Details.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Details.BackgroundTransparency = 1.000
	Details.BorderColor3 = Color3.fromRGB(128, 128, 128)
	Details.Position = UDim2.new(0, 0, 0.015, 0)
	Details.Size = UDim2.new(1, 0, 0.15, 0)
	Details.Font = Enum.Font.JosefinSans
	Details.Text = player.Name .. " | VidUI | Canary"
	Details.TextColor3 = Color3.fromRGB(251, 251, 255)
	Details.TextScaled = true
	Details.ZIndex = 5
	Details.TextSize = 14.000
	Details.TextWrapped = true
	table.insert(labels, Details)
	Details.Parent = buttonsframe

	-- "Close this GUI" for the command box.
	local Details2 = Instance.new("TextLabel")
	Details2.Name = "Details2"
	Details2.AnchorPoint = Vector2.new(0.5, 0.5)
	Details2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Details2.BackgroundTransparency = 1.000
	Details2.BorderColor3 = Color3.fromRGB(128, 128, 128)
	Details2.Position = UDim2.new(0.5, 0, 0.9, 0)
	Details2.Size = UDim2.new(1, 0, 0.15, 0)
	Details2.Font = Enum.Font.JosefinSans
	Details2.Text = "Press ] to open and close this GUI."
	Details2.TextColor3 = Color3.fromRGB(251, 251, 255)
	Details2.TextScaled = true
	Details2.TextSize = 14.000
	Details2.TextWrapped = true
	table.insert(labels, Details2)
	Details2.Parent = commandsframe

	-- "Close this GUI" for the buttons.
	local Details3 = Instance.new("TextLabel")
	Details3.Name = "Details3"
	Details3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Details3.BackgroundTransparency = 1.000
	Details3.BorderColor3 = Color3.fromRGB(128, 128, 128)
	Details3.Position = UDim2.new(0, 0, 0.875, 0)
	Details3.Size = UDim2.new(1, 0, 0.15, 0)
	Details3.Font = Enum.Font.JosefinSans
	Details3.Text = "Press [ to open and close this GUI."
	Details3.TextColor3 = Color3.fromRGB(251, 251, 255)
	Details3.TextScaled = true
	Details3.TextSize = 14.000
	Details3.TextWrapped = true
	table.insert(labels, Details3)
	Details3.Parent = buttonsframe

	-- Script termination instructions.
	local Details4 = Instance.new("TextLabel")
	Details4.Name = "Details4"
	Details4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Details4.BackgroundTransparency = 1.000
	Details4.BorderColor3 = Color3.fromRGB(128, 128, 128)
	Details4.Position = UDim2.new(0, 0, 1.1, 0)
	Details4.Size = UDim2.new(1, 0, 0.175, 0)
	Details4.Font = Enum.Font.JosefinSans
	Details4.Text = "Hold the Left and Right arrow keys, then press any key to quit VidUI."
	Details4.TextColor3 = Color3.fromRGB(251, 251, 255)
	Details4.TextScaled = true
	Details4.TextSize = 14.000
	Details4.TextWrapped = true
	Details4.Parent = buttonsframe

	-- The version number above the command box.
	local Version = Instance.new("TextLabel")
	Version.Name = "Version"
	Version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Version.BackgroundTransparency = 1.000
	Version.BorderColor3 = Color3.fromRGB(128, 128, 128)
	Version.Position = UDim2.new(0, 0, 0.05, 0)
	Version.Size = UDim2.new(1, 0, 0.1, 0)
	Version.Font = Enum.Font.JosefinSans
	Version.Text = "Version " .. verNum
	Version.TextColor3 = Color3.fromRGB(251, 251, 255)
	Version.TextScaled = true
	Version.TextSize = 14.000
	Version.TextWrapped = true
	table.insert(labels, Version)
	Version.Parent = commandsframe

	-- The background for the UI.
	local mainframe = Instance.new("ScrollingFrame")
	mainframe.Name = "mainframe"
	mainframe.Active = true
	mainframe.BackgroundColor3 = Color3.fromRGB(25, 77, 255)
	mainframe.BorderColor3 = Color3.fromRGB(128, 128, 128)
	mainframe.BorderSizePixel = 2
	mainframe.Position = UDim2.new(0.5, 0, 0.5, 0)
	mainframe.AnchorPoint = Vector2.new(0.5, 0.5)
	mainframe.Size = UDim2.new(0.867768586, 0, 0.6, 0)
	mainframe.ScrollBarThickness = 6
	mainframe.Parent = buttonsmain

	-- Grid layout for the buttons.
	local UIGridLayout = Instance.new("UIGridLayout")
	UIGridLayout.FillDirection = Enum.FillDirection.Horizontal
	UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIGridLayout.CellPadding = UDim2.new(0, 7, 0, 7)
	UIGridLayout.CellSize = UDim2.new(0.45, 0, 0, 30)
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.Parent = mainframe

	local buttons = {}

	------ The buttons!

	-- Change view. With this active, it will begin viewing the last person added to the "playerlist" list.

	local ViewChange = Instance.new("TextButton")
	ViewChange.Name = "ViewChange"
	ViewChange.Text = "View Players (Off)"
	table.insert(buttons,ViewChange)

	ChangeViewEnabled = false
	local LastPos

	local ViewIndex = 0
	viewing = player.Name

	local function ViewChangeFunc(input)
		if #playerlist == 0 then
			ViewIndex = 0
			ViewChange.Text = "View Players (On) | Viewing nobody"
		else
			if input == Enum.KeyCode.M then
				-- This should fire if the function gets run with the KeyCode M as an arg
				if (ViewIndex + 1) > #playerlist then
					warn("ViewIndex was found greater than the current player list!")					
					ViewIndex = 1
					viewing = playerlist[ViewIndex]
					ViewChange.Text = "View Player (On) | Viewing " .. viewing
					game.Workspace.Camera.CameraSubject = players[viewing].Character.PrimaryPart
				else
					ViewIndex = ViewIndex + 1
					viewing = playerlist[ViewIndex]
					ViewChange.Text = "View Player (On) | Viewing " .. viewing
					game.Workspace.Camera.CameraSubject = players[viewing].Character.PrimaryPart
				end
			elseif input == Enum.KeyCode.N then
				-- This should fire if the function gets run with the KeyCode N as an arg
				if (ViewIndex - 1) <= 0 then
					warn("ViewIndex was found smaller than the current player list!")
					ViewIndex = #playerlist
					viewing = playerlist[ViewIndex]
					ViewChange.Text = "View Player (On) | Viewing " .. viewing
					game.Workspace.Camera.CameraSubject = players[viewing].Character.PrimaryPart
				else
					ViewIndex = ViewIndex - 1
					viewing = playerlist[ViewIndex]
					ViewChange.Text = "View Player (On) | Viewing " .. viewing
					game.Workspace.Camera.CameraSubject = players[viewing].Character.PrimaryPart
				end
			else
				-- This should fire if it gets "nil" as the arg
				ViewIndex = 1
				viewing = playerlist[ViewIndex]
				ViewChange.Text = "View Player (On) | Viewing " .. viewing
				game.Workspace.Camera.CameraSubject = players[viewing].Character.PrimaryPart

			end
		end
	end

	ViewChange.MouseButton1Down:Connect(function()
		if ChangeViewEnabled then
			ChangeViewEnabled = false
			-- Remove the viewing platform
			game:GetService("Workspace")[".Ignore"]:FindFirstChild("Viewing Plate"):Destroy()

			-- Unanchor player
			for i,v in pairs(player.Character:GetChildren()) do
				if v:IsA("BasePart") then
					v.Anchored = false
				end
			end

			game:GetService("Players").LocalPlayer.Character:MoveTo(LastPos + Vector3.new(0,10,0))

			-- Set camera subject back to the player
			game.Workspace.Camera.CameraSubject = player.Character.HumanoidRootPart

			ViewChange.Text = "View Players (Off)"
		else
			ChangeViewEnabled = true

			-- Save current position
			LastPos = player.Character:WaitForChild("HumanoidRootPart").Position

			-- Create view plate
			local ViewPlate = Instance.new("Part")
			ViewPlate.Parent = game:GetService("Workspace")[".Ignore"]
			ViewPlate.Anchored = true
			ViewPlate.Size = Vector3.new(5,1,5)
			ViewPlate.Position = Vector3.new(0,1000,0)
			ViewPlate.Name = "Viewing Plate"
			ViewPlate.Transparency = 1

			-- Teleport player to view plate
			game:GetService("Players").LocalPlayer.Character:MoveTo(ViewPlate.Position + Vector3.new(0,3,0))

			-- Run the ViewChange function with no input presses to initialize it
			ViewChangeFunc(nil)
			wait(.75)

			-- Anchor player
			for i,v in pairs(player.Character:GetChildren()) do
				if v:IsA("BasePart") then
					v.Anchored = true
				end
			end
		end
	end)

	-- ESP

	local ESP = Instance.new("TextButton")
	ESP.Name = "ESP"
	ESP.Text = "ESP (Off) [B]"
	table.insert(buttons, ESP)

	local Holder = Instance.new("Folder", game.CoreGui)
	Holder.Name = "ESP"

	ESPEnabled = false

	local UpdateFuncs = {}

	local Box = Instance.new("BoxHandleAdornment")
	Box.Name = "nilBox"
	Box.Size = Vector3.new(4, 7, 4)
	Box.Color3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
	Box.Transparency = 0.7
	Box.ZIndex = 0
	Box.AlwaysOnTop = true
	Box.Visible = true

	local NameTag = Instance.new("BillboardGui")
	NameTag.Name = "nilNameTag"
	NameTag.Enabled = true
	NameTag.Size = UDim2.new(0, 200, 0, 50)
	NameTag.AlwaysOnTop = true
	NameTag.StudsOffset = Vector3.new(0, 3.6, 0)

	local Tag = Instance.new("TextLabel", NameTag)
	Tag.Name = "Tag"
	Tag.BackgroundTransparency = 1
	Tag.Position = UDim2.new(0, -50, 0, 0)
	Tag.Size = UDim2.new(0, 300, 0, 20)
	Tag.TextSize = 20
	Tag.TextColor3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
	Tag.TextStrokeColor3 = Color3.new(0 / 255, 0 / 255, 0 / 255)
	Tag.TextStrokeTransparency = 0.4
	Tag.Text = "Not Available"
	Tag.Font = Enum.Font.RobotoMono
	Tag.TextScaled = false
	Tag.TextTransparency = 0

	function LoadCharacter(v)

		local tblPlayerData = {}
		RSR:WaitForChild("PlayerData").OnClientEvent:Connect(function(v, tblData)
			tblPlayerData[v] = tblData
		end)

		if v ~= player then
			repeat wait() until v.Character ~= nil
			v.Character:WaitForChild("Humanoid")
			local vHolder = Holder:FindFirstChild(v.Name)
			vHolder:ClearAllChildren()

			local b = Box:Clone()
			b.Name = v.Name .. "Box"
			b.Adornee = v.Character.HumanoidRootPart
			b.Parent = vHolder

			local t = NameTag:Clone()
			t.Name = v.Name .. "NameTag"
			t.Parent = vHolder
			t.Adornee = v.Character:WaitForChild("HumanoidRootPart", 5)
			if not t.Adornee then
				return UnloadCharacter(v)
			end
			t.Tag.Text = v.Name
			t.Enabled = true
			wait()

			local function UpdateNameTag()
				if not pcall(function()
						-- v.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
						local maxh = math.ceil(v.Character.Humanoid.MaxHealth * 10)
						local h = math.ceil(v.Character.Humanoid.Health * 10)
						local strh = "H: " .. (not(maxh == 0) and tostring(math.ceil(100 * h / maxh)) or 0) .. "% [" .. tostring(h) .. "|" .. tostring(maxh) .. "]"
						--
						local maxm = tblPlayerData[v] and math.ceil(tblPlayerData[v].MaxMana * 10) or 1000
						local m = tblPlayerData[v] and math.ceil(tblPlayerData[v].Mana * 10) or 1000
						local strm = "M: " .. (not(maxm == 0) and tostring(math.ceil(100 * m / maxm)) or 0) .. "% [" .. tostring(m) .. "|" .. tostring(maxm) .. "]"
						--
						local maxs = tblPlayerData[v] and math.ceil(tblPlayerData[v].MaxStamina * 10) or 1000
						local s = tblPlayerData[v] and math.ceil(tblPlayerData[v].Stamina * 10) or 1000
						local strs =  "S: " .. (not(maxs == 0) and tostring(math.ceil(100 * s / maxs)) or 0) .. "% [" .. tostring(s) .. "|" .. tostring(maxs) .. "]"

						t.Tag.Text = v.Name .. ("\n" .. strh) .. ("\n" .. strm) .. ("\n" .. strs)

						if ESPEnabled and table.find(playerlist, v.Name) then
							t.Tag.TextTransparency = 0
							b.Transparency = 0.7
						else
							t.Tag.TextTransparency = 1
							b.Transparency = 1
						end
						if h / maxh >= 0.75 then
							t.Tag.TextColor3 = Color3.fromRGB(25, 255, 107)
							b.Color3 = Color3.fromRGB(15, 153, 64)
						elseif h / maxh >= 0.5 and not (h / maxh <= 0.33) then
							t.Tag.TextColor3 = Color3.fromRGB(236, 175, 20)
							b.Color3 = Color3.fromRGB(179, 132, 15)
						elseif h / maxh == 0 then
							t.Tag.TextColor3 = Color3.fromRGB(236, 20, 0)
							b.Color3 = Color3.fromRGB(134, 12, 66)
						else
							t.Tag.TextColor3 = Color3.fromRGB(236, (175 * (h / maxh)), (20 * (h / maxh)))
							b.Color3 = Color3.fromRGB(179, (132 * (h / maxh)), (15 * (h / maxh)))
						end
					end) then
					UpdateFuncs[v] = nil
				end
			end
			UpdateNameTag()
			UpdateFuncs[v] = UpdateNameTag
		end
	end

	function UnloadCharacter(v)
		local vHolder = Holder:FindFirstChild(v.Name)
		if vHolder and (vHolder:FindFirstChild(v.Name .. "Box") ~= nil or vHolder:FindFirstChild(v.Name .. "NameTag") ~= nil) then
			vHolder:ClearAllChildren()
		end
	end

	function LoadPlayer(v)
		if v ~= player then
			local vHolder = Instance.new("Folder", Holder)
			vHolder.Name = v.Name
			v.CharacterAdded:Connect(function()
				if ESPEnabled == true then
					pcall(LoadCharacter, v)
				end
			end)
			v.CharacterRemoving:Connect(function()
				pcall(UnloadCharacter, v)
			end)
			LoadCharacter(v)
		end
	end

	function UnloadPlayer(v)
		UnloadCharacter(v)
		local vHolder = Holder:FindFirstChild(v.Name)
		if vHolder then
			vHolder:Destroy()
		end
	end

	for i, v in pairs(players:GetPlayers()) do
		spawn(function() pcall(LoadPlayer, v) end)
	end

	players.PlayerAdded:Connect(function(v)
		pcall(LoadPlayer, v)
	end)

	players.PlayerRemoving:Connect(function(v)
		pcall(UnloadPlayer, v)
	end)

	game.ItemChanged:Connect(function(i)
		if i:IsA("Player") then
			if Holder:FindFirstChild(i.Name) then
				UnloadCharacter(i)
				wait()
				LoadCharacter(i)
			end
		elseif i:IsA("Humanoid") and i.Parent then
			local p = players:GetPlayerFromCharacter(i.Parent)
			if p ~= player and p ~= nil and Holder:FindFirstChild(p.Name) then
				pcall(function()
					UpdateFuncs[p]()
				end)
			end
		end
	end)

	function toggleESP()
		if ESPEnabled == false then
			ESPEnabled = true
			ESP.Text = "ESP (On) [B]"
			for i,v in pairs(players:GetPlayers()) do
				spawn(function() pcall(LoadPlayer, v) end)
			end
		else
			ESPEnabled = false
			ESP.Text = "ESP (Off) [B]"
			for i, v in pairs(game.Players:GetPlayers()) do
				spawn(function() pcall(UnloadPlayer, v) end)
			end
		end
	end

	ESP.MouseButton1Down:connect(toggleESP)

	-- Rejoin Server

	local RejoinServer = Instance.new("TextButton")
	RejoinServer.Name = "RejoinServer"
	RejoinServer.Text = "Rejoin Server"
	table.insert(buttons, RejoinServer)

	function rejoin()
		local ts = game:GetService("TeleportService")
		local p = game:GetService("Players").LocalPlayer

		ts:Teleport(game.PlaceId, p)
	end

	RejoinServer.MouseButton1Down:connect(rejoin)

	-- Clear player list

	local ClearPlayerList = Instance.new("TextButton")
	ClearPlayerList.Name = "ClearPlayerList"
	ClearPlayerList.Text = "Clear player list"
	table.insert(buttons, ClearPlayerList)

	function clearComp()
		playerlist = {}

		commandBoxOutput.Text = "Player list | (None)"
	end

	ClearPlayerList.MouseButton1Down:connect(clearComp)

	-- Ping Last Position

	local LastPosPing = Instance.new("TextButton")
	LastPosPing.Name = "LastPosPing"
	LastPosPing.Text = "Ping last position"
	table.insert(buttons, LastPosPing)

	LastPosPing.MouseButton1Down:connect(function()

		local HB = game:GetService("RunService").Heartbeat
		local CurrentCount = 45
		local HBConnect
		
		local PingBeacon = Instance.new("Part")
		PingBeacon.Parent = game:GetService("Workspace")[".Ignore"]
		PingBeacon.Name = "PingBeacon"
		PingBeacon.CanCollide = false
		PingBeacon.Shape = Enum.PartType.Cylinder
		PingBeacon.Size = Vector3.new(10000,25,25)
		PingBeacon.Orientation = Vector3.new(0,0,90)
		PingBeacon.Material = Enum.Material.Neon
		PingBeacon.Color = Color3.fromRGB(255, 2, 234)
		PingBeacon.Anchored = true
		PingBeacon.Position = LastPos
		PingBeacon.Reflectance = 0.75

		local function OnHeartBeat(delta)
			if CurrentCount > 0 then
				CurrentCount = CurrentCount - 1
				PingBeacon.Transparency = (0.5 + (1/CurrentCount))
				print(CurrentCount)
			else
				PingBeacon:Destroy()
				HBConnect:Disconnect()
			end
		end

		HBConnect = HB:Connect(OnHeartBeat)
	end)

	-- GUI Tweaking

	for i, v in pairs(borders) do
		v.AnchorPoint = Vector2.new(1, 0.5)
		v.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		v.BackgroundTransparency = 0.750
		v.BorderColor3 = Color3.fromRGB(0, 0, 0)
		v.BorderSizePixel = 0
		v.SizeConstraint = Enum.SizeConstraint.RelativeYY
		v.Active = true
		v.Parent = vidui
	end

	for i, v in pairs(buttons) do
		v.BackgroundColor3 = Color3.fromRGB(236, 20, 115)
		v.BorderColor3 = Color3.fromRGB(0, 0, 0)
		v.BorderSizePixel = 2
		v.Position = UDim2.new(0, 0, 0, 0)
		v.Size = UDim2.new(0, 0, 0, 0)
		v.Font = Enum.Font.JosefinSans
		v.TextColor3 = Color3.fromRGB(251, 251, 255)
		v.TextScaled = true
		v.TextSize = 14.000
		v.TextWrapped = true
		v.LayoutOrder = i
		v.Parent = mainframe
	end

	-- commandBox

	target = player.Name
	targetSetting = "select"
	looping = false
	smartAttack = true
	HealSetting = 1
	stunEnabled = true
	FPSDropping = false
	local buttonHeight = 30
	local buttonGap = 7

	RSR = game.ReplicatedStorage:WaitForChild("Remotes")

	function getHRP(chr)
		local HRP = chr:FindFirstChild("HumanoidRootPart") or chr:FindFirstChild("Torso") or chr:FindFirstChild("UpperTorso")
		return HRP
	end

	function getHUM(chr)
		local HUM = chr:FindFirstChild("Humanoid")
		return HUM
	end

	local function respawn(plr)
		local chr = plr.Character

		if (chr:FindFirstChildOfClass("Humanoid")) then chr:FindFirstChildOfClass("Humanoid"):ChangeState(15) end
		chr:ClearAllChildren()

		local newchr = Instance.new("Model")
		newchr.Parent = workspace
		plr.Character = newchr

		wait()

		plr.Character = chr
		newchr:Destroy()
	end

	local function refresh(plr)
		local hum = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid", true)
		local pos = hum and hum.RootPart and hum.RootPart.CFrame
		local pos1 = workspace.CurrentCamera.CFrame

		respawn(plr)

		spawn(function()
			plr.CharacterAdded:Wait():WaitForChild("Humanoid").RootPart.CFrame, workspace.CurrentCamera.CFrame = pos, wait() and pos1
		end)
	end

	local function splitArgs(command)
		command = string.gsub(command, ",", " ")
		command = string.split(command, " ")

		for i, v in ipairs(command) do
			v = string.gsub(v, "%s+", "")
			if v == "" then
				table.remove(command, i)
			end
		end

		return command
	end

	local function findPlayer(text)
		local players = game.Players:GetPlayers()
		local matches = {}

		for i, Player in ipairs(players) do
			local name = Player.Name
			text = string.lower(text)
			name = string.lower(name)

			local match = string.find(name, text)

			if match then
				table.insert(matches, Player.Name)
			end
		end

		return matches
	end

	local drugsEnabled = false
	local colorsEnabled = false
	local blackcastEnabled = false
	local colorExclude = {"Head","Torso","Left Arm","Left Leg","Right Arm","Right Leg","Shard","Diamond"}

	--[[98/255, 37/255, 209/255]]
	local color1
	local color2
	local color3

	local function termEBGui()
		buttonsmain:TweenPosition(
			UDim2.new(1.25, 0, 0.65, 0),
			"In",
			"Sine",
			.5,
			true
		)
		commandsmain:TweenPosition(
			UDim2.new(1.25, 0, 0.45, 0),
			"In",
			"Sine",
			.5,
			true
		)
		wait(1)
		target = player.Name
		vidui:Destroy()
	end

	local function inputBox()
		local text = commandBox.Text
		wait()
		commandBox.Text = ""

		local prefix = ";"
		if string.sub(text, 1, 1) == (prefix) then
			text = string.lower(text)

			if string.sub(text, 1, 3) == (prefix .. "re") then
				refresh(player)
			elseif string.sub(text, 1, 3) == (prefix .. "tp") then
				local teleportto
                local tpname
				local place = string.sub(text, 5)
				local places = {
					566399244,
					2569625809,
					570158081,
					537600204,
					520568240,
					554955560,
					602048550,
					575456646,
					1713986112,
					1243615612,
					638065302,
					634240826,
					633042731
				}

				if place == "standardlow" or place == "566399244" then
					teleportto = places[1]
                    tpname = "Lowbie Standard"
				elseif place == "standard40" or place == "2569625809" then
					teleportto = places[2]
                    tpname = "Standard"
				elseif place == "light" or place == "570158081" then
					teleportto = places[3]
                    tpname = "Light"
				elseif place == "fire" or place == "537600204" then
					teleportto = places[4]
                    tpname = "Fire"
				elseif place == "water" or place == "520568240" then
					teleportto = places[5]
                    tpname = "Water"
				elseif place == "grass" or place == "554955560" then
					teleportto = places[6]
                    tpname = "Grass"
				elseif place == "heaven" or place == "602048550" then
					teleportto = places[7]
                    tpname = "Heaven"
				elseif place == "minilovania" or place == "sans" or place == "575456646" then
					teleportto = places[8]
                    tpname = "Minilovania"
				elseif place == "survival" or place == "1243615612" then
					teleportto = places[10]
                    tpname = "Survival"
				elseif place == "megastandard" or place == "standardmega" or place == "638065302" then
					teleportto = places[11]
                    tpname = "Mega Standard"
				elseif place == "megafire" or place == "firemega" or place == "634240826" then
					teleportto = places[11]
                    tpname = "Mega Fire"
				elseif place == "megagrass" or place == "grassmega" or place == "633042731" then
					teleportto = places[13]
                    tpname = "Mega Grass"
				else
					commandBoxOutput.Text = "The place was incorrectly specified!"
				end

				if teleportto then
					commandBoxOutput.Text = "Teleporting to " .. tpname .. "!"
					game:GetService("TeleportService"):Teleport(teleportto)
				end
			elseif string.sub(text, 1, 8) == (prefix .. "declutter") then
				player.PlayerGui.Main.Frame1.Size = UDim2.new(0.375, 0, 0.375, 0)
				player.PlayerGui.Main.Frame1.ImageTransparency = 1
				player.PlayerGui.Main.Character.ImageTransparency = 1
				player.PlayerGui.Main.Book.ImageTransparency = 1
				player.PlayerGui.Main.Shop.ImageTransparency = 1
				player.PlayerGui.Main.SkillsBar.Size = UDim2.new(0.375, 0, 0.375, 0)
				player.PlayerGui.Main.SkillsBar.ImageTransparency = 1
			elseif string.sub(text, 1, 5) == (prefix .. "rain") then
				local currentCAM = workspace.CurrentCamera
				local rainSound = Instance.new("Sound")
				rainSound.Looped = true
				rainSound.SoundId = "rbxassetid://283164593"
				rainSound.Volume = 1
				rainSound.Parent = workspace
				rainSound:Play()

				local rainPart = Instance.new("Part")
				rainPart.Size = Vector3.new(300, 300, 300)
				rainPart.Transparency = 1
				rainPart.Anchored = true
				rainPart.CanCollide = false

				local rainEffect = game:GetService("ReplicatedStorage"):WaitForChild("Effects"):WaitForChild("Rain")
				rainEffect.Rate = rainPart.Size.magnitude
				rainEffect.Parent = rainPart

				local ignore = workspace:WaitForChild(".Ignore")
				rainPart.Parent = ignore:WaitForChild(".ServerEffects")

				local fov = 2 * math.tan(math.rad(currentCAM.FieldOfView) / 2)
				local newRay = Ray.new
				local height = Vector3.new(0, 50, 0)
				local depth = CFrame.new(0, fov * 50, -60)

				game:GetService("RunService"):BindToRenderStep("Rain", Enum.RenderPriority.Camera.Value, function()
					local rc = workspace:FindPartOnRayWithIgnoreList(newRay(currentCAM.CFrame.p, height), {ignore})

					if (rc) then
						rainEffect.Enabled = false
						rainSound.Volume = 0.5
						return
					end

					local viewport = currentCAM.ViewportSize
	
					rainPart.Size = Vector3.new(fov * viewport.x / viewport.y * 50, 0.2, 100)
					rainPart.CFrame = currentCAM.CFrame * depth
	
					rainEffect.Rate = rainPart.Size.magnitude
					rainEffect.Enabled = true
	
					rainSound.Volume = 1
				end)
			elseif string.sub(text, 1, 4) == (prefix .. "fix") then
				if player.PlayerGui:WaitForChild("Menu"):FindFirstChild("BlackScreen") then
					player.PlayerGui:WaitForChild("Menu"):FindFirstChild("BlackScreen").Visible = false
					commandBoxOutput.Text = "Fixing the Menu GUI!"
				end
			elseif string.sub(text, 1, 13) == (prefix .. "buttonheight") then
				buttonHeight = tonumber(string.sub(text, 15))
				UIGridLayout.CellSize = UDim2.new(0.45, 0, 0, buttonHeight)
				mainframe.CanvasSize = UDim2.new(0, 0, 0, math.ceil(#buttons / 2) * (buttonHeight + buttonGap) - buttonGap)

				commandBoxOutput.Text = "Button height was set to " .. tonumber(string.sub(text, 15)) .. "!"
			elseif string.sub(text, 1, 10) == (prefix .. "buttongap") then
				buttonGap = tonumber(string.sub(text, 12))
				UIGridLayout.CellPadding = UDim2.new(0, 7, 0, buttonGap)
				mainframe.CanvasSize = UDim2.new(0, 0, 0, math.ceil(#buttons / 2) * (buttonHeight + buttonGap) - buttonGap)

				commandBoxOutput.Text = "Button gap was set to " .. tonumber(string.sub(text, 12)) .. "!"
			elseif string.sub(text, 1, 7) == (prefix .. "rejoin") then
				rejoin()
				commandBoxOutput.Text = "Rejoining..."
			elseif string.sub(text, 1, 9) == (prefix .. "aura/off") then
				repeat wait() until getHRP(player.Character)

				if getHRP(player.Character):FindFirstChild("AuraGP") then
					getHRP(player.Character):FindFirstChild("AuraGP"):Destroy()
					commandBoxOutput.Text = "Aura has been removed."
				else
					commandBoxOutput.Text = "Aura does not exist!"
				end
			elseif string.sub(text, 1, 8) == (prefix .. "origin") then
				xpcall(function()
					local origin = Instance.new("Part")
					origin.Anchored = true
					origin.Parent = game.Workspace[".Ignore"][".ServerEffects"]
					origin.Name = "Origin"
					origin.Material = Enum.Material.Neon
					origin.BrickColor = BrickColor.new("Really red")
					origin.Size = Vector3.new(0.5, 0.5, 0.5)
					origin.Position = Vector3.new(0, 0, 0)
					warn("Made a block at the origin!")
					commandBoxOutput.Text = "Success! Check console for more info"
				end, function(e)
					print("Encountered an error! xpcall says:", e)
					warn('traceback:', debug.traceback())
				end)
			elseif string.sub(text, 1, 4) == (prefix .. "plr") then
				for i,v in pairs(playerlist) do
					if string.find(v,string.sub(text, 5)) then
						table.remove(playerlist,i)
					end
				end
            end

			wait(1.5)
			if target ~= player.Name then
				commandBoxOutput.Text = "Player list | " .. target
			else
				commandBoxOutput.Text = "Player list | (None)"
			end
		else
			local matches = findPlayer(text)

			if #matches == 1 then
				if matches[1] == game.Players.LocalPlayer.Name then
					commandBoxOutput.Text = "You can't add yourself to the list!"
					wait(1.5)
				else
					table.insert(playerlist, matches[1])
				end
			elseif #matches == 0 then
				commandBoxOutput.Text = "Invalid username! Type their name again."
				wait(1.5)
			else
				commandBoxOutput.Text = "Multiple users found! Try again, please!"
				wait(1.5)
			end
		end

		if #playerlist == 0 then
			commandBoxOutput.Text = "Player list | (None)"
		else
			local sSet = ""

			for i, v in next, playerlist do
				if i > 1 then
					sSet = sSet .. ", "
				end

				sSet = sSet .. v
			end

			commandBoxOutput.Text = "Player list | " .. sSet
		end
	end

	players.PlayerRemoving:connect(function(player)
		for i, v in next, playerlist do
			if v == player.Name then
				table.remove(playerlist, i)
			end
		end
	
		if #playerlist == 0 then
			commandBoxOutput.Text = "Player list | (None)"
		else
			local sSet = ""
	
			for i, v in next, playerlist do
				if i > 1 then
					sSet = sSet .. ", "
				end
	
				sSet = sSet .. v
			end
	
			commandBoxOutput.Text = "Player list | " .. sSet
		end
	end)

	commandBox.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			if commandBox.Text ~= "" then
				inputBox()
			end
		end
	end)

	coroutine.resume(coroutine.create(function()
		mainframe.CanvasSize = UDim2.new(0, 0, 0, (math.ceil(#buttons * 37) / 2) - 7)
	end))

	local UIS = game:GetService("UserInputService")
	local terminateuis = false

	UIS.InputBegan:connect(function(input, gp)
		if not terminateuis then
			if not gp then
				local targetChr = game.Players[target].Character

				if input.KeyCode == Enum.KeyCode.BackSlash then
					commandBox:CaptureFocus()
					wait()
					if string.sub(commandBox.Text, string.len(commandBox.Text), string.len(commandBox.Text)) == "\\" then
						commandBox.Text = string.sub(commandBox.Text, 1, string.len(commandBox.Text) - 1)
					end
				elseif input.KeyCode == Enum.KeyCode.B then
					toggleESP()
				elseif (input.KeyCode == Enum.KeyCode.M) or (input.KeyCode == Enum.KeyCode.N) then
					if ChangeViewEnabled then
						ViewChangeFunc(input.KeyCode)
					end
				elseif input.KeyCode == Enum.KeyCode.LeftBracket then
					if not closedforever then
						if not buttonsdebounce then
							buttonsdebounce = true
							if buttonsopened == false then
								buttonsopened = true
								buttonsmain:TweenPosition(
									UDim2.new(1, 0, 0.65, 0),
									"Out",
									"Sine",
									.5,
									true
								)
							else
								buttonsopened = false
								buttonsmain:TweenPosition(
									UDim2.new(1.25, 0, 0.65, 0),
									"In",
									"Sine",
									.5,
									true
								)
							end
							wait(1)
							buttonsdebounce = false
						end
					end
				elseif input.KeyCode == Enum.KeyCode.RightBracket then
					commanddebounce = true
					if commandsopened == false then
						commandsopened = true
						commandsmain:TweenPosition(
							UDim2.new(1, 0, 0.45, 0),
							"Out",
							"Sine",
							.5,
							true
						)
					else
						commandsopened = false
						commandsmain:TweenPosition(
							UDim2.new(1.25, 0, 0.45, 0),
							"In",
							"Sine",
							.5,
							true
						)
					end
					wait(1)
					commanddebounce = false
				elseif UIS:IsKeyDown(Enum.KeyCode.Left) and UIS:IsKeyDown(Enum.KeyCode.Right) then
					commandBoxOutput.Text = "Thanks for using VidUI!"
					wait(2)
					if buttonsopened == true then
						terminateuis = true
						termEBGui()
					end
				end
			end
		end
	end)

	-- Scripts and Functions END

	-- Entrance Animation

	wait(0.5)

	buttonsmain:TweenPosition(
		UDim2.new(1, 0, 0.65, 0),
		"Out",
		"Sine",
		.5,
		true
	)

	commandsmain:TweenPosition(
		UDim2.new(1, 0, 0.45, 0),
		"Out",
		"Sine",
		.5,
		true
	)

	-- Info

	print([[

	]])
	warn("GUI successfully loaded!")
	commandBoxOutput.Text = "Welcome to VidUI!"
	wait(2)
	commandBoxOutput.Text = "Player list | (None)"
end