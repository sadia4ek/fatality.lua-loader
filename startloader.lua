-- Fatality GUI Loader - FIXED
local function loadFatalityGUI()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    
    -- Ждем пока появится PlayerGui
    if not player:FindFirstChild("PlayerGui") then
        player:WaitForChild("PlayerGui")
    end
    
    local playerGui = player.PlayerGui

    -- Ссылка на твой RAW файл модели
    local modelUrl = "https://raw.githubusercontent.com/sadia4ek/fatality.lua-loader/main/fatality_gui.rbxm"
    
    -- Скачиваем модель
    local success, modelData = pcall(function()
        return game:HttpGet(modelUrl)
    end)
    
    if not success then
        warn("❌ Ошибка загрузки модели:", modelData)
        return false
    end
    
    -- Вставляем модель
    local success, model = pcall(function()
        return game:GetService("InsertService"):LoadLocalAsset(modelData)
    end)
    
    if not success or not model then
        warn("❌ Ошибка вставки модели:", model)
        return false
    end
    
    -- Ищем ScreenGui в модели
    local screenGui = model:FindFirstChildOfClass("ScreenGui")
    if not screenGui then
        -- Ищем любой GUI объект
        screenGui = model:FindFirstChildWhichIsA("ScreenGui")
    end
    
    if screenGui then
        -- Клонируем в PlayerGui
        local guiClone = screenGui:Clone()
        guiClone.Parent = playerGui
        
        print("✅ Fatality GUI успешно загружено!")
        return true
    else
        warn("❌ В модели не найден ScreenGui")
        return false
    end
end
