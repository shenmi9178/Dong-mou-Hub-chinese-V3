local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Confirmed = false

WindUI:Popup({
    Title = "DM脚本V2",
    IconThemed = true,
    Content = "欢迎尊贵的用户" .. game.Players.LocalPlayer.Name .. "使用DM脚本 当前版本型号:V2",
    Buttons = {
        {
            Title = "取消",
            Callback = function() end,
            Variant = "Secondary",
        },
        {
            Title = "执行",
            Icon = "arrow-right",
            Callback = function() 
                Confirmed = true
                createUI()
            end,
            Variant = "Primary",
        }
    }
})
function createUI()
    local Window = WindUI:CreateWindow({
        Title = "DMV2脚本",
        Icon = "palette",
    Author = "尊贵的"..game.Players.localPlayer.Name.."欢迎使用DM脚本", 
        Folder = "Premium",
        Size = UDim2.fromOffset(550, 320),
        Theme = "Violet",
        User = {
            Enabled = true,
            Anonymous = true,
            Callback = function()
            end
        },
        SideBarWidth = 200,
        HideSearchBar = false,  
    })

    Window:Tag({
        Title = "森林中的99夜",
        Color = Color3.fromHex("#00ffff") 
    })

    Window:EditOpenButton({
        Title = "DM脚本V2",
        Icon = "crown",
        CornerRadius = UDim.new(0, 8),
        StrokeThickness = 3,
        Color = ColorSequence.new(
            Color3.fromRGB(255, 255, 0),  
            Color3.fromRGB(255, 165, 0),  
            Color3.fromRGB(255, 0, 0),    
            Color3.fromRGB(139, 0, 0)     
        ),
        Draggable = true,
    })
    
    local Language = Window:Tab({Title = "Language Settings", Icon = "globe"})
local Translations = {
    ["Main"] = "主要",
    ["Biometrics"] = "生体",
    ["Infinite Health"] = "无限血",
    ["Infinite Stamina"] = "无限耐力",
    ["Adapt to all weapons"] = "适应所有的武器",
    ["Attack Method"] = "攻击方式",
    ["Range"] = "范围",
    ["Full Map"] = "全图",
    ["Kill Aura"] = "杀戮光环",
    ["Show Current Weapon"] = "显示当前武器",
    ["Trees"] = "树木",
    ["Chop Range [500 Best]"] = "砍树范围[500最佳]",
    ["Auto Chop Trees"] = "自动砍树",
    ["Children"] = "小孩",
    ["Auto Save All Children"] = "自动救所有小孩",
    ["Auto Equip"] = "自动装备",
    ["Auto Equip Weapons"] = "自动装备武器",
    ["Auto Equip Best Weapon"] = "自动装备最佳武器",
    ["Select Weapon to Equip"] = "选择要装备的武器",
    ["Auto Equip Selected Weapon"] = "自动装备选定武器",
    ["Tool Switching"] = "工具切换",
    ["Random Tool Switching"] = "随机工具切换",
    ["Planting"] = "种植",
    ["Planting Shape"] = "种植形状",
    ["Square"] = "正方形",
    ["Circle"] = "圆形",
    ["Original Position"] = "原地",
    ["Planting Range (meters)"] = "种植范围(米)",
    ["Planting Height"] = "种植高度",
    ["Sapling Spacing (meters)"] = "树苗间隔(米)",
    ["Planting Delay (seconds)"] = "种植延迟(秒)",
    ["Auto Planting"] = "自动种植",
    ["Fun Gameplay"] = "趣味玩法",
    ["Select Pattern"] = "选择图案",
    ["Sphere"] = "球形",
    ["Necklace"] = "项链",
    ["Meteor"] = "流星",
    ["Rotation Speed"] = "旋转速度",
    ["Pattern Size"] = "图案大小",
    ["Auto Form Pattern"] = "自动形成图案",
    ["Prank Friends"] = "恶搞朋友",
    ["Select Attack Player"] = "选择攻击玩家",
    ["None"] = "无",
    ["Auto Bear Trap Attack"] = "自动捕兽夹攻击",
    ["Hitbox"] = "打击盒",
    ["Show Hitbox"] = "显示打击盒",
    ["Wolf Hitbox"] = "狼打击盒",
    ["Bunny Hitbox"] = "兔子打击盒",
    ["Cultist Hitbox"] = "邪教徒打击盒",
    ["Everything Hitbox"] = "所有东西打击盒",
    ["Range Size"] = "范围大小",
    ["Slide to adjust"] = "滑动调整",
    ["Food"] = "食物",
    ["Collect Food"] = "收集食物",
    ["Select food to collect (multiple)"] = "选择要收集的食物（多选）",
    ["Raw Meat Chunk"] = "生肉块",
    ["Raw Steak"] = "生牛排",
    ["Cooked Meat Chunk"] = "熟肉块",
    ["Cooked Steak"] = "熟牛排",
    ["Select Position"] = "选择位置",
    ["Campfire"] = "火堆",
    ["Auto Throw Selected Food"] = "自动扔选择的食物",
    ["Remote Cooking"] = "远程烤肉",
    ["Select meats (multiple)"] = "选择肉类 (多选)",
    ["Meat Chunk"] = "肉块",
    ["Steak"] = "牛排",
    ["Remote Cook Selected Meat"] = "远程烤选择的肉",
    ["Auto Cook Food"] = "自动烹饪食物",
    ["Select Cooking Food"] = "选择烹饪食物",
    ["Ribs"] = "肋骨",
    ["Salmon"] = "三文鱼",
    ["Mackerel"] = "鲭鱼",
    ["Auto Cook Food"] = "自动烹饪食物",
    ["Eat Food"] = "吃食物",
    ["Select Food"] = "选择食物",
    ["Select food to auto eat"] = "选择要自动食用的食物",
    ["Hunger Threshold"] = "饥饿阈值",
    ["Auto Feed"] = "自动进食",
    ["Safety"] = "防鹿",
    ["Auto Stun Deer"] = "自动眩晕鹿",
    ["Requires flashlight"] = "需要手电筒",
    ["Fishing"] = "钓鱼",
    ["Auto Fishing"] = "自动钓鱼",
    ["No Delay Fishing"] = "无延迟钓鱼",
    ["Instant Fishing"] = "秒钓鱼",
    ["Workbench"] = "工作台",
    ["Steel"] = "钢材",
    ["Select steel items to collect (multiple)"] = "选择要收集的钢铁类物品（多选）",
    ["Bolt"] = "螺栓",
    ["Broken Fan"] = "破风扇",
    ["Broken Microwave"] = "坏微波炉",
    ["Old Radio"] = "旧收音机",
    ["Washing Machine"] = "洗衣机",
    ["Old Car Engine"] = "旧汽车引擎",
    ["Tire"] = "轮胎",
    ["Sheet Metal"] = "金属板",
    ["Workbench"] = "工作台",
    ["Auto Throw Selected Steel"] = "自动扔选择的钢铁",
    ["Auto Upgrade Workbench"] = "自动升级工作台",
    ["Auto Craft"] = "自动制作",
    ["Craft Item Name"] = "制作物品名称",
    ["Enter item name to craft"] = "输入要制作的物品名称",
    ["Craft Interval (seconds)"] = "制作间隔(秒)",
    ["Set crafting interval time"] = "设置每次制作的间隔时间",
    ["Craft Once"] = "制作一次",
    ["Auto Craft"] = "自动制作",
    ["Chest Functions"] = "宝箱功能",
    ["Auto Open All Chests"] = "自动开全部宝箱",
    ["Chest Aura"] = "宝箱光环",
    ["Chest Aura Range"] = "宝箱光环范围",
    ["Teleport to Nearest Chest"] = "传送到最近宝箱",
    
    ["Campfire"] = "火堆",
    ["Fuel Items"] = "燃料类",
    ["Select items to collect (multiple)"] = "选择要收集的物品（多选）",
    ["Wood"] = "木头",
    ["Coal"] = "煤",
    ["Fuel Canister"] = "油桶",
    ["Chair"] = "椅子",
    ["Biofuel"] = "生物燃料",
    ["Auto Throw Selected Fuel"] = "自动扔选择的燃料",
    ["Teleport Back to Campfire"] = "传送回火旁",
    
    ["Teleport Functions"] = "传送功能",
    ["Basic Teleport Points"] = "基础传送点",
    ["Teleport to Campfire"] = "传送到营火",
    ["Teleport to Stronghold"] = "传送到要塞",
    ["Teleport to Safe Zone"] = "传送到安全区",
    ["Teleport to Merchant"] = "传送到商人",
    ["Teleport to Random Tree"] = "传送到随机树",
    ["Chest Teleport"] = "宝箱传送",
    ["Select Chest"] = "选择宝箱",
    ["Refresh Chest List"] = "刷新宝箱列表",
    ["Teleport to Chest"] = "传送到宝箱",
    ["Child Teleport"] = "儿童传送",
    ["Select Child"] = "选择儿童",
    ["Refresh Child List"] = "刷新儿童列表",
    ["Teleport to Child"] = "传送到儿童",
    
  
    ["Bring"] = "带来",
    ["Auto Teleport Items"] = "自动传送物品",
    ["Auto Teleport Wood"] = "自动传送木头",
    ["Auto Teleport Fuel Canisters"] = "自动传送燃料罐",
    ["Auto Teleport Oil Barrels"] = "自动传送油桶",
    ["Auto Teleport All Scrap"] = "自动传送所有废料",
    ["Auto Teleport Coal"] = "自动传送煤炭",
    ["Auto Teleport Meat"] = "自动传送肉类",
    
    ["Collection"] = "收集",
    ["Select items to collect (multiple)"] = "选择要收集的物品（多选）",
    ["Auto Collect Selected Items"] = "自动收集选择的物品",
    ["Player Functions"] = "玩家功能",
    ["Speed (On/Off)"] = "速度 (开/关)",
    ["Speed Settings"] = "速度设置",
    ["Invisibility"] = "隐身",
    ["Instant Interaction"] = "秒互动",
    ["Infinite Jump"] = "无限跳",
    ["Language Settings"] = "语言设置",
    ["Current Language"] = "当前语言",
    ["Chinese"] = "中文",
    ["English"] = "英文",
    ["Apply Language"] = "应用语言",
    ["Restart script to take effect"] = "重启脚本生效"
}
local currentLanguage = "中文"
local languageChanged = false
Language:Dropdown({
    Title = "Current Language",
    Values = {"English", "中文"},
    Value = "English",
    Callback = function(option)
        if option == "中文" then
            currentLanguage = "Chinese"
        else
            currentLanguage = "English"
        end
        languageChanged = true
    end
})
Language:Button({
    Title = "Apply Language",
    Callback = function()
        if languageChanged then
            WindUI:Notify({
                Title = "Language Change",
                Content = "Please restart the script for changes to take effect",
                Duration = 5,
                Icon = "info"
            })
            languageChanged = false
        else
            WindUI:Notify({
                Title = "Language",
                Content = "Language is already set to " .. currentLanguage,
                Duration = 3,
                Icon = "info"
            })
        end
    end
})
local function translateText(text)
    if not text or type(text) ~= "string" then return text end
    
    if currentLanguage == "Chinese" then
        return Translations[text] or text
    else
        for en, cn in pairs(Translations) do
            if text == cn then
                return en
            end
        end
        return text
    end
end
local function translateGUI(gui)
    if (gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox")) then
        pcall(function()
            local text = gui.Text
            if text and text ~= "" then
                local translatedText = translateText(text)
                if translatedText ~= text then
                    gui.Text = translatedText
                end
            end
        end)
    end
end
local function scanAndTranslate()
    for _, gui in ipairs(game:GetService("CoreGui"):GetDescendants()) do
        translateGUI(gui)
    end
    local player = game:GetService("Players").LocalPlayer
    if player and player:FindFirstChild("PlayerGui") then
        for _, gui in ipairs(player.PlayerGui:GetDescendants()) do
            translateGUI(gui)
        end
    end
end
local function setupDescendantListener(parent)
    parent.DescendantAdded:Connect(function(descendant)
        if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
            task.wait(0.1)
            translateGUI(descendant)
        end
    end)
end
local function setupTranslationEngine()
    pcall(setupDescendantListener, game:GetService("CoreGui"))
    local player = game:GetService("Players").LocalPlayer
    if player and player:FindFirstChild("PlayerGui") then
        pcall(setupDescendantListener, player.PlayerGui)
    end
    scanAndTranslate()
    while true do
        scanAndTranslate()
        task.wait(3)
    end
end
task.spawn(function()
    task.wait(2)
    setupTranslationEngine()
end)
    
local Main = Window:Tab({Title = "主要", Icon = "user"})
Main:Section({Title = "生体"})

Main:Button({
    Title = "无限血",
    Callback = function()
        local args = {
    [1] = -math.huge  
}

game:GetService("ReplicatedStorage").RemoteEvents.DamagePlayer:FireServer(unpack(args))
    end
})

Main:Button({
    Title = "无限耐力",
    Callback = function()
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
            hum.WalkSpeed = 20
        end)
        hum.WalkSpeed = 20
    end
    end
})

Main:Section({Title = "适应所有的武器"})
local killAuraEnabled = false
local attackMethod = "范围" 

Main:Dropdown({
    Title = "攻击方式",
    Values = {"范围", "全图"},
    Value = "范围",
    Callback = function(option)
        attackMethod = option
    end
})

Main:Toggle({
    Title = "杀戮光环",
    Value = false,
    Callback = function(value)
        killAuraEnabled = value
        if value then
            spawn(function()
                while killAuraEnabled do
                    local currentTool = nil
                    
              
                    if game.Players.LocalPlayer.Character then
                        for _, item in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                            if item:IsA("Tool") then
                                currentTool = item
                                break
                            end
                        end
                        
                        if not currentTool and game.Players.LocalPlayer.Character:FindFirstChild("ToolHandle") then
                            local toolHandle = game.Players.LocalPlayer.Character.ToolHandle
                            if toolHandle:FindFirstChild("OriginalItem") and toolHandle.OriginalItem.Value then
                                currentTool = toolHandle.OriginalItem.Value
                            end
                        end
                    end
                    
                    if not currentTool then
                        for _, item in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if item:IsA("Tool") then
                                currentTool = item
                                break
                            end
                        end
                    end
                    
                
                    if currentTool then
                        for _, enemy in next, workspace.Characters:GetChildren() do
                            if enemy:IsA("Model") and enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("HitRegisters") then
                                if enemy ~= game.Players.LocalPlayer.Character then
                                    local shouldAttack = false
                                    
                                    if attackMethod == "范围" then
                                   
                                        local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - enemy.HumanoidRootPart.Position).Magnitude
                                        if distance <= 35 then
                                            shouldAttack = true
                                        end
                                    else
                                   
                                        shouldAttack = true
                                    end
                                    
                                    if shouldAttack then
                                        pcall(function()
                                            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("ToolDamageObject"):InvokeServer(
                                                enemy, 
                                                currentTool, 
                                                true, 
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                            )
                                        end)
                                    end
                                end
                            end
                        end
                    end
                    
                    wait(0)
                end
            end)
        end
    end
})

local function ShowCurrentWeapon()
    local currentTool = nil
    local toolName = "无"
    
   
    if game.Players.LocalPlayer.Character then
        for _, item in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if item:IsA("Tool") then
                currentTool = item
                break
            end
        end
        
       
        if not currentTool and game.Players.LocalPlayer.Character:FindFirstChild("ToolHandle") then
            local toolHandle = game.Players.LocalPlayer.Character.ToolHandle
            if toolHandle:FindFirstChild("OriginalItem") and toolHandle.OriginalItem.Value then
                currentTool = toolHandle.OriginalItem.Value
            end
        end
    end
    
    
    if not currentTool then
        for _, item in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if item:IsA("Tool") then
                currentTool = item
                break
            end
        end
    end
    
    
    if currentTool then
        toolName = currentTool.Name
    end
    
    WindUI:Notify({
        Title = "在森林中的99夜",
        Content = "当前武器: " .. toolName,
        Duration = 5,
    })
    
    return currentTool
end
Main:Button({
    Title = "显示当前武器",
    Callback = function()
        ShowCurrentWeapon()
    end
})

Main:Section({Title = "树木"})

local DefaultChopTreeDistance = 500
local DefaultKillAuraDistance = 20
if not DistanceForAutoChopTree then
    DistanceForAutoChopTree = DefaultChopTreeDistance
end
if not DistanceForKillAura then
    DistanceForKillAura = DefaultKillAuraDistance
end

Main:Input({
    Title = "砍树范围[500最佳]",
    Value = tostring(DefaultChopTreeDistance),
    Callback = function(value)
        local numValue = tonumber(value)
        if numValue then
            DistanceForAutoChopTree = numValue
        else
            warn("请输入有效的数字！")
        end
    end
})

Main:Toggle({
    Title = "自动砍树",
    Description = "",
    Default = false,
    Callback = function(Value)
        ActiveAutoChopTree = Value
        task.spawn(function()
            while ActiveAutoChopTree do
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local hrp = character:WaitForChild("HumanoidRootPart")
                
               
                local weapon = nil
                for _, item in pairs(player.Inventory:GetChildren()) do
                    if item:IsA("Tool") then
                        weapon = item
                        break
                    end
                end
                
           
                if not weapon then
                    weapon = (player.Inventory:FindFirstChild("Old Axe") or player.Inventory:FindFirstChild("Good Axe") or player.Inventory:FindFirstChild("Strong Axe") or player.Inventory:FindFirstChild("Chainsaw"))
                end

                task.spawn(function()
                    for _, tree in pairs(workspace.Map.Foliage:GetChildren()) do
                        if tree:IsA("Model") and (tree.Name == "Small Tree" or tree.Name == "TreeBig1" or tree.Name == "TreeBig2") and tree.PrimaryPart then
                            local distance = (tree.PrimaryPart.Position - hrp.Position).Magnitude
                            if distance <= DistanceForAutoChopTree and weapon then
                                game:GetService("ReplicatedStorage").RemoteEvents.ToolDamageObject:InvokeServer(tree, weapon, 999, hrp.CFrame)
                            end
                        end
                    end
                end)
                
                task.spawn(function()
                    for _, tree in pairs(workspace.Map.Landmarks:GetChildren()) do
                        if tree:IsA("Model") and (tree.Name == "Small Tree" or tree.Name == "TreeBig1" or tree.Name == "TreeBig2") and tree.PrimaryPart then
                            local distance = (tree.PrimaryPart.Position - hrp.Position).Magnitude
                            if distance <= DistanceForAutoChopTree and weapon then
                                game:GetService("ReplicatedStorage").RemoteEvents.ToolDamageObject:InvokeServer(tree, weapon, 999, hrp.CFrame)
                            end
                        end
                    end
                end)
                
                task.wait(0.1)
            end
        end)
    end
})
Main:Section({Title = "小孩"})

local LocalPlayer = game:GetService("Players").LocalPlayer

local originalPositions = {}
local teleportingEnabled = false
local teleportationThread = nil

Main:Toggle({
    Title = "自动救所有小孩",
    Value = false,
    Callback = function(value)
        teleportingEnabled = value
        
        if value then
          
            for _, kid in pairs(workspace:GetDescendants()) do
                if kid:IsA("Model") and kid.Name:lower():find("kid") then
                    originalPositions[kid] = kid:GetPivot()
                end
            end
            
            
            teleportationThread = task.spawn(function()
                while teleportingEnabled and task.wait(1) do
                    for _, kid in pairs(workspace:GetDescendants()) do
                        if not teleportingEnabled then break end
                        
                        if kid:IsA("Model") and kid.Name:lower():find("kid") then
                            LocalPlayer.Character:PivotTo(kid:GetPivot())
                            task.wait(20) 
                        end
                    end
                end
            end)
        else
         
            if teleportationThread then
                task.cancel(teleportationThread)
                teleportationThread = nil
            end
        end
    end
})



local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local AutoEquip = Window:Tab({Title = "自动装备", Icon = "user"})

local toolsDamageIDs = {
    ["Old Axe"] = "3_7367831688",
    ["Good Axe"] = "112_7367831688",
    ["Strong Axe"] = "116_7367831688",
    ["Chainsaw"] = "647_8992824875",
    ["Infernal Sword"] = "2_4340578793",
    ["Spear"] = "196_8999010016"
}

local function getAnyToolWithDamageID(isChopAura)
    for toolName, damageID in pairs(toolsDamageIDs) do
        if isChopAura and toolName ~= "Old Axe" and toolName ~= "Good Axe" and toolName ~= "Strong Axe" then
            continue
        end
        local tool = LocalPlayer:FindFirstChild("Inventory") and LocalPlayer.Inventory:FindFirstChild(toolName)
        if tool then
            return tool, damageID
        end
    end
    return nil, nil
end
local function equipTool(tool)
    if tool then
        ReplicatedStorage:WaitForChild("RemoteEvents").EquipItemHandle:FireServer("FireAllClients", tool)
    end
end

local function unequipTool(tool)
    if tool then
        ReplicatedStorage:WaitForChild("RemoteEvents").UnequipItemHandle:FireServer("FireAllClients", tool)
    end
end

AutoEquip:Section({ Title = "自动装备武器", Icon = "user" })

local autoEquipWeapon = false
local weaponEquipConnection

AutoEquip:Toggle({
    Title = "自动装备最佳武器",
    Value = false,
    Callback = function(state)
        autoEquipWeapon = state
        if weaponEquipConnection then
            weaponEquipConnection:Disconnect()
            weaponEquipConnection = nil
        end
        
        if state then
            weaponEquipConnection = RunService.Heartbeat:Connect(function()
                local character = LocalPlayer.Character
                if not character then return end
                
             
                local bestTool = nil
                local bestDamage = 0
                
                for toolName, damageID in pairs(toolsDamageIDs) do
                    local tool = LocalPlayer:FindFirstChild("Inventory") and LocalPlayer.Inventory:FindFirstChild(toolName)
                    if tool then
                   
                        local damage = tonumber(damageID:match("^(%d+)_")) or 0
                        if damage > bestDamage then
                            bestDamage = damage
                            bestTool = tool
                        end
                    end
                end
                
              
                if bestTool then
                    equipTool(bestTool)
                end
            end)
        else
           
            local tool, _ = getAnyToolWithDamageID(false)
            unequipTool(tool)
        end
    end
})

local selectedWeapon = "Strong Axe"

AutoEquip:Dropdown({
    Title = "选择要装备的武器",
    Values = {"Old Axe", "Good Axe", "Strong Axe", "Chainsaw", "Infernal Sword", "Spear"},
    Value = "Strong Axe",
    Callback = function(option)
        selectedWeapon = option
    end
})

local autoEquipSpecific = false
local specificEquipConnection

AutoEquip:Toggle({
    Title = "自动装备选定武器",
    Value = false,
    Callback = function(state)
        autoEquipSpecific = state
        if specificEquipConnection then
            specificEquipConnection:Disconnect()
            specificEquipConnection = nil
        end
        
        if state then
            specificEquipConnection = RunService.Heartbeat:Connect(function()
                local character = LocalPlayer.Character
                if not character then return end
                
                local tool = LocalPlayer:FindFirstChild("Inventory") and LocalPlayer.Inventory:FindFirstChild(selectedWeapon)
                if tool then
                    equipTool(tool)
                else
                    WindUI:Notify({
                        Title = "武器未找到",
                        Content = selectedWeapon .. " 不在背包中",
                        Duration = 3,
                        Icon = "alert-circle"
                    })
                    autoEquipSpecific = false
                    AutoEquip:Find("自动装备选定武器"):SetValue(false)
                end
            end)
        else
            local tool = LocalPlayer:FindFirstChild("Inventory") and LocalPlayer.Inventory:FindFirstChild(selectedWeapon)
            unequipTool(tool)
        end
    end
})
AutoEquip:Section({ Title = "工具切换", Icon = "refresh-cw" })

local autoToolSwitch = false
local toolSwitchConnection

AutoEquip:Toggle({
    Title = "随机工具切换",
    Value = false,
    Callback = function(state)
        autoToolSwitch = state
        if toolSwitchConnection then
            toolSwitchConnection:Disconnect()
            toolSwitchConnection = nil
        end
        
        if state then
            toolSwitchConnection = RunService.Heartbeat:Connect(function()
                local character = LocalPlayer.Character
                if not character then return end
                
                local hrp = character:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                
              
                local hasEnemyNearby = false
                for _, mob in ipairs(Workspace.Characters:GetChildren()) do
                    if mob:IsA("Model") then
                        local part = mob:FindFirstChildWhichIsA("BasePart")
                        if part and (part.Position - hrp.Position).Magnitude <= 50 then
                            hasEnemyNearby = true
                            break
                        end
                    end
                end
                
             
                local hasTreeNearby = false
                local map = Workspace:FindFirstChild("Map")
                if map then
                    local trees = {}
                    if map:FindFirstChild("Foliage") then
                        for _, obj in ipairs(map.Foliage:GetChildren()) do
                            if obj:IsA("Model") and (obj.Name == "Small Tree" or obj.Name == "Snowy Small Tree") then
                                table.insert(trees, obj)
                            end
                        end
                    end
                    if map:FindFirstChild("Landmarks") then
                        for _, obj in ipairs(map.Landmarks:GetChildren()) do
                            if obj:IsA("Model") and obj.Name == "Small Tree" then
                                table.insert(trees, obj)
                            end
                        end
                    end
                    
                    for _, tree in ipairs(trees) do
                        local trunk = tree:FindFirstChild("Trunk")
                        if trunk and trunk:IsA("BasePart") and (trunk.Position - hrp.Position).Magnitude <= 50 then
                            hasTreeNearby = true
                            break
                        end
                    end
                end
                
            
                if hasEnemyNearby then
                   
                    local combatTools = {"Infernal Sword", "Spear", "Chainsaw", "Strong Axe", "Good Axe"}
                    for _, toolName in ipairs(combatTools) do
                        local tool = LocalPlayer:FindFirstChild("Inventory") and LocalPlayer.Inventory:FindFirstChild(toolName)
                        if tool then
                            equipTool(tool)
                            break
                        end
                    end
                elseif hasTreeNearby then
                
                    local loggingTools = {"Chainsaw", "Strong Axe", "Good Axe", "Old Axe"}
                    for _, toolName in ipairs(loggingTools) do
                        local tool = LocalPlayer:FindFirstChild("Inventory") and LocalPlayer.Inventory:FindFirstChild(toolName)
                        if tool then
                            equipTool(tool)
                            break
                        end
                    end
                else
                  
                    local bestTool = nil
                    local bestDamage = 0
                    
                    for toolName, damageID in pairs(toolsDamageIDs) do
                        local tool = LocalPlayer:FindFirstChild("Inventory") and LocalPlayer.Inventory:FindFirstChild(toolName)
                        if tool then
                            local damage = tonumber(damageID:match("^(%d+)_")) or 0
                            if damage > bestDamage then
                                bestDamage = damage
                                bestTool = tool
                            end
                        end
                    end
                    
                    if bestTool then
                        equipTool(bestTool)
                    end
                end
            end)
        else
          
            local tool, _ = getAnyToolWithDamageID(false)
            unequipTool(tool)
        end
    end
})

local Main = Window:Tab({Title = "种植", Icon = "user"})

local plantingConfig = {
    shape = "square",  
    size = 80,        
    height = 3,     
    spacing = 1,       
    delay = 1          
}

local shapeOptions = {
    ["正方形"] = "square",
    ["圆形"] = "circle",
    ["原地"] = "original"
}
local function generatePlantPositions()
    local positions = {}
    local halfSize = plantingConfig.size / 2
    local playerPosition = Vector3.new(0.6491832137107849, plantingConfig.height, -3.8000376224517822)
    
    if plantingConfig.shape == "square" then
     
        positions = {}
        
       
        
        for x = -halfSize, halfSize, plantingConfig.spacing do
            table.insert(positions, Vector3.new(playerPosition.X + x, playerPosition.Y, playerPosition.Z + halfSize))
        end
        
      
        for z = halfSize, -halfSize, -plantingConfig.spacing do
            table.insert(positions, Vector3.new(playerPosition.X + halfSize, playerPosition.Y, playerPosition.Z + z))
        end
        
        
        for x = halfSize, -halfSize, -plantingConfig.spacing do
            table.insert(positions, Vector3.new(playerPosition.X + x, playerPosition.Y, playerPosition.Z - halfSize))
        end
        
  
        for z = -halfSize, halfSize, plantingConfig.spacing do
            table.insert(positions, Vector3.new(playerPosition.X - halfSize, playerPosition.Y, playerPosition.Z + z))
        end
    elseif plantingConfig.shape == "circle" then
       
        positions = {}
        
    
        local radius = halfSize
        local circumference = 2 * math.pi * radius
        local pointCount = math.floor(circumference / plantingConfig.spacing)
        
        for i = 1, pointCount do
            local angle = (i / pointCount) * 2 * math.pi
            local x = radius * math.cos(angle)
            local z = radius * math.sin(angle)
            table.insert(positions, Vector3.new(playerPosition.X + x, playerPosition.Y, playerPosition.Z + z))
        end
    else
     
        positions = {}
        
      
        table.insert(positions, Vector3.new(playerPosition.X, playerPosition.Y, playerPosition.Z))
    end
    
    return positions
end

local saplingPositions = generatePlantPositions()
local currentSaplingIndex = 1
local isPlanting = false

local function plantSapling()
    if isPlanting then return false end
    isPlanting = true
    
    local success = false
    local remoteEvents = game:GetService("ReplicatedStorage").RemoteEvents
    local tempStorage = game:GetService("ReplicatedStorage").TempStorage
    
    local sapling = tempStorage:FindFirstChild("Sapling")
    if not sapling then
        sapling = workspace.Items:FindFirstChild("Sapling")
    end
    
    if sapling then
        local plantPosition = saplingPositions[currentSaplingIndex]
        
        pcall(function()
            remoteEvents.StopDraggingItem:FireServer(sapling)
            task.wait(0.1)
            remoteEvents.RequestPlantItem:InvokeServer(sapling, plantPosition)
            success = true
        end)
        
        currentSaplingIndex = currentSaplingIndex + 1
        if currentSaplingIndex > #saplingPositions then
            currentSaplingIndex = 1
        end
    end
    
    isPlanting = false
    return success
end

Main:Dropdown({
    Title = "种植形状",
    Values = {"正方形", "圆形", "原地"},
    Value = "正方形",
    Callback = function(option)
        plantingConfig.shape = shapeOptions[option]
        saplingPositions = generatePlantPositions()
        currentSaplingIndex = 1
    end
})

Main:Input({
    Title = "种植范围(米)",
    Desc = "设置种植范围大小",
    Value = tostring(plantingConfig.size),
    Placeholder = "输入范围大小",
    Callback = function(input)
        local num = tonumber(input)
        if num and num > 0 then
            plantingConfig.size = num
            saplingPositions = generatePlantPositions()
            currentSaplingIndex = 1
        end
    end
})

Main:Input({
    Title = "种植高度",
    Desc = "设置种植高度",
    Value = tostring(plantingConfig.height),
    Placeholder = "输入高度",
    Callback = function(input)
        local num = tonumber(input)
        if num then
            plantingConfig.height = num
            saplingPositions = generatePlantPositions()
            currentSaplingIndex = 1
        end
    end
})

Main:Input({
    Title = "树苗间隔(米)",
    Desc = "设置树苗之间的间隔[推荐2.5]",
    Value = tostring(plantingConfig.spacing),
    Placeholder = "输入间隔距离",
    Callback = function(input)
        local num = tonumber(input)
        if num and num > 0 then
            plantingConfig.spacing = num
            saplingPositions = generatePlantPositions()
            currentSaplingIndex = 1
        end
    end
})

Main:Input({
    Title = "种植延迟(秒)",
    Desc = "设置每次种植的延迟时间",
    Value = tostring(plantingConfig.delay),
    Placeholder = "输入延迟时间",
    Callback = function(input)
        local num = tonumber(input)
        if num and num > 0 then
            plantingConfig.delay = num
        end
    end
})

local plantLoop = nil

Main:Toggle({
    Title = "自动种植",
    Default = false,
    Callback = function(state)
        if plantLoop then
            plantLoop:Disconnect()
            plantLoop = nil
        end
        
        if state then
            plantLoop = game:GetService("RunService").Heartbeat:Connect(function()
                local planted = plantSapling()
                if not planted then
                    task.wait(1)
                else
                    task.wait(plantingConfig.delay)
                end
            end)
        end
    end
})

local Main = Window:Tab({Title = "趣味玩法", Icon = "user"})
local teleportConfig = {
    pattern = "sphere",  
    speed = 5,        
    radius = 75,       
    height = 100       
}

local patternOptions = {
    ["球形"] = "sphere",
    ["项链"] = "star",
    ["流星"] = "meteor"
}

local centerPosition = Vector3.new(0.6491832137107849, teleportConfig.height, -3.8000376224517822)
local rotationAngle = 0
local teleporting = false
local function generatePatternPositions(itemCount)
    local positions = {}
    rotationAngle = rotationAngle + teleportConfig.speed * 0.01
    
    if teleportConfig.pattern == "sphere" then
      
        for i = 1, itemCount do
            local phi = math.acos(-1 + (2 * i - 1) / itemCount)
            local theta = math.sqrt(itemCount * math.pi) * phi
            
            local x = teleportConfig.radius * math.cos(theta + rotationAngle) * math.sin(phi)
            local y = teleportConfig.radius * math.sin(theta + rotationAngle) * math.sin(phi)
            local z = teleportConfig.radius * math.cos(phi)
            
            table.insert(positions, centerPosition + Vector3.new(x, y, z))
        end
    elseif teleportConfig.pattern == "star" then
       
        local points = 5
        for i = 1, itemCount do
            local angle = (i / itemCount) * math.pi * 2 * points + rotationAngle
            local radius = teleportConfig.radius * (i % 2 == 0 and 0.5 or 1)
            
            local x = radius * math.cos(angle)
            local z = radius * math.sin(angle)
            
            table.insert(positions, centerPosition + Vector3.new(x, 0, z))
        end
    elseif teleportConfig.pattern == "meteor" then
       
        for i = 1, itemCount do
            local angle = (i / itemCount) * math.pi * 2 + rotationAngle
            local x = teleportConfig.radius * math.cos(angle)
            local z = teleportConfig.radius * math.sin(angle)
            local y = teleportConfig.radius * 0.5 * math.sin(angle * 2)
            
            table.insert(positions, centerPosition + Vector3.new(x, y, z))
        end
    end
    
    return positions
end

local function teleportLogs()
    if teleporting then return end
    teleporting = true
    
    local logs = {}
    for _, item in pairs(workspace.Items:GetChildren()) do
        if item.Name:lower():find("log") and item:IsA("Model") then
            table.insert(logs, item)
        end
    end
    
    if #logs > 0 then
        local positions = generatePatternPositions(#logs)
        
        for i, log in ipairs(logs) do
            local main = log:FindFirstChildWhichIsA("BasePart")
            if main then
                local targetPos = positions[i] or positions[1]
                main.CFrame = CFrame.new(targetPos)
                main.AssemblyLinearVelocity = Vector3.new(0, 0, 0)  
            end
        end
    end
    
    teleporting = false
end

Main:Dropdown({
    Title = "选择图案",
    Values = {"球形", "项链", "流星"},
    Value = "球形",
    Callback = function(option)
        teleportConfig.pattern = patternOptions[option]
    end
})

Main:Input({
    Title = "旋转速度",
    Desc = "设置旋转速度",
    Value = tostring(teleportConfig.speed),
    Placeholder = "输入旋转速度",
    Callback = function(input)
        local num = tonumber(input)
        if num and num >= 1 and num <= 10 then
            teleportConfig.speed = num
        end
    end
})

Main:Input({
    Title = "图案大小",
    Desc = "设置图案大小",
    Value = tostring(teleportConfig.radius),
    Placeholder = "输入图案大小",
    Callback = function(input)
        local num = tonumber(input)
        if num and num >= 10 and num <= 50 then
            teleportConfig.radius = num
        end
    end
})

local teleportLoop = nil

Main:Toggle({
    Title = "自动形成图案",
    Default = false,
    Callback = function(state)
        if teleportLoop then
            teleportLoop:Disconnect()
            teleportLoop = nil
        end
        
        if state then
            teleportLoop = game:GetService("RunService").Heartbeat:Connect(function()
                teleportLogs()
            end)
        end
    end
})

local Main = Window:Tab({Title = "恶搞朋友", Icon = "user"})
local autoUseBearTrap = false
local selectedTrapPlayer = "无"
local trapPlayerList = {"无"}
local trapDropdownRef = nil

local function updateTrapPlayerList()
    local currentPlayers = game.Players:GetPlayers()
    local newPlayerList = {"无"}
    
    for _, player in ipairs(currentPlayers) do
        if player ~= game.Players.LocalPlayer then
            table.insert(newPlayerList, player.Name)
        end
    end
    
    trapPlayerList = newPlayerList
    
    if trapDropdownRef then
        trapDropdownRef:Refresh(trapPlayerList, true)
    end
    
    if selectedTrapPlayer and selectedTrapPlayer ~= "无" and not table.find(trapPlayerList, selectedTrapPlayer) then
        WindUI:Notify({
            Title = "NE提示",
            Content = "目标玩家："..selectedTrapPlayer.." 已退出服务器",
            Duration = 5,
        })
        selectedTrapPlayer = "无"
        if trapDropdownRef then
            trapDropdownRef:Set("无")
        end
    end
end

game.Players.PlayerAdded:Connect(updateTrapPlayerList)
game.Players.PlayerRemoving:Connect(function(player)
    if selectedTrapPlayer and selectedTrapPlayer ~= "无" and player.Name == selectedTrapPlayer then
        WindUI:Notify({
            Title = "NE提示",
            Content = "目标玩家："..selectedTrapPlayer.." 已退出服务器",
            Duration = 5,
        })
    end
    updateTrapPlayerList()
end)

updateTrapPlayerList()

trapDropdownRef = Main:Dropdown({
    Title = "选择攻击玩家",
    Values = trapPlayerList,
    Value = "无",
    Callback = function(option)
        selectedTrapPlayer = option
    end
})

Main:Toggle({
    Title = "自动捕兽夹攻击",
    Default = false,
    Callback = function(Value)
        autoUseBearTrap = Value
        task.spawn(function()
            while autoUseBearTrap and task.wait() do
                if selectedTrapPlayer == "无" then
                    WindUI:Notify({
                        Title = "捕提示",
                        Content = "请先选择要的玩家",
                        Duration = 3,
                    })
                    autoUseBearTrap = false
                    break
                end
                
                local targetPlayer = game.Players:FindFirstChild(selectedTrapPlayer)
                if not targetPlayer or not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    continue
                end
                
                local targetHRP = targetPlayer.Character.HumanoidRootPart
                local targetPosition = targetHRP.Position + Vector3.new(0, 1, 0)
                
                local bearTraps = {}
                
                for _, structure in pairs(workspace.Structures:GetChildren()) do
                    if structure.Name:find("Bear Trap") and structure:IsA("Model") then
                        table.insert(bearTraps, structure)
                    end
                end
                
                for _, item in pairs(workspace.Items:GetChildren()) do
                    if item.Name:find("Bear Trap") and item:IsA("Model") then
                        table.insert(bearTraps, item)
                    end
                end
                
                if workspace:FindFirstChild("Game") and workspace.Game:FindFirstChild("Entities") then
                    for _, entity in pairs(workspace.Game.Entities:GetChildren()) do
                        if entity.Name:find("Bear Trap") and entity:IsA("Model") then
                            table.insert(bearTraps, entity)
                        end
                    end
                end
                
                if #bearTraps > 0 then
                    for _, bearTrap in pairs(bearTraps) do
                        if not autoUseBearTrap then break end
                        
                        if not bearTrap.PrimaryPart then
                            for _, part in pairs(bearTrap:GetChildren()) do
                                if part:IsA("BasePart") then
                                    bearTrap.PrimaryPart = part
                                    break
                                end
                            end
                        end
                        
                        if bearTrap.PrimaryPart then
                            pcall(function()
                                local args = {[1] = bearTrap}
                                game:GetService("ReplicatedStorage").RemoteEvents.RequestStartDraggingItem:FireServer(unpack(args))
                                bearTrap:SetPrimaryPartCFrame(CFrame.new(targetPosition))
                                game:GetService("ReplicatedStorage").RemoteEvents.StopDraggingItem:FireServer(bearTrap)
                                local setArgs = {[1] = bearTrap}
                                game:GetService("ReplicatedStorage").RemoteEvents.RequestSetTrap:FireServer(unpack(setArgs))
                            end)
                        end
                    end
                end
            end
        end)
    end
})


local Hitbox = Window:Tab({Title = "打击盒", Icon = "user"})
local hitboxSettings = {
    Wolf = false,
    Bunny = false,
    Cultist = false,
    All = false,
    Show = false,
    Size = 10
}
local originalSizes = {}

local function updateHitboxForModel(model)
    local root = model:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local name = model.Name:lower()
    if not originalSizes[model] then
        originalSizes[model] = root.Size
    end

    local shouldResize = hitboxSettings.All or
        (hitboxSettings.Wolf and (name:find("wolf") or name:find("alpha"))) or
        (hitboxSettings.Bunny and name:find("bunny")) or
        (hitboxSettings.Cultist and (name:find("cultist") or name:find("cross")))

    if shouldResize and hitboxSettings.Show then
        root.Size = Vector3.new(hitboxSettings.Size, hitboxSettings.Size, hitboxSettings.Size)
        root.Transparency = 0.5
        root.Color = Color3.fromRGB(255, 255, 255)
        root.Material = Enum.Material.Neon
        root.CanCollide = false
    else
        if originalSizes[model] then
            root.Size = originalSizes[model]
        end
        root.Transparency = 1
        root.Material = Enum.Material.Plastic
        root.CanCollide = true
    end
end
workspace.DescendantRemoving:Connect(function(descendant)
    if descendant:IsA("Model") and originalSizes[descendant] then
        originalSizes[descendant] = nil
    end
end)

task.spawn(function()
    while true do
        for _, model in ipairs(workspace:GetDescendants()) do
            if model:IsA("Model") and model:FindFirstChild("HumanoidRootPart") then
                updateHitboxForModel(model)
            end
        end
        task.wait(1) 
    end
end)

Hitbox:Toggle({
    Title = "显示打击盒",
    Default = false,
    Callback = function(v)
        hitboxSettings.Show = v
    end
})

Hitbox:Toggle({
    Title = "狼打击盒",
    Default = false,
    Callback = function(v)
        hitboxSettings.Wolf = v
    end
})

Hitbox:Toggle({
    Title = "兔子打击盒",
    Default = false,
    Callback = function(v)
        hitboxSettings.Bunny = v
    end
})

Hitbox:Toggle({
    Title = "邪教徒打击盒",
    Default = false,
    Callback = function(v)
        hitboxSettings.Cultist = v
    end
})

Hitbox:Toggle({
    Title = "所有东西打击盒",
    Default = false,
    Callback = function(v)
        hitboxSettings.All = v
    end
})

Hitbox:Slider({
    Title = "范围大小",
    Desc = "滑动调整",
    Value = {
        Min = 2,
        Max = 250,
        Default = 10,
    },
    Callback = function(Value)
        hitboxSettings.Size = Value
    end
})


local Main = Window:Tab({Title = "食物", Icon = "user"})
Main:Section({Title = "收集食物"})
local foodItems = {
    ["生肉块"]   = "Morsel",
    ["生牛排"]   = "Steak",
    ["熟肉块"]   = "Cooked Morsel",
    ["熟牛排"]   = "Cooked Steak"
}

local selectedItems = {}

Main:Dropdown({
    Title  = "选择要收集的食物（多选）",
    Values = {"生肉块", "生牛排", "熟肉块", "熟牛排"},
    Value  = {},
    Multi  = true,
    Callback = function(options)
        selectedItems = {}
        for _, option in ipairs(options) do
            selectedItems[foodItems[option]] = true
        end
    end
})

local autoCollectAndDropLogs = false
local collectDelay = 0.01

local positionOptions = {
    ["原地"] = nil, 
    ["火堆"] = Vector3.new(1.4, 25.9, -0.9)
}

local selectedPosition = positionOptions["火堆"]

Main:Dropdown({
    Title = "选择位置",
    Values = {"原地", "火堆"},
    Value = "火堆",
    Callback = function(option)
        selectedPosition = positionOptions[option]
    end
})

local function fixPlayerPosition()
    local player = game:GetService("Players").LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local targetPosition
        if selectedPosition then
            targetPosition = selectedPosition
        else
     
            targetPosition = player.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
        end
        player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
        player.Character.HumanoidRootPart.Anchored = true
    end
end

local function CollectAndDropLogs()
    if not autoCollectAndDropLogs then return end
    if not next(selectedItems) then return end
    
    local player = game:GetService("Players").LocalPlayer
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    
    fixPlayerPosition()
    local hrp = player.Character.HumanoidRootPart
    
    local items = {}
    for _, item in pairs(workspace.Items:GetChildren()) do
        if selectedItems[item.Name] and item:IsA("Model") then
            table.insert(items, item)
        end
    end

    table.sort(items, function(a, b)
        local aPart = a.PrimaryPart or a:FindFirstChildWhichIsA("BasePart")
        local bPart = b.PrimaryPart or b:FindFirstChildWhichIsA("BasePart")
        if not aPart or not bPart then return false end
        return (hrp.Position - aPart.Position).Magnitude < (hrp.Position - bPart.Position).Magnitude
    end)

    for _, item in ipairs(items) do
        if not autoCollectAndDropLogs then break end
        
        local itemPart = item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart")
        if not itemPart then continue end
        
        itemPart.CFrame = CFrame.new(hrp.Position + Vector3.new(0, 0, 2))
        task.wait(0.05)
        
        game:GetService("ReplicatedStorage").RemoteEvents.RequestStartDraggingItem:FireServer(item)
        task.wait(0.05)
        
        game:GetService("ReplicatedStorage").RemoteEvents.ReplicateSound:FireServer(
            "FireAllClients",
            "BagGet",
            {
                ["Instance"] = player.Character.Head,
                ["Volume"] = 0.25
            }
        )
        
        game:GetService("ReplicatedStorage").RemoteEvents.StopDraggingItem:FireServer(item)
        
        task.wait(collectDelay)
    end
end

Main:Toggle({
    Title = "自动扔选择的食物",
    Value = false,
    Callback = function(value)
        autoCollectAndDropLogs = value
        if value then
            fixPlayerPosition()
            spawn(function()
                while autoCollectAndDropLogs do
                    CollectAndDropLogs()
                    task.wait(0.1)
                end
            end)
        else
            local player = game:GetService("Players").LocalPlayer
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.Anchored = false
            end
        end
    end
})


Main:Section({Title = "远程烤肉"})

local function getNil(name, class)
    for _, v in pairs(getnilinstances()) do
        if v.ClassName == class and v.Name == name then
            return v
        end
    end
end

local autoCook = false
local selectedMeats = {} 

local function cookItem(itemName)
    local fire = workspace.Map.Campground.MainFire
    local item = workspace.Items:FindFirstChild(itemName) or getNil(itemName, "Model")
    
    if fire and item then
        local args = {fire, item}
        game:GetService("ReplicatedStorage").RemoteEvents.RequestCookItem:FireServer(unpack(args))
        return true
    end
    return false
end

local function CookItems()
    if not autoCook then return end
    
  
    for meatName, selected in pairs(selectedMeats) do
        if selected then
            cookItem(meatName)
        end
    end
end

local meatOptions = {
    ["肉块"] = "Morsel",
    ["牛排"] = "Steak"
   
}

Main:Dropdown({
    Title = "选择肉类 (多选)",
    Values = {"肉块", "牛排"},
    Value = {}, 
    Multi = true, 
    Callback = function(selectedOptions)
        selectedMeats = {}
        for _, optionName in pairs(selectedOptions) do
            local meatKey = meatOptions[optionName]
            if meatKey then
                selectedMeats[meatKey] = true
            end
        end
    end
})

Main:Toggle({
    Title = "远程烤选择的肉",
    Value = false,
    Callback = function(value)
        autoCook = value
        if value then
            spawn(function()
                while autoCook do
                    CookItems()
                    task.wait() 
                end
            end)
        end
    end
})
local autocookItems = {"Morsel", "Steak", "Ribs", "Salmon", "Mackerel"}
local autocookItemsDisplay = {"肉块", "牛排", "肋骨", "三文鱼", "鲭鱼"} 
local autoCookEnabledItems = {}
local autoCookEnabled = false
local cookItemMapping = {
    ["肉块"] = "Morsel",
    ["牛排"] = "Steak", 
    ["肋骨"] = "Ribs",
    ["三文鱼"] = "Salmon",
    ["鲭鱼"] = "Mackerel"
}

Main:Section({ Title = "自动烹饪食物", Icon = "user" })

Main:Dropdown({
    Title = "选择烹饪食物",
    Values = autocookItemsDisplay, 
    Multi = true,
    AllowNone = true,
    Callback = function(options)
        for itemName, _ in pairs(autoCookEnabledItems) do
            autoCookEnabledItems[itemName] = false
        end
        for _, chineseName in ipairs(options) do
            local englishName = cookItemMapping[chineseName]
            if englishName then
                autoCookEnabledItems[englishName] = true
            end
        end
    end
})

Main:Toggle({
    Title = "自动烹饪食物",
    Value = false,
    Callback = function(state)
        autoCookEnabled = state
        if state then
            WindUI:Notify({
                Title = "自动烹饪已开启",
                Content = "开始自动烹饪选择的食物",
                Duration = 2,
                Icon = "flame"
            })
        else
            WindUI:Notify({
                Title = "自动烹饪已关闭", 
                Content = "停止自动烹饪食物",
                Duration = 2,
                Icon = "flame"
            })
        end
    end
})
coroutine.wrap(function()
    while true do
        if autoCookEnabled then
            for itemName, enabled in pairs(autoCookEnabledItems) do
                if enabled then
                    for _, item in ipairs(Workspace:WaitForChild("Items"):GetChildren()) do
                        if item.Name == itemName then
                            moveItemToPos(item, campfireDropPos)
                        end
                    end
                end
            end
        end
        task.wait(0.5)
    end
end)()


Main:Section({Title = "吃食物"})

local alimentos = {
    "Apple", "Berry", "Carrot", "Cake", "Chili", 
    "Cooked Ribs", "Cooked Mackerel", "Cooked Salmon", 
    "Cooked Morsel", "Cooked Steak"
}
local selectedFood = {}
local hungerThreshold = 75
local autoFeedToggle = false

Main:Dropdown({
    Title = "选择食物",
    Desc = "选择要自动食用的食物",
    Values = alimentos,
    Value = selectedFood,
    Multi = true,
    Callback = function(value)
        selectedFood = value
    end
})

Main:Input({
    Title = "饥饿阈值",
    Desc = "当饥饿度低于此值时自动进食",
    Value = tostring(hungerThreshold),
    Placeholder = "例如: 50",
    Numeric = true,
    Callback = function(value)
        local n = tonumber(value)
        if n then
            hungerThreshold = math.clamp(n, 0, 100)
        end
    end
})

Main:Toggle({
    Title = "自动进食",
    Value = false,
    Callback = function(state)
        autoFeedToggle = state
        if state then
            task.spawn(function()
                while autoFeedToggle do
                    task.wait(0.1)
                    local function wiki(nome)
                        local c = 0
                        for _, i in ipairs(Workspace.Items:GetChildren()) do
                            if i.Name == nome then
                                c = c + 1
                            end
                        end
                        return c
                    end
                    
                    local function ghn()
                        return math.floor(LocalPlayer.PlayerGui.Interface.StatBars.HungerBar.Bar.Size.X.Scale * 100)
                    end
                    
                    local function feed(nome)
                        for _, item in ipairs(Workspace.Items:GetChildren()) do
                            if item.Name == nome then
                                ReplicatedStorage.RemoteEvents.RequestConsumeItem:InvokeServer(item)
                                break
                            end
                        end
                    end
                    
                    if #selectedFood > 0 then
                        for _, food in ipairs(selectedFood) do
                            if wiki(food) == 0 then
                                autoFeedToggle = false
                                WindUI:Notify({
                                    Title = "自动进食暂停",
                                    Content = food .. " 已耗尽",
                                    Duration = 3
                                })
                                break
                            end
                            if ghn() <= hungerThreshold then
                                feed(food)
                            end
                        end
                    end
                end
            end)
        end
    end
})

local Safety = Window:Tab({Title = "防鹿", Icon = "user"})

Safety:Toggle({
    Title = "自动眩晕鹿",
    Desc = "需要手电筒",
    Value = false,
    Callback = function(state)
        if state then
            local torchLoop = RunService.RenderStepped:Connect(function()
                pcall(function()
                    local remote = ReplicatedStorage:FindFirstChild("RemoteEvents")
                        and ReplicatedStorage.RemoteEvents:FindFirstChild("DeerHitByTorch")
                    local deer = Workspace:FindFirstChild("Characters")
                        and Workspace.Characters:FindFirstChild("Deer")
                    if remote and deer then
                        remote:InvokeServer(deer)
                    end
                end)
                task.wait(0.1)
            end)
        else
            if torchLoop then
                torchLoop:Disconnect()
                torchLoop = nil
            end
        end
    end
})
local Main = Window:Tab({Title = "钓鱼", Icon = "user"})

Main:Toggle({
    Title = "自动钓鱼",
    Value = false,
    Callback = function(value)
        autoFishingEnabled = value
        if value then
            spawn(function()
                local Players = game:GetService("Players")
                local RunService = game:GetService("RunService")
                local player = Players.LocalPlayer
                local playerGui = player:WaitForChild("PlayerGui")
                
                task.wait(1)
                
                local fishingCatchFrame = playerGui.Interface.FishingCatchFrame
                local timingBar = fishingCatchFrame.TimingBar
                local successArea = timingBar.SuccessArea
                local bar = timingBar.Bar
                local button = playerGui.MobileButtons.Frame.Button3
                local canClick = true
                
                local function checkOverlap(f1, f2)
                    local p1 = f1.AbsolutePosition
                    local s1 = f1.AbsoluteSize
                    local p2 = f2.AbsolutePosition
                    local s2 = f2.AbsoluteSize
                    
                    return not (
                        p1.X + s1.X < p2.X or
                        p2.X + s2.X < p1.X or
                        p1.Y + s1.Y < p2.Y or
                        p2.Y + s2.Y < p1.Y
                    )
                end
                
                local function clickButton()
                    for _, connection in pairs(getconnections(button.MouseButton1Down)) do
                        connection:Fire()
                    end
                end
                
                while autoFishingEnabled do
                    if fishingCatchFrame.Visible and timingBar.Visible then
                        if checkOverlap(successArea, bar) and canClick then
                            canClick = false
                            clickButton()
                            task.wait(0.1)
                            canClick = true
                        end
                    else
                        canClick = true
                    end
                    wait(0)
                end
            end)
        end
    end
})
Main:Toggle({
    Title = "无延迟钓鱼",
    Value = false,
    Callback = function(value)
        noDelayFishing = value
        if value then
            spawn(function()
                local Players = game:GetService("Players")
                local player = Players.LocalPlayer
                local playerGui = player:WaitForChild("PlayerGui")
                
                task.wait(1)
                
                local button = playerGui.MobileButtons.Frame.Button3
                
                local function clickButton()
                    for _, connection in pairs(getconnections(button.MouseButton1Down)) do
                        connection:Fire()
                    end
                end
                
                while noDelayFishing do
             
                    if playerGui.Interface.FishingCatchFrame.Visible then
                        clickButton()
                    end
                    wait(0)
                end
            end)
        end
    end
})
Main:Toggle({
    Title = "秒钓鱼",
    Value = false,
    Callback = function(value)
        instantFishing = value
        if value then
            spawn(function()
                local Players = game:GetService("Players")
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                local player = Players.LocalPlayer
                
                while instantFishing do
          
                    pcall(function()
                        local remote = ReplicatedStorage:FindFirstChild("RemoteEvents")
                        if remote then
                            local finishFishing = remote:FindFirstChild("FinishFishing")
                            if finishFishing then
                                finishFishing:FireServer(true) 
                            end
                        end
                    end)
                    wait(0.1) 
                end
            end)
        end
    end
})



local Main = Window:Tab({Title = "工作台", Icon = "user"})

Main:Section({Title = "钢材"})

local steelItems = {
    ["螺栓"]            = "Bolt",
    ["破风扇"]          = "Broken Fan",
    ["坏微波炉"]        = "Broken Microwave",
    ["旧收音机"]        = "Old Radio",
    ["洗衣机"]          = "Washing Machine",
    ["旧汽车引擎"]      = "Old Car Engine",
    ["轮胎"]            = "tyre",
    ["金属板"]          = "Sheet Metal"
}

local dropPositions = {
    ["工作台"] = Vector3.new(21.67, 6.34, -4.05),
    ["火堆"] = Vector3.new(3.04, 11.70, 1.01)
}

local selectedItems = {}
local selectedDropPosition = dropPositions["工作台"] 

Main:Dropdown({
    Title = "选择要收集的钢铁类物品（多选）",
    Values = {"螺栓", "破风扇", "坏微波炉", "旧收音机", "洗衣机", "旧汽车引擎", "轮胎", "金属板"},
    Value = {},
    Multi = true,
    Callback = function(options)
        selectedItems = {}
        for _, option in ipairs(options) do
            selectedItems[steelItems[option]] = true
        end
    end
})

local autoCollectAndDropLogs = false
local collectDelay = 0.01

local positionOptions = {
    ["原地"] = nil, 
    ["工作台"] = Vector3.new(19.4, 15.0, -5.5)
}

local selectedPosition = positionOptions["工作台"]

Main:Dropdown({
    Title = "选择位置",
    Values = {"原地", "工作台"},
    Value = "工作台",
    Callback = function(option)
        selectedPosition = positionOptions[option]
    end
})

local function fixPlayerPosition()
    local player = game:GetService("Players").LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local targetPosition
        if selectedPosition then
            targetPosition = selectedPosition
        else
         
            targetPosition = player.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
        end
        player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
        player.Character.HumanoidRootPart.Anchored = true
    end
end

local function CollectAndDropLogs()
    if not autoCollectAndDropLogs then return end
    if not next(selectedItems) then return end 
    
    local player = game:GetService("Players").LocalPlayer
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    
    fixPlayerPosition()
    local hrp = player.Character.HumanoidRootPart
    
    local items = {}
    for _, item in pairs(workspace.Items:GetChildren()) do
        if selectedItems[item.Name] and item:IsA("Model") then
            table.insert(items, item)
        end
    end

    table.sort(items, function(a, b)
        local aPart = a.PrimaryPart or a:FindFirstChildWhichIsA("BasePart")
        local bPart = b.PrimaryPart or b:FindFirstChildWhichIsA("BasePart")
        if not aPart or not bPart then return false end
        return (hrp.Position - aPart.Position).Magnitude < (hrp.Position - bPart.Position).Magnitude
    end)

    for _, item in ipairs(items) do
        if not autoCollectAndDropLogs then break end
        
        local itemPart = item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart")
        if not itemPart then continue end
        
        itemPart.CFrame = CFrame.new(hrp.Position + Vector3.new(0, 0, 2))
        task.wait(0.05)
        
        game:GetService("ReplicatedStorage").RemoteEvents.RequestStartDraggingItem:FireServer(item)
        task.wait(0.05)
        
        game:GetService("ReplicatedStorage").RemoteEvents.ReplicateSound:FireServer(
            "FireAllClients",
            "BagGet",
            {
                ["Instance"] = player.Character.Head,
                ["Volume"] = 0.25
            }
        )
        
        game:GetService("ReplicatedStorage").RemoteEvents.StopDraggingItem:FireServer(item)
        
        task.wait(collectDelay)
    end
end

Main:Toggle({
    Title = "自动扔选择的钢铁",
    Value = false,
    Callback = function(value)
        autoCollectAndDropLogs = value
        if value then
            fixPlayerPosition()
            spawn(function()
                while autoCollectAndDropLogs do
                    CollectAndDropLogs()
                    task.wait(0.1)
                end
            end)
        else
            local player = game:GetService("Players").LocalPlayer
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.Anchored = false
            end
        end
    end
})

Main:Toggle({
    Title = "自动升级工作台",
    Value = false,
    Callback = function(value)
        autoCraftEnabled = value
        if value then
            spawn(function()
                while autoCraftEnabled do
                  
                    local craftingBenches = {
                        "Crafting Bench 2",
                        "Crafting Bench 3", 
                        "Crafting Bench 4",
                        "Crafting Bench 5",
                        "Crafting Bench 6",
                        "Crafting Bench 7",
                        "Crafting Bench 8"
                    }
                    
                 
                    for _, benchName in ipairs(craftingBenches) do
                        if not autoCraftEnabled then break end 
                        
                        local args = {
                            [1] = benchName
                        }
                        
                        pcall(function()
                            game:GetService("ReplicatedStorage").RemoteEvents.CraftItem:InvokeServer(unpack(args))
                        end)
                        
                        wait(0.1)
                    end
                    
                    wait(0) 
                end
            end)
        end
    end
})
Main:Section({Title = "自动制作"})

local autoCraftConfig = {
    itemName = "Shelf",  
    interval = 5,     
    craftOnce = false    
}
local autoCraftEnabled = false
local craftLoop = nil
Main:Input({
    Title = "制作物品名称",
    Desc = "输入要制作的物品名称",
    Value = autoCraftConfig.itemName,
    Placeholder = "例如: Shelf",
    Callback = function(input)
        autoCraftConfig.itemName = input
    end
})
Main:Input({
    Title = "制作间隔(秒)",
    Desc = "设置每次制作的间隔时间",
    Value = tostring(autoCraftConfig.interval),
    Placeholder = "例如: 5",
    Numeric = true,
    Callback = function(input)
        local num = tonumber(input)
        if num and num > 0 then
            autoCraftConfig.interval = num
        end
    end
})
Main:Button({
    Title = "制作一次",
    Callback = function()
        local args = {
            [1] = autoCraftConfig.itemName
        }
        
        pcall(function()
            game:GetService("ReplicatedStorage").RemoteEvents.CraftItem:InvokeServer(unpack(args))
            WindUI:Notify({
                Title = "制作完成",
                Content = "已制作: " .. autoCraftConfig.itemName,
                Duration = 3,
                Icon = "check-circle"
            })
        end)
    end
})
Main:Toggle({
    Title = "自动制作",
    Value = false,
    Callback = function(value)
        autoCraftEnabled = value
        if value then
            spawn(function()
                while autoCraftEnabled do
                    local args = {
                        [1] = autoCraftConfig.itemName
                    }
                    
                    pcall(function()
                        game:GetService("ReplicatedStorage").RemoteEvents.CraftItem:InvokeServer(unpack(args))
                    end)
                    
                
                    for i = 1, autoCraftConfig.interval * 10 do
                        if not autoCraftEnabled then break end
                        wait(0.1)
                    end
                end
            end)
            
            WindUI:Notify({
                Title = "自动制作已开启",
                Content = "正在自动制作: " .. autoCraftConfig.itemName,
                Duration = 3,
                Icon = "settings"
            })
        else
            WindUI:Notify({
                Title = "自动制作已关闭",
                Content = "停止制作: " .. autoCraftConfig.itemName,
                Duration = 3,
                Icon = "settings"
            })
        end
    end
})

local Main = Window:Tab({Title = "宝箱功能", Icon = "box"})
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local chestSettings = {
    autoChestEnabled = false,
    autoChestNearEnabled = false,
    chestRange = 50,
    isRunning = false,
    originalCFrame = nil
}
local function getChests()
    local chests = {}
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and string.find(obj.Name, "Item Chest") then
            table.insert(chests, obj)
        end
    end
    return chests
end
local function getPrompt(model)
    local prompts = {}
    for _, obj in ipairs(model:GetDescendants()) do
        if obj:IsA("ProximityPrompt") then
            table.insert(prompts, obj)
        end
    end
    return prompts
end
Main:Toggle({
    Title = "自动开全部宝箱",
    Value = false,
    Callback = function(v)
        chestSettings.autoChestEnabled = v
        
        if v then
            if chestSettings.isRunning then return end
            chestSettings.isRunning = true
            
            local player = Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            chestSettings.originalCFrame = humanoidRootPart.CFrame
            
            task.spawn(function()
                while chestSettings.autoChestEnabled and chestSettings.isRunning do
                    local chests = getChests()
                    for _, chest in ipairs(chests) do
                        if not chestSettings.autoChestEnabled then break end
                        local part = chest.PrimaryPart or chest:FindFirstChildWhichIsA("BasePart")
                        if part then
                            humanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 6, 0)
                            local prompts = getPrompt(chest)
                            for _, prompt in ipairs(prompts) do
                                fireproximityprompt(prompt, math.huge)
                            end
                            local t = tick()
                            while chestSettings.autoChestEnabled and tick() - t < 4 do 
                                task.wait() 
                            end
                        end
                    end
                    task.wait(0.1)
                end
                
            
                if chestSettings.originalCFrame then
                    humanoidRootPart.CFrame = chestSettings.originalCFrame
                end
                chestSettings.isRunning = false
            end)
        else
            chestSettings.isRunning = false
        end
    end
})
Main:Toggle({
    Title = "宝箱光环",
    Value = false,
    Callback = function(v)
        chestSettings.autoChestNearEnabled = v
        
        if v then
            task.spawn(function()
                while chestSettings.autoChestNearEnabled do
                    local player = Players.LocalPlayer
                    local character = player.Character
                    if character and character:FindFirstChild("HumanoidRootPart") then
                        local humanoidRootPart = character.HumanoidRootPart
                        
                      
                        for _, obj in ipairs(workspace:GetDescendants()) do
                            if obj:IsA("Model") and string.find(obj.Name, "Item Chest") then
                                local part = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
                                if part then
                                    local dist = (humanoidRootPart.Position - part.Position).Magnitude
                                    if dist <= chestSettings.chestRange then
                                        for _, prompt in ipairs(obj:GetDescendants()) do
                                            if prompt:IsA("ProximityPrompt") then
                                                fireproximityprompt(prompt, math.huge)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

Main:Slider({
    Title = "宝箱光环范围",
    Value = {
        Min = 1,
        Max = 100,
        Default = 50,
    },
    Callback = function(Value)
        chestSettings.chestRange = Value
    end
})
Main:Button({
    Title = "传送到最近宝箱",
    Callback = function()
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        local nearestChest, nearestDist, targetPart
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("Model") and string.find(obj.Name, "Item Chest") then
                local part = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
                if part then
                    local dist = (humanoidRootPart.Position - part.Position).Magnitude
                    if not nearestDist or dist < nearestDist then
                        nearestDist = dist
                        nearestChest = obj
                        targetPart = part
                    end
                end
            end
        end

        if targetPart then
            humanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, targetPart.Size.Y/2 + 6, 0)
            WindUI:Notify({
                Title = "宝箱传送",
                Content = "已传送到最近宝箱",
                Duration = 3,
            })
        else
            WindUI:Notify({
                Title = "宝箱传送",
                Content = "未找到宝箱",
                Duration = 3,
            })
        end
    end
})

local Main = Window:Tab({Title = "火堆", Icon = "user"})


Main:Section({Title = "燃料类"})

local itemsMap = {
    ["木头"] = "Log",
    ["煤"] = "Coal",
    ["油桶"] = "Fuel Canister",
    ["椅子"] = "Chair",
    ["生物燃料"] = "Biofuel"
}

local dropPositions = {
    ["工作台"] = Vector3.new(21.67, 6.34, -4.05),
    
    ["火堆"] = Vector3.new(3.04, 11.70, 1.01)
}

local selectedItems = {}
local selectedDropPosition = dropPositions["工作台"] 

Main:Dropdown({
    Title = "选择要收集的物品（多选）",
    Values = {"木头", "煤", "油桶", "椅子", "生物燃料"},
    Value = {},
    Multi = true,
    Callback = function(options)
        selectedItems = {}
        for _, option in ipairs(options) do
            selectedItems[itemsMap[option]] = true
        end
    end
})


local autoCollectAndDropLogs = false
local collectDelay = 0.01

local positionOptions = {
    ["原地"] = nil, 
    ["工作台"] = Vector3.new(21.67, 6.34, -4.05),
    ["火堆"] = Vector3.new(1.4, 25.9, -0.9)
}

local selectedPosition = positionOptions["火堆"]

Main:Dropdown({
    Title = "选择位置",
    Values = {"原地","工作台","火堆"},
    Value = "火堆",
    Callback = function(option)
        selectedPosition = positionOptions[option]
    end
})

local function fixPlayerPosition()
    local player = game:GetService("Players").LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local targetPosition
        if selectedPosition then
            targetPosition = selectedPosition
        else
     
            targetPosition = player.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
        end
        player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
        player.Character.HumanoidRootPart.Anchored = true
    end
end

local function CollectAndDropLogs()
    if not autoCollectAndDropLogs then return end
    if not next(selectedItems) then return end 
    
    local player = game:GetService("Players").LocalPlayer
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    
    fixPlayerPosition()
    local hrp = player.Character.HumanoidRootPart
    
    local items = {}
    for _, item in pairs(workspace.Items:GetChildren()) do
        if selectedItems[item.Name] and item:IsA("Model") then
            table.insert(items, item)
        end
    end

    table.sort(items, function(a, b)
        local aPart = a.PrimaryPart or a:FindFirstChildWhichIsA("BasePart")
        local bPart = b.PrimaryPart or b:FindFirstChildWhichIsA("BasePart")
        if not aPart or not bPart then return false end
        return (hrp.Position - aPart.Position).Magnitude < (hrp.Position - bPart.Position).Magnitude
    end)

    for _, item in ipairs(items) do
        if not autoCollectAndDropLogs then break end
        
        local itemPart = item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart")
        if not itemPart then continue end
        
        itemPart.CFrame = CFrame.new(hrp.Position + Vector3.new(0, 0, 2))
        task.wait(0.05)
        
        game:GetService("ReplicatedStorage").RemoteEvents.RequestStartDraggingItem:FireServer(item)
        task.wait(0.05)
        
        game:GetService("ReplicatedStorage").RemoteEvents.ReplicateSound:FireServer(
            "FireAllClients",
            "BagGet",
            {
                ["Instance"] = player.Character.Head,
                ["Volume"] = 0.25
            }
        )
        
        game:GetService("ReplicatedStorage").RemoteEvents.StopDraggingItem:FireServer(item)
        
        task.wait(collectDelay)
    end
end

Main:Toggle({
    Title = "自动扔选择的燃料",
    Value = false,
    Callback = function(value)
        autoCollectAndDropLogs = value
        if value then
            fixPlayerPosition()
            spawn(function()
                while autoCollectAndDropLogs do
                    CollectAndDropLogs()
                    task.wait(0.1)
                end
            end)
        else
            local player = game:GetService("Players").LocalPlayer
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.Anchored = false
            end
        end
    end
})

Main:Button({
    Title = "传送回火旁",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-0.09672313928604126, 7.937822341918945, -0.1782056838274002)
    end
})

local Teleport = Window:Tab({Title = "传送功能", Icon = "user"})
local function getChests()
    local chests = {}
    local chestNames = {}
    local index = 1
    for _, item in ipairs(Workspace:WaitForChild("Items"):GetChildren()) do
        if item.Name:match("^Item Chest") and not item:GetAttribute("8721081708ed") then
            table.insert(chests, item)
            table.insert(chestNames, "Chest " .. index)
            index = index + 1
        end
    end
    return chests, chestNames
end

local function getMobs()
    local mobs = {}
    local mobNames = {}
    local index = 1
    for _, character in ipairs(Workspace:WaitForChild("Characters"):GetChildren()) do
        if character.Name:match("^Lost Child") and character:GetAttribute("Lost") == true then
            table.insert(mobs, character)
            table.insert(mobNames, character.Name)
            index = index + 1
        end
    end
    return mobs, mobNames
end
local currentChests, currentChestNames = getChests()
local selectedChest = currentChestNames[1] or nil

local currentMobs, currentMobNames = getMobs()
local selectedMob = currentMobNames[1] or nil

Teleport:Section({ Title = "基础传送点", Icon = "map-pin" })

Teleport:Button({
    Title = "传送到营火",
    Callback = function()
        local function tp1()
            (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame =
            CFrame.new(0.43132782, 15.77634621, -1.88620758, -0.270917892, 0.102997094, 0.957076371, 0.639657021, 0.762253821, 0.0990355015, -0.719334781, 0.639031112, -0.272391081)
        end
        tp1()
    end
})

Teleport:Button({
    Title = "传送到要塞",
    Callback = function()
        local function tp2()
            local targetPart = Workspace:FindFirstChild("Map")
                and Workspace.Map:FindFirstChild("Landmarks")
                and Workspace.Map.Landmarks:FindFirstChild("Stronghold")
                and Workspace.Map.Landmarks.Stronghold:FindFirstChild("Functional")
                and Workspace.Map.Landmarks.Stronghold.Functional:FindFirstChild("EntryDoors")
                and Workspace.Map.Landmarks.Stronghold.Functional.EntryDoors:FindFirstChild("DoorRight")
                and Workspace.Map.Landmarks.Stronghold.Functional.EntryDoors.DoorRight:FindFirstChild("Model")
            if targetPart then
                local children = targetPart:GetChildren()
                local destination = children[5]
                if destination and destination:IsA("BasePart") then
                    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.CFrame = destination.CFrame + Vector3.new(0, 5, 0)
                    end
                end
            end
        end
        tp2()
    end
})

Teleport:Button({
    Title = "传送到安全区",
    Callback = function()
        if not Workspace:FindFirstChild("SafeZonePart") then
            local createpart = Instance.new("Part")
            createpart.Name = "SafeZonePart"
            createpart.Size = Vector3.new(30, 3, 30)
            createpart.Position = Vector3.new(0, 350, 0)
            createpart.Anchored = true
            createpart.CanCollide = true
            createpart.Transparency = 0.8
            createpart.Color = Color3.fromRGB(255, 0, 0)
            createpart.Parent = Workspace
        end
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")
        hrp.CFrame = CFrame.new(0, 360, 0)
    end
})

Teleport:Button({
    Title = "传送到商人",
    Callback = function()
        local pos = Vector3.new(-37.08, 3.98, -16.33)
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")
        hrp.CFrame = CFrame.new(pos)
    end
})

Teleport:Button({
    Title = "传送到随机树",
    Callback = function()
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hrp = character:FindFirstChild("HumanoidRootPart", 3)
        if not hrp then return end

        local map = Workspace:FindFirstChild("Map")
        if not map then return end

        local foliage = map:FindFirstChild("Foliage") or map:FindFirstChild("Landmarks")
        if not foliage then return end

        local trees = {}
        for _, obj in ipairs(foliage:GetChildren()) do
            if obj.Name == "Small Tree" and obj:IsA("Model") then
                local trunk = obj:FindFirstChild("Trunk") or obj.PrimaryPart
                if trunk then
                    table.insert(trees, trunk)
                end
            end
        end

        if #trees > 0 then
            local trunk = trees[math.random(1, #trees)]
            local treeCFrame = trunk.CFrame
            local rightVector = treeCFrame.RightVector
            local targetPosition = treeCFrame.Position + rightVector * 3
            hrp.CFrame = CFrame.new(targetPosition)
        end
    end
})

Teleport:Section({ Title = "宝箱传送", Icon = "box" })

local ChestDropdown = Teleport:Dropdown({
    Title = "选择宝箱",
    Values = currentChestNames,
    Multi = false,
    AllowNone = true,
    Callback = function(options)
        selectedChest = options[#options] or currentChestNames[1] or nil
    end
})

Teleport:Button({
    Title = "刷新宝箱列表",
    Locked = false,
    Callback = function()
        currentChests, currentChestNames = getChests()
        if #currentChestNames > 0 then
            selectedChest = currentChestNames[1]
            ChestDropdown:Refresh(currentChestNames)
            WindUI:Notify({
                Title = "宝箱列表已刷新",
                Content = "找到 " .. #currentChestNames .. " 个宝箱",
                Duration = 3,
                Icon = "refresh-cw"
            })
        else
            selectedChest = nil
            ChestDropdown:Refresh({ "未找到宝箱" })
            WindUI:Notify({
                Title = "未找到宝箱",
                Content = "地图上没有发现宝箱",
                Duration = 3,
                Icon = "box"
            })
        end
    end
})

Teleport:Button({
    Title = "传送到宝箱",
    Locked = false,
    Callback = function()
        if selectedChest and currentChests then
            local chestIndex = 1
            for i, name in ipairs(currentChestNames) do
                if name == selectedChest then
                    chestIndex = i
                    break
                end
            end
            local targetChest = currentChests[chestIndex]
            if targetChest then
                local part = targetChest.PrimaryPart or targetChest:FindFirstChildWhichIsA("BasePart")
                if part and LocalPlayer.Character then
                    local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.CFrame = part.CFrame + Vector3.new(0, 5, 0)
                        WindUI:Notify({
                            Title = "传送成功",
                            Content = "已传送到 " .. selectedChest,
                            Duration = 3,
                            Icon = "check-circle"
                        })
                    end
                end
            end
        else
            WindUI:Notify({
                Title = "传送失败",
                Content = "请先选择一个宝箱",
                Duration = 3,
                Icon = "alert-circle"
            })
        end
    end
})

Teleport:Section({ Title = "儿童传送", Icon = "user" })

local MobDropdown = Teleport:Dropdown({
    Title = "选择儿童",
    Values = currentMobNames,
    Multi = false,
    AllowNone = true,
    Callback = function(options)
        selectedMob = options[#options] or currentMobNames[1] or nil
    end
})

Teleport:Button({
    Title = "刷新儿童列表",
    Locked = false,
    Callback = function()
        currentMobs, currentMobNames = getMobs()
        if #currentMobNames > 0 then
            selectedMob = currentMobNames[1]
            MobDropdown:Refresh(currentMobNames)
            WindUI:Notify({
                Title = "儿童列表已刷新",
                Content = "找到 " .. #currentMobNames .. " 个迷失儿童",
                Duration = 3,
                Icon = "refresh-cw"
            })
        else
            selectedMob = nil
            MobDropdown:Refresh({ "未找到迷失儿童" })
            WindUI:Notify({
                Title = "未找到迷失儿童",
                Content = "地图上没有发现迷失儿童",
                Duration = 3,
                Icon = "user"
            })
        end
    end
})

Teleport:Button({
    Title = "传送到儿童",
    Locked = false,
    Callback = function()
        if selectedMob and currentMobs then
            for i, name in ipairs(currentMobNames) do
                if name == selectedMob then
                    local targetMob = currentMobs[i]
                    if targetMob then
                        local part = targetMob.PrimaryPart or targetMob:FindFirstChildWhichIsA("BasePart")
                        if part and LocalPlayer.Character then
                            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                hrp.CFrame = part.CFrame + Vector3.new(0, 5, 0)
                                WindUI:Notify({
                                    Title = "传送成功",
                                    Content = "已传送到 " .. selectedMob,
                                    Duration = 3,
                                    Icon = "check-circle"
                                })
                            end
                        end
                    end
                    break
                end
            end
        else
            WindUI:Notify({
                Title = "传送失败",
                Content = "请先选择一个迷失儿童",
                Duration = 3,
                Icon = "alert-circle"
            })
        end
    end
})

local AutoSection = Window:Tab({Title = "带来", Icon = "user"})

AutoSection:Toggle({
    Title = "自动传送物品",
    Default = false,
    Callback = function(Value)
        autoBringItems = Value
        task.spawn(function()
            while autoBringItems and task.wait() do
                local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not root then continue end
                for _, item in ipairs(workspace.Items:GetChildren()) do
                    local part = item:FindFirstChildWhichIsA("BasePart") or (item:IsA("BasePart") and item)
                    if part then
                        part.CFrame = root.CFrame + Vector3.new(math.random(-44,44), 0, math.random(-44,44))
                    end
                end
            end
        end)
    end
})

AutoSection:Toggle({
    Title = "自动传送木头",
    Default = false,
    Callback = function(Value)
        autoBringLogs = Value
        task.spawn(function()
            while autoBringLogs and task.wait() do
                local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not root then continue end
                
                for _, item in pairs(workspace.Items:GetChildren()) do
                    if item.Name:lower():find("log") and item:IsA("Model") then
                        local main = item:FindFirstChildWhichIsA("BasePart")
                        if main then
                            main.CFrame = root.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
                        end
                    end
                end
            end
        end)
    end
})

AutoSection:Toggle({
    Title = "自动传送燃料罐",
    Default = false,
    Callback = function(Value)
        autoBringFuel = Value
        task.spawn(function()
            while autoBringFuel and task.wait() do
                local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not root then continue end
                
                for _, item in pairs(workspace.Items:GetChildren()) do
                    if item.Name:lower():find("fuel canister") and item:IsA("Model") then
                        local main = item:FindFirstChildWhichIsA("BasePart")
                        if main then
                            main.CFrame = root.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
                        end
                    end
                end
            end
        end)
    end
})

AutoSection:Toggle({
    Title = "自动传送油桶",
    Default = false,
    Callback = function(Value)
        autoBringOil = Value
        task.spawn(function()
            while autoBringOil and task.wait() do
                local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not root then continue end
                
                for _, item in pairs(workspace.Items:GetChildren()) do
                    if item.Name:lower():find("oil barrel") and item:IsA("Model") then
                        local main = item:FindFirstChildWhichIsA("BasePart")
                        if main then
                            main.CFrame = root.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
                        end
                    end
                end
            end
        end)
    end
})

AutoSection:Toggle({
    Title = "自动传送所有废料",
    Default = false,
    Callback = function(Value)
        autoBringScrap = Value
        task.spawn(function()
            while autoBringScrap and task.wait() do
                local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not root then continue end
                
                local scrapNames = {
                    ["tyre"] = true, 
                    ["sheet metal"] = true, 
                    ["broken fan"] = true, 
                    ["bolt"] = true, 
                    ["old radio"] = true, 
                    ["ufo junk"] = true, 
                    ["ufo scrap"] = true, 
                    ["broken microwave"] = true
                }
                
                for _, item in pairs(workspace.Items:GetChildren()) do
                    if item:IsA("Model") then
                        local itemName = item.Name:lower()
                        for scrapName, _ in pairs(scrapNames) do
                            if itemName:find(scrapName) then
                                local main = item:FindFirstChildWhichIsA("BasePart")
                                if main then
                                    main.CFrame = root.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
                                end
                                break
                            end
                        end
                    end
                end
            end
        end)
    end
})

AutoSection:Toggle({
    Title = "自动传送煤炭",
    Default = false,
    Callback = function(Value)
        autoBringCoal = Value
        task.spawn(function()
            while autoBringCoal and task.wait() do
                local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not root then continue end
                
                for _, item in pairs(workspace.Items:GetChildren()) do
                    if item.Name:lower():find("coal") and item:IsA("Model") then
                        local main = item:FindFirstChildWhichIsA("BasePart")
                        if main then
                            main.CFrame = root.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
                        end
                    end
                end
            end
        end)
    end
})

AutoSection:Toggle({
    Title = "自动传送肉类",
    Default = false,
    Callback = function(Value)
        autoBringMeat = Value
        task.spawn(function()
            while autoBringMeat and task.wait() do
                local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not root then continue end
                
                for _, item in pairs(workspace.Items:GetChildren()) do
                    local name = item.Name:lower()
                    if (name:find("meat") or name:find("cooked")) and item:IsA("Model") then
                        local main = item:FindFirstChildWhichIsA("BasePart")
                        if main then
                            main.CFrame = root.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
                        end
                    end
                end
            end
        end)
    end
})

local Main = Window:Tab({Title = "收集", Icon = "user"})
local itemMaps = {
    ["燃料类物品"] = {
        ["木头"] = "Log",
        ["煤"] = "Coal",
        ["油桶"] = "Fuel Canister",
        ["椅子"] = "Chair",
        ["生物燃料"] = "Biofuel"
    },
    ["钢铁类物品"] = {
        ["螺栓"] = "Bolt",
        ["破风扇"] = "Broken Fan",
        ["坏微波炉"] = "Broken Microwave",
        ["旧收音机"] = "Old Radio",
        ["洗衣机"] = "Washing Machine",
        ["旧汽车引擎"] = "Old Car Engine",
        ["轮胎"] = "Tire",
        ["金属板"] = "Sheet Metal"
    },
    ["食物类物品"] = {
        ["蛋糕"] = "Cake",
        ["牛排"] = "Steak",
        ["肉丁"] = "Morsel",
        ["胡萝卜"] = "Carrot",
        ["苹果"] = "Apple",
        ["浆果"] = "Berry",
        ["辣椒"] = "Chili",
        ["玉米"] = "Corn",
        ["南瓜"] = "Pumpkin"
    },
    ["回血类物品"] = {
        ["绷带"] = "Bandage",
        ["医疗包"] = "Medkit"
    },
    ["武器与装备"] = {
        ["步枪"] = "Rifle",
        ["皮革背心"] = "Leather Body",
        ["左轮弹药"] = "Revolver Ammo",
        ["左轮手枪"] = "Revolver",
        ["步枪弹药"] = "Rifle Ammo",
        ["好的背包"] = "Good Sack",
        ["巨袋"] = "Large Bag",
        ["强力斧头"] = "Strong Axe",
        ["锯齿"] = "Saw Blade",
        ["好的斧头"] = "Good Axe",
        ["长矛"] = "Spear",
        ["强力手电筒"] = "Strong Flashlight",
        ["弓弩"] = "Crossbow",
        ["老鱼杆"] = "Old Rod"
    },
    ["动物与特殊物品"] = {
        ["黄鼠狼皮"] = "Arctic Fox Pelt",
        ["教徒尸体"] = "Cultist",
        ["弓弩教徒尸体"] = "Crossbow Cultist",
        ["教徒宝石"] = "Cultist Gem",
        ["狼尸体"] = "Wolf Corpse",
        ["狼皮"] = "Bunny Foot"
    }
}

local selectedItems = {}
local autoCollect = false
local collectDelay = 0.005  

local function fixPlayerPosition()
    local player = game:GetService("Players").LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local targetPosition = player.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
        player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
        player.Character.HumanoidRootPart.Anchored = true
    end
end

local function CollectItems()
    if not autoCollect then return end
    if not next(selectedItems) then return end
    
    local player = game:GetService("Players").LocalPlayer
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    
    fixPlayerPosition()
    local hrp = player.Character.HumanoidRootPart
    
    local allItems = {}
    for _, item in pairs(workspace.Items:GetChildren()) do
        if selectedItems[item.Name] and item:IsA("Model") then
            table.insert(allItems, item)
        end
    end

    table.sort(allItems, function(a, b)
        local aPart = a.PrimaryPart or a:FindFirstChildWhichIsA("BasePart")
        local bPart = b.PrimaryPart or b:FindFirstChildWhichIsA("BasePart")
        if not aPart or not bPart then return false end
        return (hrp.Position - aPart.Position).Magnitude < (hrp.Position - bPart.Position).Magnitude
    end)

    for _, item in ipairs(allItems) do
        if not autoCollect then break end
        
        local itemPart = item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart")
        if not itemPart then continue end
        
        itemPart.CFrame = CFrame.new(hrp.Position + Vector3.new(0, 0, 2))
        task.wait(0.02)  
        
        game:GetService("ReplicatedStorage").RemoteEvents.RequestStartDraggingItem:FireServer(item)
        task.wait(0.02)  
        
        game:GetService("ReplicatedStorage").RemoteEvents.ReplicateSound:FireServer(
            "FireAllClients",
            "BagGet",
            {
                ["Instance"] = player.Character.Head,
                ["Volume"] = 0.25
            }
        )
        
        game:GetService("ReplicatedStorage").RemoteEvents.StopDraggingItem:FireServer(item)
        task.wait(collectDelay)
    end
end

local allItemValues = {}
local allItemMap = {}

for category, items in pairs(itemMaps) do
    for name, id in pairs(items) do
        table.insert(allItemValues, name)
        allItemMap[name] = id
    end
end

Main:Dropdown({
    Title = "选择要收集的物品（多选）",
    Values = allItemValues,
    Value = {},
    Multi = true,
    Callback = function(options)
        selectedItems = {}
        for _, option in ipairs(options) do
            selectedItems[allItemMap[option]] = true
        end
    end
})

Main:Toggle({
    Title = "自动收集选择的物品",
    Value = false,
    Callback = function(value)
        autoCollect = value
        if value then
            fixPlayerPosition()
            spawn(function()
                while autoCollect do
                    CollectItems()
                    task.wait(0.05)  
                end
            end)
        else
            local player = game:GetService("Players").LocalPlayer
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.Anchored = false
            end
        end
    end
})


local Main = Window:Tab({Title = "玩家功能", Icon = "user"})
Main:Toggle({
    Title = "速度 (开/关)",
    Default = false,
    Callback = function(v)
        if v == true then
            sudu = game:GetService("RunService").Heartbeat:Connect(function()
                if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Humanoid and game:GetService("Players").LocalPlayer.Character.Humanoid.Parent then
                    if game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                        game:GetService("Players").LocalPlayer.Character:TranslateBy(game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * Speed / 10)
                    end
                end
            end)
        elseif not v and sudu then
            sudu:Disconnect()
            sudu = nil
        end
    end
})

Main:Slider({
    Title = "速度设置",
    Desc = "滑动调整",
    Value = {
        Min = 1,
        Max = 150,
        Default = 1,
    },
    Callback = function(Value)
        Speed = Value
    end
})

Main:Toggle({
    Title = "隐身",
    Default = false,
    Callback = function(Value)
        if invisThread then
            task.cancel(invisThread)
            invisThread = nil
        end

        if Value then
            invisThread = task.spawn(function()
                local Player = game:GetService("Players").LocalPlayer
                RealCharacter = Player.Character or Player.CharacterAdded:Wait()
                RealCharacter.Archivable = true
                FakeCharacter = RealCharacter:Clone()
                Part = Instance.new("Part")
                Part.Anchored = true
                Part.Size = Vector3.new(200, 1, 200)
                Part.CFrame = CFrame.new(0, -500, 0)
                Part.CanCollide = true
                Part.Parent = workspace
                FakeCharacter.Parent = workspace
                FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)

                for _, v in pairs(RealCharacter:GetChildren()) do
                    if v:IsA("LocalScript") then
                        local clone = v:Clone()
                        clone.Disabled = true
                        clone.Parent = FakeCharacter
                    end
                end

                for _, v in pairs(FakeCharacter:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.Transparency = 0.7
                    end
                end

                local function EnableInvisibility()
                    StoredCF = RealCharacter.HumanoidRootPart.CFrame
                    RealCharacter.HumanoidRootPart.CFrame = FakeCharacter.HumanoidRootPart.CFrame
                    FakeCharacter.HumanoidRootPart.CFrame = StoredCF
                    RealCharacter.Humanoid:UnequipTools()
                    Player.Character = FakeCharacter
                    workspace.CurrentCamera.CameraSubject = FakeCharacter.Humanoid
                    RealCharacter.HumanoidRootPart.Anchored = true

                    for _, v in pairs(FakeCharacter:GetChildren()) do
                        if v:IsA("LocalScript") then
                            v.Disabled = false
                        end
                    end
                end

                RealCharacter.Humanoid.Died:Connect(function()
                    if Part then Part:Destroy() end
                    if FakeCharacter then FakeCharacter:Destroy() end
                    Player.Character = RealCharacter
                end)

                EnableInvisibility()

                game:GetService("RunService").RenderStepped:Connect(function()
                    if RealCharacter and RealCharacter:FindFirstChild("HumanoidRootPart") and Part then
                        RealCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
                    end
                end)
            end)
        else
            if Part then Part:Destroy() Part = nil end
            if FakeCharacter then FakeCharacter:Destroy() FakeCharacter = nil end
            if RealCharacter then
                RealCharacter.HumanoidRootPart.Anchored = false
                RealCharacter.HumanoidRootPart.CFrame = StoredCF
                game:GetService("Players").LocalPlayer.Character = RealCharacter
                workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
            end
        end
    end
})

Main:Toggle({
    Title = "秒互动",
    Value = false,
    Callback = function(value)
        autohlod = value
        if autohlod then
            local function modifyPrompt(prompt)
                prompt.HoldDuration = 0 
            end 
            
            local function isTargetPrompt(prompt)
                local parent = prompt.Parent 
                while parent do 
                    if parent == workspace or parent == workspace.BankRobbery.VaultDoor then 
                        return true 
                    end 
                    parent = parent.Parent 
                end 
                return false 
            end 
            
            for _, prompt in ipairs(workspace:GetDescendants()) do
                if prompt:IsA("ProximityPrompt") and isTargetPrompt(prompt) then
                    modifyPrompt(prompt)
                end
            end 
            
            workspace.DescendantAdded:Connect(function(instance)
                if instance:IsA("ProximityPrompt") and isTargetPrompt(instance) then
                    modifyPrompt(instance)
                end
            end)
        end
    end
})

Main:Toggle({
    Title = "无限跳",
    Default = false,
    Callback = function(Value)
        local jumpConn
        if Value then
            jumpConn = game:GetService("UserInputService").JumpRequest:Connect(function()
                local humanoid = game:GetService("Players").LocalPlayer.Character and
                                 game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        else
            if jumpConn then
                jumpConn:Disconnect()
                jumpConn = nil
            end
        end
    end
})
WindUI:Notify({
                        Title = "大司马",
                        Content = "为你自动切换英文，自己调整",
                        Duration = 3,
                        Icon = "alert-circle"
                    })
                    
                    WindUI:Notify({
                        Title = "大司马脚本",
                        Content = "为你自动切换英文，自己调整",
                        Duration = 3,
                        Icon = "alert-circle"
                    })
                    
                    WindUI:Notify({
                        Title = "小云",
                        Content = "为你自动切换英文，自己调整",
                        Duration = 3,
                        Icon = "alert-circle"
                    })
                    
                    WindUI:Notify({
                        Title = "猫王",
                        Content = "为你自动切换英文，自己调整",
                        Duration = 3,
                        Icon = "alert-circle"
                    })
                    
                    WindUI:Notify({
                        Title = "云脚本",
                        Content = "为你自动切换英文，自己调整",
                        Duration = 3,
                        Icon = "alert-circle"
                    })
end
WindUI:Notify({
                        Title = "猫脚本",
                        Content = "为你自动切换英文，自己调整",
                        Duration = 3,
                        Icon = "alert-circle"
                    })
