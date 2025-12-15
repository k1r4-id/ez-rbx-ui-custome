--[[
	NumberBox Component
	EzUI Library - Modular Component
	
	Creates a numeric input field with increment/decrement buttons
]]
local NumberBox = {}

local Colors

function NumberBox:Init(_colors)
	Colors = _colors
end

function NumberBox:Create(config)
	local name = config.Name or config.Title or ""
	local placeholder = config.Placeholder or "Enter number..."
	local defaultValue = config.Default or 0
	local callback = config.Callback or function() end
	local minValue = config.Min or -math.huge
	local maxValue = config.Max or math.huge
	local increment = config.Increment or 1
	local decimals = config.Decimals or 0
	local flag = config.Flag
	local parentContainer = config.Parent
	local currentY = config.Y or 0
	local isForAccordion = config.IsForAccordion or false
	local EzUI = config.EzUI
	local saveConfiguration = config.SaveConfiguration
	local registerComponent = config.RegisterComponent
	local settings = config.Settings
	
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
			warn("NumberBox:Create - Parent is a table but no GUI object found. Keys:", table.concat(keys, ", "))
			parentContainer = nil
		end
	end
	
	-- Validate parent is an Instance
	if parentContainer and not typeof(parentContainer) == "Instance" then
		warn("NumberBox:Create - Parent must be an Instance, got:", typeof(parentContainer))
		parentContainer = nil
	end
	
	-- NumberBox state
	local currentValue = defaultValue
	
	-- Load from flag (supports both EzUI.Flags and custom config)
	if flag then
		local flagValue = nil
		
		-- Check if using custom config object
		if settings and type(settings.GetValue) == "function" then
			flagValue = settings:GetValue(flag)
		end
		
		if flagValue ~= nil then
			currentValue = flagValue
			defaultValue = currentValue
		end
	end
	
	-- Main numberbox container (UMBRELLA CORP: 34px height)
	local numberBoxContainer = Instance.new("Frame")
	if isForAccordion then
		numberBoxContainer.Size = UDim2.new(1, -10, 0, 25)
		-- Don't set Position for accordion numberboxes - let UIListLayout handle it
		numberBoxContainer.ZIndex = 6
	else
		numberBoxContainer.Size = UDim2.new(1, -20, 0, 34)
		numberBoxContainer.Position = UDim2.new(0, 10, 0, currentY)
		numberBoxContainer.ZIndex = 3
		numberBoxContainer:SetAttribute("ComponentStartY", currentY)
	end
	numberBoxContainer.BackgroundTransparency = 1
	numberBoxContainer.ClipsDescendants = true -- Ensure text doesn't overflow container
	numberBoxContainer.Parent = parentContainer
	
	-- Number input box (UMBRELLA CORP: 34px height, 14px text, Gotham, 6px corner)
	local numberBox = Instance.new("TextBox")
	if isForAccordion then
		numberBox.Size = UDim2.new(1, -45, 1, 0)
		numberBox.TextSize = 12
		numberBox.ZIndex = 7
	else
		numberBox.Size = UDim2.new(1, -36, 1, 0)
		numberBox.TextSize = 14
		numberBox.ZIndex = 4
	end
	numberBox.Position = UDim2.new(0, 0, 0, 0)
	numberBox.BackgroundColor3 = Colors.Input.Background
	numberBox.BorderSizePixel = 0
	numberBox.Text = decimals > 0 and string.format("%." .. decimals .. "f", defaultValue) or tostring(defaultValue)
	numberBox.PlaceholderText = placeholder
	numberBox.TextColor3 = Colors.Input.Text
	numberBox.PlaceholderColor3 = Colors.Input.Placeholder
	numberBox.Font = Enum.Font.Gotham
	numberBox.TextXAlignment = Enum.TextXAlignment.Center
	numberBox.TextYAlignment = Enum.TextYAlignment.Center
	numberBox.TextScaled = false -- Prevent text from scaling down automatically
	numberBox.ClipsDescendants = true -- Clip text that overflows the TextBox
	numberBox.ClearTextOnFocus = false
	numberBox.Parent = numberBoxContainer

	-- Add padding to NumberBox
	local padding = Instance.new("UIPadding")
	padding.PaddingLeft = UDim.new(0, 12)
	padding.PaddingRight = UDim.new(0, 12)
	padding.PaddingTop = UDim.new(0, 0)
	padding.PaddingBottom = UDim.new(0, 0)
	padding.Parent = numberBox

	-- Round corners for number box (UMBRELLA CORP: 6px)
	local numberCorner = Instance.new("UICorner")
	numberCorner.CornerRadius = UDim.new(0, 6)
	numberCorner.Parent = numberBox

	-- Default border (gray, transparency 0.6)
	local defaultBorder = Instance.new("UIStroke")
	defaultBorder.Color = Colors.Input.Border
	defaultBorder.Thickness = 1
	defaultBorder.Transparency = 0.6
	defaultBorder.Parent = numberBox

	-- Red focus glow (UMBRELLA CORP: Umbrella Red, pulsing 0.7 ↔ 0.5, 1.5s Sine)
	local focusGlow = Instance.new("UIStroke")
	focusGlow.Name = "FocusGlow"
	focusGlow.Color = Colors.Umbrella.Red
	focusGlow.Thickness = 1
	focusGlow.Transparency = 1
	focusGlow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	focusGlow.Parent = numberBox

	-- Pulsing glow animation (only when focused)
	local isFocused = false
	task.spawn(function()
		local TweenService = game:GetService("TweenService")
		while numberBox and numberBox.Parent do
			if isFocused then
				local fadeIn = TweenService:Create(focusGlow, TweenInfo.new(0.75, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.5})
				local fadeOut = TweenService:Create(focusGlow, TweenInfo.new(0.75, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.7})
				fadeIn:Play()
				fadeIn.Completed:Wait()
				fadeOut:Play()
				fadeOut.Completed:Wait()
			else
				task.wait(0.1)
			end
		end
	end)
	
	-- Increment button (up arrow) (UMBRELLA CORP: 28x18px, 4px corner)
	local incrementBtn = Instance.new("TextButton")
	if isForAccordion then
		incrementBtn.Size = UDim2.new(0, 20, 0, 12)
		incrementBtn.Position = UDim2.new(1, -22, 0, 1)
		incrementBtn.TextSize = 8
		incrementBtn.ZIndex = 7
	else
		incrementBtn.Size = UDim2.new(0, 28, 0, 16)
		incrementBtn.Position = UDim2.new(1, -32, 0, 1)
		incrementBtn.TextSize = 10
		incrementBtn.ZIndex = 4
	end
	incrementBtn.BackgroundColor3 = Colors.Surface.Default
	incrementBtn.BorderSizePixel = 0
	incrementBtn.Text = "▲"
	incrementBtn.TextColor3 = Colors.Text.Secondary
	incrementBtn.Font = Enum.Font.Gotham
	incrementBtn.Parent = numberBoxContainer

	-- Corner for increment button
	local incrementCorner = Instance.new("UICorner")
	incrementCorner.CornerRadius = UDim.new(0, 4)
	incrementCorner.Parent = incrementBtn

	-- Decrement button (down arrow) (UMBRELLA CORP: 28x18px, 4px corner)
	local decrementBtn = Instance.new("TextButton")
	if isForAccordion then
		decrementBtn.Size = UDim2.new(0, 20, 0, 12)
		decrementBtn.Position = UDim2.new(1, -22, 0, 13)
		decrementBtn.TextSize = 8
		decrementBtn.ZIndex = 7
	else
		decrementBtn.Size = UDim2.new(0, 28, 0, 16)
		decrementBtn.Position = UDim2.new(1, -32, 0, 17)
		decrementBtn.TextSize = 10
		decrementBtn.ZIndex = 4
	end
	decrementBtn.BackgroundColor3 = Colors.Surface.Default
	decrementBtn.BorderSizePixel = 0
	decrementBtn.Text = "▼"
	decrementBtn.TextColor3 = Colors.Text.Secondary
	decrementBtn.Font = Enum.Font.Gotham
	decrementBtn.Parent = numberBoxContainer

	-- Corner for decrement button
	local decrementCorner = Instance.new("UICorner")
	decrementCorner.CornerRadius = UDim.new(0, 4)
	decrementCorner.Parent = decrementBtn
	
	-- Calculate heights based on whether we have a title label
	local hasTitle = name and name ~= ""
	local labelHeight = hasTitle and 18 or 0
	local inputHeight = isForAccordion and 25 or 30
	local totalHeight = labelHeight + inputHeight + (hasTitle and 2 or 0) -- 2px spacing between label and input

	-- Adjust container size
	if isForAccordion then
		numberBoxContainer.Size = UDim2.new(1, -10, 0, totalHeight)
	else
		numberBoxContainer.Size = UDim2.new(1, -20, 0, totalHeight)
	end

	-- Title label (if name is provided)
	if hasTitle then
		local titleLabel = Instance.new("TextLabel")
		titleLabel.Size = UDim2.new(1, 0, 0, labelHeight)
		titleLabel.Position = UDim2.new(0, 0, 0, 0)
		titleLabel.BackgroundTransparency = 1
		titleLabel.Text = name
		titleLabel.TextColor3 = Colors.Text.Primary
		titleLabel.TextXAlignment = Enum.TextXAlignment.Left
		titleLabel.Font = Enum.Font.SourceSans
		titleLabel.TextSize = isForAccordion and 12 or 14
		titleLabel.ZIndex = isForAccordion and 7 or 4
		titleLabel.Parent = numberBoxContainer
	end

	-- Adjust numberBox position and size
	if hasTitle then
		numberBox.Position = UDim2.new(0, 0, 0, labelHeight + 2) -- Add spacing below title
		numberBox.Size = UDim2.new(1, -60, 0, inputHeight)
	else
		numberBox.Position = UDim2.new(0, 0, 0, 0)
	end

	-- Adjust increment and decrement button positions
	if hasTitle then
		-- Position buttons relative to numberBox when title exists
		local buttonY = labelHeight + 2
		if isForAccordion then
			incrementBtn.Position = UDim2.new(1, -22, 0, buttonY + 1)
			decrementBtn.Position = UDim2.new(1, -22, 0, buttonY + 13)
		else
			incrementBtn.Position = UDim2.new(1, -30, 0, buttonY + 1)
			decrementBtn.Position = UDim2.new(1, -30, 0, buttonY + 15)
		end
	else
		-- Keep original positions when no title
		if isForAccordion then
			incrementBtn.Position = UDim2.new(1, -22, 0, 1)
			decrementBtn.Position = UDim2.new(1, -22, 0, 13)
		else
			incrementBtn.Position = UDim2.new(1, -30, 0, 1)
			decrementBtn.Position = UDim2.new(1, -30, 0, 15)
		end
	end

	-- Function to validate and update value
	local function updateValue(newValue)
		-- Clamp to min/max
		newValue = math.max(minValue, math.min(maxValue, newValue))
		
		-- Round to decimal places
		if decimals > 0 then
			local multiplier = 10 ^ decimals
			newValue = math.floor(newValue * multiplier + 0.5) / multiplier
		else
			newValue = math.floor(newValue + 0.5)
		end
		
		currentValue = newValue
	
		-- Update text box display
		if decimals > 0 then
			numberBox.Text = string.format("%." .. decimals .. "f", newValue)
		else
			numberBox.Text = tostring(newValue)
		end
		
		-- Save to configuration
		if flag then
			settings:SetValue(flag, currentValue)
		end
		-- Call user callback
		local success, errorMsg = pcall(function()
			callback(currentValue)
		end)
		
		if not success then
			warn("NumberBox callback error:", errorMsg)
		end
		
		return newValue
	end 
	
	-- Text change handler with validation
	numberBox.FocusLost:Connect(function()
		local inputText = numberBox.Text
		local numValue = tonumber(inputText)
		
		if numValue then
			updateValue(numValue)
		else
			-- Invalid input, revert to current value
			if decimals > 0 then
				numberBox.Text = string.format("%." .. decimals .. "f", currentValue)
			else
				numberBox.Text = tostring(currentValue)
			end
		end
	end)
	
	-- Increment button handler
	incrementBtn.MouseButton1Click:Connect(function()
		updateValue(currentValue + increment)
	end)
	
	-- Decrement button handler
	decrementBtn.MouseButton1Click:Connect(function()
		updateValue(currentValue - increment)
	end)
	
	-- Button hover effects (UMBRELLA CORP: Red border on hover)
	incrementBtn.MouseEnter:Connect(function()
		incrementBtn.BackgroundColor3 = Colors.Surface.Hover
		-- Add red border on hover
		local hoverBorder = incrementBtn:FindFirstChild("HoverBorder")
		if not hoverBorder then
			hoverBorder = Instance.new("UIStroke")
			hoverBorder.Name = "HoverBorder"
			hoverBorder.Color = Colors.Umbrella.Red
			hoverBorder.Thickness = 1
			hoverBorder.Transparency = 0.8
			hoverBorder.Parent = incrementBtn
		end
	end)

	incrementBtn.MouseLeave:Connect(function()
		incrementBtn.BackgroundColor3 = Colors.Surface.Default
		local hoverBorder = incrementBtn:FindFirstChild("HoverBorder")
		if hoverBorder then
			hoverBorder:Destroy()
		end
	end)

	decrementBtn.MouseEnter:Connect(function()
		decrementBtn.BackgroundColor3 = Colors.Surface.Hover
		-- Add red border on hover
		local hoverBorder = decrementBtn:FindFirstChild("HoverBorder")
		if not hoverBorder then
			hoverBorder = Instance.new("UIStroke")
			hoverBorder.Name = "HoverBorder"
			hoverBorder.Color = Colors.Umbrella.Red
			hoverBorder.Thickness = 1
			hoverBorder.Transparency = 0.8
			hoverBorder.Parent = decrementBtn
		end
	end)

	decrementBtn.MouseLeave:Connect(function()
		decrementBtn.BackgroundColor3 = Colors.Surface.Default
		local hoverBorder = decrementBtn:FindFirstChild("HoverBorder")
		if hoverBorder then
			hoverBorder:Destroy()
		end
	end)

	-- Focus effects (UMBRELLA CORP: Show red glow on focus, 0.15s Quad transition)
	numberBox.Focused:Connect(function()
		isFocused = true
		local TweenService = game:GetService("TweenService")
		-- Hide default border, show focus glow
		local borderTween = TweenService:Create(defaultBorder, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1})
		local glowTween = TweenService:Create(focusGlow, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 0.7})
		-- Slightly lighter background on focus
		local bgTween = TweenService:Create(numberBox, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Colors.Input.BackgroundFocus})
		borderTween:Play()
		glowTween:Play()
		bgTween:Play()
	end)

	numberBox.FocusLost:Connect(function()
		isFocused = false
		local TweenService = game:GetService("TweenService")
		-- Show default border, hide focus glow
		local borderTween = TweenService:Create(defaultBorder, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 0.6})
		local glowTween = TweenService:Create(focusGlow, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1})
		-- Reset background color
		local bgTween = TweenService:Create(numberBox, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Colors.Input.Background})
		borderTween:Play()
		glowTween:Play()
		bgTween:Play()
	end)
	
	-- Return NumberBox API
	local numberBoxAPI = {
		NumberBox = numberBoxContainer
	}
	
	function numberBoxAPI:GetValue()
		return currentValue
	end
	
	function numberBoxAPI:SetValue(newValue)
		local numValue = tonumber(newValue)
		if numValue then
			updateValue(numValue)
		else
			warn("NumberBox SetValue: Expected number, got " .. type(newValue))
		end
	end
	
	function numberBoxAPI:SetMin(newMin)
		minValue = tonumber(newMin) or -math.huge
		updateValue(currentValue)
	end
	
	function numberBoxAPI:SetMax(newMax)
		maxValue = tonumber(newMax) or math.huge
		updateValue(currentValue)
	end
	
	function numberBoxAPI:SetIncrement(newIncrement)
		increment = tonumber(newIncrement) or 1
	end
	
	function numberBoxAPI:Clear()
		updateValue(0)
	end
	
	function numberBoxAPI:Focus()
		numberBox:CaptureFocus()
	end
	
	function numberBoxAPI:Blur()
		numberBox:ReleaseFocus()
	end
	
	function numberBoxAPI:SetCallback(newCallback)
		callback = newCallback or function() end
	end
	
	function numberBoxAPI:Set(newValue)
		local numValue = tonumber(newValue)
		if numValue then
			updateValue(numValue)
		end
	end
	
	-- Register component for flag-based updates
	if registerComponent then
		registerComponent(flag, numberBoxAPI)
	end
	
	return numberBoxAPI
end

return NumberBox
