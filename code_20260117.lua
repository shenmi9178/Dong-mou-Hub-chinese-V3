-- DM脚本工作室 | DM 专属标识
local StudioTag = "[DM Script Studio - DM]"
print(StudioTag .. " 脚本加载中...")

-- 核心配置
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local CurrentRoom = nil
local AutoOpenDistance = 15 -- 自动开门触发距离（单位： studs）
local PickupDistance = 10 -- 自动拾取触发距离（单位： studs）
-- 可拾取物品名称列表，可根据游戏更新补充
local CollectableItems = {"Coin", "Key", "Lighter", "Flashlight", "Battery"}
-- 透视书配置（50号房图书馆关键书）
local BookConfig={
    Names={"Book", "数字书", "FormBook"}, -- 关键书名称，按需补充
    HighlightColor=Color3.new(0, 0.8, 1), -- 透视书：蓝色高亮（区别普通物品）
    IsAutoPickup=true -- 开启自动拾取关键书
}
-- 怪物躲避提示配置表
local MonsterTips = {
    ["Seek"] = "立即找柜子或桌子躲避！不要跑动！",
    ["Rush"] = "快速躲进最近的衣柜/角落！它会冲过房间！",
    ["Screech"] = "立刻盯着它！移开视线会受到攻击！",
    ["Ambush"] = "不要待在门口！反复进出房间规避！",
    ["Figure"] = "降低移动音量！尽量绕开它的巡逻路线！"
}
-- 透视高亮颜色配置（RGB）
local HighlightColors={
    Monster = Color3.new(1, 0, 0), -- 怪物：红色
    Door = Color3.new(0, 1, 0),    -- 门：绿色
    Item = Color3.new(1, 1, 0),    -- 物品：黄色
    Book=BookConfig.HighlightColor -- 透视书：蓝色
}

local ESPEnabled = true -- ESP初始状态
local HighlightCache={} -- 高亮对象缓存

-- 创建ESP开关按钮
local function CreateESPToggle()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "DM_ESPGui"
    ScreenGui.Parent = Player.PlayerGui

    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Name = "DM_ESPToggle"
    ToggleBtn.Size = UDim2.new(0, 120, 0, 50)
    ToggleBtn.Position = UDim2.new(0.9, -130, 0.5, 0)
    ToggleBtn.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    ToggleBtn.TextColor3 = Color3.new(1, 1, 1)
    ToggleBtn.Font = Enum.Font.SourceSansBold
    ToggleBtn.TextSize = 16
    ToggleBtn.Text = ESPEnabled and "关闭透视" or "开启透视"
    ToggleBtn.Parent = ScreenGui

    -- 按钮点击事件
    ToggleBtn.MouseButton1Click:Connect(function()
        ESPEnabled = not ESPEnabled
        ToggleBtn.Text = ESPEnabled and "关闭透视" or "开启透视"
        ToggleBtn.BackgroundColor3 = ESPEnabled and Color3.new(0.2, 0.2, 0.2) or Color3.new(0.4, 0.1, 0.1)
        
        -- 切换所有高亮对象显示状态
        for obj, highlight in pairs(HighlightCache) do
            if obj and obj.Parent then
                highlight.Enabled = ESPEnabled
            else
                HighlightCache[obj] = nil
            end
        end
        print(StudioTag .. (ESPEnabled and " 透视功能已开启" or " 透视功能已关闭"))
    end)
end

-- 通用高亮创建函数（透视核心）
local function CreateHighlight(obj, color)
    if not obj or obj:FindFirstChild("DM_Highlight") then return end
    local highlight=Instance.new("Highlight")
    highlight.Name = "DM_Highlight"
    highlight.FillColor=color
    highlight.OutlineColor=color
    highlight.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop -- 穿透墙体显示
    highlight.FillTransparency=0.5
    highlight.OutlineTransparency=0
    highlight.Enabled = ESPEnabled
    highlight.Parent=obj
    HighlightCache[obj] = highlight -- 加入缓存
end

-- 透视书高亮+自动拾取逻辑
local function EnableBookESPAndAutoPickup()
    -- 高亮关键书
    local function HighlightAllBooks()
        for _, room in pairs(workspace.Rooms:GetChildren()) do
            for _, obj in pairs(room:GetDescendants()) do
                if table.find(BookConfig.Names, obj.Name) then
                    CreateHighlight(obj, HighlightColors.Book)
                end
            end
        end
    end
    HighlightAllBooks()
    -- 监听新生成的关键书
    workspace.Rooms.DescendantAdded:Connect(function(obj)
        if table.find(BookConfig.Names, obj.Name) then
            CreateHighlight(obj, HighlightColors.Book)
        end
    end)

    -- 自动拾取关键书（如果启用）
    if BookConfig.IsAutoPickup then
        task.spawn(function()
            while task.wait(0.1) do
                local charPos=Character:FindFirstChild("HumanoidRootPart")?.Position
                if not charPos or not ESPEnabled then continue end
                
                for _, room in pairs(workspace.Rooms:GetChildren()) do
                    for _, obj in pairs(room:GetDescendants()) do
                        if table.find(BookConfig.Names, obj.Name) then
                            local objPos=obj.Position
                            if (objPos-charPos).Magnitude < PickupDistance then
                                if obj:FindFirstChild("TouchInterest") then
                                    firetouchinterest(Character.HumanoidRootPart, obj, 0)
                                    firetouchinterest(Character.HumanoidRootPart, obj, 1)
                                    print(StudioTag .. " 已自动拾取透视书: " .. obj.Name)
                                    task.wait(0.5) -- 防止重复拾取
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
    print(StudioTag .. " 透视书功能已初始化（高亮+自动拾取）")
end

-- 透视功能：高亮怪物、门、物品
local function EnableESP()
    -- 高亮怪物
    workspace.ChildAdded:Connect(function(child)
        if MonsterTips[child.Name] then
            CreateHighlight(child, HighlightColors.Monster)
        end
    end)
    -- 高亮房间门
    local function HighlightAllDoors()
        for _, room in pairs(workspace.Rooms:GetChildren()) do
            if room:IsA("Model") and room:FindFirstChild("Door") then
                CreateHighlight(room.Door, HighlightColors.Door)
            end
        end
    end
    HighlightAllDoors()
    workspace.Rooms.ChildAdded:Connect(function(room)
        task.wait(0.1) -- 等待门加载
        HighlightAllDoors()
    end)
    -- 高亮可拾取物品
    local function HighlightAllItems()
        for _, room in pairs(workspace.Rooms:GetChildren()) do
            for _, obj in pairs(room:GetDescendants()) do
                if table.find(CollectableItems, obj.Name) then
                    CreateHighlight(obj, HighlightColors.Item)
                end
            end
        end
    end
    HighlightAllItems()
    workspace.Rooms.DescendantAdded:Connect(function(obj)
        if table.find(CollectableItems, obj.Name) then
            CreateHighlight(obj, HighlightColors.Item)
        end
    end)

    -- 启动透视书功能
    EnableBookESPAndAutoPickup()
    print(StudioTag .. " 透视(ESP)功能已初始化")
end

-- 房间信息获取函数
local function GetCurrentRoom()
    for _, v in pairs(workspace.Rooms:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Door") then
            local doorPos=v.Door.Position
            local charPos=Character.HumanoidRootPart.Position
            if (doorPos-charPos).Magnitude < 30 then
                return v
            end
        end
    end
    return nil
end

-- 通用提示创建函数
local function CreateAlert(text, color)
    local ScreenGui=Instance.new("ScreenGui")
    ScreenGui.Parent=Player.PlayerGui
    local TextLabel=Instance.new("TextLabel")
    TextLabel.Text=text
    TextLabel.TextColor3=color or Color3.new(1, 0, 0)
    TextLabel.BackgroundTransparency=0.3
    TextLabel.BackgroundColor3=Color3.new(0, 0, 0)
    TextLabel.Size=UDim2.new(0, 500, 0, 60)
    TextLabel.Position=UDim2.new(0.5, -250, 0.1, 0)
    TextLabel.Font=Enum.Font.SourceSansBold
    TextLabel.TextSize=22
    TextLabel.Parent=ScreenGui
    -- 5秒后移除提示
    task.wait(5)
    ScreenGui:Destroy()
end

-- 怪物预警+躲避提示函数
local function MonsterAlert()
    workspace.ChildAdded:Connect(function(child)
        local monsterName=child.Name
        if MonsterTips[monsterName] then
            local alertMsg=StudioTag .. " 警告！检测到 " .. monsterName .. " | " .. MonsterTips[monsterName]
            -- 红色紧急提示
            CreateAlert(alertMsg, Color3.new(1, 0, 0))
            print(alertMsg)
        end
    end)
end

-- 房间信息实时显示
local function ShowRoomInfo()
    while task.wait(1) do
        CurrentRoom=GetCurrentRoom()
        if CurrentRoom then
            local roomInfo=StudioTag .. " 当前房间: " .. CurrentRoom.Name .. " | 房间编号: " .. CurrentRoom:GetAttribute("RoomNumber")
            print(roomInfo)
        end
    end
end

-- 防摔死功能
local function AntiFall()
    Humanoid.FreeFalling:Connect(function(isFalling)
        if isFalling and Character.HumanoidRootPart.Position.Y < -50 then
            Humanoid.Health=0
            print(StudioTag .. " 检测到高空坠落，触发重生")
        end
    end)
end

-- 自动开门功能
local function AutoOpenDoor()
    while task.wait(0.2) do
        for _, room in pairs(workspace.Rooms:GetChildren()) do
            if room:IsA("Model") and room:FindFirstChild("Door") then
                local door=room.Door
                local charPos=Character:FindFirstChild("HumanoidRootPart")?.Position
                if not charPos then continue end

                -- 判断距离是否触发自动开门
                if (door.Position-charPos).Magnitude < AutoOpenDistance then
                    -- 模拟交互开门（适配Doors默认门机制）
                    if door:FindFirstChild("Open") then
                        door.Open:FireServer()
                        print(StudioTag .. " 已自动打开房门: " .. room.Name)
                        task.wait(2) -- 防止重复触发
                    end
                end
            end
        end
    end
end

-- 自动拾取物品功能
local function AutoPickupItems()
    while task.wait(0.1) do
        local charPos=Character:FindFirstChild("HumanoidRootPart")?.Position
        if not charPos then continue end
        
        -- 遍历房间内所有子对象
        for _, room in pairs(workspace.Rooms:GetChildren()) do
            for _, obj in pairs(room:GetDescendants()) do
                -- 判断是否为可拾取物品
                if table.find(CollectableItems, obj.Name) then
                    local objPos=obj.Position
                    if (objPos-charPos).Magnitude < PickupDistance then
                        -- 模拟拾取交互
                        if obj:FindFirstChild("TouchInterest") then
                            firetouchinterest(Character.HumanoidRootPart, obj, 0)
                            firetouchinterest(Character.HumanoidRootPart, obj, 1)
                            print(StudioTag .. " 已自动拾取物品: " .. obj.Name)
                            task.wait(0.5) -- 防止重复拾取
                        end
                    end
                end
            end
        end
    end
end

-- 启动脚本所有功能
CreateESPToggle() -- 先创建开关按钮
task.spawn(EnableESP)
task.spawn(EnableBookESPAndAutoPickup) -- 启动透视书功能
MonsterAlert()
task.spawn(ShowRoomInfo)
AntiFall()
task.spawn(AutoOpenDoor)
task.spawn(AutoPickupItems)

print(StudioTag .. " 脚本加载完成！")
