if not game:IsLoaded() then
game.Loaded:Wait()
end
if writefile then
writefile = nil
end
--------------------------
game.TextChatService.ChatWindowConfiguration.Enabled = true
---------------------------
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/gycgchgyfytdttr/shenqin/refs/heads/main/ui.lua"))()
local Confirmed = false
WindUI:Popup({
Title = 'DM OHIO 1.0.9',
IconThemed = true,
Icon = "crown",
Content = "欢迎尊重的用户使用DM HUB\n你的支持是我们更新的动力",
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
Title = 'DM HUB',
Icon = "crown",
IconThemed = true,
Author = "v3.0|by 屑冬某",
Folder = "CloudHub",
Size = UDim2.fromOffset(580, 440),
Transparent = true,
Theme = "Dark",
HideSearchBar = false,
ScrollBarEnabled = true,
Resizable = true,
Background = "",
BackgroundImageTransparency = 0.5,
User = {
Enabled = true,
Callback = function()
WindUI:Notify({
Title = "点击了自己",
Content = "没什么",
Duration = 1,
Icon = "4483362748"
})
end,
Anonymous = false
},
SideBarWidth = 250,
Search = {
Enabled = true,
Placeholder = "搜索...",
Callback = function(searchText)
print("搜索内容:", searchText)
end
},
SidePanel = {
Enabled = true,
Content = {
{
Type = "Button",
Text = "",
Style = "Subtle",
Size = UDim2.new(1, -20, 0, 30),
Callback = function()
end
}
}
}
})
Window:EditOpenButton({
Title = "DM HUB",
Icon = "crown",
CornerRadius = UDim.new(0,16),
StrokeThickness = 4,
Color = ColorSequence.new(Color3.fromHex("FF6B6B")),
Draggable = true,
})
Window:Tag({
Title = "俄亥俄州",
Color = Color3.fromHex("#FFA500")
})
Window:Tag({
Title = "1.0.9",
Color = Color3.fromHex("#FFA500")
})
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local devv = require(ReplicatedStorage.devv)
local Signal = devv.load("Signal")
local v3item = devv.load("v3item")
local GUID = require(ReplicatedStorage.devv.shared.Helpers.string.GUID)
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")
local settings = {
color = Color3.fromRGB(252, 3, 90),
antifog = true,
fpsCap = 900
}
if setfpscap then
setfpscap(settings.fpsCap)
end
local Main = Window:Tab({Title = "基本功能", Icon = "move"})
Main:Toggle({
Title = "防雾",
Value = settings.antifog,
Callback = function(state)
settings.antifog = state
if state then
Lighting.Atmosphere.Density = 0
Lighting.Atmosphere:GetPropertyChangedSignal("Density"):Connect(function()
if Lighting.Atmosphere.Density > 0 then
Lighting.Atmosphere.Density = 0
end
end)
end
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
Main:Section({ Title = "移动设置", Icon = "move" })
local tpWalkEnabled = false
local tpWalkMode = "MoveDirection"
local tpWalkSpeed = 3.5
Main:Toggle({
Title = "TP行走",
Desc = "启用传送行走模式",
Value = false,
Callback = function(state)
tpWalkEnabled = state
if state then
local connection = RunService.Heartbeat:Connect(function()
if tpWalkEnabled and HumanoidRootPart then
local direction
if tpWalkMode == "MoveDirection" then
direction = Humanoid.MoveDirection
else
direction = Workspace.CurrentCamera.CFrame.LookVector
end
HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + direction * tpWalkSpeed
HumanoidRootPart.CanCollide = true
end
end)
end
end
})
Main:Dropdown({
Title = "TP行走模式",
Desc = "选择TP行走的移动方向",
Values = {"MoveDirection", "Camera LookVector"},
Value = "MoveDirection",
Callback = function(value)
tpWalkMode = value
end
})
Main:Slider({
Title = "TP行走速度",
Desc = "设置TP行走的移动速度",
Value = {
Min = 0.1,
Max = 11,
Default = 3.5
},
Callback = function(value)
tpWalkSpeed = value
end
})
Main:Toggle({
Title = "扩大视野 (开/关)",
Default = false,
Callback = function(v)
if v == true then
fovConnection = game:GetService("RunService").Heartbeat:Connect(function()
workspace.CurrentCamera.FieldOfView = 120
end)
elseif not v and fovConnection then
fovConnection:Disconnect()
fovConnection = nil
end
end
})
Main:Slider({
Title = "视野范围设置",
Desc = "调整视野大小",
Value = {
Min = 70,
Max = 120,
Default = 120,
},
Callback = function(Value)
if fovConnection then
workspace.CurrentCamera.FieldOfView = Value
end
end
})
local infiniteJumpEnabled = false
local jumpPower = 50
Main:Toggle({
Title = "无限跳跃",
Value = false,
Callback = function(state)
infiniteJumpEnabled = state
if state then
game:GetService("UserInputService").JumpRequest:Connect(function()
if infiniteJumpEnabled and Humanoid then
Humanoid:ChangeState("Jumping")
end
end)
end
end
})
Main:Slider({
Title = "跳跃力量",
Desc = "设置跳跃高度",
Value = {
Min = 10,
Max = 250,
Default = 50
},
Callback = function(value)
jumpPower = value
Humanoid.UseJumpPower = true
Humanoid.JumpPower = jumpPower
end
})
local speedMultiplier = 1
Main:Slider({
Title = "速度倍数",
Desc = "调整移动速度倍数",
Value = {
Min = 1,
Max = 30,
Default = 1
},
Callback = function(value)
speedMultiplier = value
LocalPlayer:SetAttribute("speedModifier", speedMultiplier)
end
})
local aimAssistLevel = 0
Main:Slider({
Title = "瞄准辅助",
Desc = "设置瞄准辅助敏感度",
Value = {
Min = 0,
Max = 20,
Default = 0
},
Callback = function(value)
aimAssistLevel = value
LocalPlayer:SetAttribute("aimAssistSensitivity", aimAssistLevel)
end
})
do local TouchFlingModule={}TouchFlingModule.Version="1.0" TouchFlingModule.LoadTime=tick()local flingEnabled=false local flingPower=10000 local flingThread=nil local flingMove=0.1 Main:Input({Title="碰飞距离",Desc="大小",Value=tostring(flingPower),Placeholder="输入",Color=Color3.fromRGB(0,170,255),Callback=function(Value)local power=tonumber(Value)if power then flingPower=power end end})Main:Toggle({Title="开启碰飞",Default=flingEnabled,Callback=function(State)flingEnabled=State if flingThread then task.cancel(flingThread)flingThread=nil end if flingEnabled then flingThread=task.spawn(function()local RunService=game:GetService("RunService")local Players=game:GetService("Players")local lp=Players.LocalPlayer while flingEnabled do RunService.Heartbeat:Wait()local c=lp.Character local hrp=c and c:FindFirstChild("HumanoidRootPart")if hrp then local vel=hrp.Velocity hrp.Velocity=vel*flingPower+Vector3.new(0,flingPower,0)RunService.RenderStepped:Wait()hrp.Velocity=vel RunService.Stepped:Wait()hrp.Velocity=vel+Vector3.new(0,flingMove,0)flingMove=-flingMove end end end)end end})TouchFlingModule.Cleanup=function()if flingThread then task.cancel(flingThread)flingThread=nil end flingEnabled=false end if _G.TouchFlingModule then _G.TouchFlingModule.Cleanup()end _G.TouchFlingModule=TouchFlingModule end
local K = Window:Tab({Title = "攻击", Icon = "swords"})
K:Section({ Title = "主要", Icon = "settings" })
K:Toggle({
Title = "自动破坏车辆",
Value = false,
Callback = function(state)
local destroyVehicles = state
if destroyVehicles then
task.spawn(function()
while destroyVehicles do
local equippedItem = v3item.inventory.getEquippedItem()
local equippedName = equippedItem and equippedItem.name
local friendIDs = {}
for _, player in pairs(Players:GetPlayers()) do
if player ~= LocalPlayer then
local success, isFriend = pcall(function()
return LocalPlayer:IsFriendsWith(player.UserId)
end)
if success and isFriend then
table.insert(friendIDs, player.UserId)
end
end
end
for _, vehicle in pairs(Workspace.Game.Vehicles:GetChildren()) do
if vehicle.PrimaryPart then
local distance = (HumanoidRootPart.Position - vehicle.PrimaryPart.Position).magnitude
local owner = vehicle:GetAttribute("owner")
local isFriend = false
for _, friendID in pairs(friendIDs) do
if owner == friendID then
isFriend = true
break
end
end
if equippedName == "Fists" and distance <= 50 and
owner ~= LocalPlayer.UserId and not isFriend then
local vehicleGUID = vehicle.GUID.Value
if vehicleGUID then
require(game:GetService("ReplicatedStorage").devv).load("Signal").FireServer(
"meleeAttackHit",
"vehicle",
{
meleeType = "meleemegapunch",
guid = vehicleGUID
}
)
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
K:Section({ Title = "杀戮类", Icon = "swords" })
local Signal = require(game:GetService("ReplicatedStorage").devv).load("Signal")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local b1 = require(game:GetService('ReplicatedStorage').devv).load('v3item').inventory.items
local autokill = false
local autostomp = false
local grabplay = false
local autoFists = false
local function equipFists()
for i, v in next, b1 do
if v.name == 'Fists' then
Signal.FireServer("equip", v.guid)
break
end
end
end
local function killAura()
local character = localPlayer.Character
if not character then return end
local rootPart = character:FindFirstChild("HumanoidRootPart")
if not rootPart then return end
for _, player in ipairs(Players:GetPlayers()) do
if player ~= localPlayer and player.Character then
local targetChar = player.Character
local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
if targetHRP then
local distance = (rootPart.Position - targetHRP.Position).Magnitude
if distance <= 35 then
local uid = player.UserId
Signal.FireServer("meleeAttackHit", "player", {
meleeType = "meleemegapunch",
hitPlayerId = uid
})
end
end
end
end
end
local function stompAura()
local character = localPlayer.Character
if not character then return end
local rootPart = character:FindFirstChild("HumanoidRootPart")
if not rootPart then return end
for _, player in ipairs(Players:GetPlayers()) do
if player ~= localPlayer and player.Character then
local targetChar = player.Character
local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
local targetHumanoid = targetChar:FindFirstChild("Humanoid")
if targetHRP and targetHumanoid and targetHumanoid.Health < 20 then
local distance = (rootPart.Position - targetHRP.Position).Magnitude
if distance <= 40 then
Signal.FireServer("finish", player)
end
end
end
end
end
local function grabAura()
local character = localPlayer.Character
if not character then return end
local rootPart = character:FindFirstChild("HumanoidRootPart")
if not rootPart then return end
for _, player in ipairs(Players:GetPlayers()) do
if player ~= localPlayer and player.Character then
local targetChar = player.Character
local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
local targetHumanoid = targetChar:FindFirstChild("Humanoid")
if targetHRP and targetHumanoid and targetHumanoid.Health < 20 then
local distance = (rootPart.Position - targetHRP.Position).Magnitude
if distance <= 40 then
Signal.FireServer("grabPlayer", player)
end
end
end
end
end
game:GetService("RunService").Heartbeat:Connect(function()
if autokill then
killAura()
end
if autostomp then
stompAura()
end
if grabplay then
grabAura()
end
if autoFists then
equipFists()
end
end)
K:Toggle({
Title = "自动装备拳头",
Value = false,
Callback = function(state)
autoFists = state
end
})
K:Toggle({
Title = "杀戮光环[一拳]",
Value = false,
Callback = function(state)
autokill = state
end
})
K:Toggle({
Title = "踩踏光环",
Value = false,
Callback = function(state)
autostomp = state
end
})
K:Toggle({
Title = "抓取光环",
Value = false,
Callback = function(state)
grabplay = state
end
})
K:Section({ Title = "防护", Icon = "swords" })
K:Toggle({
Title = "自动穿甲",
Default = false,
Callback = function(Value)
AutoArmor = Value
if Value then
local heartbeat = game:GetService("RunService").Heartbeat
local connection
connection = heartbeat:Connect(function()
if not AutoArmor then
connection:Disconnect()
return
end
pcall(function()
local player = game:GetService('Players').LocalPlayer
local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
if humanoid and humanoid.Health > 35 then
local b1 = require(game:GetService('ReplicatedStorage').devv).load('v3item').inventory.items
local hasLightVest = false
for i, v in next, b1 do
if v.name == "Light Vest" then
hasLightVest = true
light = v.guid
local armor = player:GetAttribute('armor')
if armor == nil or armor <= 0 then
require(game:GetService("ReplicatedStorage").devv).load("Signal").FireServer("equip", light)
require(game:GetService("ReplicatedStorage").devv).load("Signal").FireServer("useConsumable", light)
require(game:GetService("ReplicatedStorage").devv).load("Signal").FireServer("removeItem", light)
end
break
end
end
if not hasLightVest then
require(game:GetService("ReplicatedStorage").devv).load("Signal").InvokeServer("attemptPurchase", "Light Vest")
end
end
end)
end)
end
end
})
K:Toggle({
Title = "自动面具",
Value = false,
Callback = function(state)
autokz = state
if autokz then
while autokz and wait(1) do
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local Mask = character:FindFirstChild("Hockey Mask")
local Signal = require(game:GetService("ReplicatedStorage").devv).load("Signal")
local b1 = require(game:GetService('ReplicatedStorage').devv).load('v3item').inventory.items
if not Mask then
Signal.InvokeServer("attemptPurchase", "Hockey Mask")
for i, v in next, b1 do
if v.name == "Hockey Mask" then
sugid = v.guid
if not Mask then
Signal.FireServer("equip", sugid)
Signal.FireServer("wearMask", sugid)
end
break
end
end
end
end
end
end
})
K:Toggle({
Title = "自动回血",
Default = false,
Callback = function(Value)
if healThread then
healThread:Disconnect()
healThread = nil
end
if Value then
local heartbeat = game:GetService("RunService").Heartbeat
healThread = heartbeat:Connect(function()
Signal.InvokeServer("attemptPurchase", 'Bandage')
for _, v in next, item.inventory.items do
if v.name == 'Bandage' then
local bande = v.guid
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild('Humanoid')
if Humanoid.Health >= 5 and Humanoid.Health < Humanoid.MaxHealth then
Signal.FireServer("equip", bande)
Signal.FireServer("useConsumable", bande)
Signal.FireServer("removeItem", bande)
end
break
end
end
end)
end
end
})
local melee = require(game:GetService("ReplicatedStorage").devv).load("ClientReplicator")
local lp = game:GetService("Players").LocalPlayer
local AutoKnockReset = false
K:Toggle({
Title = "防倒地",
Default = false,
Callback = function(Value)
AutoKnockReset = Value
if Value then
task.spawn(function()
while AutoKnockReset do
if lp.Character and lp.Character:FindFirstChild("Humanoid") then
melee.Set(lp, "knocked", false)
melee.Replicate("knocked")
end
wait()
end
end)
end
end
})
K:Toggle({
Title = "防虚空",
Default = false,
Callback = function(Value)
task.spawn(function()
while Value and task.wait(0.1) do
local character = game:GetService("Players").LocalPlayer.Character
if character and character:FindFirstChild("HumanoidRootPart") then
local humanoidRootPart = character.HumanoidRootPart
local position = humanoidRootPart.Position
if position.Y < -200 then
humanoidRootPart.CFrame = CFrame.new(1339.9090576171875, 6.044891357421875, -660.3264770507812)
end
end
end
end)
end
})
K:Toggle({
Title = "防甩飞",
Default = false,
Callback = function(Value)
task.spawn(function()
while Value and task.wait(0.1) do
local character = game:GetService("Players").LocalPlayer.Character
if character then
for _, part in ipairs(character:GetDescendants()) do
if part:IsA("BasePart") then
part.CanCollide = false
end
end
end
end
end)
end
})
K:Toggle({
Title = "显示名字血量",
Value = false,
Callback = function(enableESP)
if enableESP then
local function ApplyESP(v)
if v.Character and v.Character:FindFirstChildOfClass'Humanoid' then
v.Character.Humanoid.NameDisplayDistance = 9e9
v.Character.Humanoid.NameOcclusion = "NoOcclusion"
v.Character.Humanoid.HealthDisplayDistance = 9e9
v.Character.Humanoid.HealthDisplayType = "AlwaysOn"
v.Character.Humanoid.Health = v.Character.Humanoid.Health
end
end
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
for i, v in pairs(Players:GetPlayers()) do
ApplyESP(v)
v.CharacterAdded:Connect(function()
task.wait(0.33)
ApplyESP(v)
end)
end
Players.PlayerAdded:Connect(function(v)
ApplyESP(v)
v.CharacterAdded:Connect(function()
task.wait(0.33)
ApplyESP(v)
end)
end)
local espConnection = RunService.Heartbeat:Connect(function()
for i, v in pairs(Players:GetPlayers()) do
if v.Character and v.Character:FindFirstChildOfClass'Humanoid' then
v.Character.Humanoid.NameDisplayDistance = 9e9
v.Character.Humanoid.NameOcclusion = "NoOcclusion"
v.Character.Humanoid.HealthDisplayDistance = 9e9
v.Character.Humanoid.HealthDisplayType = "AlwaysOn"
end
end
end)
_G.ESPConnection = espConnection
else
if _G.ESPConnection then
_G.ESPConnection:Disconnect()
_G.ESPConnection = nil
end
local Players = game:GetService("Players")
for i, v in pairs(Players:GetPlayers()) do
if v.Character and v.Character:FindFirstChildOfClass'Humanoid' then
v.Character.Humanoid.NameDisplayDistance = 100
v.Character.Humanoid.NameOcclusion = "OccludeAll"
v.Character.Humanoid.HealthDisplayDistance = 100
v.Character.Humanoid.HealthDisplayType = "DisplayWhenDamaged"
end
end
end
end
})
K:Toggle({
Title = "防僵直",
Default = false,
Callback = function(Value)
task.spawn(function()
while Value and task.wait(0.1) do
local character = game:GetService("Players").LocalPlayer.Character
if character and character:FindFirstChild("Humanoid") then
local humanoid = character.Humanoid
if humanoid:GetState() == Enum.HumanoidStateType.Frozen then
humanoid:ChangeState(Enum.HumanoidStateType.Running)
end
end
end
end)
end
})
K:Toggle({
Title = "防坐下",
Default = false,
Callback = function(Value)
task.spawn(function()
while Value and task.wait(0.1) do
local character = game:GetService("Players").LocalPlayer.Character
if character and character:FindFirstChild("Humanoid") then
local humanoid = character.Humanoid
if humanoid:GetState() == Enum.HumanoidStateType.Seated then
humanoid.Sit = false
humanoid:ChangeState(Enum.HumanoidStateType.Running)
end
end
end
end)
end
})
local MagicTab = Window:Tab({Title = "魔法类", Icon = "zap"})
MagicTab:Section({ Title = "基础设置", Icon = "settings" })
local hitPart = "HumanoidRootPart"
local hitPartsList = {
"Head",
"HumanoidRootPart",
"UpperTorso",
"LowerTorso",
"LeftHand",
"RightHand",
"LeftFoot",
"RightFoot"
}
MagicTab:Dropdown({
Title = "命中部位",
Desc = "选择瞄准的身体部位",
Values = hitPartsList,
Value = "HumanoidRootPart",
Callback = function(value)
hitPart = value
end
})
MagicTab:Section({ Title = "魔法子弹", Icon = "target" })
local magicBulletEnabled = false
local magicBulletWeapon = "AK-47"
local magicBulletDistance = 80
local magicBulletFireRate = "auto"
local availableWeapons = {
"AK-47",
"Gold AK-47",
"M4A1",
"AS Val",
"AUG",
"P90",
"RPK",
"Scar L",
"Tommy Gun",
"MP7",
"Barrett M107",
"Deagle",
"Gold Deagle",
"Python",
"Sawn Off",
"Double Barrel",
"Dragunov"
}
local fireModes = {"semi", "auto", "burst"}
MagicTab:Dropdown({
Title = "选择武器",
Desc = "选择用于魔法攻击的武器",
Values = availableWeapons,
Value = "AK-47",
Callback = function(value)
magicBulletWeapon = value
end
})
MagicTab:Dropdown({
Title = "射击模式",
Desc = "选择射击模式",
Values = fireModes,
Value = "auto",
Callback = function(value)
magicBulletFireRate = value
end
})
MagicTab:Slider({
Title = "攻击距离",
Desc = "设置魔法攻击的最大距离",
Value = {
Min = 1,
Max = 500,
Default = 80
},
Callback = function(value)
magicBulletDistance = value
end
})
local function createTrail(origin, targetPos)
local trailPart = Instance.new("Part")
trailPart.Size = Vector3.new(0.2, 0.2, 0.2)
trailPart.Anchored = true
trailPart.CanCollide = false
trailPart.Transparency = 1
trailPart.CFrame = CFrame.new(origin)
trailPart.Parent = workspace
local att0 = Instance.new("Attachment", trailPart)
local att1 = Instance.new("Attachment", workspace.Terrain)
att1.WorldPosition = targetPos
local beam = Instance.new("Beam", trailPart)
beam.Attachment0 = att0
beam.Attachment1 = att1
beam.Color = ColorSequence.new(Color3.fromRGB(0, 170, 255))
beam.Width0 = 0.3
beam.Width1 = 0.3
beam.FaceCamera = true
beam.LightEmission = 1
local lightning = Instance.new("Part")
lightning.Size = Vector3.new(0.5, 0.5, 0.5)
lightning.Transparency = 1
lightning.CanCollide = false
lightning.Parent = trailPart
local fire = Instance.new("Fire", lightning)
fire.Color = Color3.fromRGB(0, 170, 255)
fire.SecondaryColor = Color3.fromRGB(255, 255, 255)
fire.Heat = 5
fire.Size = 2
task.spawn(function()
for i = 1, 20 do
if beam and beam.Parent then
beam.Transparency = NumberSequence.new(i/20)
task.wait(0.1)
end
end
if trailPart and trailPart.Parent then
trailPart:Destroy()
end
end)
end
local function hasShieldProtection(player)
if player and player.Character then
local humanoid = player.Character:FindFirstChild("Humanoid")
if humanoid then
for _, desc in pairs(player.Character:GetDescendants()) do
if desc:IsA("ForceField") or desc.Name:lower():find("shield") or desc.Name:lower():find("保护") then
return true
end
end
end
end
return false
end
local function rapidFire(player, equippedGUID, targetPart, myPos, targetPos, equippedName)
for _ = 1, 6 do
if not magicBulletEnabled then break end
if not player or not player.Character or not targetPart or not targetPart.Parent then break end
if hasShieldProtection(player) then
break
end
local same = {GUID()}
local replicateArgs = {equippedGUID}
local projectileData = {{same[1], targetPart.CFrame}}
replicateArgs[2] = projectileData
replicateArgs[3] = magicBulletFireRate
Signal.FireServer("replicateProjectiles", unpack(replicateArgs))
createTrail(myPos, targetPos)
local snd = Instance.new("Sound", workspace)
snd.SoundId = "rbxassetid://9116483270"
snd.Volume = 1
snd.PlayOnRemove = true
snd:Destroy()
local hitArgs = {
same[1],
"player",
{
["hitPart"] = targetPart,
["hitPlayerId"] = player.UserId,
["hitSize"] = targetPart.Size,
["pos"] = targetPart.Position
}
}
Signal.FireServer("projectileHit", unpack(hitArgs))
Signal.InvokeServer("attemptPurchaseAmmo", equippedName)
Signal.FireServer("reload", equippedGUID)
task.wait(0.016)
end
end
MagicTab:Toggle({
Title = "魔法子弹",
Value = false,
Callback = function(state)
magicBulletEnabled = state
if state then
task.spawn(function()
while magicBulletEnabled do
local equippedItem = v3item.inventory.getEquippedItem()
if not equippedItem then
task.wait(0.01)
continue
end
local equippedName = equippedItem.name
local equippedGUID = equippedItem.guid
if equippedName ~= magicBulletWeapon then
Signal.FireServer("equip", magicBulletWeapon)
task.wait(0.01)
continue
end
local friendIDs = {}
for _, player in pairs(Players:GetPlayers()) do
if player ~= LocalPlayer then
local success, isFriend = pcall(function()
return LocalPlayer:IsFriendsWith(player.UserId)
end)
if success and isFriend then
table.insert(friendIDs, player.UserId)
end
end
end
for _, player in pairs(Players:GetPlayers()) do
if not magicBulletEnabled then break end
if player ~= LocalPlayer and player.Character then
local character = player.Character
local humanoid = character:FindFirstChild("Humanoid")
local targetPart = character:FindFirstChild(hitPart)
local hrp = character:FindFirstChild("HumanoidRootPart")
if humanoid and targetPart and hrp and humanoid.Health > 0 then
local distance = (HumanoidRootPart.Position - hrp.Position).magnitude
local isFriend = false
for _, friendID in pairs(friendIDs) do
if player.UserId == friendID then
isFriend = true
break
end
end
if not isFriend and distance <= magicBulletDistance then
if hasShieldProtection(player) then
continue
end
local myPos = HumanoidRootPart.Position
local targetPos = targetPart.Position
task.spawn(function()
while magicBulletEnabled and player and player.Character and
player.Character:FindFirstChild("Humanoid") and
player.Character.Humanoid.Health > 0 and
not hasShieldProtection(player) and
(HumanoidRootPart.Position - player.Character:FindFirstChild("HumanoidRootPart").Position).magnitude <= magicBulletDistance do
local currentTargetPart = player.Character:FindFirstChild(hitPart)
if currentTargetPart then
rapidFire(player, equippedGUID, currentTargetPart, myPos, currentTargetPart.Position, equippedName)
end
task.wait(0.016)
end
end)
end
end
end
end
task.wait(0.1)
end
end)
end
end
})
MagicTab:Section({ Title = "火焰/酸液攻击", Icon = "flame" })
local flameAttackEnabled = false
local flameAttackDistance = 60
MagicTab:Slider({
Title = "攻击距离",
Desc = "设置火焰/酸液攻击的最大距离",
Value = {
Min = 1,
Max = 500,
Default = 60
},
Callback = function(value)
flameAttackDistance = value
end
})
MagicTab:Toggle({
Title = "火焰/酸液攻击",
Value = false,
Callback = function(state)
flameAttackEnabled = state
if state then
task.spawn(function()
local same = {GUID()}
while flameAttackEnabled do
local equippedItem = v3item.inventory.getEquippedItem()
if not equippedItem then
task.wait(0.1)
continue
end
local equippedName = equippedItem.name
local equippedGUID = equippedItem.guid
if equippedName ~= "Flamethrower" and equippedName ~= "Acid Gun" then
task.wait(0.1)
continue
end
local friendIDs = {}
for _, player in pairs(Players:GetPlayers()) do
if player ~= LocalPlayer then
local success, isFriend = pcall(function()
return LocalPlayer:IsFriendsWith(player.UserId)
end)
if success and isFriend then
table.insert(friendIDs, player.UserId)
end
end
end
for _, player in pairs(Players:GetPlayers()) do
if not flameAttackEnabled then break end
if player ~= LocalPlayer and player.Character then
local character = player.Character
local humanoid = character:FindFirstChild("Humanoid")
local targetPart = character:FindFirstChild(hitPart)
if humanoid and targetPart and humanoid.Health > 0 then
local distance = (HumanoidRootPart.Position - character:FindFirstChild("HumanoidRootPart").Position).magnitude
local isFriend = false
for _, friendID in pairs(friendIDs) do
if player.UserId == friendID then
isFriend = true
break
end
end
if not isFriend and distance <= flameAttackDistance then
local replicateArgs = {equippedGUID}
local projectileData = {{same[1], targetPart.CFrame}}
replicateArgs[2] = projectileData
replicateArgs[3] = "auto"
Signal.FireServer("replicateProjectiles", unpack(replicateArgs))
local flameArgs = {same[1], GUID(), targetPart.Position}
if equippedName == "Flamethrower" then
Signal.FireServer("flameHit", unpack(flameArgs))
elseif equippedName == "Acid Gun" then
Signal.FireServer("acidHit", unpack(flameArgs))
end
local hitArgs = {
same[1],
"player",
{
["hitPart"] = targetPart,
["hitPlayerId"] = player.UserId,
["hitSize"] = targetPart.Size,
["pos"] = targetPart.Position
}
}
Signal.FireServer("projectileHit", unpack(hitArgs))
Signal.InvokeServer("attemptPurchaseAmmo", equippedName)
Signal.FireServer("reload", equippedGUID)
end
end
end
end
task.wait(0.1)
end
end)
end
end
})
MagicTab:Section({ Title = "RPG/三叉戟攻击", Icon = "rocket" })
local rpgAttackEnabled = false
local rpgAttackDistance = 100
local rpgMinHealth = 0.3
MagicTab:Slider({
Title = "攻击距离",
Value = {
Min = 1,
Max = 5000,
Default = 100
},
Callback = function(value)
rpgAttackDistance = value
end
})
MagicTab:Slider({
Title = "最低血量",
Value = {
Min = 0.1,
Max = 1,
Default = 0.3
},
Callback = function(value)
rpgMinHealth = value
end
})
MagicTab:Toggle({
Title = "RPG/三叉戟攻击",
Value = false,
Callback = function(state)
rpgAttackEnabled = state
if state then
task.spawn(function()
local same = {GUID()}
while rpgAttackEnabled do
local equippedItem = v3item.inventory.getEquippedItem()
if not equippedItem then
task.wait(0.1)
continue
end
local equippedName = equippedItem.name
local equippedGUID = equippedItem.guid
if equippedName ~= "RPG" and equippedName ~= "Trident" then
task.wait(0.1)
continue
end
local friendIDs = {}
for _, player in pairs(Players:GetPlayers()) do
if player ~= LocalPlayer then
local success, isFriend = pcall(function()
return LocalPlayer:IsFriendsWith(player.UserId)
end)
if success and isFriend then
table.insert(friendIDs, player.UserId)
end
end
end
for _, player in pairs(Players:GetPlayers()) do
if not rpgAttackEnabled then break end
if player ~= LocalPlayer and player.Character then
local character = player.Character
local humanoid = character:FindFirstChild("Humanoid")
local targetPart = character:FindFirstChild(hitPart)
if humanoid and targetPart and humanoid.Health > rpgMinHealth then
local distance = (HumanoidRootPart.Position - character:FindFirstChild("HumanoidRootPart").Position).magnitude
local isFriend = false
for _, friendID in pairs(friendIDs) do
if player.UserId == friendID then
isFriend = true
break
end
end
if not isFriend and distance <= rpgAttackDistance then
local replicateArgs = {equippedGUID}
local projectileData = {{same[1], targetPart.CFrame}}
replicateArgs[2] = projectileData
replicateArgs[3] = "semi"
Signal.FireServer("replicateProjectiles", unpack(replicateArgs))
local rocketArgs = {same[1], GUID(), targetPart.Position}
for i = 1, 5 do
Signal.FireServer("rocketHit", unpack(rocketArgs))
end
Signal.InvokeServer("attemptPurchaseAmmo", equippedName)
Signal.FireServer("reload", equippedGUID)
end
end
end
end
task.wait(0.1)
end
end)
end
end
})
MagicTab:Section({ Title = "喷雾攻击", Icon = "wind" })
local sprayAttackEnabled = false
local sprayAttackDistance = 80
MagicTab:Slider({
Title = "攻击距离",
Value = {
Min = 1,
Max = 500,
Default = 80
},
Callback = function(value)
sprayAttackDistance = value
end
})
MagicTab:Toggle({
Title = "喷雾攻击",
Desc = "胡椒喷雾或灭火器攻击",
Value = false,
Callback = function(state)
sprayAttackEnabled = state
if state then
task.spawn(function()
local same = {GUID()}
while sprayAttackEnabled do
local equippedItem = v3item.inventory.getEquippedItem()
if not equippedItem then
task.wait(0.1)
continue
end
local equippedName = equippedItem.name
local equippedGUID = equippedItem.guid
if equippedName ~= "Pepper Spray" and equippedName ~= "Fire Extinguisher" then
task.wait(0.1)
continue
end
local friendIDs = {}
for _, player in pairs(Players:GetPlayers()) do
if player ~= LocalPlayer then
local success, isFriend = pcall(function()
return LocalPlayer:IsFriendsWith(player.UserId)
end)
if success and isFriend then
table.insert(friendIDs, player.UserId)
end
end
end
for _, player in pairs(Players:GetPlayers()) do
if not sprayAttackEnabled then break end
if player ~= LocalPlayer and player.Character then
local character = player.Character
local humanoid = character:FindFirstChild("Humanoid")
local targetPart = character:FindFirstChild(hitPart)
if humanoid and targetPart and humanoid.Health > 0 then
local distance = (HumanoidRootPart.Position - character:FindFirstChild("HumanoidRootPart").Position).magnitude
local isFriend = false
for _, friendID in pairs(friendIDs) do
if player.UserId == friendID then
isFriend = true
break
end
end
if not isFriend and distance <= sprayAttackDistance then
local replicateArgs = {equippedGUID}
local projectileData = {{same[1], targetPart.CFrame}}
replicateArgs[2] = projectileData
replicateArgs[3] = "auto"
Signal.FireServer("replicateProjectiles", unpack(replicateArgs))
local sprayArgs = {
same[1],
"player",
{
["hitPart"] = targetPart,
["hitPlayerId"] = player.UserId,
["hitSize"] = targetPart.Size,
["pos"] = targetPart.Position
}
}
Signal.FireServer("pepperSprayHit", unpack(sprayArgs))
Signal.FireServer("reload", equippedGUID)
end
end
end
end
task.wait(0.1)
end
end)
end
end
})
local Main = Window:Tab({Title = "金钱", Icon = "dollar-sign"})
Main:Section({ Title = "刷钱", Icon = "settings" })
local jewelryFarmEnabled = false
local jewelryFarmMode = "All"
local originalCFrame = nil
local originalEquipped = nil
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local function getAllJewelryCases()
local jewelryCases = {}
local jewelryLoc = Workspace:FindFirstChild("GemRobbery")
if not jewelryLoc then return jewelryCases end
local jewelryCasesLoc = jewelryLoc:FindFirstChild("JewelryCases")
if not jewelryCasesLoc then return jewelryCases end
local lowYield = jewelryCasesLoc:FindFirstChild("LowYieldSpawns")
local highYield = jewelryCasesLoc:FindFirstChild("HighYieldSpawns")
if lowYield then
for _, case in pairs(lowYield:GetChildren()) do
table.insert(jewelryCases, case)
end
end
if highYield then
for _, case in pairs(highYield:GetChildren()) do
table.insert(jewelryCases, case)
end
end
return jewelryCases
end
local function hasJewelry(jewelCase)
for _, child in pairs(jewelCase:GetChildren()) do
if child:IsA("Model") or child:IsA("BasePart") then
if string.find(child.Name, "Gem") or
string.find(child.Name, "Diamond") or
string.find(child.Name, "Ring") or
string.find(child.Name, "Gold") or
string.find(child.Name, "Ruby") or
string.find(child.Name, "Sapphire") or
string.find(child.Name, "Emerald") or
string.find(child.Name, "Amethyst") or
string.find(child.Name, "Topaz") or
child.Name == "Watch" or
child.Name == "Rollie" or
child.Name == "Cup" or
child.Name == "Crown" or
child.Name == "Bar" then
return true
end
end
end
return false
end
local function equipFists()
local inventory = require(game:GetService("ReplicatedStorage").devv).load("v3item").inventory
local fistsItem = inventory.getFromName("Fists")
if fistsItem then
inventory.setEquipped(fistsItem.guid)
return fistsItem.guid
end
return nil
end
local function restoreEquipped(guid)
if guid then
local inventory = require(game:GetService("ReplicatedStorage").devv).load("v3item").inventory
inventory.setEquipped(guid)
end
end
local function breakJewelryCase(jewelCase)
local caseGUID = jewelCase:GetAttribute("guid")
if caseGUID then
local success, errorMsg = pcall(function()
require(game:GetService("ReplicatedStorage").devv).load("Signal").FireServer(
"meleeAttackHit",
"jewelcase",
{
meleeType = "meleepunch",
guid = caseGUID
}
)
end)
if not success then
return false
end
return true
end
return false
end
local function checkRemainingJewelry()
local jewelryCases = getAllJewelryCases()
for _, jewelCase in pairs(jewelryCases) do
if hasJewelry(jewelCase) then
return true
end
end
return false
end
Main:Toggle({
Title = "自动珠宝店",
Value = false,
Callback = function(state)
jewelryFarmEnabled = state
if state then
task.spawn(function()
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local HumanoidRootPart = character:WaitForChild("HumanoidRootPart")
originalCFrame = HumanoidRootPart.CFrame
local equippedItem = require(game:GetService("ReplicatedStorage").devv).load("v3item").inventory.getEquippedItem()
originalEquipped = equippedItem and equippedItem.guid
while jewelryFarmEnabled do
character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
HumanoidRootPart = character:WaitForChild("HumanoidRootPart")
local jewelryCases = getAllJewelryCases()
if #jewelryCases == 0 then
task.wait(1)
break
end
local hasJewelryFound = false
for _, jewelCase in pairs(jewelryCases) do
if not jewelryFarmEnabled then break end
if hasJewelry(jewelCase) then
hasJewelryFound = true
local casePosition
if jewelCase:IsA("Model") and jewelCase.PrimaryPart then
casePosition = jewelCase.PrimaryPart.Position
else
casePosition = jewelCase:GetPivot().Position
end
HumanoidRootPart.CFrame = CFrame.new(casePosition + Vector3.new(0, 3, 0))
task.wait(0.3)
equipFists()
task.wait(0.3)
if breakJewelryCase(jewelCase) then
task.wait(0.5)
local gemRobbery = workspace:FindFirstChild("GemRobbery")
if gemRobbery then
local cases = gemRobbery:FindFirstChild("JewelryCases")
if cases then
for _ = 1, 10 do
if not jewelryFarmEnabled then break end
local foundPrompt = false
for _, descendant in pairs(cases:GetDescendants()) do
if not jewelryFarmEnabled then break end
if descendant:IsA("ProximityPrompt") and
descendant.ActionText == "Steal" and
descendant.Enabled == true then
local promptPosition = descendant.Parent.Position
local distance = (casePosition - promptPosition).Magnitude
if distance < 10 then
foundPrompt = true
HumanoidRootPart.CFrame = CFrame.new(promptPosition + Vector3.new(0, 2, 0))
descendant.HoldDuration = 0
fireproximityprompt(descendant)
task.wait(0.2)
end
end
end
if not foundPrompt then
break
end
task.wait(0.5)
end
end
end
end
task.wait(0.5)
end
end
if not hasJewelryFound then
if originalCFrame then
HumanoidRootPart.CFrame = originalCFrame
end
if originalEquipped then
restoreEquipped(originalEquipped)
end
while jewelryFarmEnabled do
task.wait(1)
if checkRemainingJewelry() then
break
end
end
end
task.wait(1)
end
if not jewelryFarmEnabled then
if originalCFrame then
HumanoidRootPart.CFrame = originalCFrame
end
if originalEquipped then
restoreEquipped(originalEquipped)
end
end
end)
else
if originalEquipped then
restoreEquipped(originalEquipped)
end
end
end
})
local autoUnlockEnabled = false
local originalPosition = nil
local originalEquipped = nil
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local HumanoidRootPart = character:WaitForChild("HumanoidRootPart")
Main:Toggle({
Title = "自动保险箱",
Value = false,
Callback = function(state)
autoUnlockEnabled = state
if state then
task.spawn(function()
character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
HumanoidRootPart = character:WaitForChild("HumanoidRootPart")
originalPosition = HumanoidRootPart.CFrame
local equippedItem = v3item.inventory.getEquippedItem()
originalEquipped = equippedItem and equippedItem.guid
while autoUnlockEnabled do
character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
HumanoidRootPart = character:WaitForChild("HumanoidRootPart")
Signal.InvokeServer("attemptPurchase", "Lockpick")
task.wait(0.2)
local allSafes = {}
local safeTypes = {
"LargeSafe",
"MediumSafe",
"SmallSafe",
"JewelSafe",
"GoldJewelSafe"
}
for _, safeType in pairs(safeTypes) do
local safesFolder = Workspace.Game.Entities:FindFirstChild(safeType)
if safesFolder then
for _, safe in pairs(safesFolder:GetChildren()) do
table.insert(allSafes, safe)
end
end
end
for _, safe in pairs(allSafes) do
if not autoUnlockEnabled then break end
local prompt = safe:FindFirstChild("ProximityPrompt", true)
if prompt and prompt.Enabled then
local safePosition
if safe:IsA("Model") and safe.PrimaryPart then
safePosition = safe.PrimaryPart.Position
else
safePosition = safe.WorldPivot.Position
end
HumanoidRootPart.CFrame = CFrame.new(safePosition)
task.wait(0.3)
fireproximityprompt(prompt)
task.wait(1)
for attempt = 1, 20 do
if not autoUnlockEnabled then break end
local moneyFound = false
for _, obj in pairs(Workspace.Game.Entities:GetDescendants()) do
if not autoUnlockEnabled then break end
if obj:IsA("BasePart") and obj.Name == "Cash" then
moneyFound = true
HumanoidRootPart.CFrame = CFrame.new(obj.Position)
firetouchinterest(obj, character:FindFirstChild("HumanoidRootPart"), 0)
firetouchinterest(obj, character:FindFirstChild("HumanoidRootPart"), 1)
task.wait(0.1)
elseif obj:IsA("Model") and (obj.Name == "GoldBar" or obj.Name == "Diamond" or obj.Name == "Emerald" or obj.Name == "Ruby" or obj.Name == "Sapphire" or obj.Name == "Amethyst" or obj.Name == "Topaz" or string.find(obj.Name, "Ring") or string.find(obj.Name, "Gem") or obj.Name == "Watch" or obj.Name == "Rollie") then
moneyFound = true
if obj.PrimaryPart then
HumanoidRootPart.CFrame = CFrame.new(obj.PrimaryPart.Position)
firetouchinterest(obj.PrimaryPart, character:FindFirstChild("HumanoidRootPart"), 0)
firetouchinterest(obj.PrimaryPart, character:FindFirstChild("HumanoidRootPart"), 1)
task.wait(0.1)
end
end
end
if not moneyFound then
break
end
task.wait(0.2)
end
task.wait(0.5)
end
end
task.wait(1)
end
if originalPosition then
HumanoidRootPart.CFrame = originalPosition
end
if originalEquipped then
Signal.FireServer("equip", originalEquipped)
end
end)
else
if originalEquipped then
Signal.FireServer("equip", originalEquipped)
end
end
end
})
local autobank = false
local bankTeleportCFrame = CFrame.new(1112.12671, 10.1856346, -324.815613)
local originalPosition = nil
local function robBankAndReturn()
if not autobank then return end
local player = game:GetService("Players").LocalPlayer
local character = player.Character
if not character then return end
local rootPart = character:FindFirstChild("HumanoidRootPart")
if not rootPart then return end
originalPosition = rootPart.CFrame
rootPart.CFrame = bankTeleportCFrame
task.wait(0.1)
local Signal = require(game:GetService("ReplicatedStorage").devv).load("Signal")
local waitTime = 0.1
local maxWait = 5.0
local startTime = tick()
while autobank and (tick() - startTime) < maxWait do
Signal.FireServer("stealBankCash")
task.wait(waitTime)
end
if autobank and originalPosition then
rootPart.CFrame = originalPosition
task.wait(0.1)
end
originalPosition = nil
end
local bankThread = nil
local function startBankRobberyLoop()
if bankThread then return end
bankThread = task.spawn(function()
while autobank do
robBankAndReturn()
task.wait(0.5)
end
bankThread = nil
end)
end
local function stopBankRobberyLoop()
if bankThread then
task.cancel(bankThread)
bankThread = nil
end
end
Main:Toggle({
Title = "自动抢银行",
Value = false,
Callback = function(state)
autobank = state
if autobank then
startBankRobberyLoop()
else
stopBankRobberyLoop()
end
end
})
Main:Toggle({
Title = "自动ATM",
Default = false,
Callback = function(Value)
autoATMCashCombo = Value
if autoATMCashCombo then
local function collectCash()
local player = game:GetService("Players").LocalPlayer
local cashSize = Vector3.new(2, 0.2499999850988388, 1)
for _, part in ipairs(workspace.Game.Entities.CashBundle:GetDescendants()) do
if part:IsA("BasePart") and part.Size == cashSize then
player.Character.HumanoidRootPart.CFrame = part.CFrame
task.wait()
end
end
end
coroutine.wrap(function()
while autoATMCashCombo and task.wait() do
local ATMsFolder = workspace:FindFirstChild("ATMs")
local localPlayer = game:GetService("Players").LocalPlayer
local hasActiveATM = false
if ATMsFolder and localPlayer.Character then
for _, atm in ipairs(ATMsFolder:GetChildren()) do
if atm:IsA("Model") then
local hp = atm:GetAttribute("health")
if hp ~= 0 then
hasActiveATM = true
for _, part in ipairs(atm:GetChildren()) do
if part.Name == "Main" and part:IsA("BasePart") then
localPlayer.Character.HumanoidRootPart.CFrame = part.CFrame
task.wait()
atm:SetAttribute("health", 0)
break
end
end
task.wait()
end
end
end
end
if hasActiveATM then
task.wait(1)
else
collectCash()
task.wait()
end
end
end)()
end
end
})
local treasureFarmEnabled = false
Main:Toggle({
Title = "自动海盗宝藏",
Value = false,
Callback = function(state)
treasureFarmEnabled = state
if state then
task.spawn(function()
while treasureFarmEnabled do
local equippedName = v3item.inventory.getEquippedItem().name
if equippedName == "Treasure Map" then
local originalCFrame = HumanoidRootPart.CFrame
for _, treasure in pairs(Workspace.Game.Local.Debris:GetChildren()) do
if not treasureFarmEnabled then break end
if treasure.Name == "TreasureMarker" then
HumanoidRootPart.CFrame = treasure.CFrame
if treasure:FindFirstChild("ProximityPrompt", true) then
fireproximityprompt(treasure:FindFirstChild("ProximityPrompt", true))
end
task.wait(0.5)
end
end
HumanoidRootPart.CFrame = originalCFrame
end
task.wait(1)
end
end)
end
end
})
Main:Section({ Title = "售卖", Icon = "settings" })
local Signal = require(ReplicatedStorage.devv).load("Signal")
local item = require(ReplicatedStorage.devv).load("v3item")
local function autoSellItems()
for i, v in next, item.inventory.items do
local sellid = v.guid
Signal.FireServer("equip", sellid)
Signal.FireServer("sellItem", sellid)
end
end
Main:Toggle({
Title = "自动售卖全部物品",
Default = false,
Callback = function(Value)
autoSellEnabled = Value
if autoSellConnection then
autoSellConnection:Disconnect()
autoSellConnection = nil
end
if Value then
local RunService = game:GetService("RunService")
autoSellConnection = RunService.Heartbeat:Connect(function()
local currentTime = tick()
if currentTime - lastBombardmentTime >= autoSellInterval then
pcall(function()
autoSellItems()
end)
lastBombardmentTime = currentTime
end
end)
_G.AutoSell = {
connection = autoSellConnection
}
pcall(function()
autoSellItems()
end)
else
if _G.AutoSell then
if _G.AutoSell.connection then
_G.AutoSell.connection:Disconnect()
end
_G.AutoSell = nil
end
end
end
})
local bulkSellEnabled = false
Main:Toggle({
Title = "批量销售物品",
Desc = "当物品超过20个时自动全部销售",
Value = false,
Callback = function(state)
bulkSellEnabled = state
if state then
task.spawn(function()
while bulkSellEnabled do
if v3item.inventory.ordered and #v3item.inventory.ordered > 20 then
for _, itemGuid in pairs(v3item.inventory.ordered) do
Signal.FireServer("sellItem", itemGuid)
end
end
task.wait(0.3)
end
end)
end
end
})
local blackMarketEnabled = false
Main:Toggle({
Title = "自动黑市销售",
Desc = "自动在黑市销售装备的物品",
Value = false,
Callback = function(state)
blackMarketEnabled = state
if state then
task.spawn(function()
local sellableItems = {
"Dark Matter Gem", "Void Gem", "Diamond Ring", "Diamond", "Rollie",
"Watch", "Glock 18", "AR-15", "Amethyst", "Topaz", "Emerald",
"Gold Bar", "Sapphire", "Ruby", "Emerald Ring", "Topaz Ring",
"Amethyst Ring", "Sapphire Ring", "Ruby Ring", "AK-47", "Glock",
"Raygun", "Gold AK-47", "Gold Deagle", "AS Val", "AUG", "Acid Gun",
"P90", "RPK", "Sawn Off", "Scar L", "Saiga 12", "Tommy Gun",
"Double Barrel", "Deagle", "Dragunov", "Flamethrower", "M249 SAW",
"MP7", "Minigun", "M4A1", "Barrett M107", "Gravity Gun",
"Seashell", "Blue Seashell", "Purple Seashell"
}
while blackMarketEnabled do
local equippedItem = v3item.inventory.getEquippedItem()
if equippedItem then
local equippedName = equippedItem.name
for _, itemName in pairs(sellableItems) do
if equippedName == itemName then
local dealer = Workspace.BlackMarket.Dealer.Dealer
if dealer and dealer:FindFirstChild("ProximityPrompt") then
fireproximityprompt(dealer.ProximityPrompt)
end
break
end
end
end
task.wait(0.1)
end
end)
end
end
})
Main:Section({ Title = "打开", Icon = "settings" })
local luckyBlockItems = {
"Green Lucky Block",
"Orange Lucky Block",
"Purple Lucky Block"
}
local function openLuckyBlocks()
for i, v in next, item.inventory.items do
if table.find(luckyBlockItems, v.name) then
local useid = v.guid
pcall(function()
Signal.FireServer("equip", useid)
wait(0.1)
Signal.FireServer("useConsumable", useid)
wait(0.1)
Signal.FireServer("removeItem", useid)
end)
break
end
end
end
Main:Toggle({
Title = "自动开幸运方块",
Default = false,
Callback = function(Value)
autoOpenLuckyBlocks = Value
if luckyBlockThread then
task.cancel(luckyBlockThread)
luckyBlockThread = nil
end
if Value then
luckyBlockThread = task.spawn(function()
while autoOpenLuckyBlocks do
pcall(function()
openLuckyBlocks()
end)
task.wait(0.0001)
end
end)
end
end
})
local materialBoxItems = {
"Electronics",
"Weapon Parts"
}
local function openMaterialBoxes()
for i, v in next, item.inventory.items do
if table.find(materialBoxItems, v.name) then
local useid = v.guid
pcall(function()
Signal.FireServer("equip", useid)
wait(0.1)
Signal.FireServer("useConsumable", useid)
wait(0.1)
Signal.FireServer("removeItem", useid)
end)
break
end
end
end
Main:Toggle({
Title = "自动开材料盒",
Default = false,
Callback = function(Value)
autoOpenMaterialBoxes = Value
if materialBoxThread then
task.cancel(materialBoxThread)
materialBoxThread = nil
end
if Value then
materialBoxThread = task.spawn(function()
while autoOpenMaterialBoxes do
pcall(function()
openMaterialBoxes()
end)
task.wait()
end
end)
end
end
})
Main:Section({ Title = "物品", Icon = "settings" })
local autoCraftEnabled = false
local autoClaimEnabled = false
local craftConnection
local Signal = require(game:GetService("ReplicatedStorage").devv).load("Signal")
local function performCrafting()
if autoCraftEnabled then
Signal.InvokeServer("beginCraft", 'RollieCraft')
end
if autoClaimEnabled then
Signal.InvokeServer("claimCraft", 'RollieCraft')
end
end
game:GetService("RunService").Heartbeat:Connect(function()
if autoCraftEnabled or autoClaimEnabled then
performCrafting()
end
end)
Main:Toggle({
Title = "自动制作萝莉",
Default = false,
Callback = function(Value)
autoCraftEnabled = Value
end
})
Main:Toggle({
Title = "自动领取萝莉",
Default = false,
Callback = function(Value)
autoClaimEnabled = Value
end
})
local autoStoreGems = false
local Signal = require(game:GetService("ReplicatedStorage").devv).load("Signal")
local b1 = require(game:GetService('ReplicatedStorage').devv).load('v3item').inventory.items
local function storeGems()
for _, v in pairs(workspace.HousingPlots:GetDescendants()) do
if v:IsA("ProximityPrompt") then
if v.ActionText == "Add Gem" or v.ActionText == "Equip a Gem" then
local houseid = v.Parent.Parent.Name
local hitid = v.Parent.Name
for i, item in next, b1 do
if item.name == "Diamond" or item.name == "Rollie" or item.name == "Dark Matter Gem" or item.name == "Diamond Ring" or item.name == "Void Gem" then
Signal.FireServer("equip", item.guid)
Signal.FireServer("updateGemDisplay", houseid, hitid, item.guid)
end
end
end
end
end
end
game:GetService("RunService").Heartbeat:Connect(function()
if autoStoreGems then
storeGems()
end
end)
Main:Toggle({
Title = "自动存放珠宝到家用珠宝柜",
Desc = "需要有房子和珠宝柜",
Default = false,
Callback = function(Value)
autoStoreGems = Value
end
})
local autoRentHouse = false
local Signal = require(game:GetService("ReplicatedStorage").devv).load("Signal")
local function rentHouse()
for _, v in pairs(workspace.HousingPlots:GetChildren()) do
if not v:GetAttribute("Owner") then
local housename = v
Signal.InvokeServer("rentHouse", v)
end
end
end
local lastRentTime = 0
game:GetService("RunService").Heartbeat:Connect(function()
if autoRentHouse and tick() - lastRentTime >= 2 then
rentHouse()
lastRentTime = tick()
end
end)
Main:Toggle({
Title = "自动租用房屋",
Default = false,
Callback = function(Value)
autoRentHouse = Value
end
})
local Signal = require(game:GetService("ReplicatedStorage").devv).load("Signal")
local autoClaimEnabled = false
local autoClaimConnection = nil
local function autoClaimRewards()
for day = 1, 12 do
Signal.InvokeServer("claimDailyReward", day)
task.wait(0.1)
end
for tier = 1, 3 do
for level = 1, 6 do
Signal.InvokeServer("claimPlaytimeReward", tier, level)
task.wait(0.1)
end
end
WindUI:Notify({Title = "自动领取", Content = "奖励领取完成", Duration = 2})
end
local function startAutoClaimLoop()
autoClaimEnabled = true
autoClaimConnection = task.spawn(function()
while autoClaimEnabled do
autoClaimRewards()
task.wait(5)
end
end)
end
local function stopAutoClaimLoop()
autoClaimEnabled = false
if autoClaimConnection then
autoClaimConnection:Disconnect()
autoClaimConnection = nil
end
end
Main:Toggle({
Title = "自动领取奖励",
Default = false,
Callback = function(Value)
if Value then
startAutoClaimLoop()
else
stopAutoClaimLoop()
end
end
})
local function teleportToAirdrop()
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local character = localPlayer.Character
if not character then return false end
local rootPart = character:FindFirstChild("HumanoidRootPart")
if not rootPart then return false end
local originalPosition = rootPart.CFrame
local foundAirdrop = false
local airdrops = game:GetService('Workspace').Game.Airdrops:GetChildren()
for _, airdrop in pairs(airdrops) do
if airdrop:FindFirstChild('Airdrop') and airdrop.Airdrop:FindFirstChild('ProximityPrompt') then
local prompt = airdrop.Airdrop.ProximityPrompt
prompt.RequiresLineOfSight = false
prompt.HoldDuration = 0
rootPart.CFrame = airdrop.Airdrop.CFrame
task.wait(0.1)
for i = 1, 15 do
fireproximityprompt(prompt)
task.wait(0.02)
end
foundAirdrop = true
break
end
end
if not foundAirdrop then
rootPart.CFrame = originalPosition
else
task.wait(0.3)
rootPart.CFrame = originalPosition
end
return foundAirdrop
end
local airdropAutoEnabled = false
Main:Toggle({
Title = "自动空投",
Default = false,
Callback = function(Value)
airdropAutoEnabled = Value
if Value then
task.spawn(function()
while airdropAutoEnabled do
local collected = teleportToAirdrop()
if not collected then
for i = 1, 10 do
if not airdropAutoEnabled then break end
task.wait(0.1)
end
else
for i = 1, 3 do
if not airdropAutoEnabled then break end
task.wait(0.1)
end
end
end
end)
end
end
})
local function fastCollectMoney()
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local character = localPlayer.Character
if not character then return false end
local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
if not humanoidRootPart then return false end
local originalPosition = humanoidRootPart.CFrame
local foundMoney = false
local moneyEntities = workspace.Game.Entities.CashBundle:GetChildren()
for i = 1, #moneyEntities do
local l = moneyEntities[i]
local moneyValue = l:FindFirstChildWhichIsA("IntValue")
if moneyValue and moneyValue.Value >= setting.minMoney then
humanoidRootPart.CFrame = l:FindFirstChildWhichIsA("Part").CFrame
task.wait(0.2)
humanoidRootPart.CFrame = originalPosition
foundMoney = true
break
end
end
return foundMoney
end
Main:Section({ Title = "钱数", Icon = "settings" })
Main:Toggle({
Title = "自动捡钱",
Default = false,
Callback = function(Value)
setting.autoMoney = Value
if Value then
task.spawn(function()
while setting.autoMoney and task.wait(0.1) do
fastCollectMoney()
end
end)
end
end
})
Main:Slider({
Title = "最低钱数设置",
Value = {
Min = 250,
Max = 1000,
Default = 250,
},
Callback = function(Value)
setting.minMoney = Value
end
})
Main:Section({ Title = "业余", Icon = "zap" })
local slotMachineEnabled = false
Main:Toggle({
Title = "自动老虎机",
Value = false,
Callback = function(state)
slotMachineEnabled = state
if state then
task.spawn(function()
while slotMachineEnabled do
local originalCFrame = HumanoidRootPart.CFrame
local ServerFurniture = Workspace.ServerFurniture
local slotSpins = LocalPlayer:GetAttribute("slotSpins") or 0
for _, furniture in pairs(ServerFurniture:GetDescendants()) do
if not slotMachineEnabled then break end
if furniture:GetAttribute("furnitureName") == "SlotMachine" then
local prompt = furniture:FindFirstChild("Attachment", true).ProximityPrompt
if prompt then
prompt.MaxActivationDistance = 40
HumanoidRootPart.CFrame = CFrame.new(846.239685, 0.435377538, -919.226746, -0.999359787, 0.0311656408, 0.0175692085, 0.0265386514, 0.975102663, -0.220160127, -0.0239932127, -0.219552919, -0.975305498) * CFrame.new(10, -1.6, -5)
while slotMachineEnabled and LocalPlayer:GetAttribute("slotSpins") > 0 do
fireproximityprompt(prompt)
task.wait(0.5)
end
break
end
end
end
HumanoidRootPart.CFrame = originalCFrame
task.wait(1)
end
end)
end
end
})
local autoUnlockEnabled = false
Main:Toggle({
Title = "开锁光环",
Value = false,
Callback = function(state)
autoUnlockEnabled = state
if state then
task.spawn(function()
while autoUnlockEnabled do
Signal.InvokeServer("attemptPurchase", "Lockpick")
for _, safe in pairs(Workspace.Game.Entities.LargeSafe:GetChildren()) do
if safe:FindFirstChild("ProximityPrompt", true) then
local distance = (HumanoidRootPart.Position - safe.WorldPivot.Position).magnitude
if distance <= 45 then
fireproximityprompt(safe:FindFirstChild("ProximityPrompt", true))
end
end
end
for _, safe in pairs(Workspace.Game.Entities.MediumSafe:GetChildren()) do
if safe:FindFirstChild("ProximityPrompt", true) then
local distance = (HumanoidRootPart.Position - safe.WorldPivot.Position).magnitude
if distance <= 45 then
fireproximityprompt(safe:FindFirstChild("ProximityPrompt", true))
end
end
end
for _, safe in pairs(Workspace.Game.Entities.SmallSafe:GetChildren()) do
if safe:FindFirstChild("ProximityPrompt", true) then
local distance = (HumanoidRootPart.Position - safe.WorldPivot.Position).magnitude
if distance <= 45 then
fireproximityprompt(safe:FindFirstChild("ProximityPrompt", true))
end
end
end
for _, safe in pairs(Workspace.Game.Entities.JewelSafe:GetChildren()) do
if safe:FindFirstChild("ProximityPrompt", true) then
local distance = (HumanoidRootPart.Position - safe.WorldPivot.Position).magnitude
if distance <= 45 then
fireproximityprompt(safe:FindFirstChild("ProximityPrompt", true))
end
end
end
for _, safe in pairs(Workspace.Game.Entities.GoldJewelSafe:GetChildren()) do
if safe:FindFirstChild("ProximityPrompt", true) then
local distance = (HumanoidRootPart.Position - safe.WorldPivot.Position).magnitude
if distance <= 45 then
fireproximityprompt(safe:FindFirstChild("ProximityPrompt", true))
end
end
end
task.wait(0.2)
end
end)
end
end
})
local cashAuraEnabled = false
Main:Toggle({
Title = "现金光环",
Value = false,
Callback = function(state)
cashAuraEnabled = state
if state then
task.spawn(function()
while cashAuraEnabled do
for _, cash in pairs(Workspace.Game.Entities.CashBundle:GetChildren()) do
if not cashAuraEnabled then break end
if cash:FindFirstChildOfClass("Part") then
local part = cash:FindFirstChildOfClass("Part")
local distance = (HumanoidRootPart.Position - part.Position).magnitude
if distance <= 30 and cash:FindFirstChildOfClass("ClickDetector") then
fireclickdetector(cash:FindFirstChildOfClass("ClickDetector"))
end
end
end
task.wait(0.1)
end
end)
end
end
})
local itemAuraEnabled = false
Main:Toggle({
Title = "物品光环",
Value = false,
Callback = function(state)
itemAuraEnabled = state
if state then
task.spawn(function()
local valuableItems = {
"Dark Matter Gem", "Void Gem", "Diamond Ring", "Diamond", "Rollie",
"Watch", "Glock 18", "AR-15", "Amethyst", "Topaz", "Emerald",
"Gold Bar", "Sapphire", "Ruby", "Emerald Ring", "Topaz Ring",
"Amethyst Ring", "Sapphire Ring", "Ruby Ring", "AK-47", "Glock",
"Raygun", "Gold AK-47", "Gold Deagle", "AS Val", "AUG", "Acid Gun",
"P90", "Raygun", "RPK", "Sawn Off", "Scar L", "Saiga 12", "Tommy Gun",
"Double Barrel", "Deagle", "Dragunov", "Flamethrower", "M249 SAW",
"MP7", "Minigun", "M4A1", "Barrett M107", "Gravity Gun",
"Gold Lucky Block", "Orange Lucky Block", "Purple Lucky Block",
"Green Lucky Block", "Red Lucky Block", "Blue Lucky Block",
"Treasure Map", "Pearl Necklace", "Military Armory Keycard",
"Police Armory Keycard", "Money Printer", "RPG", "Trident",
"Gold Crown", "Gold Cup", "Heavy Vest", "Military Vest"
}
while itemAuraEnabled do
for _, item in pairs(Workspace.Game.Entities.ItemPickup:GetChildren()) do
if not itemAuraEnabled then break end
local itemName = item:GetAttribute("itemName")
local mainPart = item:FindFirstChildOfClass("Part")
if mainPart then
for _, valuableName in pairs(valuableItems) do
if itemName == valuableName then
local distance = (HumanoidRootPart.Position - mainPart.Position).magnitude
if distance <= 27 then
if item:FindFirstChildOfClass("ClickDetector") then
fireclickdetector(item:FindFirstChildOfClass("ClickDetector"))
elseif mainPart:FindFirstChildOfClass("ClickDetector") then
fireclickdetector(mainPart:FindFirstChildOfClass("ClickDetector"))
end
end
break
end
end
end
end
task.wait(0.3)
end
end)
end
end
})
local weightFarmEnabled = false
Main:Toggle({
Title = "自动使用哑铃锻炼",
Value = false,
Callback = function(state)
weightFarmEnabled = state
if state then
task.spawn(function()
while weightFarmEnabled do
local equippedName = v3item.inventory.getEquippedItem().name
if equippedName == "Dumbell" then
Signal.FireServer("liftDumbell")
end
task.wait(0.5)
end
end)
end
end
})
local truckCashFarmEnabled = false
Main:Toggle({
Title = "自动收集装甲车现金",
Value = false,
Callback = function(state)
truckCashFarmEnabled = state
if state then
task.spawn(function()
while truckCashFarmEnabled do
for _, vehicle in pairs(Workspace.Game.Vehicles:GetChildren()) do
if not truckCashFarmEnabled then break end
if vehicle.Name == "Armored Truck" and vehicle:FindFirstChild("TruckCash") then
local distance = (HumanoidRootPart.Position - vehicle.PrimaryPart.Position).magnitude
if distance <= 100 then
HumanoidRootPart.CFrame = vehicle.PrimaryPart.CFrame
local truckCash = vehicle:FindFirstChild("TruckCash")
if truckCash and truckCash:FindFirstChild("Main") then
local prompt = truckCash.Main.Attachment.ProximityPrompt
if prompt then
prompt.RequiresLineOfSight = false
prompt.HoldDuration = 0
fireproximityprompt(prompt)
end
end
task.wait(0.5)
end
end
end
task.wait(1)
end
end)
end
end
})
local Main = Window:Tab({Title = "圣诞节活动", Icon = "gift"})
Main:Section({ Title = "刷糖果", Icon = "gift" })
local christmasMobThread = nil
local christmasMobEnabled = false
local function teleportToHideSpot()
end
local function checkAnyTargetExists()
return true
end
local function collectGingerbread()
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
if localPlayer.Character then
local rootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
if rootPart then
if workspace:FindFirstChild("Game") and workspace.Game:FindFirstChild("Entities") then
if workspace.Game.Entities:FindFirstChild("Gingerbread") then
for _, gingerbread in pairs(workspace.Game.Entities.Gingerbread:GetChildren()) do
if gingerbread:IsA("Model") then
for _, v in pairs(gingerbread:GetDescendants()) do
if v:IsA("ClickDetector") then
local detectorPos = gingerbread:GetPivot().Position
local distance = (rootPart.Position - detectorPos).Magnitude
if distance <= 20 then
fireclickdetector(v)
end
end
end
end
end
end
end
end
end
end
Main:Toggle({
Title = "礼物盒农场",
Default = false,
Callback = function(Value)
if christmasMobThread then
task.cancel(christmasMobThread)
christmasMobThread = nil
end
christmasMobEnabled = Value
if Value then
christmasMobThread = task.spawn(function()
while christmasMobEnabled do
task.wait()
if not checkAnyTargetExists() then
teleportToHideSpot()
task.wait(1)
else
pcall(function()
local plr = game:GetService("Players").LocalPlayer
local char = plr.Character
if char and char:FindFirstChild("HumanoidRootPart") then
local christmasMobs = workspace:FindFirstChild("Christmas")
if christmasMobs and christmasMobs:FindFirstChild("Mobs") then
local rootPart = char:FindFirstChild("HumanoidRootPart")
if rootPart then
collectGingerbread()
for _, mob in ipairs(christmasMobs.Mobs:GetChildren()) do
if mob:IsA("Model") then
local health = mob:GetAttribute("health")
if health and health > 0 then
rootPart.CFrame = mob:GetPivot() * CFrame.new(0, 0, -2)
task.wait(0.1)
mob:SetAttribute("health", 0)
task.wait(2)
collectGingerbread()
end
end
end
end
end
end
end)
end
end
end)
end
end
})
Main:Toggle({
Title = "收集姜饼人光环",
Default = false,
Callback = function(Value)
mngh = Value
task.spawn(function()
while mngh and task.wait() do
if not checkAnyTargetExists() then
teleportToHideSpot()
task.wait(1)
else
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
if localPlayer.Character then
local rootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
if rootPart then
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
for _, v in pairs(workspace.Game.Entities.CashBundle:GetDescendants()) do
if v:IsA("ClickDetector") then
local detectorPos = v.Parent:GetPivot().Position
local distance = (rootPart.Position - detectorPos).Magnitude
if distance <= 50 then
fireclickdetector(v)
end
end
end
end
end
end
end
end)
end
})
local Signal = require(game:GetService("ReplicatedStorage").devv).load("Signal")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local autoElfEnabled = false
local autoElfThread = nil
local function findElves()
local elves = {}
local CollectionService = game:GetService("CollectionService")
for _, elf in ipairs(CollectionService:GetTagged("PeterTheElf")) do
if elf:IsA("Model") and elf.PrimaryPart then
local alreadyCollected = false
for _, part in ipairs(elf:GetChildren()) do
if part:IsA("BasePart") and part.Name ~= "Hitbox" then
if part.Transparency >= 0.5 then
alreadyCollected = true
break
end
end
end
if not alreadyCollected then
table.insert(elves, elf)
end
end
end
return elves
end
local function collectElf(elf)
if not elf or not elf.PrimaryPart then return false end
local char = localPlayer.Character
if not char then return false end
local hrp = char:FindFirstChild("HumanoidRootPart")
if not hrp then return false end
hrp.CFrame = elf.PrimaryPart.CFrame * CFrame.new(0, 0, -2)
task.wait(0.5)
local success, gingerbreadAmount = pcall(function()
return Signal.InvokeServer("attemptCollectElf")
end)
if success then
return true
else
return false
end
end
Main:Toggle({
Title = "自动圣诞精灵",
Default = false,
Callback = function(Value)
if autoElfThread then
task.cancel(autoElfThread)
autoElfThread = nil
end
autoElfEnabled = Value
if Value then
autoElfThread = task.spawn(function()
while autoElfEnabled do
task.wait()
pcall(function()
local elves = findElves()
if #elves > 0 then
for _, elf in ipairs(elves) do
if not autoElfEnabled then break end
local collected = collectElf(elf)
if collected then
task.wait(3)
else
task.wait(1)
end
elves = findElves()
if #elves == 0 then break end
end
else
task.wait(5)
end
end)
end
end)
end
end
})
Main:Section({ Title = "任务", Icon = "gift" })
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local load = require(ReplicatedStorage.devv).load
local Signal = load("Signal")
local christmasQuests = load("ChristmasQuests")
local autoQuestThread = nil
local autoQuestEnabled = false
local function getQuestRewards()
local quests = {}
for questType, questData in pairs(christmasQuests) do
if type(questData) == "table" then
table.insert(quests, {
type = questType,
name = questData.title:match(">(.+)<") or questType,
tiers = questData.tiers or {}
})
end
end
return quests
end
local function claimQuestReward(questType, tierIndex)
local success, result = pcall(function()
return Signal.InvokeServer("claimQuestReward", questType, tierIndex)
end)
return success
end
local function checkAndClaimAllQuests()
local claimedCount = 0
local failedCount = 0
for questType, questData in pairs(christmasQuests) do
if type(questData) == "table" and questData.tiers then
for tierIndex = 1, #questData.tiers do
local success = claimQuestReward(questType, tierIndex)
if success then
claimedCount = claimedCount + 1
task.wait(0.2)
else
failedCount = failedCount + 1
end
end
end
end
return claimedCount, failedCount
end
Main:Toggle({
Title = "自动领取姜饼人奖励",
Value = false,
Callback = function(state)
autoQuestEnabled = state
if autoQuestThread then
task.cancel(autoQuestThread)
autoQuestThread = nil
end
if state then
autoQuestThread = task.spawn(function()
while autoQuestEnabled do
checkAndClaimAllQuests()
task.wait(5)
end
end)
else
end
end
})
Main:Button({
Title = "查看任务列表",
Callback = function()
local quests = getQuestRewards()
local message = "圣诞任务列表：\n\n"
for i, quest in ipairs(quests) do
message = message .. string.format("%d. %s\n", i, quest.name)
if quest.tiers and #quest.tiers > 0 then
for j, tier in ipairs(quest.tiers) do
message = message .. string.format(" 等级 %d: %d 姜饼人\n", j, tier.gingerbread or 0)
end
end
message = message .. "\n"
end
WindUI:Notify({
Title = "圣诞任务列表",
Content = message,
Duration = 8,
Icon = "list"
})
end
})
local bs = Window:Tab({Title = "绕过", Icon = "user"})
bs:Button({
Title = "绕过移动经销商[新版本]",
Callback = function()
local pjyd pjyd=hookmetamethod(game,"__namecall",function(self,...)local args={...}local method=getnamecallmethod()if method=="InvokeServer" and args[2]==true then args[2]=false return pjyd(self,unpack(args))end return pjyd(self,...)end)
game:GetService("Players").LocalPlayer:SetAttribute("mobileDealer",true)
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local mobileDealer=require(ReplicatedStorage.devv.shared.Indicies.mobileDealer)
for category,items in pairs(mobileDealer)do
for _,item in ipairs(items)do
item.stock=999999
end
end
table.insert(mobileDealer.Gun,{itemName="Acid Gun",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Candy Bucket",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Golden Rose",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Black Rose",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Dollar Balloon",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Bat Balloon",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Bunny Balloon",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Clover Balloon",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Ghost Balloon",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Gold Clover Balloon",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Heart Balloon",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Skull Balloon",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Snowflake Balloon",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Admin AK-47",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Admin Nuke Launcher",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Admin RPG",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Void Gem",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Pulse Rifle",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Unusual Money Printer",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Money Printer",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Trident",stock=9999})
table.insert(mobileDealer.Gun,{itemName="NextBot Grenade",stock=9999})
table.insert(mobileDealer.Gun,{itemName="El Fuego",stock=9999})
end
})
bs:Button({
Title = "绕过高级表情包",
Callback = function()
for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Emotes.Frame.ScrollingFrame:GetDescendants()) do
if v.Name == "Locked" then
v.Visible = false
end
end
end
})
bs:Button({
Title = "绕过飞行检测",
Callback = function()
if game:GetService("ReplicatedStorage"):FindFirstChild("devv"):FindFirstChild("remoteStorage"):FindFirstChild("makeExplosion") then
game:GetService("ReplicatedStorage"):FindFirstChild("devv"):FindFirstChild("remoteStorage"):FindFirstChild("makeExplosion"):Destroy()
end
end
})
bs:Button({
Title = "绕过物品栏封禁",
Callback = function()
if game:GetService("ReplicatedStorage"):FindFirstChild("devv"):FindFirstChild("remoteStorage"):FindFirstChild("makeExplosion") then
game:GetService("ReplicatedStorage"):FindFirstChild("devv"):FindFirstChild("remoteStorage"):FindFirstChild("makeExplosion"):Destroy()
end
end
})
bs:Button({
Title = "绕过战斗状态",
Callback = function()
for _, func in pairs(getgc(true)) do
if type(func) == "function" then
local info = debug.getinfo(func)
if info.name == "isInCombat" or (info.source and info.source:find("combatIndicator")) then
hookfunction(func, function()
return false
end)
end
end
end
end
})
local Main = Window:Tab({Title = "本地", Icon = "box"})
Main:Section({ Title = "免费物品", Icon = "swords" })
local items = {
"Golden Rose",
"Black Rose",
"Dollar Balloon",
"Bat Balloon",
"Bunny Balloon",
"Clover Balloon",
"Ghost Balloon",
"Gold Clover Balloon",
"Heart Balloon",
"Skull Balloon",
"Snowflake Balloon",
"Admin AK-47",
"Admin Nuke Launcher",
"Admin RPG",
"Void Gem",
"Pulse Rifle",
"Unusual Money Printer",
"Money Printer",
"Trident",
"NextBot Grenade",
"El Fuego"
}
local itemDisplayNames = {
["Golden Rose"] = "金玫瑰",
["Black Rose"] = "黑玫瑰",
["Dollar Balloon"] = "美元气球",
["Bat Balloon"] = "蝙蝠气球",
["Bunny Balloon"] = "兔子气球",
["Clover Balloon"] = "三叶草气球",
["Ghost Balloon"] = "幽灵气球",
["Gold Clover Balloon"] = "金三叶草气球",
["Heart Balloon"] = "爱心气球",
["Skull Balloon"] = "骷髅气球",
["Snowflake Balloon"] = "雪花气球",
["Admin AK-47"] = "管理员黄金AK-47",
["Admin Nuke Launcher"] = "管理员核弹发射器",
["Admin RPG"] = "管理员RPG",
["Void Gem"] = "虚空宝石",
["Pulse Rifle"] = "脉冲步枪",
["Unusual Money Printer"] = "异常印钞机",
["Money Printer"] = "印钞机",
["Trident"] = "三叉戟",
["NextBot Grenade"] = "NextBot手榴弹",
["El Fuego"] = "烈焰喷射器"
}
local itemData = {
["Bat Balloon"] = {
name = "Bat Balloon",
cost = 0,
unpurchasable = true,
multiplier = 0.625,
holdableType = "Balloon",
canDrop = true,
dropCooldown = 120,
permanent = true,
TPSOffsets = {hold = CFrame.new(0, 0, 0)},
viewportOffsets = {
hotbar = {dist = 5.5, offset = CFrame.new(0, 0, 0), rotoffset = CFrame.Angles(0, math.pi, 0)},
ammoHUD = {dist = 5, offset = CFrame.new(0, 0, 0), rotoffset = CFrame.Angles(0, 0, 0)}
}
},
["Bunny Balloon"] = {
name = "Bunny Balloon",
cost = 0,
unpurchasable = true,
multiplier = 0.61,
holdableType = "Balloon",
canDrop = true,
dropCooldown = 120,
permanent = true,
TPSOffsets = {hold = CFrame.new(0, 0, 0)},
viewportOffsets = {
hotbar = {dist = 4.75, offset = CFrame.new(0, -0.25, 0), rotoffset = CFrame.Angles(0, 4.71238898038469, 0)},
ammoHUD = {dist = 5, offset = CFrame.new(0, 0, 0), rotoffset = CFrame.Angles(0, 0, 0)}
}
},
["Clover Balloon"] = {
name = "Clover Balloon",
cost = 200,
unpurchasable = true,
multiplier = 0.625,
holdableType = "Balloon",
canDrop = true,
dropCooldown = 120,
permanent = true,
TPSOffsets = {hold = CFrame.new(0, 0, 0)},
viewportOffsets = {
hotbar = {dist = 5, offset = CFrame.new(0, 0, 0), rotoffset = CFrame.Angles(0, 0, 0)},
ammoHUD = {dist = 5, offset = CFrame.new(0, 0, 0), rotoffset = CFrame.Angles(0, 0, 0)}
}
},
["Ghost Balloon"] = {
name = "Ghost Balloon",
cost = 0,
unpurchasable = true,
multiplier = 0.625,
holdableType = "Balloon",
canDrop = true,
dropCooldown = 120,
permanent = true,
TPSOffsets = {hold = CFrame.new(0, 0, 0)},
viewportOffsets = {
hotbar = {dist = 3.5, offset = CFrame.new(0, 0.5, 0), rotoffset = CFrame.Angles(0, math.pi, 0)},
ammoHUD = {dist = 5, offset = CFrame.new(0, 0, 0), rotoffset = CFrame.Angles(0, 0, 0)}
}
},
["Gold Clover Balloon"] = {
name = "Gold Clover Balloon",
cost = 250000,
unpurchasable = true,
multiplier = 0.6,
holdableType = "Balloon",
canDrop = true,
dropCooldown = 120,
permanent = true,
TPSOffsets = {hold = CFrame.new(0, 0, 0)},
viewportOffsets = {
hotbar = {dist = 5, offset = CFrame.new(0, 0, 0), rotoffset = CFrame.Angles(0, 0, 0)},
ammoHUD = {dist = 5, offset = CFrame.new(0, 0, 0), rotoffset = CFrame.Angles(0, 0, 0)}
}
},
["Heart Balloon"] = {
name = "Heart Balloon",
cost = 200,
multiplier = 0.6,
holdableType = "Balloon",
unpurchasable = true,
canDrop = true,
dropCooldown = 120,
permanent = true,
TPSOffsets = {hold = CFrame.new(0, 0, 0)},
viewportOffsets = {
hotbar = {dist = 5, offset = CFrame.new(0, 0, 0), rotoffset = CFrame.Angles(0, 0, 0)},
ammoHUD = {dist = 5, offset = CFrame.new(0, 0, 0), rotoffset = CFrame.Angles(0, 0, 0)}
}
},
["Skull Balloon"] = {
name = "Skull Balloon",
cost = 0,
unpurchasable = true,
multiplier = 0.625,
holdableType = "Balloon",
canDrop = true,
dropCooldown = 120,
permanent = true,
TPSOffsets = {hold = CFrame.new(0, 0, 0)},
viewportOffsets = {
hotbar = {dist = 5.5, offset = CFrame.new(0, 0, 0), rotoffset = CFrame.Angles(0, -270, 0)},
ammoHUD = {dist = 5, offset = CFrame.new(0, 0, 0), rotoffset = CFrame.Angles(0, 0, 0)}
}
},
["Snowflake Balloon"] = {
name = "Snowflake Balloon",
cost = 0,
unpurchasable = true,
multiplier = 0.625,
holdableType = "Balloon",
canDrop = true,
dropCooldown = 120,
permanent = true,
TPSOffsets = {hold = CFrame.new(0, 0, 0)},
viewportOffsets = {
hotbar = {dist = 5, offset = CFrame.new(0, 0, 0), rotoffset = CFrame.Angles(0, (math.pi/2), 0)},
ammoHUD = {dist = 5, offset = CFrame.new(0, 0, 0), rotoffset = CFrame.Angles(0, 0, 0)}
}
},
["Golden Rose"] = {
name = "Golden Rose",
guid = "golden_rose_"..tostring(tick()),
permanent = true,
canDrop = true,
dropCooldown = 120,
multiplier = 0.625,
holdableType = "Balloon",
movespeedAdd = 5,
TPSOffsets = {hold = CFrame.new(0, 0.5, 0)},
viewportOffsets = {
hotbar = {dist = 3, offset = CFrame.new(0, 0, 0), rotoffset = CFrame.Angles(0, (math.pi/2), 0)},
ammoHUD = {dist = 2, offset = CFrame.new(-0.1, -0.2, 0), rotoffset = CFrame.Angles(0, -1.3744467859455345, 0)},
slotButton = {dist = 1, offset = CFrame.new(-0.1, -0.2, 0), rotoffset = CFrame.Angles(0, (-math.pi/2), 0)}
}
},
["Black Rose"] = {
name = "Black Rose",
guid = "black_rose_"..tostring(tick()),
permanent = true,
canDrop = true,
dropCooldown = 120,
multiplier = 0.75,
holdableType = "Balloon",
movespeedAdd = 12,
TPSOffsets = {hold = CFrame.new(0, 0.5, 0)},
viewportOffsets = {
hotbar = {dist = 3, offset = CFrame.new(0, 0, 0), rotoffset = CFrame.Angles(0, (math.pi/2), 0)},
ammoHUD = {dist = 2, offset = CFrame.new(-0.1, -0.2, 0), rotoffset = CFrame.Angles(0, -1.3744467859455345, 0)},
slotButton = {dist = 1, offset = CFrame.new(-0.1, -0.2, 0), rotoffset = CFrame.Angles(0, (-math.pi/2), 0)}
}
},
["Dollar Balloon"] = {
name = "Dollar Balloon",
cost = 100000000000,
unpurchasable = true,
multiplier = 0.8,
holdableType = "Balloon",
movespeedAdd = 8,
cannotDiscard = true,
TPSOffsets = {hold = CFrame.new(0, 0, 0) * CFrame.Angles(0, math.pi, 0)},
viewportOffsets = {
hotbar = {dist = 4, offset = CFrame.new(0, 0, 0), rotoffset = CFrame.Angles(0, 0, 0)},
ammoHUD = {dist = 5, offset = CFrame.new(0, 0, 0), rotoffset = CFrame.Angles(0, 0, 0)}
}
},
["Admin AK-47"] = {
name = "Admin AK-47",
modelName = "Gold AK-47",
subtype = "AK-47",
adminOnly = true,
canDrop = false,
unpurchasable = true,
damage = 10,
ammo = 999999999,
startAmmo = -1,
maxAmmo = -1,
firemode = "auto",
numProjectiles = 8,
fireDebounce = 0.01
},
["Admin Nuke Launcher"] = {
name = "Admin Nuke Launcher",
modelName = "Nuke Launcher",
subtype = "Nuke Launcher",
adminOnly = true,
canDrop = false,
unpurchasable = true,
ammo = 99999999,
startAmmo = -1,
maxAmmo = -1,
overrideProjectileProperties = {
disableNukeFlash = true
},
reloadTime = 0,
reloadType = "mag",
firemode = "auto",
numProjectiles = 1,
fireDebounce = 0.2
},
["Admin RPG"] = {
canDrop = false,
unpurchasable = true,
name = "Admin RPG",
modelName = "RPG",
subtype = "RPG",
adminOnly = true,
ammo = 99999999,
startAmmo = -1,
maxAmmo = -1,
reloadTime = 0,
reloadType = "mag",
firemode = "auto",
numProjectiles = 1,
fireDebounce = 0.02,
recoilAdd = 0,
maxRecoil = 0,
recoilDiminishFactor = 0,
recoilFastDiminishFactor = 0
},
["Void Gem"] = {
name = "Void Gem",
subtype = "gem",
maxAmmo = 3,
adminLimit = 1,
sellPrice = 25000,
canDrop = true,
dropCooldown = 300
},
["Pulse Rifle"] = {
name = "Pulse Rifle",
subtype = "Raygun",
unpurchasable = true,
damage = 22,
headshotMultiplier = 1.5,
ammo = 50,
startAmmo = -1,
maxAmmo = -1,
reloadTime = 3.5,
reloadType = "mag",
firemode = "auto",
numProjectiles = 1,
fireDebounce = 0.04,
projectileLength = 20,
projectileLifetime = 200,
speedDropoff = 0.04,
speedMax = 5,
baseSpread = 3,
baseAimSpread = 0.8,
spread = 11,
aimSpread = 2.4,
recoilAdd = 0.05,
maxRecoil = 0.4,
recoilDiminishFactor = 0.95,
recoilFastDiminishFactor = 0.85
},
["Unusual Money Printer"] = {
name = "Unusual Money Printer",
cost = 500,
ammo = 1,
startAmmo = -1,
maxAmmo = 1,
hint = {
computer = "Click to Place",
console = "Click to Place"
},
canDrop = true,
dropCooldown = 600,
isConsumable = true,
TPSOffsets = {
hold = CFrame.new(-0.1, 0, -0.75) * CFrame.Angles(0, 0, 0)
},
viewportOffsets = {
hotbar = {
dist = 5,
offset = CFrame.new(0, 0.15, 0),
rotoffset = CFrame.Angles(0, (-math.pi/2), 0)
},
ammoHUD = {
dist = 3.25,
offset = CFrame.new(0, 1, 0),
rotoffset = CFrame.Angles(0, (math.pi/2), 0)
}
}
},
["Money Printer"] = {
name = "Money Printer",
ammo = 1,
startAmmo = -1,
maxAmmo = 1,
adminLimit = 10,
hint = {
computer = "Click to Place",
console = "Click to Place"
},
canDrop = true,
dropCooldown = 600,
isConsumable = true,
permanent = true,
TPSOffsets = {
hold = CFrame.new(-0.1, 0, -0.75) * CFrame.Angles(0, 0, 0)
},
viewportOffsets = {
hotbar = {
dist = 5,
offset = CFrame.new(0, 0.15, 0),
rotoffset = CFrame.Angles(0, (-math.pi/2), 0)
},
ammoHUD = {
dist = 3.25,
offset = CFrame.new(0, 1, 0),
rotoffset = CFrame.Angles(0, (-math.pi/2), 0)
}
}
},
["Trident"] = {
name = "Trident",
subtype = "RPG",
unpurchasable = true,
ammo = 1,
startAmmo = 12,
maxAmmo = 12,
firemode = "semi",
numProjectiles = 3,
fireDebounce = 0.5,
projectileLength = 4,
projectileLifetime = 1000,
speedDropoff = 0.04,
speedMax = 5,
baseSpread = 5,
baseAimSpread = 1,
spread = 10,
aimSpread = 6,
recoilAdd = 1,
maxRecoil = 1.25,
recoilDiminishFactor = 0.9,
recoilFastDiminishFactor = 0.66
},
["NextBot Grenade"] = {
name = "NextBot Grenade",
isNade = true,
bounceSFX = "nadeBounce",
canDrop = true,
dropCooldown = 600,
thrownOffset = CFrame.Angles(0, (math.pi/2), 0),
ammo = 1,
startAmmo = -1,
maxAmmo = 1,
permanent = true,
throwDist = 50,
TPSOffsets = {
hold = CFrame.new(-0.1, 0.25, -0.125)
},
viewportOffsets = {
hotbar = {
dist = 2.75,
offset = CFrame.new(0, -0.125, 0),
rotoffset = CFrame.Angles(0, 1.8849555921538759, 0)
},
ammoHUD = {
dist = 2,
offset = CFrame.new(0, 0.1, 0),
rotoffset = CFrame.Angles(0, (math.pi/2), 0)
}
}
},
["El Fuego"] = {
name = "El Fuego",
modelName = "El Fuego",
subtype = "Flamethrower",
unpurchasable = true,
ammo = 600,
startAmmo = 0,
maxAmmo = 600,
reloadTime = 6,
reloadType = "mag",
firemode = "auto",
damage = 6,
numProjectiles = 3,
fireDebounce = 0.05,
projectileLength = 4,
projectileLifetime = 60,
speedDropoff = 0.04,
speedMax = 5,
baseSpread = 4,
baseAimSpread = 2,
spread = 12,
aimSpread = 6,
recoilAdd = 0.1,
maxRecoil = 1,
recoilDiminishFactor = 0.95,
recoilFastDiminishFactor = 0.8
}
}
local function getItemList()
local itemList = {}
for _, itemName in ipairs(items) do
local displayName = itemDisplayNames[itemName] or itemName
table.insert(itemList, displayName)
end
return itemList
end
local selectedItem = ""
local itemDropdown = Main:Dropdown({
Title = "选择物品",
Desc = "从列表中选择要获得的物品",
Values = getItemList(),
Value = "",
Callback = function(value)
if value and value ~= "" then
selectedItem = value
else
selectedItem = ""
end
end
})
local function getItemNameByDisplayName(displayName)
for itemName, dispName in pairs(itemDisplayNames) do
if dispName == displayName then
return itemName
end
end
return displayName
end
local function addItem(itemName)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
pcall(function()
local itemSystem = require(ReplicatedStorage.devv).load("v3item")
local inventory = itemSystem.inventory
if not itemData[itemName] then
warn("物品数据不存在: " .. itemName)
return
end
local itemConfig = itemData[itemName]
local itemToAdd = {
name = itemConfig.name,
guid = itemName:lower():gsub(" ", "_").."_"..tostring(tick()),
permanent = itemConfig.permanent or true,
canDrop = itemConfig.canDrop or true,
dropCooldown = itemConfig.dropCooldown or 120,
multiplier = itemConfig.multiplier or 0.625,
holdableType = itemConfig.holdableType or "Balloon",
movespeedAdd = itemConfig.movespeedAdd or 0,
cannotDiscard = itemConfig.cannotDiscard or false,
TPSOffsets = itemConfig.TPSOffsets or {hold = CFrame.new(0, 0.5, 0)},
viewportOffsets = itemConfig.viewportOffsets or {
hotbar = {dist = 3, offset = CFrame.new(0, 0, 0), rotoffset = CFrame.Angles(0, (math.pi/2), 0)},
ammoHUD = {dist = 2, offset = CFrame.new(-0.1, -0.2, 0), rotoffset = CFrame.Angles(0, -1.3744467859455345, 0)},
slotButton = {dist = 1, offset = CFrame.new(-0.1, -0.2, 0), rotoffset = CFrame.Angles(0, (-math.pi/2), 0)}
}
}
if itemConfig.subtype then itemToAdd.subtype = itemConfig.subtype end
if itemConfig.modelName then itemToAdd.modelName = itemConfig.modelName end
if itemConfig.adminOnly then itemToAdd.adminOnly = itemConfig.adminOnly end
if itemConfig.damage then itemToAdd.damage = itemConfig.damage end
if itemConfig.ammo then itemToAdd.ammo = itemConfig.ammo end
if itemConfig.startAmmo then itemToAdd.startAmmo = itemConfig.startAmmo end
if itemConfig.maxAmmo then itemToAdd.maxAmmo = itemConfig.maxAmmo end
if itemConfig.reloadTime then itemToAdd.reloadTime = itemConfig.reloadTime end
if itemConfig.reloadType then itemToAdd.reloadType = itemConfig.reloadType end
if itemConfig.firemode then itemToAdd.firemode = itemConfig.firemode end
if itemConfig.numProjectiles then itemToAdd.numProjectiles = itemConfig.numProjectiles end
if itemConfig.fireDebounce then itemToAdd.fireDebounce = itemConfig.fireDebounce end
if itemConfig.projectileLength then itemToAdd.projectileLength = itemConfig.projectileLength end
if itemConfig.projectileLifetime then itemToAdd.projectileLifetime = itemConfig.projectileLifetime end
if itemConfig.headshotMultiplier then itemToAdd.headshotMultiplier = itemConfig.headshotMultiplier end
if itemConfig.hint then itemToAdd.hint = itemConfig.hint end
if itemConfig.isConsumable then itemToAdd.isConsumable = itemConfig.isConsumable end
if itemConfig.isNade then itemToAdd.isNade = itemConfig.isNade end
if itemConfig.throwDist then itemToAdd.throwDist = itemConfig.throwDist end
if itemConfig.sellPrice then itemToAdd.sellPrice = itemConfig.sellPrice end
if itemConfig.adminLimit then itemToAdd.adminLimit = itemConfig.adminLimit end
if itemConfig.overrideProjectileProperties then itemToAdd.overrideProjectileProperties = itemConfig.overrideProjectileProperties end
if itemConfig.recoilAdd then itemToAdd.recoilAdd = itemConfig.recoilAdd end
if itemConfig.maxRecoil then itemToAdd.maxRecoil = itemConfig.maxRecoil end
if itemConfig.recoilDiminishFactor then itemToAdd.recoilDiminishFactor = itemConfig.recoilDiminishFactor end
if itemConfig.recoilFastDiminishFactor then itemToAdd.recoilFastDiminishFactor = itemConfig.recoilFastDiminishFactor end
if inventory.add then
inventory.add(itemToAdd, false)
if inventory.currentItemsData then
table.insert(inventory.currentItemsData, itemToAdd)
end
end
if inventory.rerender then
inventory:rerender()
end
end)
end
Main:Button({
Title = "免费获得选择的物品",
Callback = function()
if selectedItem and selectedItem ~= "" then
local itemName = getItemNameByDisplayName(selectedItem)
if itemName then
addItem(itemName)
end
end
end
})
Main:Section({ Title = "免费箱子", Icon = "swords" })
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local load = require(ReplicatedStorage.devv).load
local var4_result1_upvr_5 = load("skins")
local var4_result1_upvr_9 = load("state")
local var4_result1_upvr_10 = load("Signal")
local caseList = {}
local selectedCase = "Series3Heavy"
local function getAvailableCases()
local cases = {}
for caseName, caseData in pairs(var4_result1_upvr_5.cases) do
table.insert(cases, caseName)
end
table.sort(cases)
return cases
end
caseList = getAvailableCases()
Main:Dropdown({
Title = "选择箱子类型",
Values = caseList,
Value = selectedCase,
Callback = function(value)
selectedCase = value
end
})
Main:Button({
Title = "获得999个选中箱子",
Callback = function()
if not var4_result1_upvr_9.data.ownedCases then
var4_result1_upvr_9.data.ownedCases = {}
end
var4_result1_upvr_9.data.ownedCases[selectedCase] = 999
if var4_result1_upvr_9.data.ownedCases[selectedCase] then
else
end
end
})
Main:Button({
Title = "获得所有箱子999个",
Callback = function()
if not var4_result1_upvr_9.data.ownedCases then
var4_result1_upvr_9.data.ownedCases = {}
end
local count = 0
for _, caseName in ipairs(caseList) do
var4_result1_upvr_9.data.ownedCases[caseName] = 999
count = count + 1
end
end
})
Main:Section({ Title = "皮肤类", Icon = "swords" })
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local load = require(ReplicatedStorage.devv).load
local var6_result1_upvr_5 = load("skins")
local var6_result1_upvr_4 = load("state")
local var6_result1_upvr_2 = load("Signal")
local skinList = {}
local selectedWeapon = "AK-47"
local function getWeaponList()
local weapons = {}
for _, weapon in ipairs(var6_result1_upvr_5.compatabilities.Generic or {}) do
table.insert(weapons, weapon)
end
table.sort(weapons)
return weapons
end
local function getSkinListForWeapon(weapon)
local skins = {}
for skinName, skinData in pairs(var6_result1_upvr_5.skinData or {}) do
local compatTable = var6_result1_upvr_5.GetCompatabilityTable(skinName, weapon)
if compatTable and #compatTable > 0 then
table.insert(skins, skinName)
end
end
table.sort(skins)
return skins
end
local weaponList = getWeaponList()
Main:Dropdown({
Title = "选择武器类型",
Values = weaponList,
Value = selectedWeapon,
Callback = function(value)
selectedWeapon = value
end
})
Main:Button({
Title = "解锁选中武器全部皮肤",
Callback = function()
if not var6_result1_upvr_4.data.ownedSkins then
var6_result1_upvr_4.data.ownedSkins = {}
end
if not var6_result1_upvr_4.data.ownedSkins[selectedWeapon] then
var6_result1_upvr_4.data.ownedSkins[selectedWeapon] = {}
end
local skinCount = 0
for skinName, skinData in pairs(var6_result1_upvr_5.skinData or {}) do
local compatTable = var6_result1_upvr_5.GetCompatabilityTable(skinName, selectedWeapon)
if compatTable and #compatTable > 0 then
var6_result1_upvr_4.data.ownedSkins[selectedWeapon][skinName] = 99
skinCount = skinCount + 1
end
end
WindUI:Notify({
Title = "皮肤",
Content = "成功解锁" .. selectedWeapon .. "的" .. skinCount .. "个皮肤",
Duration = 3,
Icon = "check"
})
end
})
Main:Button({
Title = "解锁所有武器全部皮肤",
Callback = function()
if not var6_result1_upvr_4.data.ownedSkins then
var6_result1_upvr_4.data.ownedSkins = {}
end
local totalSkins = 0
for _, weapon in ipairs(weaponList) do
if not var6_result1_upvr_4.data.ownedSkins[weapon] then
var6_result1_upvr_4.data.ownedSkins[weapon] = {}
end
for skinName, skinData in pairs(var6_result1_upvr_5.skinData or {}) do
local compatTable = var6_result1_upvr_5.GetCompatabilityTable(skinName, weapon)
if compatTable and #compatTable > 0 then
var6_result1_upvr_4.data.ownedSkins[weapon][skinName] = 99
totalSkins = totalSkins + 1
end
end
end
WindUI:Notify({
Title = "皮肤",
Content = "成功解锁所有" .. #weaponList .. "种武器的" .. totalSkins .. "个皮肤",
Duration = 3,
Icon = "check"
})
end
})
local function setupCurrencyCheats()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local load = require(ReplicatedStorage.devv).load
local Signal = load("Signal")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local moneyDisplay = load("moneyDisplay")
local v3item = load("v3item")
local gingerbreadAmount = 99999
local moneyAmount = 999999999
Main:Section({ Title = "姜饼人", Icon = "cookie" })
Main:Input({
Title = "姜饼人数量",
Value = "99999",
Placeholder = "输入姜饼人数量",
Callback = function(value)
local num = tonumber(value)
if num and num > 0 then
gingerbreadAmount = num
end
end
})
Main:Button({
Title = "获得姜饼人",
Icon = "cookie",
Callback = function()
pcall(function()
LocalPlayer:SetAttribute("gingerbread", gingerbreadAmount)
end)
WindUI:Notify({
Title = "姜饼人",
Content = string.format("获得 %d 个姜饼人", gingerbreadAmount),
Duration = 3,
Icon = "check"
})
end
})
Main:Section({ Title = "金钱", Icon = "dollar-sign" })
Main:Input({
Title = "金钱数量",
Value = "999999999",
Placeholder = "输入金钱数量",
Callback = function(value)
local num = tonumber(value)
if num and num > 0 then
moneyAmount = num
end
end
})
Main:Button({
Title = "获得金钱",
Icon = "dollar-sign",
Callback = function()
pcall(function()
local moneydata = tostring(moneyAmount)
moneyDisplay.current = moneydata
moneyDisplay.tweenTo = moneydata
moneyDisplay.caChing()
end)
WindUI:Notify({
Title = "金钱",
Content = string.format("获得 $%s", tostring(moneyAmount)),
Duration = 3,
Icon = "check"
})
end
})
Main:Button({
Title = "更新钱包显示",
Icon = "refresh-cw",
Callback = function()
pcall(function()
local equippedItem = v3item.inventory.getEquipped()
if equippedItem and equippedItem.name == "Wallet" then
local moneydata = tostring(moneyAmount)
equippedItem.controller:updateMoney(moneydata)
WindUI:Notify({
Title = "钱包更新",
Content = "已更新钱包显示",
Duration = 2,
Icon = "check"
})
else
WindUI:Notify({
Title = "错误",
Content = "请先装备钱包",
Duration = 3,
Icon = "x"
})
end
end)
end
})
end
setupCurrencyCheats()
local CasePurchase = Window:Tab({Title = "皮肤箱子", Icon = "shopping-bag"})
local casesList = {}
local skins = require(game:GetService("ReplicatedStorage").devv).load("skins")
for caseName, caseData in pairs(skins.cases) do
if caseData.cashPrice or caseData.candyPrice or caseData.gingerbreadPrice then
table.insert(casesList, caseName)
end
end
local selectedCase = casesList[1]
local selectedOpenCase = casesList[1]
local autoOpenSelected = false
local autoBuySelected = false
local autoOpenAll = false
CasePurchase:Dropdown({
Title = "选择要购买的箱子",
Values = casesList,
Callback = function(Value)
selectedCase = Value
end
})
CasePurchase:Button({
Title = "购买一次选中箱子",
Callback = function()
local Signal = require(game:GetService("ReplicatedStorage").devv).load("Signal")
Signal.InvokeServer("buyCases", selectedCase, 1)
end
})
CasePurchase:Toggle({
Title = "自动购买选中箱子",
Value = false,
Callback = function(state)
autoBuySelected = state
if state then
task.spawn(function()
local Signal = require(game:GetService("ReplicatedStorage").devv).load("Signal")
while autoBuySelected do
Signal.InvokeServer("buyCases", selectedCase, 1)
task.wait(0.5)
end
end)
end
end
})
CasePurchase:Dropdown({
Title = "选择要开启的箱子",
Values = casesList,
Callback = function(Value)
selectedOpenCase = Value
end
})
CasePurchase:Toggle({
Title = "自动开启选中箱子",
Value = false,
Callback = function(state)
autoOpenSelected = state
if state then
task.spawn(function()
local Signal = require(game:GetService("ReplicatedStorage").devv).load("Signal")
local state = require(game:GetService("ReplicatedStorage").devv).load("state")
while autoOpenSelected do
local ownedCount = state.data.ownedCases[selectedOpenCase] or 0
if ownedCount > 0 then
Signal.InvokeServer("openCase", selectedOpenCase)
task.wait(0.5)
else
task.wait(1)
end
end
end)
end
end
})
CasePurchase:Toggle({
Title = "自动开全部箱子",
Value = false,
Callback = function(state)
autoOpenAll = state
if state then
task.spawn(function()
local Signal = require(game:GetService("ReplicatedStorage").devv).load("Signal")
local state = require(game:GetService("ReplicatedStorage").devv).load("state")
while autoOpenAll do
for caseName, ownedCount in pairs(state.data.ownedCases or {}) do
if ownedCount > 0 and not autoOpenSelected then
Signal.InvokeServer("openCase", caseName)
task.wait(0.3)
end
end
task.wait(1)
end
end)
end
end
})
local RiskyTab = Window:Tab({Title = "玩家", Icon = "users"})
RiskyTab:Section({ Title = "自定义动画", Icon = "activity" })
local animationList = {}
for _, anim in pairs(ReplicatedStorage.Anims:GetChildren()) do
table.insert(animationList, anim.Name)
end
table.sort(animationList)
local selectedAnimation = ""
RiskyTab:Dropdown({
Title = "选择动画",
Desc = "选择要应用的动画",
Values = animationList,
Value = "",
Callback = function(value)
selectedAnimation = value
if value and value ~= "" then
local animateScript = LocalPlayer.Character:WaitForChild("Animate")
local animation = ReplicatedStorage.Anims[value]
if animateScript and animation then
animateScript.idle.Animation1.AnimationId = animation.AnimationId
animateScript.idle.Animation2.AnimationId = animation.AnimationId
local walkAnim = animateScript.walk:FindFirstChildWhichIsA("Animation")
if walkAnim then walkAnim.AnimationId = animation.AnimationId end
local runAnim = animateScript.run:FindFirstChildWhichIsA("Animation")
if runAnim then runAnim.AnimationId = animation.AnimationId end
local jumpAnim = animateScript.jump:FindFirstChildWhichIsA("Animation")
if jumpAnim then jumpAnim.AnimationId = animation.AnimationId end
local swimAnim = animateScript.swim:FindFirstChildWhichIsA("Animation")
if swimAnim then swimAnim.AnimationId = animation.AnimationId end
local climbAnim = animateScript.climb:FindFirstChildWhichIsA("Animation")
if climbAnim then climbAnim.AnimationId = animation.AnimationId end
local swimIdleAnim = animateScript.swimidle:FindFirstChildWhichIsA("Animation")
if swimIdleAnim then swimIdleAnim.AnimationId = animation.AnimationId end
local fallAnim = animateScript.fall:FindFirstChildWhichIsA("Animation")
if fallAnim then fallAnim.AnimationId = animation.AnimationId end
WindUI:Notify({
Title = "动画设置",
Content = "已应用 " .. value .. " 动画",
Duration = 3,
Icon = "check"
})
end
end
end
})
RiskyTab:Section({ Title = "服装获取", Icon = "user" })
RiskyTab:Button({
Title = "警察制服",
Desc = "自动获取警察制服和帽子",
Callback = function()
local originalCFrame = HumanoidRootPart.CFrame
for _, furniture in pairs(Workspace.ServerFurniture:GetDescendants()) do
if furniture:IsA("Model") and furniture:GetAttribute("furnitureName") == "PoliceUniform" then
HumanoidRootPart.CFrame = furniture.PrimaryPart.CFrame
task.wait(0.6)
if furniture.Handle and furniture.Handle:FindFirstChild("ProximityPrompt") then
fireproximityprompt(furniture.Handle.ProximityPrompt)
end
break
end
end
task.wait(0.2)
HumanoidRootPart.CFrame = originalCFrame
for _, furniture in pairs(Workspace.ServerFurniture:GetDescendants()) do
if furniture:IsA("Model") and furniture:GetAttribute("furnitureName") == "PoliceHat" then
HumanoidRootPart.CFrame = furniture.PrimaryPart.CFrame
task.wait(0.6)
if furniture.Hitbox and furniture.Hitbox:FindFirstChild("ProximityPrompt") then
fireproximityprompt(furniture.Hitbox.ProximityPrompt)
end
break
end
end
HumanoidRootPart.CFrame = originalCFrame
WindUI:Notify({
Title = "服装获取",
Content = "已获取警察制服",
Duration = 3,
Icon = "check"
})
end
})
RiskyTab:Button({
Title = "小丑帽子",
Desc = "自动获取小丑帽子",
Callback = function()
local originalCFrame = HumanoidRootPart.CFrame
for _, furniture in pairs(Workspace.ServerFurniture:GetDescendants()) do
if furniture:GetAttribute("furnitureName") == "Clown" then
HumanoidRootPart.CFrame = furniture.WorldPivot * CFrame.new(0, 0, 3)
task.wait(0.7)
if furniture.Hitbox and furniture.Hitbox:FindFirstChild("ProximityPrompt") then
fireproximityprompt(furniture.Hitbox.ProximityPrompt)
end
break
end
end
HumanoidRootPart.CFrame = originalCFrame
WindUI:Notify({
Title = "服装获取",
Content = "已获取小丑帽子",
Duration = 3,
Icon = "check"
})
end
})
RiskyTab:Section({ Title = "防御功能", Icon = "shield" })
RiskyTab:Toggle({
Title = "防抓取",
Value = false,
Callback = function(state)
local antiGrab = state
if antiGrab then
task.spawn(function()
local ClientReplicator = devv.load("ClientReplicator")
while antiGrab do
if ClientReplicator.Get(LocalPlayer, "carried") == true then
ClientReplicator.Set(LocalPlayer, "carried", false)
end
task.wait(0.1)
end
end)
end
end
})
RiskyTab:Toggle({
Title = "防倒地",
Value = false,
Callback = function(state)
local antiRagdoll = state
if antiRagdoll then
task.spawn(function()
while antiRagdoll do
if LocalPlayer:GetAttribute("isRagdoll") == true then
local ClientRagdoll = devv.load("ClientRagdoll")
ClientRagdoll.SetRagdoll(LocalPlayer, false)
end
task.wait(0.1)
end
end)
end
end
})
RiskyTab:Toggle({
Title = "静默格挡",
Value = false,
Callback = function(state)
local silentBlock = state
if silentBlock then
task.spawn(function()
local ClientReplicator = devv.load("ClientReplicator")
while silentBlock do
if ClientReplicator.Get(LocalPlayer, "blocking") == false then
ClientReplicator.Set(LocalPlayer, "blocking", true)
ClientReplicator.Replicate("blocking")
end
task.wait(0.1)
end
end)
end
end
})
local Main = Window:Tab({Title = "骚扰类", Icon = "phone"})
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Signal = require(ReplicatedStorage.devv).load("Signal")
local TweenService = game:GetService("TweenService")
harassSettings = {
targetPlayer = nil,
messageText = "我是神",
isSpamming = false,
spamInterval = 1,
autoMessages = {
"孩子干啥呢啊",
"有什么实力",
"活着干啥呢",
"Phoenix"
},
autoMessageIndex = 1,
isAutoCalling = false,
callInterval = 5,
currentCallId = nil,
playerList = {},
lastPlayerRefresh = 0,
playerRefreshInterval = 5,
spamAllEnabled = false,
blockAllEnabled = false
}
function startAutoCall()
if not harassSettings.targetPlayer then
WindUI:Notify({Title = "打电话", Content = "请先选择目标玩家", Duration = 3, Icon = "phone-off"})
return false
end
harassSettings.isAutoCalling = true
task.spawn(function()
while harassSettings.isAutoCalling and harassSettings.targetPlayer do
pcall(function()
local success, callId = Signal.InvokeServer("attemptCall", harassSettings.targetPlayer.UserId)
if success then
harassSettings.currentCallId = callId
WindUI:Notify({
Title = "打电话",
Content = "正在呼叫: " .. harassSettings.targetPlayer.Name,
Duration = 3,
Icon = "phone-outgoing"
})
local callDuration = math.random(10, 30)
local startTime = os.time()
while harassSettings.isAutoCalling and os.time() - startTime < callDuration do
task.wait(1)
end
if harassSettings.currentCallId then
Signal.FireServer("sendPhoneAction", harassSettings.currentCallId, "hangup")
harassSettings.currentCallId = nil
end
else
WindUI:Notify({
Title = "打电话",
Content = "呼叫失败: " .. harassSettings.targetPlayer.Name,
Duration = 3,
Icon = "phone-missed"
})
end
end)
if harassSettings.isAutoCalling then
task.wait(harassSettings.callInterval)
end
end
end)
end
function stopAutoCall()
harassSettings.isAutoCalling = false
if harassSettings.currentCallId then
Signal.FireServer("sendPhoneAction", harassSettings.currentCallId, "hangup")
harassSettings.currentCallId = nil
end
end
function startSpam()
harassSettings.isSpamming = true
task.spawn(function()
while harassSettings.isSpamming and harassSettings.targetPlayer do
pcall(function()
Signal.FireServer("sendMessage", harassSettings.targetPlayer.UserId, harassSettings.messageText)
end)
task.wait(harassSettings.spamInterval)
end
end)
end
function startAutoMessages()
task.spawn(function()
while harassSettings.isSpamming and harassSettings.targetPlayer do
pcall(function()
Signal.FireServer("sendMessage", harassSettings.targetPlayer.UserId,
harassSettings.autoMessages[harassSettings.autoMessageIndex])
harassSettings.autoMessageIndex = harassSettings.autoMessageIndex + 1
if harassSettings.autoMessageIndex > #harassSettings.autoMessages then
harassSettings.autoMessageIndex = 1
end
end)
task.wait(harassSettings.spamInterval)
end
end)
end
function startSpamAll()
harassSettings.spamAllEnabled = true
task.spawn(function()
while harassSettings.spamAllEnabled do
pcall(function()
for _, player in ipairs(Players:GetPlayers()) do
if player ~= Players.LocalPlayer then
Signal.FireServer("sendMessage", player.UserId, harassSettings.messageText)
end
end
end)
task.wait(harassSettings.spamInterval)
end
end)
end
function stopSpamAll()
harassSettings.spamAllEnabled = false
end
function blockAllMessages()
if not harassSettings.blockAllEnabled then return end
for _, player in ipairs(Players:GetPlayers()) do
if player ~= Players.LocalPlayer then
Signal.FireServer("blockPlayer", player.UserId)
end
end
end
function refreshPlayerList()
local currentTime = os.time()
if currentTime - harassSettings.lastPlayerRefresh < harassSettings.playerRefreshInterval then
return harassSettings.playerList
end
harassSettings.lastPlayerRefresh = currentTime
harassSettings.playerList = {}
for _, player in ipairs(Players:GetPlayers()) do
if player ~= Players.LocalPlayer then
table.insert(harassSettings.playerList, {
text = player.Name .. " (@" .. player.DisplayName .. ")",
value = player.Name
})
end
end
table.sort(harassSettings.playerList, function(a, b)
return a.text:lower() < b.text:lower()
end)
return harassSettings.playerList
end
function getPlayerListValues()
refreshPlayerList()
local values = {}
for _, player in ipairs(harassSettings.playerList) do
table.insert(values, player.text)
end
return values
end
local playerDropdown = Main:Dropdown({
Title = "选择目标玩家",
Desc = "自动刷新玩家列表",
Values = getPlayerListValues(),
Value = "",
Callback = function(value)
if value and value ~= "" then
local playerName = value:match("^([^%s]+)")
if playerName then
harassSettings.targetPlayer = Players:FindFirstChild(playerName)
if harassSettings.targetPlayer then
WindUI:Notify({
Title = "目标设置",
Content = "已选择: " .. harassSettings.targetPlayer.Name,
Duration = 2,
Icon = "user-check"
})
else
WindUI:Notify({
Title = "错误",
Content = "未找到玩家: " .. playerName,
Duration = 3,
Icon = "user-x"
})
end
end
else
harassSettings.targetPlayer = nil
end
end
})
Main:Button({
Title = "刷新玩家列表",
Icon = "refresh-cw",
Callback = function()
local newValues = getPlayerListValues()
playerDropdown:Refresh(newValues)
WindUI:Notify({
Title = "玩家列表",
Content = "已刷新，找到 " .. #newValues .. " 个玩家",
Duration = 2,
Icon = "users"
})
end
})
Main:Toggle({
Title = "自动打电话",
Value = false,
Callback = function(isEnabled)
if isEnabled and not harassSettings.targetPlayer then
WindUI:Notify({
Title = "错误",
Content = "请先选择目标玩家",
Duration = 3,
Icon = "user-x"
})
return false
end
if isEnabled then
startAutoCall()
WindUI:Notify({
Title = "开始打电话",
Content = "开始自动呼叫: " .. harassSettings.targetPlayer.Name,
Duration = 3,
Icon = "phone-outgoing"
})
else
stopAutoCall()
WindUI:Notify({
Title = "停止打电话",
Content = "已停止自动呼叫",
Duration = 2,
Icon = "phone-off"
})
end
end
})
Main:Slider({
Title = "呼叫间隔",
Desc = "设置每次呼叫的时间间隔（秒）",
Value = {Min = 3, Max = 60, Default = 5},
Callback = function(value)
harassSettings.callInterval = value
end
})
Main:Input({
Title = "自定义消息",
Value = "我是神",
Placeholder = "输入要发送的消息内容",
Callback = function(value)
harassSettings.messageText = value
end
})
Main:Toggle({
Title = "消息轰炸[自定义]",
Value = false,
Callback = function(isEnabled)
if isEnabled and not harassSettings.targetPlayer then
WindUI:Notify({
Title = "错误",
Content = "请先选择目标玩家",
Duration = 3,
Icon = "user-x"
})
return false
end
harassSettings.isSpamming = isEnabled
if isEnabled then
startSpam()
WindUI:Notify({
Title = "开始轰炸",
Content = "开始向 " .. harassSettings.targetPlayer.Name .. " 发送消息",
Duration = 3,
Icon = "send"
})
else
WindUI:Notify({
Title = "停止轰炸",
Content = "已停止发送消息",
Duration = 2,
Icon = "square"
})
end
end
})
Main:Toggle({
Title = "自动发送预设消息",
Value = false,
Callback = function(isEnabled)
if isEnabled and not harassSettings.targetPlayer then
WindUI:Notify({
Title = "错误",
Content = "请先选择目标玩家",
Duration = 3,
Icon = "user-x"
})
return false
end
harassSettings.isSpamming = isEnabled
if isEnabled then
startAutoMessages()
WindUI:Notify({
Title = "开始自动消息",
Content = "开始发送预设消息给 " .. harassSettings.targetPlayer.Name,
Duration = 3,
Icon = "message-circle"
})
else
WindUI:Notify({
Title = "停止自动消息",
Content = "已停止发送预设消息",
Duration = 2,
Icon = "message-square"
})
end
end
})
Main:Slider({
Title = "消息间隔",
Desc = "设置发送消息的时间间隔（秒）",
Value = {Min = 0.1, Max = 5, Default = 1},
Callback = function(value)
harassSettings.spamInterval = value
end
})
Main:Toggle({
Title = "群发消息",
Value = false,
Callback = function(isEnabled)
if isEnabled then
startSpamAll()
WindUI:Notify({
Title = "开始群发",
Content = "开始向所有玩家发送消息",
Duration = 3,
Icon = "send"
})
else
stopSpamAll()
WindUI:Notify({
Title = "停止群发",
Content = "已停止群发消息",
Duration = 2,
Icon = "square"
})
end
end
})
Main:Toggle({
Title = "屏蔽所有人消息和电话",
Value = false,
Callback = function(isEnabled)
harassSettings.blockAllEnabled = isEnabled
if isEnabled then
blockAllMessages()
WindUI:Notify({
Title = "开启屏蔽",
Content = "已屏蔽所有玩家消息和电话",
Duration = 3,
Icon = "shield"
})
task.spawn(function()
while harassSettings.blockAllEnabled do
blockAllMessages()
task.wait(5)
end
end)
else
WindUI:Notify({
Title = "关闭屏蔽",
Content = "已取消屏蔽所有玩家",
Duration = 2,
Icon = "shield-off"
})
end
end
})
local CollectTab = Window:Tab({Title = "拾取", Icon = "package"})
local setting = {
player = { list = {}, select = nil },
rope = { autorope = false, autorandom = false },
collect = {
autocl = false,
autobs = false,
autohk = false,
automn = false,
autodj = false,
autojt = false,
autoqq = false,
autoblue = false,
autoluck = false,
autocc = false,
czycj = false,
autoprecious = false,
autobluekey = false,
autovehicle = false,
autoweapon = false
}
}
local function fastCollectItems(itemNames)
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local character = localPlayer.Character
if not character then return end
local rootPart = character:FindFirstChild("HumanoidRootPart")
if not rootPart then return end
local originalPosition = rootPart.CFrame
for _, l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
for _, v in pairs(l:GetChildren()) do
if v:IsA("MeshPart") or v:IsA("Part") then
for _, e in pairs(v:GetChildren()) do
if e:IsA("ProximityPrompt") then
for _, itemName in ipairs(itemNames) do
if e.ObjectText == itemName then
local itemCFrame = v.CFrame
rootPart.CFrame = itemCFrame * CFrame.new(0, 2, 0)
e.RequiresLineOfSight = false
e.HoldDuration = 0
for i = 1, 5 do
fireproximityprompt(e)
task.wait(0.01)
end
rootPart.CFrame = originalPosition
return true
end
end
end
end
end
end
end
rootPart.CFrame = originalPosition
return false
end
CollectTab:Toggle({
Title = "自动捡材料",
Default = false,
Callback = function(Value)
setting.collect.autocl = Value
task.spawn(function()
while setting.collect.autocl and task.wait(0.1) do
fastCollectItems({"Electronics", "Weapon Parts"})
end
end)
end
})
CollectTab:Toggle({
Title = "自动捡普通宝石",
Default = false,
Callback = function(Value)
setting.collect.autobs = Value
task.spawn(function()
while setting.collect.autobs and task.wait(0.1) do
fastCollectItems({
"Amethyst", "Sapphire", "Emerald", "Topaz", "Ruby",
"Diamond Ring", "Rollie"
})
end
end)
end
})
CollectTab:Toggle({
Title = "自动捡红卡",
Default = false,
Callback = function(Value)
setting.collect.autohk = Value
task.spawn(function()
while setting.collect.autohk and task.wait(0.1) do
fastCollectItems({"Military Armory Keycard"})
end
end)
end
})
CollectTab:Toggle({
Title = "自动捡钞票打印机",
Default = false,
Callback = function(Value)
setting.collect.automn = Value
task.spawn(function()
while setting.collect.automn and task.wait(0.1) do
fastCollectItems({"Money Printer"})
end
end)
end
})
CollectTab:Toggle({
Title = "自动捡核弹类物品",
Default = false,
Callback = function(Value)
setting.collect.autodj = Value
task.spawn(function()
while setting.collect.autodj and task.wait(0.1) do
fastCollectItems({"Suitcase Nuke", "Nuke Launcher", "Easter Basket"})
end
end)
end
})
CollectTab:Toggle({
Title = "自动捡金条",
Default = false,
Callback = function(Value)
setting.collect.autojt = Value
task.spawn(function()
while setting.collect.autojt and task.wait(0.1) do
fastCollectItems({"Gold Bar"})
end
end)
end
})
CollectTab:Toggle({
Title = "自动捡气球",
Default = false,
Callback = function(Value)
setting.collect.autoqq = Value
task.spawn(function()
while setting.collect.autoqq and task.wait(0.1) do
fastCollectItems({
"Bunny Balloon", "Ghost Balloon", "Clover Balloon", "Bat Balloon",
"Gold Clover Balloon", "Golden Rose", "Black Rose", "Heart Balloon"
})
end
end)
end
})
CollectTab:Toggle({
Title = "自动捡蓝色糖果棒",
Default = false,
Callback = function(Value)
setting.collect.autoblue = Value
task.spawn(function()
while setting.collect.autoblue and task.wait(0.1) do
fastCollectItems({"Blue Candy Cane"})
end
end)
end
})
CollectTab:Toggle({
Title = "自动捡红色糖果棒",
Default = false,
Callback = function(Value)
setting.collect.autocc = Value
task.spawn(function()
while setting.collect.autocc and task.wait(0.1) do
fastCollectItems({"Candy Cane"})
end
end)
end
})
CollectTab:Toggle({
Title = "自动捡幸运方块",
Default = false,
Callback = function(Value)
setting.collect.autoluck = Value
task.spawn(function()
while setting.collect.autoluck and task.wait(0.1) do
fastCollectItems({"Green Lucky Block", "Orange Lucky Block", "Purple Lucky Block"})
end
end)
end
})
CollectTab:Toggle({
Title = "自动捡贵重宝石",
Default = false,
Callback = function(Value)
setting.collect.autoprecious = Value
task.spawn(function()
while setting.collect.autoprecious and task.wait(0.1) do
fastCollectItems({
"Dark Matter Gem",
"Void Gem",
"Diamond",
"Diamond Ring",
"Requirements"
})
end
end)
end
})
CollectTab:Toggle({
Title = "自动捡蓝卡",
Default = false,
Callback = function(Value)
setting.collect.autobluekey = Value
task.spawn(function()
while setting.collect.autobluekey and task.wait(0.1) do
fastCollectItems({"Blue Keycard"})
end
end)
end
})
CollectTab:Toggle({
Title = "自动捡载具",
Default = false,
Callback = function(Value)
setting.collect.autovehicle = Value
task.spawn(function()
while setting.collect.autovehicle and task.wait(0.1) do
fastCollectItems({"Car", "Helicopter"})
end
end)
end
})
CollectTab:Toggle({
Title = "自动捡贵重枪支",
Default = false,
Callback = function(Value)
setting.collect.autoweapon = Value
task.spawn(function()
while setting.collect.autoweapon and task.wait(0.1) do
fastCollectItems({
"RPG",
"Scar L",
"AS Val",
"FN FAL",
"P90",
"Barrett M107",
"AWP",
"M249 SAW"
})
end
end)
end
})
local TeleportTab = Window:Tab({Title = "传送", Icon = "navigation"})
TeleportTab:Section({ Title = "预设位置", Icon = "map-pin" })
local teleportLocations = {
["银行"] = CFrame.new(1089.2777099609375, 8.169798851013184, -344.85955810546875),
["珠宝店"] = CFrame.new(1598.3031005859375, 8.369791030883789, -691.4287719726562),
["警察局"] = CFrame.new(647.1284790039062, 9.037802696228027, -862.6290283203125),
["黑市"] = CFrame.new(726.1677856445312, -27.880531311035156, -112.65306854248047),
["军事基地"] = CFrame.new(796.650390625, 25.2656192779541, -1368.020751953125),
["隐藏区域"] = CFrame.new(1653.3216552734375, -16.953155517578125, -529.6856079101562),
["地图外"] = CFrame.new(1884.9793701171875, 4.352350234985352, -967.9786376953125),
["水下"] = CFrame.new(369.20672607421875, -127.81851196289062, -423.2080993652344),
["塔楼"] = CFrame.new(823.8939208984375, 83.43997192382812, -146.0994110107422),
["医院"] = CFrame.new(1153.28955078125, 6.276763916015625, -975.0587158203125)
}
local locationList = {}
for locationName, _ in pairs(teleportLocations) do
table.insert(locationList, locationName)
end
table.sort(locationList)
TeleportTab:Dropdown({
Title = "传送位置",
Desc = "选择要传送到的位置",
Values = locationList,
Value = "",
Callback = function(value)
if value and teleportLocations[value] then
HumanoidRootPart.CFrame = teleportLocations[value]
WindUI:Notify({
Title = "传送成功",
Content = "已传送到 " .. value,
Duration = 3,
Icon = "navigation"
})
end
end
})
TeleportTab:Section({ Title = "防踩踏", Icon = "shield" })
local antiStompEnabled = false
local antiStompSpeed = 0.08
TeleportTab:Toggle({
Title = "防踩踏传送",
Desc = "被踩时自动传送避免",
Value = false,
Callback = function(state)
antiStompEnabled = state
if state then
task.spawn(function()
while antiStompEnabled do
local originalCFrame = HumanoidRootPart.CFrame
if not Humanoid.Sit then
local tweenInfo = TweenInfo.new(antiStompSpeed, Enum.EasingStyle.Exponential)
local tween = TweenService:Create(HumanoidRootPart, tweenInfo, {
CFrame = CFrame.new(0, 0, 0)
})
tween:Play()
tween.Completed:Wait()
tween = TweenService:Create(HumanoidRootPart, tweenInfo, {
CFrame = originalCFrame
})
tween:Play()
tween.Completed:Wait()
else
Humanoid.Jump = true
end
task.wait(0.1)
end
local tweenInfo = TweenInfo.new(antiStompSpeed, Enum.EasingStyle.Linear)
TweenService:Create(HumanoidRootPart, tweenInfo, {
CFrame = HumanoidRootPart.CFrame
}):Play()
end)
end
end
})
TeleportTab:Slider({
Title = "传送速度",
Desc = "设置防踩踏传送的速度",
Value = {
Min = 0.01,
Max = 1,
Default = 0.08
},
Callback = function(value)
antiStompSpeed = value
end
})
TeleportTab:Section({ Title = "快速传送", Icon = "zap" })
TeleportTab:Button({
Title = "传送到银行",
Callback = function()
HumanoidRootPart.CFrame = CFrame.new(1089.2777099609375, 8.169798851013184, -344.85955810546875)
end
})
TeleportTab:Button({
Title = "传送到珠宝店",
Desc = "快速传送到珠宝店位置",
Callback = function()
HumanoidRootPart.CFrame = CFrame.new(1598.3031005859375, 8.369791030883789, -691.4287719726562)
end
})
TeleportTab:Button({
Title = "传送到隐藏区域",
Desc = "快速传送到安全隐藏区域",
Callback = function()
HumanoidRootPart.CFrame = CFrame.new(1653.3216552734375, -16.953155517578125, -529.6856079101562)
end
})
TeleportTab:Button({
Title = "传送到地图外",
Desc = "快速传送到地图外安全区域",
Callback = function()
HumanoidRootPart.CFrame = CFrame.new(1884.9793701171875, 4.352350234985352, -967.9786376953125)
end
})
end
