local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()


local Window = WindUI:CreateWindow({
        Title = "<font color='#FF66CC'>打开/点开DMV2脚本</font>  ",
        
-- ↓ This all is Optional. You can remove it.
        
    -- ↓ Optional. You can remove it.
    --[[ You can set 'rbxassetid://' or video to Background.
        'rbxassetid://':
            Background = "rbxassetid://", -- rbxassetid
        Video:
            Background = "video:YOUR-RAW-LINK-TO-VIDEO.webm", -- video 
    --]]
    
    -- ↓ Optional. You can remove it.
    Size = UDim2.fromOffset(100, 50),
        Transparent = true,
        Theme = "Dark",
        User = {
            Enabled = true,
            Callback = function() print("clicked") end,
            Anonymous = false
        },
    
Window:Tag({
    Title = "重制版",
    Color = Color3.fromHex("#30ff6a")
})

Window:Tag({
    Title = "v2",
    Color = Color3.fromHex("#30ff6a")
})

Window:Tag({
        Title = "此脚本永久免费",
        Color = Color3.fromHex("#315dff")
    })
    local TimeTag = Window:Tag({
        Title = "持续更新",
        Color = Color3.fromHex("#000000")
    })


WindUI:Notify({
    Title = "DMV2脚本通知",
    Content = "DMV2脚本禁止倒卖",
    Duration = 10, -- 10 seconds
    Icon = "bird",
})

WindUI:Notify({
    Title = "DMV2脚本通知",
    Content = "作者:shenmi",
    Duration = 10, -- 10 seconds
    Icon = "bird",
})

local Tab = Window:Tab({
    Title = "DMV2脚本公告",
    Icon = "layout-grid",
    Locked = false,
})

local Paragraph = Tab:Paragraph({
    Title = "作者shenmi",
    Desc = "QQ群主群107198294 ",
    Image = "rbxassetid://75198135626218",
    ImageSize = 42,
    Thumbnail = "rbxassetid://103506480252017",
    ThumbnailSize = 0,
})

local Paragraph = Tab:Paragraph({
    Title = "欢迎使用DM脚本",
    Desc = "QQ群主群1071982943 ",
    Image = "rbxassetid://75198135626218",
    ImageSize = 42,
    Thumbnail = "rbxassetid://103506480252017",
    ThumbnailSize = 0,
})

local Paragraph = Tab:Paragraph({
    Title = "三天一更",
    Desc = "QQ群主群1071982943 ",
    Image = "rbxassetid://75198135626218",
    ImageSize = 42,
    Thumbnail = "rbxassetid://103506480252017",
    ThumbnailSize = 0,
})

local Paragraph = Tab:Paragraph({
    Title = "新年快乐，在这shenmi祝你身体健康，万事如意",
    Desc = "",
    Image = "rbxassetid://75198135626218",
    ImageSize = 42,
    Thumbnail = "rbxassetid://103506480252017",
    ThumbnailSize = 0,
})

local Paragraph = Tab:Paragraph({
    Title = "黑白脚本卡密:HB_7891",
    Desc = "",
    Image = "rbxassetid://75198135626218",
    ImageSize = 42,
    Thumbnail = "rbxassetid://103506480252017",
    ThumbnailSize = 0,
})

local Tabs = {
    Main = Window:Section({ Title = "基础", Opened = true }),
    Settings = Window:Section({ Title = "服务器", Opened = true }),
    Utilities = Window:Section({ Title = "设置", Opened = true })
}

local Tab = Tabs.Main:Tab({
    Title = "通用",
    Icon = "layout-grid",
    Locked = false,
})

local Slider = Tab:Slider({
    Title = "跳跃",
    Value = {
        Min = 50,
        Max = 200,
        Default = 50,
    },
    Increment = 1,
    Callback = function(value)
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = value
        end
    end
})

local Slider = Tab:Slider({
    Title = "移速",
    Value = {
        Min = 16,
        Max = 400,
        Default = 16,
    },
    Increment = 1,
    Callback = function(value)
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = value
        end
    end
})
        
local Slider = Tab:Slider({
    Title = "重力",
    Value = {
        Min = 0.1,
        Max = 500.0,
        Default = 196.2,
    },
    Step = 0.1,
    Callback = function(value)
        game.Workspace.Gravity = value
    end
})

local Button = Tab:Button({
    Title = "DM飞行",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/shenmi9178/Dong-s-script/refs/heads/main/%E5%86%AC%E6%9F%90%E9%A3%9E%E8%A1%8C.lua"))()
    end
})

local Button = Tab:Button({
    Title = "子弹追踪",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/fcsdsss/games/refs/heads/main/Silent%20aim/1.1"))()
    end
})

local Button = Tab:Button({
    Title = "隐身 [别人看得见]",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Yungengxin/roblox/main/yinshen"))()
    end
})

local Button = Tab:Button({
    Title = "撸管r6",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
    end
})

local Button = Tab:Button({
    Title = "撸管r15",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
    end
})

local Button = Tab:Button({
    Title = "玩家进入提示",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
    end
})

local Button = Tab:Button({
    Title = "反挂机",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/9fFu43FF"))()
    end
})

local Button = Tab:Button({
    Title = "悬空",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
    end
})

local Button = Tab:Button({
    Title = "3000多个动作",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/7yd7/Hub/refs/heads/Branch/GUIS/Emotes.lua"))()
    end
})

local Button = Tab:Button({
    Title = "操人",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/ESWSFND7", true))()
    end
})

local Button = Tab:Button({
    Title = "超长🐔巴",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/tt/main/%E6%AD%BB%E4%BA%A1%E7%AC%94%E8%AE%B0%20(1).txt"))()
    end
})

local Button = Tab:Button({
    Title = "死亡笔记",
    Desc = "",
    Locked = false,
    Callback =function()
        loadstring(game:HttpGet("https://pastebin.com/raw/sZpgTVas"))()                
    end
})

local Button = Tab:Button({
    Title = "获得管理员权限",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
    end
})

local Button = Tab:Button({
    Title = "防止坠落伤害",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://pastefy.app/4lzEtnLg/raw'))()
    end
})

local Button = Tab:Button({
    Title = "成为无敌少侠",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/396abc/Script/refs/heads/main/MobileFly.lua"))()
    end
})
Window:SelectTab(2) -- Number of Tab

local Tab = Tabs.Settings:Tab({
    Title = "被遗弃",
    Icon = "layout-grid",
    Locked = false,
})

local Button = Tab:Button({
    Title = "XK",
    Desc = "无卡密中文",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet(('https://github.com/devslopo/DVES/raw/main/XK%20Hub')))()
    end
})

local Button = Tab:Button({
    Title = "不知道",
    Desc = "无卡密英文",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet(('https://github.com/devslopo/DVES/raw/main/XK%20Hub')))()
    end
})

Window:SelectTab(2) -- Number of Tab

local Tab = Tabs.Settings:Tab({
    Title = "最强战场",
    Icon = "layout-grid",
    Locked = false,
})

local Button = Tab:Button({
    Title = "金身",
    Desc = "就是一个动作",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Cyborg883/GoldenPakiFusion/refs/heads/main/Script"))()
    end
})

local Button = Tab:Button({
    Title = "各种自动技能",
    Desc = "英文",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/UY1oh6PG/raw"))()
    end
})

local Button = Tab:Button({
    Title = "火车头",
    Desc = "",
    Locked = false,
    Callback = function()
        getgenv().settings = {
    ["morph"] = {
        ["enabled"] = false,
        ["dontchangeskincolor"] = false,
    },
    ["ult_forcewalkspeed"] = true, -- forces walkspeed even if set to 0
    ["ult_walkspeed"] = 64, -- how fast you walk in ult
    ["tp_duration"] = 0.15 -- how long it takes to tp
} 

loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/ATrainSounds/refs/heads/main/ATrain.lua"))()
    end
})

Window:SelectTab(2) -- Number of Tab

local Tab = Tabs.Main:Tab({
    Title = "各大脚本中心",
    Icon = "layout-grid",
    Locked = false,
})

local Button = Tab:Button({
    Title = "KG脚本",
    Desc = "",
    Locked = false,
    Callback = function()
        KG_SCRIPT = "张硕制作"
loadstring(game:HttpGet("https://github.com/ZS-NB/KG/raw/main/Zhang-Shuo.lua"))()
    end
})

local Button = Tab:Button({
    Title = "混脚本",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/smalldesikon/wocaonima/main/sikon.txt"))()
    end
})

local Button = Tab:Button({
    Title = "SN脚本中心",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\120\105\97\110\105\110\103\49\53\49\47\83\78\72\85\66\47\109\97\105\110\47\83\78\104\117\98\46\108\117\97\34\41\41\40\41")()
    end
})

local Button = Tab:Button({
    Title = "某黄脚本",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaokong6/x1/refs/heads/main/黄某脚本加载器"))()
    end
})

local Button = Tab:Button({
    Title = "安脚本中心",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/wucan114514/gegeyxjb/main/oww')))()
    end
})

local Button = Tab:Button({
    Title = "迪脚本",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://api.junkie-development.de/api/v1/luascripts/public/54464412341ef904e10fb8d7ea70e047969d47b06a488cac60fbf8484ff70b83/download"))()
    end
})

local Button = Tab:Button({
    Title = "bhbox",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\102\121\46\97\112\112\47\115\57\80\105\106\110\118\84\47\114\97\119"))()
    end
})

local Button = Tab:Button({
    Title = "黑白脚本卡密在公告",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/tfcygvunbind/Apple/main/黑白脚本加载器'))()
    end
})

local Button = Tab:Button({
    Title = "天空脚本",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hdjsjjdgrhj/script-hub/main/skyhub"))()
    end
})

local Button = Tab:Button({
    Title = "驰脚本",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/qwrt5589/eododo/main/驰脚本.txt"))()
    end
})

local Button = Tab:Button({
    Title = "BS黑洞中心",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://api.junkie-development.de/api/v1/luascripts/public/d6dffe74a774f7983c29a61dbfaef705a7c1bbd193c1bb68d778cb4bb4c302ae/download"))()
    end
})

local Button = Tab:Button({
    Title = "大司马脚本",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/whenheer/dasimav6/refs/heads/main/dasimaV6.txt"))()
    end
})

local Button = Tab:Button({
    Title = "APT脚本密码xiaomao",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\110\97\105\110\115\104\117\47\110\111\47\109\97\105\110\47\65\80\84\46\108\117\97"))()
    end
})

local Button = Tab:Button({
    Title = "云脚本",
    Desc = "",
    Locked = false,
    Callback = function()    
        loadstring(game:HttpGet("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\103\105\116\104\117\98\46\99\111\109\47\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\47\77\105\97\110\47\114\97\119\47\109\97\105\110\47\228\186\145\232\132\154\230\156\172\46\108\117\97\117\34\44\32\116\114\117\101\41\41\40\41\10\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\103\105\116\104\117\98\46\99\111\109\47\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\47\77\105\97\110\47\114\97\119\47\109\97\105\110\47\228\186\145\232\132\154\230\156\172\46\108\117\97\117\34\44\32\116\114\117\101\41\41\40\41\10"))()
    end
})

local Button = Tab:Button({
    Title = "叶脚本",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/ROBLOX-CNVIP-XIAOYE.lua"))()
    end
})

local Button = Tab:Button({
    Title = "光脚本",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/qwrt5589/eododo/main/GuangJiaoBen.lua"))()
    end
})

local Button = Tab:Button({
    Title = "TX脚本",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JsYb666/TX-Free-YYDS/refs/heads/main/FREE-TX-TEAM"))()
    end
})

local Button = Tab:Button({
    Title = "sxHUD脚本",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/87a8a4f4c2d2ef535ccd1bdb949218fe.lua"))()
    end
})

local Button = Tab:Button({
    Title = "rb脚本",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Yungengxin/roblox/refs/heads/main/Rb-Hub"))()
    end
})

local Button = Tab:Button({
    Title = "德语中山破解版脚本",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/eksan966/Deyu-Zhongshan/refs/heads/main/pojieban"))()
    end
})
local Tab = Tabs.Main:Tab({
    Title = "客户端",
    Icon = "layout-grid",
    Locked = false,
})

local Button = Tab:Button({
    Title = "不知道",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-John-doe-script-by-g00byd0lan-10381"))()
    end
})

local Button = Tab:Button({
    Title = "封禁锤",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ban-hammer-v0-47112"))()
    end
})

local Button = Tab:Button({
    Title = "汽车 [不知道是不是客户端]",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-R15-ONLY-FE-Vehicle-Script-71606'))()
    end
})

Window:SelectTab(2) -- Number of

local Tab = Tabs.Settings:Tab({
    Title = "自然灾害",
    Icon = "layout-grid",
    Locked = false,
})

local Button = Tab:Button({
    Title = "v1",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/V1.lua.txt"))()
    end
})

local Button = Tab:Button({
    Title = "v2",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E7%A3%81%E9%93%81%E9%BB%91%E6%B4%9EV2.txt"))()
    end
})

local Button = Tab:Button({
    Title = "v3",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/V3.txt"))()
    end
})

local Button = Tab:Button({
    Title = "v4",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/V4.txt"))()
    end
})

local Button = Tab:Button({
    Title = "v5",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/V5.txt"))()
    end
})

local Button = Tab:Button({
    Title = "v6",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/V6.txt"))()
    end
})

Window:SelectTab(2) -- Number of Tab

local Tab = Tabs.Settings:Tab({
    Title = "99",
    Icon = "layout-grid",
    Locked = false,
})

local Button = Tab:Button({
    Title = "虚空汉化",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/99%E5%A4%9C%E8%99%9A%E7%A9%BA.txt"))()
    end
})

local Button = Tab:Button({
    Title = "让树都飞起来",
    Desc = "老外/要卡密 [第一个按钮]",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/nouralddin-abdullah/99-night/refs/heads/main/main-en.lua"))()
    end
})

local Button = Tab:Button({
    Title = "二狗子",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gycgchgyfytdttr/shenqin/refs/heads/main/99day.lua"))()
    end
})

local Button = Tab:Button({
    Title = "XK Hub",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://github.com/DevSloPo/Main/raw/main/99day"))()
    end
})

Window:SelectTab(2) -- Number of Tab

local Tab = Tabs.Settings:Tab({
    Title = "墨水游戏",
    Icon = "layout-grid",
    Locked = false,
})


local Button = Tab:Button({
    Title = "墨水无卡密",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/inkgames.github.io/refs/heads/main/ringta.lua"))()
    end
})                                                                                                 

Window:SelectTab(2) -- Number of Tab

local Tab = Tabs.Settings:Tab({
    Title = "doors",
    Icon = "layout-grid",
    Locked = false,
})


local Button = Tab:Button({
    Title = "Doors圣诞Figure自动秒通关",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XOTRXONY/EasyScript/main/DoorsAutoWin"))()
    end
})

local Button = Tab:Button({
    Title = "xk",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet(('https://github.com/devslopo/DVES/raw/main/XK%20Hub')))()
    end
})

local Button = Tab:Button({
    Title = "xa",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.gitcode.com/Xingtaiduan/Scripts/raw/main/Loader.lua"))()
    end
})


local Tab = Tabs.Settings:Tab({
    Title = "亡命",
    Icon = "layout-grid",
    Locked = false,
})


local Button = Tab:Button({
    Title = "linni",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ShenJiaoBen/ScriptLoader/refs/heads/main/Linni_FreeLoader.lua"))()
    end
})
