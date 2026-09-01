--// NEVO HUB - GET KEY UI

local Players = game:GetService("Players")
local player = Players.LocalPlayer

--========================
-- CONFIG
--========================
local GET_KEY_LINK = "https://example.com/getkey"
local CORRECT_KEY = "NEVO123" -- Đổi key của bạn ở đây

--========================
-- GUI
--========================
local gui = Instance.new("ScreenGui")
gui.Name = "NEVO_GetKey"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 300, 0, 190)
main.Position = UDim2.new(0.5, -150, 0.5, -95)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(0, 170, 255)
stroke.Thickness = 2
stroke.Parent = main

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "NEVO HUB - GET KEY"
title.TextColor3 = Color3.fromRGB(0, 170, 255)
title.TextSize = 20
title.Font = Enum.Font.GothamBold
title.Parent = main

-- Key box
local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(1, -30, 0, 40)
keyBox.Position = UDim2.new(0, 15, 0, 50)
keyBox.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
keyBox.BorderSizePixel = 0
keyBox.PlaceholderText = "Nhập Key..."
keyBox.Text = ""
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
keyBox.TextSize = 15
keyBox.Font = Enum.Font.Gotham
keyBox.Parent = main

local boxCorner = Instance.new("UICorner")
boxCorner.CornerRadius = UDim.new(0, 7)
boxCorner.Parent = keyBox

-- Get Key
local getKey = Instance.new("TextButton")
getKey.Size = UDim2.new(0.46, 0, 0, 38)
getKey.Position = UDim2.new(0, 15, 0, 105)
getKey.BackgroundColor3 = Color3.fromRGB(0, 130, 200)
getKey.BorderSizePixel = 0
getKey.Text = "GET KEY"
getKey.TextColor3 = Color3.fromRGB(255, 255, 255)
getKey.TextSize = 14
getKey.Font = Enum.Font.GothamBold
getKey.Parent = main

local getCorner = Instance.new("UICorner")
getCorner.CornerRadius = UDim.new(0, 7)
getCorner.Parent = getKey

-- Check Key
local checkKey = Instance.new("TextButton")
checkKey.Size = UDim2.new(0.46, 0, 0, 38)
checkKey.Position = UDim2.new(0.54, 0, 0, 105)
checkKey.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
checkKey.BorderSizePixel = 0
checkKey.Text = "CHECK KEY"
checkKey.TextColor3 = Color3.fromRGB(255, 255, 255)
checkKey.TextSize = 14
checkKey.Font = Enum.Font.GothamBold
checkKey.Parent = main

local checkCorner = Instance.new("UICorner")
checkCorner.CornerRadius = UDim.new(0, 7)
checkCorner.Parent = checkKey

-- Status
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -30, 0, 25)
status.Position = UDim2.new(0, 15, 0, 153)
status.BackgroundTransparency = 1
status.Text = "Vui lòng nhập key"
status.TextColor3 = Color3.fromRGB(180, 180, 180)
status.TextSize = 13
status.Font = Enum.Font.Gotham
status.Parent = main

--========================
-- GET KEY BUTTON
--========================
getKey.MouseButton1Click:Connect(function()
    -- Dùng được trong executor hỗ trợ setclipboard
    if setclipboard then
        setclipboard(GET_KEY_LINK)
        status.Text = "Đã copy link lấy key!"
        status.TextColor3 = Color3.fromRGB(0, 170, 255)
    else
        status.Text = GET_KEY_LINK
        status.TextColor3 = Color3.fromRGB(0, 170, 255)
    end
end)

--========================
-- CHECK KEY
--========================
checkKey.MouseButton1Click:Connect(function()
    if keyBox.Text == "" then
        status.Text = "Bạn chưa nhập key!"
        status.TextColor3 = Color3.fromRGB(255, 180, 0)

    elseif keyBox.Text == CORRECT_KEY then
        status.Text = "Key đúng! ✓"
        status.TextColor3 = Color3.fromRGB(0, 255, 100)

        task.wait(0.5)
        gui:Destroy()

        -- Code chính của NEVO HUB đặt ở đây
        -- loadstring(...)()

    else
        status.Text = "Key không đúng!"
        status.TextColor3 = Color3.fromRGB(255, 70, 70)
    end
end)
