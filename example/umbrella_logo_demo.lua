--[[
	Umbrella Corporation Logo Demo

	Demonstrates the programmatically created Umbrella Corp logo
	with 8 alternating red and white segments in a circular design.

	Features:
	- 8-segment octagonal logo (no emoji!)
	- Alternating red (#DC143C) and white (#F5F5FA) colors
	- Circular container with red glow border
	- Pulsing animation effect
	- Center dark circle for authenticity
	- Hover effects on segments
	- Click to restore functionality
]]

-- Load EzUI Library
local EzUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_REPO/ez-rbx-ui/main/init.lua"))()

-- Create window with minimize feature
local window = EzUI:CreateWindow({
	Title = "Umbrella Corporation - Logo Demo",
	Width = 500,
	Height = 400,
	AutoShow = true,
	Draggable = true,
	Resizable = true,
})

-- Create main tab
local mainTab = window:AddTab({
	Name = "Logo Info",
	Icon = ""
})

-- Add title
mainTab:AddLabel({
	Text = "Umbrella Corporation Logo",
	Size = 18,
	Color = Color3.fromRGB(220, 20, 60),
	Font = Enum.Font.GothamBold
})

mainTab:AddSeparator()

-- Description
mainTab:AddLabel({
	Text = "The minimized logo features:",
	Size = 14,
	Color = Color3.fromRGB(200, 200, 210)
})

mainTab:AddLabel({
	Text = "• 8 alternating segments (Red & White)",
	Size = 12,
	Color = Color3.fromRGB(180, 180, 190)
})

mainTab:AddLabel({
	Text = "• Circular design (octagonal pattern)",
	Size = 12,
	Color = Color3.fromRGB(180, 180, 190)
})

mainTab:AddLabel({
	Text = "• Pulsing red glow border animation",
	Size = 12,
	Color = Color3.fromRGB(180, 180, 190)
})

mainTab:AddLabel({
	Text = "• Hover effects (segments brighten)",
	Size = 12,
	Color = Color3.fromRGB(180, 180, 190)
})

mainTab:AddLabel({
	Text = "• Center dark circle for authenticity",
	Size = 12,
	Color = Color3.fromRGB(180, 180, 190)
})

mainTab:AddLabel({
	Text = "• NO EMOJI - 100% programmatic!",
	Size = 12,
	Color = Color3.fromRGB(220, 20, 60),
	Font = Enum.Font.GothamBold
})

mainTab:AddSeparator()

-- Add buttons to test minimize/restore
mainTab:AddButton({
	Text = "Minimize Window (Show Logo)",
	Callback = function()
		window:Minimize()
		window:ShowInfo(
			"Window Minimized",
			"Click the Umbrella Corp logo to restore!",
			5
		)
	end
})

mainTab:AddButton({
	Text = "Restore Window (Hide Logo)",
	Callback = function()
		window:Restore()
	end
})

mainTab:AddButton({
	Text = "Toggle Minimize",
	Callback = function()
		window:ToggleMinimize()
	end
})

mainTab:AddSeparator()

-- Technical details
mainTab:AddLabel({
	Text = "Technical Implementation:",
	Size = 14,
	Color = Color3.fromRGB(200, 200, 210),
	Font = Enum.Font.GothamBold
})

mainTab:AddLabel({
	Text = "• Container: 80x80px circular frame",
	Size = 11,
	Color = Color3.fromRGB(160, 160, 170)
})

mainTab:AddLabel({
	Text = "• Segments: 8 rotated frames (45° each)",
	Size = 11,
	Color = Color3.fromRGB(160, 160, 170)
})

mainTab:AddLabel({
	Text = "• Colors: Red (220,20,60) & White (245,245,250)",
	Size = 11,
	Color = Color3.fromRGB(160, 160, 170)
})

mainTab:AddLabel({
	Text = "• Animation: Sine easing, 1.5s cycle",
	Size = 11,
	Color = Color3.fromRGB(160, 160, 170)
})

mainTab:AddLabel({
	Text = "• ClipsDescendants: true (for circular shape)",
	Size = 11,
	Color = Color3.fromRGB(160, 160, 170)
})

-- Add controls tab
local controlsTab = window:AddTab({
	Name = "Controls",
	Icon = ""
})

controlsTab:AddLabel({
	Text = "Keyboard Shortcuts:",
	Size = 14,
	Color = Color3.fromRGB(200, 200, 210),
	Font = Enum.Font.GothamBold
})

controlsTab:AddLabel({
	Text = "Ctrl + M - Toggle minimize",
	Size = 12,
	Color = Color3.fromRGB(180, 180, 190)
})

controlsTab:AddLabel({
	Text = "Ctrl + H - Toggle minimize (alternate)",
	Size = 12,
	Color = Color3.fromRGB(180, 180, 190)
})

controlsTab:AddSeparator()

controlsTab:AddLabel({
	Text = "Logo Interactions:",
	Size = 14,
	Color = Color3.fromRGB(200, 200, 210),
	Font = Enum.Font.GothamBold
})

controlsTab:AddLabel({
	Text = "Click - Restore window",
	Size = 12,
	Color = Color3.fromRGB(180, 180, 190)
})

controlsTab:AddLabel({
	Text = "Hover - Show tooltip & brighten",
	Size = 12,
	Color = Color3.fromRGB(180, 180, 190)
})

-- Info message
window:ShowSuccess(
	"Umbrella Corp Logo Demo Loaded!",
	"Minimize the window to see the programmatic logo in action.",
	5
)

print("Umbrella Corporation Logo Demo loaded successfully!")
print("- Logo created programmatically with 8 segments")
print("- NO emoji used!")
print("- Minimize window to see the logo")
