local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local loglib = {}

loglib.Colors = {
	red    = "255, 0, 0",
	green  = "0, 255, 0",
	blue   = "0, 150, 255",
	yellow = "255, 255, 0",
	pink   = "255, 102, 153",
	cyan   = "33, 161, 163",
	white  = "255, 255, 255",
	orange = "255, 165, 0",
	purple = "180, 0, 255",
}

local function patch()
	RunService.Heartbeat:Connect(function()
		local console = CoreGui:FindFirstChild("DevConsoleMaster")
		if not console then return end
		for _, obj in ipairs(console:GetDescendants()) do
			if obj:IsA("TextLabel") and not obj.RichText then
				obj.RichText = true
			end
		end
	end)
end

local function find_label(needle)
	local console = CoreGui:FindFirstChild("DevConsoleMaster")
	if not console then return nil end
	for _, obj in ipairs(console:GetDescendants()) do
		if obj:IsA("TextLabel") and obj.Text:find(needle, 1, true) then
			return obj
		end
	end
	return nil
end

function loglib:print(msg, color, time)
	color = color or loglib.Colors.white
	local tag = tostring(math.random(100000000, 999999999))
	print(tag)
	local label
	repeat
		task.wait()
		label = find_label(tag)
	until label ~= nil
	if time then
		label.Text = ("%s -- <font color='rgb(%s)'>%s</font>"):format(os.date("%H:%M:%S"), color, msg)
	else
		label.Text = ("<font color='rgb(%s)'>%s</font>"):format(color, msg)
	end
end

patch()
return loglib
