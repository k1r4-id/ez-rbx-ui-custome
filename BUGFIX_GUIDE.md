# EzUI Bug Fixes Guide

## Bug 1: SelectBox Stuck on "Loading..." - SOLVED ✅

### Problem
SelectBox shows "Loading..." and never updates options when using `coroutine.wrap()()` pattern.

### Root Cause
When using `coroutine.wrap(function() ... end)()`, if the function yields (async call), the coroutine pauses and never resumes automatically. This means `updateOptions()` callback is never called.

### ❌ INCORRECT Pattern (Causes Bug)
```lua
tab:AddSelectBox({
    Name = "Pet Team",
    Options = {"Loading..."},
    OnInit = function(api, optionsData)
        coroutine.wrap(function()  -- ❌ WRONG!
            local data = GetDataFromServer()  -- This might yield
            local options = ProcessData(data)
            optionsData.updateOptions(options)  -- Never reached if yielded!
        end)()
    end,
    OnDropdownOpen = function(currentOptions, updateOptions)
        local data = GetDataFromServer()  -- If this yields, updateOptions never called
        updateOptions(data)
    end
})
```

### ✅ CORRECT Pattern (Fixed)
```lua
tab:AddSelectBox({
    Name = "Pet Team",
    Options = {"Loading..."},
    OnInit = function(api, optionsData)
        task.spawn(function()  -- ✅ CORRECT!
            local data = GetDataFromServer()
            local options = ProcessData(data)
            optionsData.updateOptions(options)
        end)
    end,
    OnDropdownOpen = function(currentOptions, updateOptions)
        task.spawn(function()  -- ✅ Use task.spawn for async
            local data = GetDataFromServer()
            updateOptions(data)
        end)
    end
})
```

### Alternative Pattern (Synchronous Data)
If your data is already available (no async calls), you can call directly:
```lua
tab:AddSelectBox({
    Name = "Pet Team",
    Options = {"Loading..."},
    OnInit = function(api, optionsData)
        -- Direct call if data is synchronous
        local options = GetLocalData()
        optionsData.updateOptions(options)
    end,
    OnDropdownOpen = function(currentOptions, updateOptions)
        local freshData = GetLocalData()
        updateOptions(freshData)
    end
})
```

### Key Points
- Use `task.spawn()` for async operations
- Never use `coroutine.wrap()()` for callbacks that need to complete
- `OnInit` runs immediately after component creation
- `OnDropdownOpen` runs every time dropdown opens (good for live data)

---

## Bug 2: Button Spacing Too Cramped - SOLVED ✅

### Problem
Buttons appeared too cramped with only 1px gap between them.

### Root Cause
- Button height: 34px
- Y increment: 35px
- Gap: 35 - 34 = 1px (too tight!)

### Fix Applied
Changed button height from 34px to 30px in `/components/button.lua`:
- Button height: 30px
- Y increment: 35px (unchanged)
- Gap: 35 - 30 = 5px (comfortable spacing! ✅)

### Before & After
```lua
// Before (TOO CRAMPED)
button.Size = UDim2.new(0, 120, 0, 34)  // 34px height = 1px gap

// After (COMFORTABLE)
button.Size = UDim2.new(0, 120, 0, 30)  // 30px height = 5px gap
```

This matches the original creator's design specifications.

---

## How to Apply Fixes

### For SelectBox Loading Bug:
1. Open your script files (e.g., `shop/ui.lua`, `inventory/ui.lua`, etc.)
2. Find all `OnInit` and `OnDropdownOpen` callbacks
3. Replace `coroutine.wrap(function() ... end)()` with `task.spawn(function() ... end)`

### For Button Spacing:
No changes needed in your scripts - the fix is in the library component itself!

---

## Testing Your Fixes

### Test SelectBox:
1. Open dropdown
2. Verify options load correctly (not stuck on "Loading...")
3. Check that data refreshes when reopening dropdown

### Test Button Spacing:
1. Look at any tab with multiple buttons (like "Test Notification")
2. Verify there's comfortable spacing between buttons (5px gap)
3. Buttons should not feel cramped ("mepet")

---

Generated: 2025-12-16
Library Version: EzUI v2.0.0
