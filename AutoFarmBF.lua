-- StarterGui/AutoFarmBF_Client.lua
-- Script GUI AutoFarm BF by 007n7scripter V3
-- ✅ Aman, rapi, bisa HP & Laptop, GUI keren, password dari server

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local DISCORD_LINK = "https://dsc.gg/bypassbot"
local GET_KEY_LINK = "https://lootdest.org/s?y8YCsQUB"
local LOGO_ASSET = "rbxassetid://108218286918279"
local ATTACK_INTERVAL = 0.28

local validateRF = ReplicatedStorage:WaitForChild("Validate007n7Password")
local sessionRF = ReplicatedStorage:WaitForChild("Check007n7Session")

local setClipboard = setclipboard or toclipboard

-- 🧱 Fungsi bikin glow
local function AddGlow(obj, color)
	local stroke = Instance.new("UIStroke", obj)
	stroke.Color = color or Color3.fromRGB(0, 200, 255)
	stroke.Thickness = 2
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	stroke.Transparency = 0.25
end

-- 🧠 Buat GUI password dulu
local passGui = Instance.new("ScreenGui", playerGui)
local passFrame = Instance.new("Frame", passGui)
passFrame.Size = UDim2.new(0, 300, 0, 140)
passFrame.Position = UDim2.new(0.5, -150, 0.5, -70)
passFrame.BackgroundColor3 = Color3.fromRGB(20,20,26)
passFrame.Active = true
passFrame.Draggable = true
AddGlow(passFrame)
local corner = Instance.new("UICorner", passFrame)
corner.CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", passFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "Enter Password 🔐"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(0, 200, 255)

local box = Instance.new("TextBox", passFrame)
box.Size = UDim2.new(0.9, 0, 0, 36)
box.Position = UDim2.new(0.05, 0, 0, 45)
box.PlaceholderText = "Password"
box.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
box.ClearTextOnFocus = false
local bc = Instance.new("UICorner", box)
bc.CornerRadius = UDim.new(0, 8)
AddGlow(box)

local submit = Instance.new("TextButton", passFrame)
submit.Size = UDim2.new(0.9, 0, 0, 32)
submit.Position = UDim2.new(0.05, 0, 0, 90)
submit.Text = "Unlock"
submit.Font = Enum.Font.GothamBold
submit.TextSize = 16
submit.BackgroundColor3 = Color3.fromRGB(0, 200, 200)
local sc = Instance.new("UICorner", submit)
sc.CornerRadius = UDim.new(0, 8)
AddGlow(submit)

local msg = Instance.new("TextLabel", passFrame)
msg.Size = UDim2.new(1, 0, 0, 20)
msg.Position = UDim2.new(0, 0, 1, -25)
msg.BackgroundTransparency = 1
msg.Font = Enum.Font.Gotham
msg.TextSize = 14
msg.TextColor3 = Color3.new(1, 0.7, 0.5)

-- 🧠 Fungsi buka GUI utama
local function OpenMainGUI()
	passGui:Destroy()

	local gui = Instance.new("ScreenGui", playerGui)
	gui.Name = "AutoFarmBF_GUI"

	-- ✨ Tombol O (floating)
	local floatBtn = Instance.new("ImageButton", gui)
	floatBtn.Size = UDim2.new(0, 60, 0, 60)
	floatBtn.Position = UDim2.new(0.9, 0, 0.8, 0)
	floatBtn.Image = LOGO_ASSET
	floatBtn.BackgroundTransparency = 1
	AddGlow(floatBtn)

	local frame = Instance.new("Frame", gui)
	frame.Size = UDim2.new(0, 360, 0, 560)
	frame.Position = UDim2.new(0.5, -180, 0.5, -280)
	frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	frame.Visible = true
	frame.Active = true
	frame.Draggable = true
	AddGlow(frame)
	local corner = Instance.new("UICorner", frame)
	corner.CornerRadius = UDim.new(0, 14)

	local logo = Instance.new("ImageLabel", frame)
	logo.Size = UDim2.new(0, 92, 0, 92)
	logo.Position = UDim2.new(0.5, -46, 0, 10)
	logo.BackgroundTransparency = 1
	logo.Image = LOGO_ASSET

	local title = Instance.new("TextLabel", frame)
	title.Size = UDim2.new(1, 0, 0, 40)
	title.Position = UDim2.new(0, 0, 0, 110)
	title.BackgroundTransparency = 1
	title.Text = "🐯 AutoFarm BF"
	title.Font = Enum.Font.GothamBold
	title.TextSize = 24
	title.TextColor3 = Color3.fromRGB(0, 200, 255)
	AddGlow(title)

	-- ✨ Copy Discord
	local copyBtn = Instance.new("TextButton", frame)
	copyBtn.Size = UDim2.new(0.9, 0, 0, 40)
	copyBtn.Position = UDim2.new(0.05, 0, 0, 160)
	copyBtn.Text = "📎 Copy Discord"
	copyBtn.Font = Enum.Font.GothamBold
	copyBtn.TextSize = 16
	copyBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 200)
	local c1 = Instance.new("UICorner", copyBtn)
	c1.CornerRadius = UDim.new(0, 8)
	AddGlow(copyBtn)

	copyBtn.MouseButton1Click:Connect(function()
		if setClipboard then
			setClipboard(DISCORD_LINK)
		end
	end)

	-- ✨ Get Key
	local getKeyBtn = Instance.new("TextButton", frame)
	getKeyBtn.Size = UDim2.new(0.9, 0, 0, 40)
	getKeyBtn.Position = UDim2.new(0.05, 0, 0, 210)
	getKeyBtn.Text = "🔑 Get Key"
	getKeyBtn.Font = Enum.Font.GothamBold
	getKeyBtn.TextSize = 16
	getKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
	local c2 = Instance.new("UICorner", getKeyBtn)
	c2.CornerRadius = UDim.new(0, 8)
	AddGlow(getKeyBtn)

	getKeyBtn.MouseButton1Click:Connect(function()
		if setClipboard then
			setClipboard(GET_KEY_LINK)
		end
	end)

	-- ✨ FPS Boost
	local fpsBtn = Instance.new("TextButton", frame)
	fpsBtn.Size = UDim2.new(0.9, 0, 0, 40)
	fpsBtn.Position = UDim2.new(0.05, 0, 0, 260)
	fpsBtn.Text = "⚡ FPS Boost"
	fpsBtn.Font = Enum.Font.GothamBold
	fpsBtn.TextSize = 16
	fpsBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 120)
	local c3 = Instance.new("UICorner", fpsBtn)
	c3.CornerRadius = UDim.new(0, 8)
	AddGlow(fpsBtn)

	fpsBtn.MouseButton1Click:Connect(function()
		if setfpscap then
			setfpscap(60)
		end
	end)

	-- ✨ Tombol AutoFarm Mode
	local function makeFarmBtn(text, y)
		local btn = Instance.new("TextButton", frame)
		btn.Size = UDim2.new(0.9, 0, 0, 40)
		btn.Position = UDim2.new(0.05, 0, 0, y)
		btn.Text = text
		btn.Font = Enum.Font.GothamBold
		btn.TextSize = 16
		btn.BackgroundColor3 = Color3.fromRGB(0, 200, 200)
		local c = Instance.new("UICorner", btn)
		c.CornerRadius = UDim.new(0, 8)
		AddGlow(btn)
		return btn
	end

	local meleeBtn = makeFarmBtn("AutoFarm | Melee", 310)
	local swordBtn = makeFarmBtn("AutoFarm | Sword", 360)
	local fruitBtn = makeFarmBtn("AutoFarm | Blox Fruit", 410)
	local gunBtn = makeFarmBtn("AutoFarm | Gun", 460)

	-- ✨ Close Button dengan konfirmasi
	local closeBtn = Instance.new("TextButton", frame)
	closeBtn.Size = UDim2.new(0, 28, 0, 28)
	closeBtn.Position = UDim2.new(1, -36, 0, 8)
	closeBtn.Text = "✕"
	closeBtn.Font = Enum.Font.GothamBold
	closeBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
	local cc = Instance.new("UICorner", closeBtn)
	cc.CornerRadius = UDim.new(0, 6)
	AddGlow(closeBtn)

	local confirmFrame = Instance.new("Frame", gui)
	confirmFrame.Size = UDim2.new(0, 300, 0, 120)
	confirmFrame.Position = UDim2.new(0.5, -150, 0.5, -60)
	confirmFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
	confirmFrame.Visible = false
	local cf = Instance.new("UICorner", confirmFrame)
	cf.CornerRadius = UDim.new(0, 10)

	local confirmText = Instance.new("TextLabel", confirmFrame)
	confirmText.Size = UDim2.new(1, -20, 0, 66)
	confirmText.Position = UDim2.new(0, 10, 0, 8)
	confirmText.BackgroundTransparency = 1
	confirmText.Font = Enum.Font.GothamBold
	confirmText.TextSize = 15
	confirmText.TextColor3 = Color3.new(1, 1, 1)
	confirmText.Text = "Are you sure want to close the interface?"

	local yes = Instance.new("TextButton", confirmFrame)
	yes.Size = UDim2.new(0.42, 0, 0, 36)
	yes.Position = UDim2.new(0.06, 0, 0.6, 0)
	yes.Text = "Yes"
	yes.BackgroundColor3 = Color3.fromRGB(0, 200, 120)
	yes.Font = Enum.Font.GothamBold

	local no = Instance.new("TextButton", confirmFrame)
	no.Size = UDim2.new(0.42, 0, 0, 36)
	no.Position = UDim2.new(0.52, 0, 0.6, 0)
	no.Text = "No"
	no.BackgroundColor3 = Color3.fromRGB(240, 80, 80)
	no.Font = Enum.Font.GothamBold

	closeBtn.MouseButton1Click:Connect(function()
		confirmFrame.Visible = true
	end)

	yes.MouseButton1Click:Connect(function()
		gui:Destroy()
	end)

	no.MouseButton1Click:Connect(function()
		confirmFrame.Visible = false
	end)

	-- ✨ Toggle GUI pakai tombol O
	floatBtn.MouseButton1Click:Connect(function()
		frame.Visible = not frame.Visible
	end)
end

-- 🧠 Validasi Password
submit.MouseButton1Click:Connect(function()
	local input = box.Text
	if input == "" then
		msg.Text = "Please enter password."
		return
	end

	local ok, result = pcall(function()
		return validateRF:InvokeServer(input)
	end)

	if ok and result then
		msg.Text = "Password benar. Membuka GUI..."
		task.delay(0.8, OpenMainGUI)
	else
		msg.Text = "Password salah!"
	end
end)
