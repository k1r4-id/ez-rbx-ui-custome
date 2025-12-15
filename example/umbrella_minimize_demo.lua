--[[
    UMBRELLA CORP MINIMIZE DEMO

    Demonstrates the professional minimize-to-logo functionality
    with Umbrella Corporation branding!

    Features:
    - Minimize button in title bar
    - Umbrella Corp logo (circular, bottom-right)
    - Pulsing red glow animation
    - Smooth minimize/restore animations
    - Keyboard shortcuts (Ctrl+M, Ctrl+H)
]]

local EzUI = require(game.ReplicatedStorage.EzUI)

-- ============================================
-- CREATE UMBRELLA CORP WINDOW
-- ============================================

local Window = EzUI:CreateWindow({
    Title = "⚠️ Umbrella Corporation - Research Division",
    Width = 750,
    Height = 550,
    AutoShow = true,
    Draggable = true,
    Resizable = true
})

-- ============================================
-- OPTIONAL: SET CUSTOM LOGO
-- ============================================

-- If you have uploaded Umbrella Corp logo to Roblox, uncomment this:
-- Window:SetMinimizedLogo(YOUR_ASSET_ID_HERE)
-- Example: Window:SetMinimizedLogo(123456789)

-- For now, it will use the default umbrella emoji (⛱)

-- ============================================
-- CUSTOMIZE LOGO (OPTIONAL)
-- ============================================

-- Get logo reference for customization
local umbrellaLogo = Window:GetMinimizedLogo()

-- Example: Change logo text if you don't have image
-- umbrellaLogo.LogoText.Text = "U"
-- umbrellaLogo.LogoText.Font = Enum.Font.GothamBlack
-- umbrellaLogo.LogoText.TextSize = 52

-- Example: Change logo position to top-right
-- umbrellaLogo.Frame.Position = UDim2.new(1, -100, 0, 20)

-- ============================================
-- ADD TABS
-- ============================================

-- Research Tab
local ResearchTab = Window:AddTab({
    Name = "Research",
    Icon = "🧪"
})

-- Security Tab
local SecurityTab = Window:AddTab({
    Name = "Security",
    Icon = "🔒"
})

-- Settings Tab
local SettingsTab = Window:AddTab({
    Name = "Settings",
    Icon = "⚙️"
})

-- ============================================
-- RESEARCH TAB CONTENT
-- ============================================

ResearchTab:AddLabel({
    Text = "🏢 Umbrella Corporation",
    FontSize = 18,
    Bold = true,
    Color = Color3.fromRGB(220, 20, 60) -- Umbrella Red
})

ResearchTab:AddLabel({
    Text = "Preserve the Species | Obey Your Thirst",
    FontSize = 12,
    Color = Color3.fromRGB(150, 150, 160)
})

ResearchTab:AddSeparator()

ResearchTab:AddLabel({
    Text = "📋 Minimize Functionality",
    FontSize = 14,
    Bold = true
})

ResearchTab:AddLabel({
    Text = [[
• Click the minimize button (—) in title bar
• Window minimizes to Umbrella Corp logo
• Logo appears in bottom-right corner
• Click logo to restore window
• Smooth bounce animations!
    ]],
    FontSize = 11,
    Color = Color3.fromRGB(200, 200, 210)
})

ResearchTab:AddSeparator()

-- Minimize Button Demo
ResearchTab:AddButton({
    Text = "🔽 Minimize Window (Programmatic)",
    Color = Color3.fromRGB(220, 20, 60),
    Callback = function()
        Window:Minimize()
    end
})

ResearchTab:AddButton({
    Text = "🔼 Restore Window (Programmatic)",
    Color = Color3.fromRGB(80, 200, 120),
    Callback = function()
        Window:Restore()
    end
})

ResearchTab:AddButton({
    Text = "🔄 Toggle Minimize",
    Callback = function()
        Window:ToggleMinimize()
    end
})

ResearchTab:AddSeparator()

-- Check minimize state
ResearchTab:AddButton({
    Text = "❓ Check Minimize State",
    Callback = function()
        if Window:IsMinimized() then
            Window:ShowInfo("Minimize Status", "Window is currently MINIMIZED to logo")
        else
            Window:ShowInfo("Minimize Status", "Window is currently VISIBLE")
        end
    end
})

-- ============================================
-- SECURITY TAB CONTENT
-- ============================================

SecurityTab:AddLabel({
    Text = "🔒 Security Protocols",
    FontSize = 16,
    Bold = true
})

SecurityTab:AddSeparator()

SecurityTab:AddToggle({
    Text = "Enable T-Virus Containment",
    Default = false,
    Callback = function(value)
        if value then
            Window:ShowWarning("Security Alert", "T-Virus containment activated!")
        else
            Window:ShowError("Warning", "T-Virus containment deactivated!")
        end
    end
})

SecurityTab:AddToggle({
    Text = "Lock Research Facilities",
    Default = true,
    Callback = function(value)
        if value then
            Window:ShowSuccess("Security", "All facilities locked")
        end
    end
})

SecurityTab:AddSeparator()

SecurityTab:AddSlider({
    Text = "Security Level",
    Min = 1,
    Max = 10,
    Default = 5,
    Callback = function(value)
        print("Security level set to:", value)
    end
})

SecurityTab:AddSeparator()

SecurityTab:AddButton({
    Text = "🚨 Emergency Protocol",
    Color = Color3.fromRGB(220, 20, 60),
    Callback = function()
        Window:ShowError(
            "⚠️ EMERGENCY PROTOCOL",
            "All personnel evacuate immediately!",
            5
        )
    end
})

-- ============================================
-- SETTINGS TAB CONTENT
-- ============================================

SettingsTab:AddLabel({
    Text = "⚙️ Window Settings",
    FontSize = 16,
    Bold = true
})

SettingsTab:AddSeparator()

-- Logo customization
SettingsTab:AddLabel({
    Text = "🎨 Logo Customization",
    FontSize = 14,
    Bold = true
})

SettingsTab:AddButton({
    Text = "Move Logo to Top-Right",
    Callback = function()
        umbrellaLogo.Frame.Position = UDim2.new(1, -100, 0, 20)
        Window:ShowSuccess("Logo Position", "Moved to top-right corner")
    end
})

SettingsTab:AddButton({
    Text = "Move Logo to Bottom-Left",
    Callback = function()
        umbrellaLogo.Frame.Position = UDim2.new(0, 20, 1, -100)
        Window:ShowSuccess("Logo Position", "Moved to bottom-left corner")
    end
})

SettingsTab:AddButton({
    Text = "Reset Logo Position",
    Callback = function()
        umbrellaLogo.Frame.Position = UDim2.new(1, -100, 1, -100)
        Window:ShowSuccess("Logo Position", "Reset to bottom-right corner")
    end
})

SettingsTab:AddSeparator()

-- Logo size
SettingsTab:AddLabel({
    Text = "📏 Logo Size",
    FontSize = 14,
    Bold = true
})

SettingsTab:AddButton({
    Text = "Small Logo (60x60)",
    Callback = function()
        umbrellaLogo.Frame.Size = UDim2.new(0, 60, 0, 60)
        Window:ShowInfo("Logo Size", "Logo size set to 60x60px")
    end
})

SettingsTab:AddButton({
    Text = "Medium Logo (80x80) - Default",
    Callback = function()
        umbrellaLogo.Frame.Size = UDim2.new(0, 80, 0, 80)
        Window:ShowInfo("Logo Size", "Logo size reset to 80x80px")
    end
})

SettingsTab:AddButton({
    Text = "Large Logo (120x120)",
    Callback = function()
        umbrellaLogo.Frame.Size = UDim2.new(0, 120, 0, 120)
        Window:ShowInfo("Logo Size", "Logo size set to 120x120px")
    end
})

SettingsTab:AddSeparator()

-- Glow customization
SettingsTab:AddLabel({
    Text = "✨ Glow Effects",
    FontSize = 14,
    Bold = true
})

local redGlow = umbrellaLogo.Frame:FindFirstChild("RedGlow")

SettingsTab:AddButton({
    Text = "Stop Pulsing Glow",
    Callback = function()
        if umbrellaLogo.PulseTween then
            umbrellaLogo.PulseTween:Pause()
            Window:ShowInfo("Glow Effect", "Pulsing animation stopped")
        end
    end
})

SettingsTab:AddButton({
    Text = "Resume Pulsing Glow",
    Callback = function()
        if umbrellaLogo.PulseTween then
            umbrellaLogo.PulseTween:Play()
            Window:ShowSuccess("Glow Effect", "Pulsing animation resumed")
        end
    end
})

SettingsTab:AddButton({
    Text = "Change Glow to Green",
    Callback = function()
        if redGlow then
            redGlow.Color = Color3.fromRGB(80, 200, 120)
            umbrellaLogo.LogoText.TextColor3 = Color3.fromRGB(80, 200, 120)
            Window:ShowSuccess("Glow Color", "Changed to medical green")
        end
    end
})

SettingsTab:AddButton({
    Text = "Reset Glow to Umbrella Red",
    Callback = function()
        if redGlow then
            redGlow.Color = Color3.fromRGB(220, 20, 60)
            umbrellaLogo.LogoText.TextColor3 = Color3.fromRGB(220, 20, 60)
            Window:ShowSuccess("Glow Color", "Reset to Umbrella Red")
        end
    end
})

-- ============================================
-- WELCOME NOTIFICATION
-- ============================================

task.wait(1)

Window:ShowSuccess(
    "🏢 Welcome to Umbrella Corporation",
    "Click the minimize button (—) to minimize to Umbrella Corp logo!",
    6
)

task.wait(3)

Window:ShowInfo(
    "⌨️ Keyboard Shortcuts",
    "Press Ctrl+M or Ctrl+H to toggle minimize!",
    5
)

-- ============================================
-- DEMO: AUTO MINIMIZE/RESTORE
-- ============================================

-- Uncomment to test auto minimize/restore cycle
--[[
task.wait(8)
print("AUTO DEMO: Minimizing in 3 seconds...")
task.wait(3)

Window:Minimize()
Window:ShowInfo("Demo", "Window minimized to logo!")

task.wait(4)
print("AUTO DEMO: Restoring in 2 seconds...")
task.wait(2)

Window:Restore()
Window:ShowSuccess("Demo", "Window restored!")
]]

-- ============================================
-- DONE!
-- ============================================

print("===========================================")
print("UMBRELLA CORP MINIMIZE DEMO LOADED!")
print("===========================================")
print("")
print("Features:")
print("✅ Minimize button in title bar")
print("✅ Umbrella Corp logo (bottom-right)")
print("✅ Pulsing red glow animation")
print("✅ Smooth bounce animations")
print("✅ Keyboard shortcuts (Ctrl+M, Ctrl+H)")
print("")
print("Try it:")
print("1. Click minimize button (—) in title bar")
print("2. Window minimizes to Umbrella logo")
print("3. Click logo to restore window")
print("4. Press Ctrl+M to toggle")
print("")
print("===========================================")
