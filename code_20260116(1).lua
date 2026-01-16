-- DM脚本工作室 | DM 专属 Roblox 脚本加载器
-- 支持模块化加载、状态提示、错误捕获 | 启动指定DM V2脚本
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 加载器核心类
local DMScriptLoader = {}
DMScriptLoader.__index = DMScriptLoader

-- 加载状态枚举
local LoadStatus = {
    Waiting = "等待加载",
    Loading = "正在加载",
    Success = "加载成功 ✅",
    Failed = "加载失败 ❌"
}

-- 创建加载器UI
function DMScriptLoader.new()
    local self = setmetatable({}, DMScriptLoader)

    -- 加载器主界面
    self.LoaderGui = Instance.new("ScreenGui")
    self.LoaderGui.Name = "DM_ScriptLoaderGui"
    self.LoaderGui.Parent = PlayerGui

    self.MainFrame = Instance.new("Frame")
    self.MainFrame.Name = "DM_LoaderFrame"
    self.MainFrame.Size = UDim2.new(0, 350, 0, 200)
    self.MainFrame.Position = UDim2.new(0.5, -175, 0.2, 0)
    self.MainFrame.BackgroundColor3 = Color3.fromRGB(20, 25, 40)
    self.MainFrame.BackgroundTransparency = 0.15
    self.MainFrame.BorderSizePixel = 0
    self.MainFrame.Parent = self.LoaderGui

    -- 科技感边框
    local BorderGradient = Instance.new("UIGradient")
    BorderGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 150, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 0, 255))
    })
    BorderGradient.Rotation = 90
    BorderGradient.Parent = self.MainFrame

    -- 标题
    self.TitleLabel = Instance.new("TextLabel")
    self.TitleLabel.Name = "DM_LoaderTitle"
    self.TitleLabel.Size = UDim2.new(1, 0, 0, 40)
    self.TitleLabel.Position = UDim2.new(0, 0, 0, 10)
    self.TitleLabel.BackgroundTransparency = 1
    self.TitleLabel.Text = "DM Studio | DM 脚本加载器"
    self.TitleLabel.Font = Enum.Font.GothamBold
    self.TitleLabel.TextSize = 18
    self.TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    self.TitleLabel.Parent = self.MainFrame

    -- 状态提示
    self.StatusLabel = Instance.new("TextLabel")
    self.StatusLabel.Name = "DM_LoadStatus"
    self.StatusLabel.Size = UDim2.new(1, 0, 0, 30)
    self.StatusLabel.Position = UDim2.new(0, 0, 0, 60)
    self.StatusLabel.BackgroundTransparency = 1
    self.StatusLabel.Text = LoadStatus.Waiting
    self.StatusLabel.Font = Enum.Font.SourceSans
    self.StatusLabel.TextSize = 16
    self.StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    self.StatusLabel.Parent = self.MainFrame

    -- 加载进度条
    self.ProgressBar = Instance.new("Frame")
    self.ProgressBar.Name = "DM_ProgressBar"
    self.ProgressBar.Size = UDim2.new(0, 0, 0, 15)
    self.ProgressBar.Position = UDim2.new(0.5, -150, 0, 100)
    self.ProgressBar.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    self.ProgressBar.BorderSizePixel = 0
    self.ProgressBar.Parent = self.MainFrame

    self.ProgressBarBg = Instance.new("Frame")
    self.ProgressBarBg.Name = "DM_ProgressBarBg"
    self.ProgressBarBg.Size = UDim2.new(0, 300, 0, 15)
    self.ProgressBarBg.Position = UDim2.new(0.5, -150, 0, 100)
    self.ProgressBarBg.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    self.ProgressBarBg.BorderSizePixel = 0
    self.ProgressBarBg.Parent = self.MainFrame

    -- 加载按钮
    self.LoadButton = Instance.new("TextButton")
    self.LoadButton.Name = "DM_LoadButton"
    self.LoadButton.Size = UDim2.new(0, 120, 0, 35)
    self.LoadButton.Position = UDim2.new(0.5, -60, 0, 135)
    self.LoadButton.BackgroundColor3 = Color3.fromRGB(0, 80, 200)
    self.LoadButton.BorderSizePixel = 0
    self.LoadButton.Text = "加载DM V2脚本"
    self.LoadButton.Font = Enum.Font.Gotham
    self.LoadButton.TextSize = 16
    self.LoadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    self.LoadButton.Parent = self.MainFrame

    -- 按钮悬浮效果
    self.LoadButton.MouseEnter:Connect(function()
        TweenService:Create(self.LoadButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(0, 120, 255),
            Size = UDim2.new(0, 130, 0, 38)
        }):Play()
    end)

    self.LoadButton.MouseLeave:Connect(function()
        TweenService:Create(self.LoadButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(0, 80, 200),
            Size = UDim2.new(0, 120, 0, 35)
        }):Play()
    end)

    -- 版权标识
    self.Copyright = Instance.new("TextLabel")
    self.Copyright.Size = UDim2.new(1, 0, 0, 20)
    self.Copyright.Position = UDim2.new(0, 0, 1, -20)
    self.Copyright.BackgroundTransparency = 1
    self.Copyright.Text = "© 2026 DM脚本工作室 | DM All Rights Reserved"
    self.Copyright.Font = Enum.Font.SourceSans
    self.Copyright.TextSize = 10
    self.Copyright.TextColor3 = Color3.fromRGB(120, 120, 120)
    self.Copyright.Parent = self.MainFrame

    -- 绑定加载事件（加载指定的DM V2脚本）
    self.LoadButton.MouseButton1Click:Connect(function()
        self:LoadTargetScript()
    end)

    return self
end

-- 加载指定的DM V2脚本
function DMScriptLoader:LoadTargetScript()
    -- 目标脚本地址
    local targetScriptUrl = "https://raw.githubusercontent.com/shenmi9178/Dong-s-script/refs/heads/main/DM%E8%84%9A%E6%9C%AC%E5%8A%A0%E8%BD%BD%E5%99%A8V2.lua"
    
    self.StatusLabel.Text = LoadStatus.Loading
    self.StatusLabel.TextColor3 = Color3.fromRGB(0, 180, 255)
    self.LoadButton.Enabled = false

    -- 模拟进度条加载动画
    TweenService:Create(self.ProgressBar, TweenInfo.new(1.5), {
        Size = UDim2.new(0, 300, 0, 15)
    }):Play()

    task.wait(1.5)

    -- 加载并执行目标脚本
    local success, err = pcall(function()
        loadstring(game:HttpGet(targetScriptUrl))()
    end)

    -- 更新最终状态
    if success then
        self.StatusLabel.Text = LoadStatus.Success
        self.StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 120)
        task.wait(1)
        self.LoaderGui:Destroy() -- 加载完成关闭加载器UI
    else
        self.StatusLabel.Text = string.format("%s：%s", LoadStatus.Failed, err)
        self.StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
        self.LoadButton.Enabled = true
        warn(string.format("DM加载器：脚本加载失败 - %s", err))
    end
end

-- 初始化加载器
local function InitLoader()
    local loader = DMScriptLoader.new()
end

InitLoader()

return DMScriptLoader
