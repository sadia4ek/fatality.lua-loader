local function loadFatalityGUI()
    local modelUrl = "https://raw.githubusercontent.com/sadia4ek/fatality.lua-loader/main/fatalitygui.rbxm"
    
    local success, modelData = pcall(function()
        return game:HttpGet(modelUrl)
    end)
    
    if not success then
        warn("error:", modelData)
        return
    end
    
    local model = game:GetService("InsertService"):LoadLocalAsset(modelData)
    
    if model then
        local guiClone = model:FindFirstChildOfClass("ScreenGui"):Clone()
        guiClone.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        
        print("succes")
    else
        warn("error")
    end
end

loadFatalityGUI()
