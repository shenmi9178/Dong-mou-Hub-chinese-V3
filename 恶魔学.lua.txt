local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Confirmed = false

WindUI:Popup({
    Title = "shenmiV2脚本",
    IconThemed = true,
    Content = "欢迎尊贵的用户" .. game.Players.LocalPlayer.Name .. "使用shemi脚本 当前版本型号:V2",
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
        Title = "shenmiV2脚本",
        Icon = "palette",
    Author = "尊贵的"..game.Players.localPlayer.Name.."欢迎使用shenmiV2脚本", 
        Folder = "Premium",
        Size = UDim2.fromOffset(550, 320),
        Theme = "Light",
        User = {
            Enabled = true,
            大司马 = true,
            Callback = function()
            end
        },
        SideBarWidth = 200,
        HideSearchBar = false,  
    })

    Window:Tag({
        Title = "恶魔学",
        Color = Color3.fromHex("#00ffff") 
    })

    Window:EditOpenButton({
        Title = "大司马脚本 V2",
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

       local GhostTab = Window:Tab({Title = "鬼魂功能", Icon = "ghost"})
local PlayerTab = Window:Tab({Title = "玩家功能", Icon = "user"})
local ItemTab = Window:Tab({Title = "物品功能", Icon = "package"})
local RoomTab = Window:Tab({Title = "房间功能", Icon = "package"})
local VisualTab = Window:Tab({Title = "视觉功能", Icon = "eye"})
local TrollTab = Window:Tab({Title = "恶搞功能", Icon = "zap"})

local stuff = {
    SeeGhost = false,
    prints = nil,
    ghostSeePlayerDistance = 15,
    ghostSeePlayerEnabled = false,
    sayInchat = false,
    sayInchat2 = false,
    playerChatted = {},
    warningHunt = nil
}

GhostTab:Toggle({
    Title = "显示鬼魂",
    Default = false,
    Callback = function(Value)
        stuff.SeeGhost = Value
        task.spawn(function()
            while stuff.SeeGhost do
                task.wait()
                if workspace:WaitForChild("Ghost"):GetAttribute("VisualModel") == "Biter" and game.Players.LocalPlayer:GetAttribute("TrypophobiaSafe") == true then
                    workspace:WaitForChild("Ghost"):WaitForChild("HumanoidRootPart"):WaitForChild("Cat"):WaitForChild("ImageLabel").ImageTransparency = 0.25
                else
                    local transparency = workspace:WaitForChild("Ghost"):GetAttribute("Transparency") or 0.25
                    transparency = transparency <= 0.25 and transparency or 0.25
                    
                    for _, d in pairs(workspace:WaitForChild("Ghost").VisibleParts:GetDescendants()) do
                        if d:IsA("BasePart") then
                            d.Transparency = transparency
                        elseif d:IsA("ParticleEmitter") or d:IsA("Light") then
                            d.Enabled = true
                        end
                    end
                end
            end
            
            for _, d in pairs(workspace:WaitForChild("Ghost").VisibleParts:GetDescendants()) do
                if d:IsA("BasePart") then
                    d.Transparency = 1
                elseif d:IsA("ParticleEmitter") or d:IsA("Light") then
                    d.Enabled = false
                end
            end
        end)
    end
})

GhostTab:Toggle({
    Title = "显示鬼魂手印",
    Default = false,
    Callback = function(Value)
        if stuff.prints then
            stuff.prints:Disconnect()
            stuff.prints = nil
        end

        if Value then
            for _, d in pairs(workspace.Handprints:GetChildren()) do
                d:FindFirstChildOfClass("Decal").Transparency = 0
            end

            stuff.prints = workspace.Handprints.ChildAdded:Connect(function(handprint)
                handprint:FindFirstChildOfClass("Decal").Transparency = 0
            end)
        else
            for _, d in pairs(workspace.Handprints:GetChildren()) do
                d:FindFirstChildOfClass("Decal").Transparency = 1
            end
        end
    end
})

GhostTab:Button({
    Title = "获取鬼魂信息",
    Callback = function()
        local Ghost = workspace:WaitForChild("Ghost")
        local info = {
            age = tostring(Ghost:GetAttribute("Age")),
            favroom = Ghost:GetAttribute("FavoriteRoom"),
            crntroom = Ghost:GetAttribute("CurrentRoom"),
            gender = Ghost:GetAttribute("Gender"),
            mdlName = Ghost:GetAttribute("VisualModel")
        }

        if stuff.sayInchat then
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("AskSpiritBoxFromUI"):FireServer(
                "鬼魂是一个"..string.lower(info.gender)..", 年龄 "..info.age.." 它最喜欢的房间是 "..string.lower(info.favroom)
            )
        else
            WindUI:Notify({
                Title = "鬼魂信息",
                Content = info.gender.." | 年龄 "..info.age.."\n鬼魂房间 | "..info.favroom,
                Duration = 5
            })
        end
    end
})

GhostTab:Button({
    Title = "获取鬼魂当前房间",
    Callback = function()
        local crntroom = workspace:WaitForChild("Ghost"):GetAttribute("CurrentRoom")
        
        if stuff.sayInchat then
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("AskSpiritBoxFromUI"):FireServer(
                "鬼魂在"..string.lower(crntroom)
            )
        else
            WindUI:Notify({
                Title = "鬼魂信息",
                Content = crntroom,
                Duration = 5
            })
        end
    end
})

GhostTab:Toggle({
    Title = "在聊天中显示鬼魂信息",
    Default = false,
    Callback = function(Value)
        stuff.sayInchat = Value
    end
})

GhostTab:Toggle({
    Title = "鬼魂接近通知(仅在狩猎时有效)",
    Default = false,
    Callback = function(Value)
        stuff.ghostSeePlayerEnabled = Value
        
        task.spawn(function()
            while stuff.ghostSeePlayerEnabled do
                task.wait(1)
                local distanceGhost = (workspace:WaitForChild("Ghost"):WaitForChild("HumanoidRootPart").Position - 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude

                if distanceGhost <= stuff.ghostSeePlayerDistance and distanceGhost >= 5 and 
                    workspace:WaitForChild("Ghost"):GetAttribute("Hunting") then
                    
                    WindUI:Notify({
                        Title = "鬼魂警告",
                        Content = "鬼魂距离你"..tostring(math.floor(distanceGhost)).."单位",
                        Duration = 3.5
                    })
                end
            end
        end)
    end
})

GhostTab:Toggle({
    Title = "鬼魂狩猎事件通知",
    Default = false,
    Callback = function(Value)
        if Value then
            stuff.warningHunt = workspace:WaitForChild("Ghost"):GetAttributeChangedSignal("Hunting"):Connect(function()
                if workspace:WaitForChild("Ghost"):GetAttribute("Hunting") == true then
                    WindUI:Notify({
                        Title = "狩猎警告",
                        Content = "鬼魂开始狩猎!",
                        Duration = 5
                    })
                else
                    WindUI:Notify({
                        Title = "狩猎警告",
                        Content = "鬼魂结束狩猎!",
                        Duration = 5
                    })
                end
            end)
        elseif stuff.warningHunt then
            stuff.warningHunt:Disconnect()
            stuff.warningHunt = nil
        end
    end
})

GhostTab:Button({
    Title = "触发所有盐堆",
    Callback = function()
        local SaltPiles = workspace.SaltPiles:GetChildren()
        local NormalPiles = {}
        
        for _, d in pairs(SaltPiles) do
            if d.Name == "SaltLine" then
                table.insert(NormalPiles, d)
            end
        end

        if #NormalPiles > 0 then
            for _, d in pairs(NormalPiles) do
                task.spawn(function()
                    firetouchinterest(workspace.Ghost.Torso, d:WaitForChild("GhostTracker"), 0)
                    firetouchinterest(workspace.Ghost.Torso, d:WaitForChild("GhostTracker"), 1)
                end)
            end
        else
            WindUI:Notify({
                Title = "盐堆触发",
                Content = "没有盐堆!",
                Duration = 3.5
            })
        end
    end
})

GhostTab:Button({
    Title = "检查是否为无头骑士",
    Callback = function()
        local isHeadless = workspace:WaitForChild("Ghost"):GetAttribute("Headless")
        
        WindUI:Notify({
            Title = "无头骑士检查",
            Content = isHeadless and "鬼魂是无头骑士!" or "鬼魂不是无头骑士",
            Duration = 3.5
        })
    end
})

GhostTab:Button({
    Title = "检查鬼魂球体",
    Callback = function()
        WindUI:Notify({
            Title = "鬼魂球体检查",
            Content = workspace:FindFirstChild("GhostOrb") and "有鬼魂球体" or "没有鬼魂球体",
            Duration = 3.5
        })
    end
})

GhostTab:Button({
    Title = "检查手印",
    Callback = function()
        WindUI:Notify({
            Title = "手印检查",
            Content = #workspace.Handprints:GetChildren() > 0 and "有手印" or "没有手印",
            Duration = 3.5
        })
    end
})

GhostTab:Button({
    Title = "检查激光可见性",
    Callback = function()
        local ghostLaserVisible = workspace:WaitForChild("Ghost"):GetAttribute("LaserVisible") and 
            workspace:WaitForChild("Ghost"):GetAttribute("Transparency") < 1
        
        WindUI:Notify({
            Title = "激光可见性检查",
            Content = ghostLaserVisible and "鬼魂对激光可见!" or 
                "鬼魂对激光不可见\n这可能是错误，请确保将激光投影仪放在鬼魂喜欢的房间",
            Duration = ghostLaserVisible and 3.5 or 7.5
        })
    end
})

PlayerTab:Toggle({
    Title = "通知聊天消息",
    Default = false,
    Callback = function(Value)
        if Value then
            for _, d in pairs(game.Players:GetChildren()) do
                if d ~= game.Players.LocalPlayer then
                    stuff.playerChatted[d.Name] = d.Chatted:Connect(function(msg)
                        local topName = d.Name
                        
                        if workspace:WaitForChild("Ragdolls"):FindFirstChild(d.Name) then
                            topName = topName.. " (死亡)"
                        end
                        
                        WindUI:Notify({
                            Title = topName.." 说:",
                            Content = msg,
                            Duration = 10
                        })

                        if stuff.sayInchat2 then
                            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("AskSpiritBoxFromUI"):FireServer(
                                topName.." 说: ".. msg
                            )
                        end
                    end)
                end
            end
        else
            for _, d in pairs(stuff.playerChatted) do
                d:Disconnect()
            end
            stuff.playerChatted = {}
        end
    end
})

PlayerTab:Toggle({
    Title = "在聊天中通知消息",
    Default = false,
    Callback = function(Value)
        stuff.sayInchat2 = Value
    end
})

ItemTab:Button({
    Title = "使用激光扫描仪",
    Callback = function()
        local function ridarScan()
            local v1 = game:GetService("ReplicatedStorage")
            local v2 = game:GetService("UserInputService")
            local u3 = game:GetService("RunService")
            local u4 = game:GetService("Players").LocalPlayer
            local v5 = u4:WaitForChild("PlayerScripts")
            local u8 = v5:WaitForChild("Events")
            local u9 = workspace:FindFirstChild("LIDAR_V2") or Instance.new("Folder")
            local u10 = workspace.CurrentCamera
            local u11 = nil
            local u12 = false

            u9.Name = "LIDAR_V2"
            u9.Parent = workspace

            local function GenerateScreenPoints(p13, p14, p15)
                local v16 = p14 * p15
                local v17 = v16 * p13
                local v18 = math.ceil(v17)
                local v19 = v16 / v18
                local v20 = math.sqrt(v19)
                local v21 = p15 / v20
                local v22 = math.floor(v21)
                local v23 = p14 / v20
                local v24 = math.floor(v23)
                local v25 = {}
                for v26 = 0, v22 - 1 do
                    for v27 = 0, v24 - 1 do
                        if v18 <= #v25 then
                            break
                        end
                        local v28 = math.random
                        local v29 = v27 * v20
                        local v30 = (v27 + 1) * v20 - 1
                        local v31 = v28(v29, (math.min(v30, p14)))
                        local v32 = math.random
                        local v33 = v26 * v20
                        local v34 = (v26 + 1) * v20 - 1
                        local v35 = v32(v33, (math.min(v34, p15)))
                        local v36 = Vector2.new
                        table.insert(v25, v36(v31, v35))
                    end
                end
                return v25
            end

            local function GetColorFromScreenPosition(p37)
                local v38 = Vector2.new(u10.ViewportSize.X / 2, u10.ViewportSize.Y / 2)
                local v39 = (p37 - v38).Magnitude / (v38.Magnitude * 0.7)
                local v40 = math.clamp(v39, 0, 1)
                local v41
                if v40 < 0.5 then
                    local v42 = v40 * 2
                    v41 = Color3.new(1 - v42, v42, 0)
                else
                    local v43 = (v40 - 0.5) * 2
                    v41 = Color3.new(v43, 1, v43)
                end
                local v44, v45, v46 = v41:ToHSV()
                return Color3.fromHSV(v44, v45, v46 * 0.7)
            end

            local function CreateLidarSpheres(p47, p48)
                local v49 = p48:ViewportPointToRay(p47.X, p47.Y)
                local v50 = RaycastParams.new()
                v50.FilterDescendantsInstances = { u4.Character }
                v50.FilterType = Enum.RaycastFilterType.Exclude
                local v51 = workspace:Raycast(v49.Origin, v49.Direction * 1000, v50)
                if v51 then
                    local v52 = v5.ItemControllers:WaitForChild("LIDAR Scanner").Part:Clone()
                    v52.Position = v51.Position
                    v52.Color = GetColorFromScreenPosition(p47)
                    v52.Parent = u9
                end
            end

            local function RenderLidarOutput()
                local v53 = u10.ViewportSize.X
                local v54 = u10.ViewportSize.Y
                local v55 = GenerateScreenPoints(0.001, v53, v54)
                workspace.LIDAR:ClearAllChildren()
                local v56 = workspace:FindFirstChild("Ghost"):Clone()
                for _, v57 in v56:GetDescendants() do
                    if v57:IsA("BasePart") then
                        v57.CanCollide = false
                        v57.CanQuery = true
                        v57.Anchored = true
                        v57.CollisionGroup = "Default"
                        v57.Transparency = 1
                    end
                end
                v56.Parent = workspace
                for v58, v59 in ipairs(v55) do
                    if v58 % 100 == 0 then
                        u3.Heartbeat:Wait()
                    end
                    CreateLidarSpheres(v59, u10)
                end
                v56:Destroy()
            end

            RenderLidarOutput()
        end

        ridarScan()
    end
})

ItemTab:Button({
    Title = "通知所有稀有物品",
    Callback = function()
        local found = false

        for _, d in pairs(workspace:WaitForChild("Items"):GetChildren()) do
            if d:GetAttribute("ItemName") then
                local NameItem = d:GetAttribute("ItemName")
                local er = true

                if d:GetAttribute("Uninteractable") == true or d:GetAttribute("Broken") == true then
                    er = false
                end

                if er and (NameItem == "Energy Drink" or NameItem == "Music Box" or 
                    NameItem == "Umbra Board" or NameItem == "Energy Watch" or tonumber(d.Name) >= 100) then
                    
                    found = true
                    WindUI:Notify({
                        Title = "稀有物品警告",
                        Content = "发现稀有物品 "..NameItem,
                        Duration = 3.5
                    })

                    local hightlight = Instance.new("Highlight")
                    hightlight.Parent = d
                    hightlight.FillColor = Color3.fromRGB(37, 161, 255)
                    game:GetService("Debris"):AddItem(hightlight,5)
                end
            end
        end

        if not found then
            WindUI:Notify({
                Title = "稀有物品警告",
                Content = "未找到稀有物品",
                Duration = 3.5
            })
        end
    end
})

ItemTab:Button({
    Title = "切换保险丝盒",
    Callback = function()
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ToggleFuseBox"):FireServer()
    end
})

RoomTab:Button({
    Title = "获取当前房间温度",
    Callback = function()
        local room = game.Players.LocalPlayer:GetAttribute("CurrentRoom")
        
        if workspace:WaitForChild("Map"):WaitForChild("Rooms"):FindFirstChild(room) and 
            workspace:WaitForChild("Map"):WaitForChild("Rooms"):WaitForChild(room):GetAttribute("Temperature") then
            
            WindUI:Notify({
                Title = "房间温度检查",
                Content = room.."的温度是 "..tostring(workspace:WaitForChild("Map"):WaitForChild("Rooms"):WaitForChild(room):GetAttribute("Temperature")),
                Duration = 3.5
            })
        end
    end
})

RoomTab:Toggle({
    Title = "通知鬼魂房间温度低于0°C",
    Default = false,
    Callback = function(Value)
        if Value then
            local room = workspace:WaitForChild("Ghost"):GetAttribute("FavoriteRoom")
            
            if workspace:WaitForChild("Map"):WaitForChild("Rooms"):WaitForChild(room):GetAttribute("Temperature") <= 0 then
                WindUI:Notify({
                    Title = "房间温度检查(鬼魂)",
                    Content = room.."的温度低于0°C!",
                    Duration = 3.5
                })
            end

            workspace:WaitForChild("Map"):WaitForChild("Rooms"):WaitForChild(room):GetAttributeChangedSignal("Temperature"):Connect(function()
                if workspace:WaitForChild("Map"):WaitForChild("Rooms"):WaitForChild(room):GetAttribute("Temperature") <= 0 then
                    WindUI:Notify({
                        Title = "房间温度检查(鬼魂)",
                        Content = room.."的温度低于0°C!",
                        Duration = 3.5
                    })
                end
            end)
        end
    end
})

RoomTab:Toggle({
    Title = "穿门无碰撞",
    Default = false,
    Callback = function(Value)
        for _, d in pairs(workspace.Doors:GetChildren()) do
            task.spawn(function()
                for _, d22 in pairs(d:WaitForChild("Door"):GetChildren()) do
                    if d22:IsA("BasePart") and d22.Name ~= "GhostTracker" then
                        d22.CanCollide = not Value
                    end
                end
            end)
        end
    end
})

VisualTab:Toggle({
    Title = "最大亮度",
    Default = false,
    Callback = function(Value)
        if Value then
            game.Lighting.Brightness = 2
            game.Lighting.ClockTime = 14
            game.Lighting.GlobalShadows = false
            game.Lighting.OutdoorAmbient = Color3.fromRGB(209, 209, 209)
        else
            game.Lighting.Brightness = 0
            game.Lighting.ClockTime = 0
            game.Lighting.GlobalShadows = true
            game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
        end
    end
})

TrollTab:Toggle({
    Title = "刷门(卡顿)",
    Default = false,
    Callback = function(Value)
        task.spawn(function()
            while Value do
                task.wait()
                for _, d in pairs(workspace.Doors:GetChildren()) do
                    if d:GetAttribute("Locked") ~= true then
                        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ClientChangeDoorState"):FireServer(d:WaitForChild("Door"))
                    end
                end
            end
        end)
    end
})

TrollTab:Toggle({
    Title = "刷灯(卡顿)",
    Default = false,
    Callback = function(Value)
        task.spawn(function()
            while Value do
                task.wait()
                for _, d in pairs(workspace.Map.Rooms:GetChildren()) do
                    if d:FindFirstChild("LightSwitch") then
                        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("UseLightSwitch"):FireServer(d)
                    end
                end
            end
        end)
    end
})

TrollTab:Button({
    Title = "让所有物品消失",
    Callback = function()
        task.spawn(function()
            while task.wait() do
                for _, d in pairs(workspace.Items:GetChildren()) do
                    if d.PrimaryPart then
                        local newForce = Instance.new("BodyPosition",d.PrimaryPart)
                        newForce.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
                        newForce.Position = Vector3.new(1000000,1000000,1000000)
                    end
                end

                for _, d in pairs(game.Players:GetChildren()) do
                    local Tools = d:WaitForChild("ToolsHolder")

                    for _, d in pairs(Tools:GetChildren()) do
                        if d.PrimaryPart then
                            local newForce = Instance.new("BodyPosition",d.PrimaryPart)
                            newForce.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
                            newForce.Position = Vector3.new(1000000,1000000,1000000)
                        end
                    end
                end
            end
        end)
    end
})
end