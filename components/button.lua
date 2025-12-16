--[[
	Button Component
	EzUI Library - Modular Component
	
	Creates a clickable button with hover effects
]]
local Button = {}

local Colors

function Button:Init(_colors)
	Colors = _colors
end

function Button:Create(config)
	local text = config.Text or config.Label or config.Title or config.Name or "Button"
	local callback = config.Callback or function() end
	local variant = config.Variant or "primary"
	local parentContainer = config.Parent
	local currentY = config.Y or 0
	local isForAccordion = config.IsForAccordion or false
	
	-- Handle case where Parent might be a component API object instead of Instance
	if parentContainer and type(parentContainer) == "table" then
		-- Look for common GUI object properties in component APIs
		if parentContainer.Frame then
			parentContainer = parentContainer.Frame
		elseif parentContainer.Button then
			parentContainer = parentContainer.Button
		elseif parentContainer.Label then
			parentContainer = parentContainer.Label
		elseif parentContainer.Container then
			parentContainer = parentContainer.Container
		else
			-- List available keys for debugging
			local keys = {}
			for k, v in pairs(parentContainer) do
				table.insert(keys, tostring(k))
			end
			warn("Button:Create - Parent is a table but no GUI object found. Keys:", table.concat(keys, ", "))
			parentContainer = nil
		end
	end
	
	-- Validate parent is an Instance
	if parentContainer and not typeof(parentContainer) == "Instance" then
		warn("Button:Create - Parent must be an Instance, got:", typeof(parentContainer))
		parentContainer = nil
	end
	
	-- Function to get variant colors (UMBRELLA CORP: Updated with Umbrella Red)
	local function getVariantColors(variantName)
		local variants = {
			primary = {
				background = Colors.Umbrella.Red,
				backgroundHover = Colors.Umbrella.RedBright,
				backgroundActive = Colors.Umbrella.RedDark,
				text = Colors.Text.Primary,
				border = Colors.Umbrella.RedDark
			},
			secondary = {
				background = Colors.Surface.Default,
				backgroundHover = Colors.Surface.Hover,
				backgroundActive = Colors.Surface.Active,
				text = Colors.Text.Primary,
				border = Colors.Umbrella.Red
			},
			success = {
				background = Colors.Button.Success,
				backgroundHover = Colors.Button.SuccessHover,
				backgroundActive = Colors.Button.SuccessActive,
				text = Colors.Text.Primary,
				border = Colors.Button.Success
			},
			warning = {
				background = Colors.Button.Warning,
				backgroundHover = Colors.Button.WarningHover,
				backgroundActive = Colors.Button.WarningActive,
				text = Colors.Background.Primary,
				border = Colors.Button.Warning
			},
			danger = {
				background = Colors.Umbrella.Red,
				backgroundHover = Colors.Umbrella.RedBright,
				backgroundActive = Colors.Umbrella.RedDark,
				text = Colors.Text.Primary,
				border = Colors.Umbrella.RedDark
			},
			info = {
				background = Colors.Status.Info,
				backgroundHover = Color3.fromRGB(120, 170, 255),
				backgroundActive = Color3.fromRGB(80, 130, 235),
				text = Colors.Text.Primary,
				border = Colors.Status.Info
			},
			light = {
				background = Colors.Surface.Elevated,
				backgroundHover = Colors.Surface.Hover,
				backgroundActive = Colors.Surface.Active,
				text = Colors.Text.Primary,
				border = Colors.Border.Light
			},
			dark = {
				background = Colors.Background.Primary,
				backgroundHover = Colors.Background.Secondary,
				backgroundActive = Colors.Surface.Active,
				text = Colors.Text.Primary,
				border = Colors.Border.Dark
			}
		}

		return variants[variantName] or variants.primary
	end
	
	local variantColors = getVariantColors(variant)
	
	local button = Instance.new("TextButton")
	if isForAccordion then
		-- Make button width responsive to content (takes full available width)
		button.Size = UDim2.new(1, -10, 0, 25)
		-- Don't set Position for accordion buttons - let UIListLayout handle it
		button.BorderSizePixel = 0
		button.TextSize = 12
		button.ZIndex = 5

		-- Round corners for accordion button
		local buttonCorner = Instance.new("UICorner")
		buttonCorner.CornerRadius = UDim.new(0, 4)
		buttonCorner.Parent = button

		-- Border for secondary variant
		if variant == "secondary" then
			local buttonBorder = Instance.new("UIStroke")
			buttonBorder.Color = variantColors.border
			buttonBorder.Thickness = 1
			buttonBorder.Parent = button
		end

		-- Button hover effects for accordion
		button.MouseEnter:Connect(function()
			button.BackgroundColor3 = variantColors.backgroundHover
		end)

		button.MouseLeave:Connect(function()
			button.BackgroundColor3 = variantColors.background
		end)
	else
		-- UMBRELLA CORP: 30px height for better spacing (5px gap with +35 increment), 150px width, 16px padding, 6px corner, 14px text, Gotham Semibold
		button.Size = UDim2.new(0, 150, 0, 30)
		button.Position = UDim2.new(0, 10, 0, currentY)
		button.BorderSizePixel = 0
		button.TextSize = 14
		button.ZIndex = 3
		button:SetAttribute("ComponentStartY", currentY)

		-- Round corners (6px)
		local buttonCorner = Instance.new("UICorner")
		buttonCorner.CornerRadius = UDim.new(0, 6)
		buttonCorner.Parent = button

		-- Padding
		local buttonPadding = Instance.new("UIPadding")
		buttonPadding.PaddingLeft = UDim.new(0, 16)
		buttonPadding.PaddingRight = UDim.new(0, 16)
		buttonPadding.Parent = button

		-- Glow for primary button (UMBRELLA CORP: red glow, transparency 0.8)
		if variant == "primary" or variant == "danger" then
			local buttonGlow = Instance.new("UIStroke")
			buttonGlow.Color = Colors.Umbrella.Red
			buttonGlow.Thickness = 1
			buttonGlow.Transparency = 0.8
			buttonGlow.Parent = button
		end

		-- Border for secondary variant
		if variant == "secondary" then
			local buttonBorder = Instance.new("UIStroke")
			buttonBorder.Color = variantColors.border
			buttonBorder.Thickness = 1
			buttonBorder.Transparency = 0.9
			buttonBorder.Parent = button
		end

		-- Shadow (UMBRELLA CORP: Black, transparency 0.7, rounded corners)
		local buttonShadow = Instance.new("Frame")
		buttonShadow.Size = UDim2.new(1, 2, 1, 2)
		buttonShadow.Position = UDim2.new(0, -1, 0, 1)
		buttonShadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		buttonShadow.BackgroundTransparency = 0.7
		buttonShadow.BorderSizePixel = 0
		buttonShadow.ZIndex = button.ZIndex - 1
		buttonShadow.Parent = button

		-- Rounded corners for shadow - match button corner radius
		local shadowCorner = Instance.new("UICorner")
		shadowCorner.CornerRadius = UDim.new(0, 6)
		shadowCorner.Parent = buttonShadow
	end
	button.BackgroundColor3 = variantColors.background
	button.Text = text
	button.TextColor3 = variantColors.text
	button.Font = Enum.Font.GothamBold
	button.TextScaled = false  -- Keep original text size
	button.TextWrapped = false -- Don't wrap text to new lines
	button.TextTruncate = Enum.TextTruncate.AtEnd -- Add ... at end if text is too long
	button.Parent = parentContainer

	-- Add hover effects for non-accordion buttons (UMBRELLA CORP: 0.15s Quad transition, glow 0.8 → 0.4)
	if not isForAccordion then
		button.MouseEnter:Connect(function()
			local TweenService = game:GetService("TweenService")
			local hoverTween = TweenService:Create(button, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				BackgroundColor3 = variantColors.backgroundHover
			})
			hoverTween:Play()

			-- Update glow on hover
			local glow = button:FindFirstChild("UIStroke")
			if glow and (variant == "primary" or variant == "danger") then
				local glowTween = TweenService:Create(glow, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					Transparency = 0.4
				})
				glowTween:Play()
			end
		end)

		button.MouseLeave:Connect(function()
			local TweenService = game:GetService("TweenService")
			local leaveTween = TweenService:Create(button, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				BackgroundColor3 = variantColors.background
			})
			leaveTween:Play()

			-- Reset glow
			local glow = button:FindFirstChild("UIStroke")
			if glow and (variant == "primary" or variant == "danger") then
				local glowTween = TweenService:Create(glow, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					Transparency = 0.8
				})
				glowTween:Play()
			end
		end)
	end

	if callback then
		button.MouseButton1Click:Connect(callback)
	end
	
	-- Create Button API
	local buttonAPI = {
		Button = button
	}

	function buttonAPI:SetText(newText)
		button.Text = newText or ""
	end

	function buttonAPI:GetText()
		return button.Text
	end

	function buttonAPI:SetCallback(newCallback)
		callback = newCallback or function() end
		button.MouseButton1Click:Connect(callback)
	end

	function buttonAPI:SetEnabled(enabled)
		button.Active = enabled
		if enabled then
			button.BackgroundColor3 = variantColors.background
		else
			-- Create a disabled version by reducing opacity/brightness
			local r, g, b = variantColors.background.R, variantColors.background.G, variantColors.background.B
			button.BackgroundColor3 = Color3.fromRGB(
				math.floor(r * 255 * 0.5),
				math.floor(g * 255 * 0.5),
				math.floor(b * 255 * 0.5)
			)
		end
	end
	
	function buttonAPI:SetVariant(newVariant)
		variant = newVariant or "primary"
		variantColors = getVariantColors(variant)
		
		-- Update button colors
		button.BackgroundColor3 = variantColors.background
		button.TextColor3 = variantColors.text
		if isForAccordion then
			button.BorderColor3 = variantColors.border
		end
	end
	
	function buttonAPI:GetVariant()
		return variant
	end
	
	return buttonAPI
end

return Button
