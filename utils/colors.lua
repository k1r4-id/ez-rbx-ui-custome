--[[
	EzUI Color Palette Module - UMBRELLA CORPORATION THEME
	Pharmaceutical Corporation with High-Tech Medical Aesthetic

	Author: EzUI Library
	Version: 2.0.0 - Ultimate Umbrella Corp Edition

	Theme Identity:
	- Primary: Umbrella Crimson Red (Signature)
	- Style: Corporate pharmaceutical with medical precision
	- Mood: Professional, powerful, slightly sinister

	Usage:
		local m = require(path.to.color)
		myFrame.BackgroundColor3 = Colors.Background.Primary
		myButton.BackgroundColor3 = Colors.Button.Default
]]

local Colors = {}

-- ============================================
-- UMBRELLA CORPORATION SIGNATURE COLORS
-- ============================================
Colors.Umbrella = {
	Red = Color3.fromRGB(220, 20, 60),          -- Crimson signature
	RedBright = Color3.fromRGB(240, 30, 70),    -- Hover/emphasis
	RedDark = Color3.fromRGB(180, 15, 50),      -- Darker variant
	CorporateWhite = Color3.fromRGB(245, 245, 250), -- Clean medical white
	CorporateBlack = Color3.fromRGB(18, 18, 22),    -- Professional depth
}

-- ============================================
-- BACKGROUND COLORS (Corporate Dark)
-- ============================================
Colors.Background = {
	Primary = Color3.fromRGB(18, 18, 22),      -- Main background (corporate black)
	Secondary = Color3.fromRGB(25, 25, 30),    -- Secondary panels (dark panel)
	Tertiary = Color3.fromRGB(32, 32, 38),     -- Elevated elements
	Overlay = Color3.fromRGB(0, 0, 0),         -- Modal overlays (use with transparency)
	Transparent = Color3.fromRGB(0, 0, 0),     -- For transparent elements
}

-- ============================================
-- SURFACE COLORS (Professional Panels)
-- ============================================
Colors.Surface = {
	Default = Color3.fromRGB(25, 25, 30),      -- Default surface (dark panel)
	Elevated = Color3.fromRGB(32, 32, 38),     -- Elevated surface
	Hover = Color3.fromRGB(38, 38, 45),        -- Hover state
	Active = Color3.fromRGB(40, 40, 48),       -- Active/Pressed state
	Disabled = Color3.fromRGB(20, 20, 25),     -- Disabled state
}

-- ============================================
-- TEXT COLORS (Corporate Hierarchy)
-- ============================================
Colors.Text = {
	Primary = Color3.fromRGB(245, 245, 250),   -- Primary text (corporate white)
	Secondary = Color3.fromRGB(200, 200, 210), -- Secondary text
	Tertiary = Color3.fromRGB(150, 150, 160),  -- Tertiary text (gray)
	Disabled = Color3.fromRGB(100, 100, 110),  -- Disabled text
	Placeholder = Color3.fromRGB(120, 120, 130), -- Placeholder text
	Link = Color3.fromRGB(220, 20, 60),        -- Link text (Umbrella Red)
	LinkHover = Color3.fromRGB(240, 30, 70),   -- Link hover (brighter red)
}

-- ============================================
-- BORDER COLORS (Subtle & Professional)
-- ============================================
Colors.Border = {
	Default = Color3.fromRGB(40, 40, 48),      -- Default border (subtle)
	Light = Color3.fromRGB(50, 50, 58),        -- Light border
	Dark = Color3.fromRGB(30, 30, 35),         -- Dark border
	Focus = Color3.fromRGB(220, 20, 60),       -- Focused border (Umbrella Red)
	Error = Color3.fromRGB(220, 20, 60),       -- Error border (same as red)
	Success = Color3.fromRGB(80, 200, 120),    -- Success border (medical green)
}

-- ============================================
-- BUTTON COLORS (Premium Corporate)
-- ============================================
Colors.Button = {
	-- Primary Button (UMBRELLA RED!)
	Primary = Color3.fromRGB(220, 20, 60),
	PrimaryHover = Color3.fromRGB(240, 30, 70),
	PrimaryActive = Color3.fromRGB(200, 15, 50),
	PrimaryDisabled = Color3.fromRGB(110, 10, 30),

	-- Secondary Button (Dark with Red Border)
	Secondary = Color3.fromRGB(25, 25, 30),
	SecondaryHover = Color3.fromRGB(32, 32, 38),
	SecondaryActive = Color3.fromRGB(20, 20, 25),
	SecondaryDisabled = Color3.fromRGB(18, 18, 22),

	-- Success Button (Medical Green)
	Success = Color3.fromRGB(80, 200, 120),
	SuccessHover = Color3.fromRGB(90, 220, 135),
	SuccessActive = Color3.fromRGB(70, 180, 105),
	SuccessDisabled = Color3.fromRGB(40, 100, 60),

	-- Danger Button (Umbrella Red)
	Danger = Color3.fromRGB(220, 20, 60),
	DangerHover = Color3.fromRGB(240, 30, 70),
	DangerActive = Color3.fromRGB(200, 15, 50),
	DangerDisabled = Color3.fromRGB(110, 10, 30),

	-- Warning Button (Medical Amber)
	Warning = Color3.fromRGB(255, 160, 0),
	WarningHover = Color3.fromRGB(255, 180, 30),
	WarningActive = Color3.fromRGB(235, 140, 0),
	WarningDisabled = Color3.fromRGB(130, 80, 0),
}

-- ============================================
-- INPUT COLORS (User-Friendly)
-- ============================================
Colors.Input = {
	Background = Color3.fromRGB(25, 25, 30),   -- Dark panel
	BackgroundHover = Color3.fromRGB(28, 28, 33),
	BackgroundFocus = Color3.fromRGB(30, 30, 35),
	BackgroundDisabled = Color3.fromRGB(20, 20, 25),
	Border = Color3.fromRGB(60, 60, 68),       -- Gray border (0.6 transparency)
	BorderFocus = Color3.fromRGB(220, 20, 60), -- Umbrella Red on focus!
	BorderError = Color3.fromRGB(220, 20, 60), -- Red for errors
	Text = Color3.fromRGB(245, 245, 250),      -- Corporate white
	Placeholder = Color3.fromRGB(120, 120, 130), -- Gray placeholder
}

-- ============================================
-- TOGGLE/SWITCH COLORS (Satisfying!)
-- ============================================
Colors.Toggle = {
	On = Color3.fromRGB(220, 20, 60),          -- Umbrella Red when ON!
	Off = Color3.fromRGB(60, 60, 68),          -- Dark gray when OFF
	Handle = Color3.fromRGB(245, 245, 250),    -- White circle handle
	Disabled = Color3.fromRGB(40, 40, 48),     -- Disabled state
}

-- ============================================
-- SLIDER COLORS
-- ============================================
Colors.Slider = {
	Track = Color3.fromRGB(40, 40, 48),        -- Dark track
	TrackFilled = Color3.fromRGB(220, 20, 60), -- Red filled portion
	Handle = Color3.fromRGB(245, 245, 250),    -- White handle
	HandleHover = Color3.fromRGB(240, 30, 70), -- Red glow on hover
	HandleActive = Color3.fromRGB(220, 20, 60),
	HandleDisabled = Color3.fromRGB(100, 100, 110),
}

-- ============================================
-- DROPDOWN COLORS (Clean & Modern)
-- ============================================
Colors.Dropdown = {
	Background = Color3.fromRGB(25, 25, 30),
	Option = Color3.fromRGB(25, 25, 30),
	OptionHover = Color3.fromRGB(32, 32, 38),
	OptionSelected = Color3.fromRGB(32, 32, 38),
	OptionActive = Color3.fromRGB(220, 20, 60), -- Red for active
	Border = Color3.fromRGB(60, 60, 68),
	Arrow = Color3.fromRGB(200, 200, 210),
}

-- ============================================
-- SCROLLBAR COLORS (Subtle)
-- ============================================
Colors.Scrollbar = {
	Background = Color3.fromRGB(18, 18, 22),
	Thumb = Color3.fromRGB(80, 80, 90),
	ThumbHover = Color3.fromRGB(100, 100, 110),
	ThumbActive = Color3.fromRGB(120, 120, 130),
}

-- ============================================
-- STATUS COLORS (Medical/Laboratory Theme)
-- ============================================
Colors.Status = {
	Success = Color3.fromRGB(80, 200, 120),    -- Medical green (ECG monitor)
	Warning = Color3.fromRGB(255, 160, 0),     -- Medical amber
	Error = Color3.fromRGB(220, 20, 60),       -- Umbrella Red
	Info = Color3.fromRGB(100, 150, 255),      -- Medical blue
}

-- ============================================
-- ACCENT COLORS (Umbrella Signature)
-- ============================================
Colors.Accent = {
	Primary = Color3.fromRGB(220, 20, 60),     -- Umbrella Red
	Secondary = Color3.fromRGB(180, 15, 50),   -- Darker red
	Success = Color3.fromRGB(80, 200, 120),    -- Medical green
	Warning = Color3.fromRGB(255, 160, 0),     -- Medical amber
	Danger = Color3.fromRGB(220, 20, 60),      -- Umbrella Red
	Info = Color3.fromRGB(100, 150, 255),      -- Medical blue
	Hover = Color3.fromRGB(240, 30, 70),       -- Brighter red for hover
}

-- ============================================
-- SPECIAL COLORS (Effects & Glows)
-- ============================================
Colors.Special = {
	Shadow = Color3.fromRGB(0, 0, 0),          -- For shadows
	Highlight = Color3.fromRGB(245, 245, 250), -- Corporate white highlights
	Overlay = Color3.fromRGB(0, 0, 0),         -- Modal overlays (use with transparency)
	Divider = Color3.fromRGB(40, 40, 48),      -- Separators/dividers

	-- Glow colors (use with transparency!)
	RedGlowSubtle = Color3.fromRGB(220, 20, 60),   -- Base: 0.7-0.9 transparency
	RedGlowBright = Color3.fromRGB(240, 30, 70),   -- Active: 0.4-0.6 transparency
	GreenGlow = Color3.fromRGB(80, 200, 120),      -- Success glow
	AmberGlow = Color3.fromRGB(255, 160, 0),       -- Warning glow
	BlueGlow = Color3.fromRGB(100, 150, 255),      -- Info glow
}

-- ============================================
-- TAB COLORS (Clean Navigation)
-- ============================================
Colors.Tab = {
	Background = Color3.fromRGB(25, 25, 30),
	BackgroundHover = Color3.fromRGB(28, 28, 33),
	BackgroundActive = Color3.fromRGB(32, 32, 38), -- Subtle lift when active
	Text = Color3.fromRGB(245, 245, 250),
	TextInactive = Color3.fromRGB(150, 150, 160),
	Indicator = Color3.fromRGB(220, 20, 60),       -- Red active indicator!
}

-- ============================================
-- NOTIFICATION COLORS (Medical Alert Style)
-- ============================================
Colors.Notification = {
	Success = {
		Background = Color3.fromRGB(25, 25, 30),   -- Dark background
		Text = Color3.fromRGB(245, 245, 250),
		Border = Color3.fromRGB(80, 200, 120),     -- Medical green border
		Accent = Color3.fromRGB(80, 200, 120),
	},
	Warning = {
		Background = Color3.fromRGB(25, 25, 30),
		Text = Color3.fromRGB(245, 245, 250),
		Border = Color3.fromRGB(255, 160, 0),      -- Medical amber border
		Accent = Color3.fromRGB(255, 160, 0),
	},
	Error = {
		Background = Color3.fromRGB(25, 25, 30),
		Text = Color3.fromRGB(245, 245, 250),
		Border = Color3.fromRGB(220, 20, 60),      -- Umbrella Red border
		Accent = Color3.fromRGB(220, 20, 60),
	},
	Info = {
		Background = Color3.fromRGB(25, 25, 30),
		Text = Color3.fromRGB(245, 245, 250),
		Border = Color3.fromRGB(100, 150, 255),    -- Medical blue border
		Accent = Color3.fromRGB(100, 150, 255),
	},
}

-- ============================================
-- UTILITY FUNCTIONS
-- ============================================

-- Convert Color3 to hex string
function Colors:ToHex(color3)
	local r = math.floor(color3.R * 255)
	local g = math.floor(color3.G * 255)
	local b = math.floor(color3.B * 255)
	return string.format("#%02X%02X%02X", r, g, b)
end

-- Convert hex string to Color3
function Colors:FromHex(hex)
	hex = hex:gsub("#", "")
	local r = tonumber("0x" .. hex:sub(1, 2)) / 255
	local g = tonumber("0x" .. hex:sub(3, 4)) / 255
	local b = tonumber("0x" .. hex:sub(5, 6)) / 255
	return Color3.new(r, g, b)
end

-- Lighten a color by a percentage (0-1)
function Colors:Lighten(color3, amount)
	amount = math.clamp(amount, 0, 1)
	local h, s, v = color3:ToHSV()
	v = math.clamp(v + amount, 0, 1)
	return Color3.fromHSV(h, s, v)
end

-- Darken a color by a percentage (0-1)
function Colors:Darken(color3, amount)
	amount = math.clamp(amount, 0, 1)
	local h, s, v = color3:ToHSV()
	v = math.clamp(v - amount, 0, 1)
	return Color3.fromHSV(h, s, v)
end

-- Adjust saturation of a color
function Colors:Saturate(color3, amount)
	amount = math.clamp(amount, -1, 1)
	local h, s, v = color3:ToHSV()
	s = math.clamp(s + amount, 0, 1)
	return Color3.fromHSV(h, s, v)
end

-- Mix two colors with a ratio (0 = color1, 1 = color2)
function Colors:Mix(color1, color2, ratio)
	ratio = math.clamp(ratio, 0, 1)
	return Color3.new(
		color1.R + (color2.R - color1.R) * ratio,
		color1.G + (color2.G - color1.G) * ratio,
		color1.B + (color2.B - color1.B) * ratio
	)
end

-- Get contrasting text color (black or white) based on background
function Colors:GetContrastText(backgroundColor)
	local luminance = (0.299 * backgroundColor.R + 0.587 * backgroundColor.G + 0.114 * backgroundColor.B)
	return luminance > 0.5 and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
end

-- Apply alpha/transparency to a color (returns color and transparency value)
function Colors:WithAlpha(color3, alpha)
	alpha = math.clamp(alpha, 0, 1)
	return color3, 1 - alpha
end

-- Create a gradient of colors
function Colors:CreateGradient(startColor, endColor, steps)
	local gradient = {}
	for i = 0, steps - 1 do
		local ratio = i / (steps - 1)
		table.insert(gradient, self:Mix(startColor, endColor, ratio))
	end
	return gradient
end

-- ============================================
-- PRESET THEMES
-- ============================================
Colors.Themes = {
	-- Umbrella Corporation Theme (Default)
	UmbrellaCorp = {
		Name = "Umbrella Corporation",
		Primary = Color3.fromRGB(220, 20, 60),
		Background = Color3.fromRGB(18, 18, 22),
		Surface = Color3.fromRGB(25, 25, 30),
		Text = Color3.fromRGB(245, 245, 250),
		Accent = Color3.fromRGB(220, 20, 60),
	},

	-- Medical Lab Theme
	MedicalLab = {
		Name = "Medical Laboratory",
		Primary = Color3.fromRGB(80, 200, 120),
		Background = Color3.fromRGB(18, 18, 22),
		Surface = Color3.fromRGB(20, 30, 25),
		Text = Color3.fromRGB(245, 245, 250),
		Accent = Color3.fromRGB(80, 200, 120),
	},

	-- Umbrella Blue (Alternative)
	UmbrellaBlue = {
		Name = "Umbrella Blue",
		Primary = Color3.fromRGB(100, 150, 255),
		Background = Color3.fromRGB(15, 20, 30),
		Surface = Color3.fromRGB(20, 25, 35),
		Text = Color3.fromRGB(245, 245, 250),
		Accent = Color3.fromRGB(100, 150, 255),
	},
}

-- ============================================
-- RETURN MODULE
-- ============================================
return Colors
