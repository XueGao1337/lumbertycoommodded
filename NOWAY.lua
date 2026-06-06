local RanTimes = 0

local Connection = game:GetService("RunService").Heartbeat:Connect(function()
    RanTimes += 1
end)

repeat
    task.wait()
until RanTimes >= 2

Connection:Disconnect()

local WasUIPro = loadstring(game:HttpGet("https://raw.githubusercontent.com/WasKKal/WasUI-For-Roblox/main/WasUIPro.lua", true))()

WasUIPro:SetDefaultTheme("Dark")
WasUIPro:SetDefaultRainbowMode("流动")
WasUIPro:SetLanguage("中文")

local mainWindow = WasUIPro:CreateWindow({
    Title = "雪糕 · 木材大亨2",
    WelcomeText = "完整功能版（含全树木/全传送点/全鸭子召唤/复仇剑合成 + 翻译笔记 + 物品整理 + 月亮鸭合成 + 手动购买拖回）",
    MinimizedText = "雪糕助手",
    Theme = "Blue",
})

local lp = game:GetService("Players").LocalPlayer
local ws = game:GetService("Workspace")
local rep = game:GetService("ReplicatedStorage")
local mouse = lp:GetMouse()
local DRAG_SECRET = "Ifyouarereadingthisstophackingbrolegitalsokrnlisbadbtw432rewdWdwFe432432rwDWDAVWdawgdGWAYDFGYTUW"

local dragAttempts = 15
local dragInterval = 0.01

local function notify(msg, duration)
    game.StarterGui:SetCore("SendNotification", { Title = "雪糕", Text = msg, Duration = duration or 3 })
end

local function safeTeleport(cf)
    if not lp.Character or not lp.Character:FindFirstChild("HumanoidRootPart") then return end
    local hrp = lp.Character.HumanoidRootPart
    hrp.CFrame = cf
    task.wait(0.05)
    if hrp.Position.Y < 0 then
        hrp.CFrame = cf + Vector3.new(0, 10, 0)
    end
end

local function tp(cf) safeTeleport(cf) end
local function carTeleport(cf) if lp.Character then lp.Character.HumanoidRootPart.CFrame = cf end end

local bai = {
    awaysday = false, awaysdnight = false, nofog = false,
    playernamedied = "", autodropae = false, autopick = false,
    loaddupeaxewaittime = 3.1, whthmose = false, axeFling = nil,
    modwood = false, autobuystop = false, autobuyamount = 1,
    moneyaoumt = 1, moneytoplayername = "", cuttreeselect = "Generic",
    bringamount = 1, bringtree = false, autofarm = false, autofarm1 = false,
    dropdown = {}, soltnumber = "1", walkspeed = 16, JumpPower = 50,
    -- 整理功能所需变量
    zlwjia = lp.Name,   -- 默认整理自己
    zix = 1,            -- X轴数量
    zlz = 3,            -- Z轴数量
    dxmz = "",          -- 物品类型名
}

local function shuaxinlb(zji)
    bai.dropdown = {}
    if zji == true then
        for _, I in pairs(game.Players:GetChildren()) do table.insert(bai.dropdown, I.Name) end
    else
        for _, I in pairs(game.Players:GetChildren()) do if I ~= lp then table.insert(bai.dropdown, I.Name) end end
    end
end
shuaxinlb(true)

local function TurnInvisible()
    for _, v in pairs(lp.Character:GetDescendants()) do if v:IsA("BasePart") then v.Transparency = 1 end end
end
local function TurnVisible()
    for _, v in pairs(lp.Character:GetDescendants()) do if v:IsA("BasePart") then v.Transparency = 0 end end
end

local function droptool(cframe)
    local tool = lp.Character:FindFirstChildOfClass("Tool")
    if tool then tool.Parent = workspace; tool:SetPrimaryPartCFrame(cframe) end
end

local function farAxeEquip()
    for _, model in pairs(workspace.PlayerModels:GetChildren()) do
        if model:FindFirstChild("Owner") and model.Owner.Value == lp and model:FindFirstChild("Type") and model.Type.Value == "Tool" then
            rep.Interaction.ClientInteracted:FireServer(model, 'Pick up tool')
            break
        end
    end
end

local function sellwood()
    for _, obj in pairs(workspace.PlayerModels:GetChildren()) do
        if obj:FindFirstChild("Owner") and obj.Owner.Value == lp then
            if obj.Name == "Plank" or (obj.Name:sub(1,6) == "Loose_" and obj:FindFirstChild("Type") and obj.Type.Value == "Wood") then
                pcall(function() rep.Interaction.ClientSoldItem:FireServer(obj) end)
            end
        end
    end
end

local function getPlanks()
    local planks = {}
    for _, obj in pairs(workspace.PlayerModels:GetChildren()) do
        if obj.Name == "Plank" and obj:FindFirstChild("Owner") and obj.Owner.Value == lp then
            table.insert(planks, obj)
        end
    end
    return planks
end

local function PlankToBlueprint() notify("白脚本", "此功能需完整版支持", 3) end

local function bringTree(treeClass)
    for _, region in pairs(ws:GetChildren()) do
        if region.Name == "TreeRegion" then
            for _, tree in pairs(region:GetChildren()) do
                if tree:IsA("Model") and tree:FindFirstChild("TreeClass") and tree.TreeClass.Value == treeClass then
                    local woodSec = tree:FindFirstChild("WoodSection")
                    if woodSec and woodSec:IsA("BasePart") then
                        local oldPos = lp.Character.HumanoidRootPart.CFrame
                        safeTeleport(woodSec.CFrame + Vector3.new(4, 3, 4))
                        wait(0.5)
                        local axe = lp.Character:FindFirstChildOfClass("Tool")
                        if axe then rep.Interaction.ClientInteracted:FireServer(axe, 'Click') end
                        wait(2)
                        safeTeleport(oldPos)
                        return
                    end
                end
            end
        end
    end
end

local function autofarm(treeClass) bringTree(treeClass); wait(1); sellwood() end
local function autobuy(itemName, amount) notify("白脚本", "购买 "..itemName.." x"..amount.."（模拟）", 2) end

local function donate(targetName, money)
    local target = game.Players:FindFirstChild(targetName)
    if target then
        rep.Interaction.ClientDonated:FireServer(target, money)
        notify("雪糕", "已转 "..money.." 给 "..targetName, 3)
    else
        notify("雪糕", "玩家不存在", 3)
    end
end

local function getSpecialID(name) return name end

local function burnAllShopItems()
    for _, v in pairs(workspace.Stores:GetDescendants()) do
        if v.Name == "ButtonRemote" then
            pcall(function() rep.Interaction.RemoteProxy:FireServer(v) end)
        end
    end
end

local function lowerBridge(action)
    local bridge = workspace.Bridge.VerticalLiftBridge
    if action == "Lower" then
        pcall(function() rep.Interaction.RemoteProxy:FireServer(bridge.ButtonRemote_Lower) end)
    else
        pcall(function() rep.Interaction.RemoteProxy:FireServer(bridge.ButtonRemote_Raise) end)
    end
end

local function axefily()
    bai.axeFling = game:GetService("RunService").Stepped:Connect(function()
        local tool = lp.Character:FindFirstChildOfClass("Tool")
        if tool then
            for _, v in pairs(workspace.Properties:GetChildren()) do
                if v and v:FindFirstChild("PrimaryPart") then
                    tool:SetPrimaryPartCFrame(v.PrimaryPart.CFrame)
                end
            end
        end
    end)
end

local function CanClientLoad() end
local function GetLoadedSlot() return 1 end
local function LoadSlot(slot) end
local function CheckIfSlotAvailable(slot) return true end
local function LoadSaveSlot(slot) if slot and slot >= 1 and slot <= 6 then pcall(function() rep.LoadSaveRequests.RequestLoad:InvokeServer(slot) end) end end
local function SaveAndShutdown(slot) if not slot then return end; local conn = workspace.PlayerModels.ChildAdded:Connect(function(v) if v:WaitForChild("Owner") and v.Owner.Value == lp then game:Shutdown() end end); pcall(function() rep.LoadSaveRequests.RequestLoad:InvokeServer(slot, lp) end) end

local treeMapping = {
    ["石头木"] = "Magma",["裂纹木"] = "Celestial", ["火焰木"] = "Flame", ["蓝色火焰木"] = "BlueFlame", ["彩虹火焰木"] = "RainbowFlame"
}
local treeNames = {}
for name, _ in pairs(treeMapping) do table.insert(treeNames, name) end
table.sort(treeNames)

local selectedTreeName = treeNames[1]
local selectedTreeClass = treeMapping[selectedTreeName]
local woodRange = 50

local function findUncutTree(treeClass)
    local playerPos = lp.Character and lp.Character.HumanoidRootPart.Position
    if not playerPos then return nil, nil end
    local nearestDist = math.huge
    local nearestWood, nearestTree = nil, nil
    for _, region in pairs(ws:GetChildren()) do
        if region.Name == "TreeRegion" then
            for _, tree in pairs(region:GetChildren()) do
                if tree:IsA("Model") and tree:FindFirstChild("TreeClass") and tree.TreeClass.Value == treeClass then
                    local owner = tree:FindFirstChild("Owner")
                    if owner and owner.Value ~= nil then continue end
                    local woodSec = tree:FindFirstChild("WoodSection")
                    if woodSec and woodSec:IsA("BasePart") and woodSec:FindFirstChild("ID") and woodSec.ID.Value == 1 and woodSec.Size.Y > 0.5 then
                        local dist = (woodSec.Position - playerPos).Magnitude
                        if dist < nearestDist then
                            nearestDist = dist
                            nearestWood = woodSec
                            nearestTree = tree
                        end
                    end
                end
            end
        end
    end
    return nearestWood, nearestTree
end

local function waitForOwnLogImmediate(treeClass, range, timeout)
    local start = tick()
    while (tick() - start) < timeout do
        for _, log in pairs(ws.LogModels:GetChildren()) do
            if log:IsA("Model") and log:FindFirstChild("TreeClass") and log.TreeClass.Value == treeClass then
                local owner = log:FindFirstChild("Owner")
                if owner and owner.Value == lp then
                    local woodPart = log:FindFirstChild("WoodSection")
                    if woodPart and lp.Character then
                        local dist = (woodPart.Position - lp.Character.HumanoidRootPart.Position).Magnitude
                        if dist <= range then return log, dist end
                    end
                end
            end
        end
        task.wait()
    end
    return nil, nil
end

local function dragToPosition(model, targetCF)
    if not model then return false end
    local primary = model.PrimaryPart or model:FindFirstChild("WoodSection") or model:FindFirstChild("Main") or model:FindFirstChildWhichIsA("BasePart")
    if not primary then return false end
    if not model.PrimaryPart then model.PrimaryPart = primary end
    for i = 1, dragAttempts do
        pcall(function()
            rep.Interaction.ClientIsDragging:FireServer(model, DRAG_SECRET)
            model:SetPrimaryPartCFrame(targetCF)
        end)
        task.wait(dragInterval)
    end
    return true
end

local function cutAndReturnWood()
    local originalPos = lp.Character and lp.Character.HumanoidRootPart.CFrame
    if not originalPos then notify("无法获取当前位置", 3) return end
    local woodSec, tree = findUncutTree(selectedTreeClass)
    if not woodSec then notify("附近没有可砍的无主 " .. selectedTreeName, 3) return end
    safeTeleport(woodSec.CFrame + Vector3.new(4, 3, 4))
    notify("已传送到无主 " .. selectedTreeName .. " 旁，请手动砍树", 4)
    local fallenLog, dist = waitForOwnLogImmediate(selectedTreeClass, woodRange, 180)
    if not fallenLog then
        notify(string.format("超时：木头距离你 > %d，未触发传送", woodRange), 3)
        return
    end
    notify(string.format("木头出现（距离%.1f），立即传回...", dist), 2)
    dragToPosition(fallenLog, originalPos)
    safeTeleport(originalPos)
    notify("木头已传回原位，你已返回", 3)
end

local function executeSequenceAndReturn()
    local oldCFrame = lp.Character and lp.Character.HumanoidRootPart.CFrame
    if not oldCFrame then return end
    notify("开始执行 Angel Duck 序列...", 4)
    safeTeleport(CFrame.new(184, 12, -2666))
    task.wait(0.5)
    local controllerPath = ws:WaitForChild("Stores"):WaitForChild("PlantomicsChoice"):WaitForChild("Parts"):WaitForChild("Controller"):WaitForChild("yes")
    local sequence = {"Up","Up","Down","Down","Left","Right","Left","Right","B","A","Start"}
    for _, name in ipairs(sequence) do
        local part = controllerPath:FindFirstChild(name)
        if part then
            local click = part:FindFirstChildOfClass("ClickDetector")
            if click then fireclickdetector(click) end
        end
        task.wait(0.1)
    end
    task.wait(0.5)
    safeTeleport(oldCFrame)
    notify("序列完成，已返回原位", 3)
end

local function bringUnclaimedAngel()
    for _, model in pairs(ws.PlayerModels:GetChildren()) do
        if model:IsA("Model") and model.Name == "DuckAngel" then
            local owner = model:FindFirstChild("Owner")
            if not owner or owner.Value == nil then
                local originalPos = lp.Character and lp.Character.HumanoidRootPart.CFrame
                if not originalPos then return end
                local primaryPart = model.PrimaryPart or model:FindFirstChild("Main") or model:FindFirstChildWhichIsA("BasePart")
                if not primaryPart then notify("无法定位 Angel Duck", 3) return end
                safeTeleport(primaryPart.CFrame + Vector3.new(0, 2, 0))
                notify("已传送到无归属 Angel Duck 旁边，正在带回...", 2)
                if not model.PrimaryPart then model.PrimaryPart = primaryPart end
                dragToPosition(model, originalPos)
                safeTeleport(originalPos)
                notify("无归属 Angel Duck 已传送到你最初的位置", 3)
                return
            end
        end
    end
    notify("当前地图没有无归属的 Angel Duck", 3)
end

local function bringMyDuckAngel()
    for _, model in pairs(ws.PlayerModels:GetChildren()) do
        if model:IsA("Model") and model:FindFirstChild("Owner") and model.Owner.Value == lp and model.Name == "DuckAngel" then
            local originalPos = lp.Character and lp.Character.HumanoidRootPart.CFrame
            if not originalPos then return end
            local primaryPart = model.PrimaryPart or model:FindFirstChild("Main") or model:FindFirstChildWhichIsA("BasePart")
            if not primaryPart then notify("无法定位你的 DuckAngel", 3) return end
            safeTeleport(primaryPart.CFrame + Vector3.new(0, 2, 0))
            notify("已传送到你的 DuckAngel 旁边，正在带回...", 2)
            if not model.PrimaryPart then model.PrimaryPart = primaryPart end
            dragToPosition(model, originalPos)
            safeTeleport(originalPos)
            notify("你的 DuckAngel 已传送到你最初的位置", 3)
            return
        end
    end
    notify("你没有 DuckAngel", 3)
end

local function bringMyDuckEvil()
    for _, model in pairs(ws.PlayerModels:GetChildren()) do
        if model:IsA("Model") and model:FindFirstChild("Owner") and model.Owner.Value == lp and model.Name == "DuckEvil" then
            local originalPos = lp.Character and lp.Character.HumanoidRootPart.CFrame
            if not originalPos then return end
            local primaryPart = model.PrimaryPart or model:FindFirstChild("Main") or model:FindFirstChildWhichIsA("BasePart")
            if not primaryPart then notify("无法定位你的 DuckEvil", 3) return end
            safeTeleport(primaryPart.CFrame + Vector3.new(0, 2, 0))
            notify("已传送到你的 DuckEvil 旁边，正在带回...", 2)
            if not model.PrimaryPart then model.PrimaryPart = primaryPart end
            dragToPosition(model, originalPos)
            safeTeleport(originalPos)
            notify("你的 DuckEvil 已传送到你最初的位置", 3)
            return
        end
    end
    notify("你没有 DuckEvil", 3)
end

local function bringMyDuck()
    for _, model in pairs(ws.PlayerModels:GetChildren()) do
        if model:IsA("Model") and model:FindFirstChild("Owner") and model.Owner.Value == lp and model.Name == "Duck" then
            local originalPos = lp.Character and lp.Character.HumanoidRootPart.CFrame
            if not originalPos then return end
            local primaryPart = model.PrimaryPart or model:FindFirstChild("Main") or model:FindFirstChildWhichIsA("BasePart")
            if not primaryPart then notify("无法定位你的普通鸭", 3) return end
            safeTeleport(primaryPart.CFrame + Vector3.new(0, 2, 0))
            notify("已传送到你的普通鸭旁边，正在带回...", 2)
            if not model.PrimaryPart then model.PrimaryPart = primaryPart end
            dragToPosition(model, originalPos)
            safeTeleport(originalPos)
            notify("你的普通鸭已传送到你最初的位置", 3)
            return
        end
    end
    notify("你没有普通鸭 (Duck)", 3)
end

local function bringMyLunarDuck()
    for _, model in pairs(ws.PlayerModels:GetChildren()) do
        if model:IsA("Model") and model:FindFirstChild("Owner") and model.Owner.Value == lp and (model.Name == "LunarDuck" or model.Name == "DuckLunar") then
            local originalPos = lp.Character and lp.Character.HumanoidRootPart.CFrame
            if not originalPos then return end
            local primaryPart = model.PrimaryPart or model:FindFirstChild("Main") or model:FindFirstChildWhichIsA("BasePart")
            if not primaryPart then notify("无法定位你的月亮鸭", 3) return end
            safeTeleport(primaryPart.CFrame + Vector3.new(0, 2, 0))
            notify("已传送到你的月亮鸭旁边，正在带回...", 2)
            if not model.PrimaryPart then model.PrimaryPart = primaryPart end
            dragToPosition(model, originalPos)
            safeTeleport(originalPos)
            notify("你的月亮鸭已传送到你最初的位置", 3)
            return
        end
    end
    notify("你没有月亮鸭 (LunarDuck)", 3)
end

local function bringUnclaimedLunarDuck()
    for _, model in pairs(ws.PlayerModels:GetChildren()) do
        if model:IsA("Model") and (model.Name == "LunarDuck" or model.Name == "DuckLunar") then
            local owner = model:FindFirstChild("Owner")
            if not owner or owner.Value == nil then
                local originalPos = lp.Character and lp.Character.HumanoidRootPart.CFrame
                if not originalPos then return end
                local primaryPart = model.PrimaryPart or model:FindFirstChild("Main") or model:FindFirstChildWhichIsA("BasePart")
                if not primaryPart then notify("无法定位无归属月亮鸭", 3) return end
                safeTeleport(primaryPart.CFrame + Vector3.new(0, 2, 0))
                notify("已传送到无归属月亮鸭旁边，正在带回...", 2)
                if not model.PrimaryPart then model.PrimaryPart = primaryPart end
                dragToPosition(model, originalPos)
                safeTeleport(originalPos)
                notify("无归属月亮鸭已传送到你最初的位置", 3)
                return
            end
        end
    end
    notify("当前地图没有无归属的月亮鸭 (LunarDuck)", 3)
end

local function craftRevengeSword()
    local evilDuck = nil
    local angelDuck = nil
    for _, model in pairs(ws.PlayerModels:GetChildren()) do
        if model:IsA("Model") and model:FindFirstChild("Owner") and model.Owner.Value == lp then
            if model.Name == "DuckEvil" then
                evilDuck = model
            elseif model.Name == "DuckAngel" then
                angelDuck = model
            end
        end
    end
    if not evilDuck then
        notify("未找到你的恶魔鸭 (DuckEvil)", 3)
        return
    end
    if not angelDuck then
        notify("未找到你的天堂鸭 (DuckAngel)", 3)
        return
    end

    local evilTargetCF = CFrame.new(6486, -89, -4551)
    local angelTargetCF = CFrame.new(6447, -90, -4523)
    local playerTargetCF = CFrame.new(6466, -95, -4546)

    local function ensurePrimaryPart(model)
        if not model.PrimaryPart then
            local primary = model:FindFirstChild("Main") or model:FindFirstChildWhichIsA("BasePart")
            if primary then
                model.PrimaryPart = primary
            else
                return false
            end
        end
        return true
    end

    if not ensurePrimaryPart(evilDuck) then
        notify("无法定位恶魔鸭的主部件", 3)
        return
    end
    if not ensurePrimaryPart(angelDuck) then
        notify("无法定位天堂鸭的主部件", 3)
        return
    end

    notify("开始移动恶魔鸭和天堂鸭...", 3)

    local function moveDuck(duck, targetCF)
        local duckPos = duck.PrimaryPart.CFrame
        safeTeleport(duckPos)
        task.wait(0.5)
        dragToPosition(duck, targetCF)
        task.wait(0.5)
    end

    moveDuck(evilDuck, evilTargetCF)
    moveDuck(angelDuck, angelTargetCF)
    safeTeleport(playerTargetCF)

    notify("复仇剑合成位置已就绪，你可以开始合成了", 3)
end

local function craftLunarDuck()
    local evilDuck = nil
    local angelDuck = nil
    local normalDuck = nil

    for _, model in pairs(ws.PlayerModels:GetChildren()) do
        if model:IsA("Model") and model:FindFirstChild("Owner") and model.Owner.Value == lp then
            if model.Name == "DuckEvil" then
                evilDuck = model
            elseif model.Name == "DuckAngel" then
                angelDuck = model
            elseif model.Name == "Duck" then
                normalDuck = model
            end
        end
    end

    if not evilDuck then
        notify("未找到你的恶魔鸭 (DuckEvil)", 3)
        return
    end
    if not angelDuck then
        notify("未找到你的天堂鸭 (DuckAngel)", 3)
        return
    end
    if not normalDuck then
        notify("未找到你的普通鸭 (Duck)", 3)
        return
    end

    local evilTargetCF = CFrame.new(-7041, 392, 4906)
    local normalTargetCF = CFrame.new(-7066, 392, 4898)
    local angelTargetCF = CFrame.new(-7092, 392, 4891)
    local playerTargetCF = CFrame.new(-7059, 390, 4881)

    local function ensurePrimaryPart(model)
        if not model.PrimaryPart then
            local primary = model:FindFirstChild("Main") or model:FindFirstChildWhichIsA("BasePart")
            if primary then
                model.PrimaryPart = primary
            else
                return false
            end
        end
        return true
    end

    if not ensurePrimaryPart(evilDuck) then
        notify("无法定位恶魔鸭的主部件", 3)
        return
    end
    if not ensurePrimaryPart(angelDuck) then
        notify("无法定位天堂鸭的主部件", 3)
        return
    end
    if not ensurePrimaryPart(normalDuck) then
        notify("无法定位普通鸭的主部件", 3)
        return
    end

    notify("开始移动恶魔鸭、普通鸭和天堂鸭...", 3)

    local function moveDuck(duck, targetCF)
        local duckPos = duck.PrimaryPart.CFrame
        safeTeleport(duckPos)
        task.wait(0.5)
        dragToPosition(duck, targetCF)
        task.wait(0.5)
    end

    moveDuck(evilDuck, evilTargetCF)
    moveDuck(normalDuck, normalTargetCF)
    moveDuck(angelDuck, angelTargetCF)

    safeTeleport(playerTargetCF)
    notify("月亮鸭合成位置已就绪，你可以开始合成了", 3)
end

local morseCode = {
    [".-"]="A",["-..."]="B",["-.-."]="C",["-.."]="D",["."]="E",["..-."]="F",
    ["--."]="G",["...."]="H",[".."]="I",[".---"]="J",["-.-"]="K",[".-.."]="L",
    ["--"]="M",["-."]="N",["---"]="O",[".--."]="P",["--.-"]="Q",[".-."]="R",
    ["..."]="S",["-"]="T",["..-"]="U",["...-"]="V",[".--"]="W",["-..-"]="X",
    ["-.--"]="Y",["--.."]="Z",["-----"]="0",[".----"]="1",["..---"]="2",
    ["...--"]="3",["....-"]="4",["....."]="5",["-...."]="6",["--..."]="7",
    ["---.."]="8",["----."]="9"
}

local function translateMorse(morse)
    local words={}
    for word in string.gmatch(morse,"[^/]+") do
        local letters={}
        for letter in string.gmatch(word,"[^%s]+") do
            table.insert(letters,morseCode[letter] or "?")
        end
        table.insert(words, table.concat(letters))
    end
    return table.concat(words," ")
end

local function translateEvilNotes()
    local notesFolder = ws:FindFirstChild("Stores") and ws.Stores:FindFirstChild("SamsStuff") and ws.Stores.SamsStuff:FindFirstChild("Parts") and ws.Stores.SamsStuff.Parts:FindFirstChild("HellFireNotes")
    if not notesFolder then
        notify("未找到 HellFireNotes 文件夹", 3)
        return
    end
    local results = {}
    for i = 3, 1, -1 do
        local note = notesFolder:FindFirstChild("Note"..i)
        if note then
            local gui = note:FindFirstChildOfClass("SurfaceGui")
            local rawText = ""
            if gui then
                for _, obj in ipairs(gui:GetDescendants()) do
                    if obj:IsA("TextLabel") then
                        rawText = obj.Text
                        break
                    end
                end
            end
            local translated = translateMorse(rawText)
            table.insert(results, string.format("Note%d: %s", i, translated))
        end
    end
    if #results == 0 then
        notify("未找到笔记文本", 3)
    else
        for _, msg in ipairs(results) do
            notify(msg, 5)
        end
    end
end

-- ================= 天降整理功能核心函数 =================
local function ItemStackeraxe(ItemType, XAxis, ZAxis)
    local Player = lp.Character.HumanoidRootPart.Position - Vector3.new(0, 3.5, 0)
    local Items = {}
    for _, v in pairs(ws.PlayerModels:GetChildren()) do
        if v:FindFirstChild("Owner") and tostring(v.Owner.Value) == bai.zlwjia then
            if v:FindFirstChild("DraggableItem") and tostring(v.DraggableItem.Parent) == ItemType then
                table.insert(Items, v)
            end
        end
    end
    if #Items == 0 then return end
    local Count = 0
    for Y = 1, math.ceil(#Items / (XAxis * ZAxis)) do
        for X = 1, XAxis do
            for Z = 1, ZAxis do
                Count = Count + 1
                if Count > #Items then break end
                local targetCF = CFrame.new(
                    (X - 1) * Items[1].Main.Size.X,
                    (Y - 1) * Items[1].Main.Size.Y,
                    (Z - 1) * Items[1].Main.Size.Z
                ) + Player
                rep.PlaceStructure.ClientPlacedStructure:FireServer(nil, targetCF, lp, nil, Items[Count], true)
            end
            if Count > #Items then break end
        end
        if Count > #Items then break end
    end
    notify("已整理 "..#Items.." 个物品 ("..ItemType..")", 3)
end

local function ItemStackerbox(ItemType, XAxis, ZAxis)
    local Player = lp.Character.HumanoidRootPart.Position - Vector3.new(0, 4, 0)
    local Items = {}
    for _, v in pairs(ws.PlayerModels:GetChildren()) do
        if v:FindFirstChild("Owner") and tostring(v.Owner.Value) == bai.zlwjia then
            if v:FindFirstChild("PurchasedBoxItemName") and tostring(v.PurchasedBoxItemName.Value) == ItemType then
                table.insert(Items, v)
            end
        end
    end
    if #Items == 0 then return end
    local Count = 0
    for Y = 1, math.ceil(#Items / (XAxis * ZAxis)) do
        for X = 1, XAxis do
            for Z = 1, ZAxis do
                Count = Count + 1
                if Count > #Items then break end
                local targetCF = CFrame.new(
                    (X - 1) * Items[1].Main.Size.X,
                    (Y - 1) * Items[1].Main.Size.Y,
                    (Z - 1) * Items[1].Main.Size.Z
                ) + Player
                rep.PlaceStructure.ClientPlacedStructure:FireServer(nil, targetCF, lp, nil, Items[Count], true)
            end
            if Count > #Items then break end
        end
        if Count > #Items then break end
    end
    notify("已整理 "..#Items.." 个物品 ("..ItemType..")", 3)
end

local currentSortTool = nil
local function giveSortTool()
    if currentSortTool and currentSortTool.Parent then currentSortTool:Destroy() end
    currentSortTool = Instance.new("Tool")
    currentSortTool.RequiresHandle = false
    currentSortTool.Name = "点击要整理的物品"
    currentSortTool.Activated:Connect(function()
        local target = mouse.Target
        if not target then return end
        local model = target:FindFirstAncestorOfClass("Model")
        if not model then
            notify("请点击一个物品模型", 2)
            return
        end
        if not model:FindFirstChild("Owner") or tostring(model.Owner.Value) ~= bai.zlwjia then
            notify("这个物品不属于所选玩家", 2)
            return
        end
        if model:FindFirstChild("PurchasedBoxItemName") then
            local itemType = model.PurchasedBoxItemName.Value
            bai.dxmz = itemType
            ItemStackerbox(itemType, bai.zix, bai.zlz)
        elseif model:FindFirstChild("ItemName") then
            local itemType = model.ItemName.Value
            bai.dxmz = itemType
            ItemStackeraxe(itemType, bai.zix, bai.zlz)
        elseif model:FindFirstChild("DraggableItem") then
            local itemType = tostring(model.DraggableItem.Parent)
            bai.dxmz = itemType
            ItemStackeraxe(itemType, bai.zix, bai.zlz)
        else
            notify("无法识别该物品类型", 2)
        end
    end)
    currentSortTool.Parent = lp.Backpack
    notify("整理工具已添加到背包（当前玩家：" .. bai.zlwjia .. "，X:" .. bai.zix .. " Z:" .. bai.zlz .. "）", 3)
end
-- =====================================================

local treeTab = mainWindow:Tab({ Title = "手动砍树" })
local treeCategory = treeTab:Category({ Title = "砍树设置", IconName = "tree-pine" })
treeCategory:Dropdown({ Title = "选择树木种类", Values = treeNames, Value = treeNames[1], Multi = false, ConfigKey = "selectedTree", Callback = function(v) selectedTreeName = v; selectedTreeClass = treeMapping[v] end })
treeCategory:TextInput({ Title = "木头传送范围（单位）", Placeholder = "输入数字", Value = "10", ConfigKey = "woodRange", Callback = function(v) local num = tonumber(v); if num then woodRange = num end end })
treeCategory:Button({ Text = "砍", Icon = "scissors", Callback = cutAndReturnWood })

local duckTab = mainWindow:Tab({ Title = "召唤鸭子" })
local seqCategory = duckTab:Category({ Title = "Angel Duck 序列", IconName = "gamepad-2" })
seqCategory:Button({ Text = "执行序列并返回（不移动鸭子）", Icon = "play", Callback = executeSequenceAndReturn })

local angelCategory = duckTab:Category({ Title = "天堂鸭移动", IconName = "angel" })
angelCategory:Button({ Text = "传送无归属 Angel Duck 到原位", Icon = "user-plus", Callback = bringUnclaimedAngel })
angelCategory:Button({ Text = "召唤自己的 DuckAngel 到原位", Icon = "user", Callback = bringMyDuckAngel })

local evilCategory = duckTab:Category({ Title = "恶魔鸭", IconName = "skull" })
evilCategory:Button({ Text = "召唤自己的 DuckEvil 到原位", Icon = "user-x", Callback = bringMyDuckEvil })
evilCategory:Button({ Text = "翻译恶魔鸭笔记 (HellFireNotes)", Icon = "file-text", Callback = translateEvilNotes })

local duckCategory = duckTab:Category({ Title = "普通鸭 (Duck)", IconName = "duck" })
duckCategory:Button({ Text = "召唤自己的普通鸭 (Duck) 到原位", Icon = "user", Callback = bringMyDuck })

local lunarCategory = duckTab:Category({ Title = "月亮鸭 (LunarDuck)", IconName = "moon" })
lunarCategory:Button({ Text = "召唤自己的月亮鸭 (LunarDuck) 到原位", Icon = "user", Callback = bringMyLunarDuck })
lunarCategory:Button({ Text = "召唤无归属月亮鸭 (LunarDuck) 到原位", Icon = "user-plus", Callback = bringUnclaimedLunarDuck })

local revengeCategory = duckTab:Category({ Title = "复仇剑合成", IconName = "sword" })
revengeCategory:Button({ Text = "一键合成复仇剑（移动恶魔鸭和天堂鸭）", Icon = "crosshair", Callback = craftRevengeSword })

local lunarCraftCategory = duckTab:Category({ Title = "月亮鸭合成", IconName = "moon" })
lunarCraftCategory:Button({ Text = "一键合成月亮鸭（移动三只鸭并传送到指定位置）", Icon = "crosshair", Callback = craftLunarDuck })

-- ================= 物品整理标签页（完全天降风格） =================
local sortTab = mainWindow:Tab({ Title = "物品整理", Icon = "grid" })
local sortCategory = sortTab:Category({ Title = "天降物品整理", IconName = "package" })

-- 玩家下拉（初始使用shuaxinlb获取所有玩家名称）
local allPlayersList = {}
shuaxinlb(true)
for _, name in ipairs(bai.dropdown) do table.insert(allPlayersList, name) end
local playerDropdown = sortCategory:Dropdown({
    Title = "选择玩家",
    Values = allPlayersList,
    Value = lp.Name,
    Multi = false,
    ConfigKey = "sortPlayer",
    Callback = function(v) bai.zlwjia = v end
})

sortCategory:Button({
    Text = "刷新玩家列表",
    Icon = "refresh-cw",
    Callback = function()
        shuaxinlb(true)
        local newList = {}
        for _, name in ipairs(bai.dropdown) do table.insert(newList, name) end
        playerDropdown:SetValues(newList)
        if not table.find(newList, bai.zlwjia) then
            bai.zlwjia = lp.Name
            playerDropdown:SetValue(lp.Name)
        end
        notify("玩家列表已刷新", 2)
    end
})

sortCategory:TextInput({
    Title = "X轴数量 (网格列数)",
    Placeholder = "输入数字",
    Value = tostring(bai.zix),
    ConfigKey = "sortX",
    Callback = function(v)
        local num = tonumber(v)
        if num and num > 0 then bai.zix = num else notify("请输入大于0的数字", 2) end
    end
})

sortCategory:TextInput({
    Title = "Z轴数量 (网格行数)",
    Placeholder = "输入数字",
    Value = tostring(bai.zlz),
    ConfigKey = "sortZ",
    Callback = function(v)
        local num = tonumber(v)
        if num and num > 0 then bai.zlz = num else notify("请输入大于0的数字", 2) end
    end
})

sortCategory:Button({
    Text = "获取整理工具",
    Icon = "mouse-pointer",
    Callback = giveSortTool
})

sortCategory:Paragraph({
    Title = "使用说明",
    Desc = "1. 选择要整理的玩家\n2. 设置X/Z轴数量（默认1x3）\n3. 点击「获取整理工具」得到一把工具\n4. 用该工具点击任意属于该玩家的可拖拽物品\n5. 所有同类物品将堆叠到面前的网格中\n\n提示：支持箱子物品(PurchasedBoxItemName)和普通可拖拽物品(DraggableItem)",
    Icon = "info"
})
-- =========================================================

local miscTab = mainWindow:Tab({ Title = "其他功能" })
local dragCategory = miscTab:Category({ Title = "拖拽器增强", IconName = "move" })
local dragEnabled = false
local dragConnection = nil
local function setDragParameters(state)
    if dragConnection then dragConnection:Disconnect() end
    dragConnection = workspace.ChildAdded:Connect(function(Dragger)
        if tostring(Dragger) == "Dragger" then
            local BodyGyro = Dragger:WaitForChild("BodyGyro")
            local BodyPosition = Dragger:WaitForChild("BodyPosition")
            repeat task.wait() until workspace:FindFirstChild("Dragger")
            if state then
                BodyPosition.P = 120000; BodyPosition.D = 1000; BodyPosition.maxForce = Vector3.new(1,1,1)*1000000
                BodyGyro.maxTorque = Vector3.new(1,1,1)*200; BodyGyro.P = 1200; BodyGyro.D = 140
            else
                BodyPosition.P = 10000; BodyPosition.D = 800; BodyPosition.maxForce = Vector3.new(17000,17000,17000)
                BodyGyro.maxTorque = Vector3.new(200,200,200); BodyGyro.P = 1200; BodyGyro.D = 140
            end
        end
    end)
end
setDragParameters(false)
dragCategory:Toggle({ Title = "增强拖拽器", Value = false, ConfigKey = "dragEnhance", Callback = function(state) dragEnabled = state; setDragParameters(state) end })
local processCategory = miscTab:Category({ Title = "快捷加工", IconName = "cog" })
local function quickProcess()
    local wood, saw = nil, nil
    notify("一键加工", "请点击一棵树，再点击一个锯木机", 4)
    local clickConn = mouse.Button1Up:Connect(function()
        local obj = mouse.Target.Parent
        if not obj:FindFirstChild("RootCut") and obj.Parent.Name == "TreeRegion" then
            return notify("错误!", "这棵树还没有砍!", 3)
        end
        if obj:FindFirstChild("Owner") and obj.Owner.Value == lp and obj:FindFirstChild("WoodSection") then
            wood = obj; notify("一键加工", "已选择树!", 3)
        end
        if obj.Name:find("Sawmill") then
            saw = obj; notify("雪糕", "锯木机已选择", 4)
        elseif obj.Parent.Name:find("Sawmill") or obj.Parent:FindFirstChild("BlockageAlert") then
            saw = obj.Parent; notify("雪糕", "锯木机已选择", 4)
        end
    end)
    repeat task.wait(0.01) until wood and saw
    clickConn:Disconnect()
    local sawPos = saw.Particles.CFrame + Vector3.new(0.7, 0)
    local cu, cw = 0, nil
    for _, part in pairs(wood:GetChildren()) do
        if part.Name == "WoodSection" and part.ID.Value > cu then
            cu = part.ID.Value
            cw = part
        end
    end
    local cv = nil
    for _, part in pairs(wood:GetChildren()) do
        if part.Name == "WoodSection" then
            for _, child in pairs(part.ChildIDs:GetChildren()) do
                if child.Value == cu then cv = part end
            end
        end
    end
    safeTeleport(cv.CFrame)
    wait()
    repeat
        wait()
        rep.Interaction.ClientRequestOwnership:FireServer(cv)
        rep.Interaction.ClientIsDragging:FireServer(cv)
        firetouchinterest(cv, ws["Region_Volcano"].Lava.Lava, 0)
        firetouchinterest(cv, ws["Region_Volcano"].Lava.Lava, 1)
    until cv:FindFirstChild("LavaFire")
    if cv:FindFirstChild("LavaFire") then cv.LavaFire:Destroy() end
    safeTeleport(cw.CFrame)
    for i = 1, dragAttempts do
        rep.Interaction.ClientRequestOwnership:FireServer(cw)
        rep.Interaction.ClientIsDragging:FireServer(cw)
        cw.CFrame = sawPos
        task.wait(dragInterval)
    end
    local tempPart = Instance.new("Part")
    tempPart.Size = Vector3.new(1,1,1); tempPart.Anchored = true; tempPart.Transparency = 1; tempPart.CanCollide = false; tempPart.Parent = workspace
    local startPos = sawPos + Vector3.new(0,1,0); local endPos = sawPos + Vector3.new(3,1,0)
    tempPart.CFrame = startPos; task.wait(0.1)
    for i = 1,10 do pcall(function() rep.Interaction.ClientIsDragging:FireServer(tempPart, DRAG_SECRET); tempPart.CFrame = startPos:Lerp(endPos, i/10) end); task.wait(0.05) end
    for i = 1,5 do pcall(function() rep.Interaction.ClientIsDragging:FireServer(tempPart, DRAG_SECRET); tempPart.CFrame = endPos:Lerp(startPos, i/10) end); task.wait(0.05) end
    tempPart:Destroy()
    local tempModel = Instance.new("Model")
    task.wait(0.2); pcall(function() rep.Interaction.ClientIsDragging:FireServer(tempModel, DRAG_SECRET) end); task.wait(0.3); tempModel:Destroy()
    notify("一键加工完成", 3)
end
processCategory:Button({ Text = "一键加工（点击锯木机 随后拿剑砍一下树）", Icon = "hammer", Callback = quickProcess })

local envTab = mainWindow:Tab({ Title = "环境", Icon = "sun" })
local envCategory = envTab:Category({ Title = "天气与视觉效果", IconName = "cloud-sun" })
envCategory:Toggle({ Title = "终日白天", Value = false, Callback = function(state) bai.awaysday = state; spawn(function() while bai.awaysday do game.Lighting.TimeOfDay = "12:00:00"; task.wait() end end) end })
envCategory:Toggle({ Title = "终日黑夜", Value = false, Callback = function(state) bai.awaysdnight = state; spawn(function() while bai.awaysdnight do game.Lighting.TimeOfDay = "02:00:00"; task.wait() end end) end })
envCategory:Toggle({ Title = "去除雾", Value = false, Callback = function(state) bai.nofog = state; spawn(function() while bai.nofog do game.Lighting.FogEnd = 1000000; task.wait() end end) end })
envCategory:Toggle({ Title = "消除阴影", Value = false, Callback = function(state) game.Lighting.GlobalShadows = not state end })
envCategory:Toggle({ Title = "水上行走", Value = false, Callback = function(state) for _, v in pairs(workspace.Water:GetChildren()) do if v:IsA("BasePart") then v.CanCollide = state end end; for _, v in pairs(workspace.Bridge.VerticalLiftBridge.WaterModel:GetChildren()) do if v:IsA("BasePart") then v.CanCollide = state end end end })
envCategory:Toggle({ Title = "删除水（透明）", Value = false, Callback = function(state) for _, v in pairs(workspace.Water:GetChildren()) do if v.Name == "Water" then v.Transparency = state and 1 or 0 end end end })
envCategory:Toggle({ Title = "删除岩浆（透明）", Value = false, Callback = function(state) for _, v in pairs(workspace.Region_Volcano:GetDescendants()) do if v.Name == "Lava" then for _, part in pairs(v:GetChildren()) do if part:IsA("Part") then part.Transparency = state and 1 or 0 end end end end end })
envCategory:Toggle({ Title = "放下桥", Value = false, Callback = function(state) lowerBridge(state and "Lower" or "Higher") end })
envCategory:Button({ Text = "删除灵视神殿石头及门", Callback = function() pcall(function() workspace.Region_Mountainside.BoulderRegen.Boulder:Destroy() end); pcall(function() workspace.Region_Mountainside.Door.Door:Destroy() end); notify("雪糕", "已删除石头与门", 3) end })
envCategory:Button({ Text = "启动所有压力板", Callback = function() burnAllShopItems(); notify("雪糕", "已触发所有压力板", 3) end })
envCategory:Button({ Text = "删除火山/雪山刷石机", Callback = function() for _, v in pairs(workspace.Region_Volcano:GetChildren()) do if v.Name == "PartSpawner" then v.Parent = game.Lighting end end; for _, v in pairs(workspace.Region_Snow:GetChildren()) do if v.Name == "PartSpawner" then v.Parent = game.Lighting end end; notify("雪糕", "已移除刷石机", 3) end })
envCategory:Button({ Text = "关/开家具店的门", Callback = function() pcall(function() rep.Interaction.RemoteProxy:FireServer(workspace.Stores.FurnitureStore.LDoor.ButtonRemote_Toggle) end); wait(0.5); pcall(function() rep.Interaction.RemoteProxy:FireServer(workspace.Stores.FurnitureStore.RDoor.ButtonRemote_Toggle) end) end })
envCategory:Button({ Text = "删除迷宫门", Callback = function() for i=0,7 do pcall(function() workspace["Region_MazeCave"].Blockade["Blockade"..i]:Destroy() end) end; notify("雪糕", "迷宫门已删除", 3) end })
envCategory:TextInput({ Title = "自定义亮度（0-10）", Placeholder = "输入0-10的数字", Value = "0", Callback = function(v) game.Lighting.Brightness = (tonumber(v) or 0)/10 end })
envCategory:Button({ Text = "提高画质（白脚本特效）", Callback = function() notify("雪糕", "画质增强已启用", 3) end })

local devilTab = mainWindow:Tab({ Title = "魔鬼功能", Icon = "skull" })
local devilCategory = devilTab:Category({ Title = "玩家针对", IconName = "user-slash" })
local playerDropdownDevil = devilCategory:Dropdown({ Title = "选择玩家", Values = bai.dropdown, Value = bai.dropdown[1] or "", Multi = false, Callback = function(v) bai.playernamedied = v end })
devilCategory:Button({ Text = "刷新玩家列表", Callback = function() shuaxinlb(true); playerDropdownDevil:SetValues(bai.dropdown) end })
devilCategory:Button({ Text = "传送到玩家旁边", Callback = function() local target = game.Players:FindFirstChild(bai.playernamedied); if target and target.Character then safeTeleport(target.Character.HumanoidRootPart.CFrame + Vector3.new(0,3,0)) end end })
devilCategory:Button({ Text = "传送到玩家基地", Callback = function() for _, v in pairs(workspace.Properties:GetChildren()) do if v.Owner.Value == game.Players[bai.playernamedied] then safeTeleport(v.OriginSquare.CFrame + Vector3.new(0,10,0)); break end end end })
devilCategory:Button({ Text = "汽车传送到玩家旁边", Callback = function() local target = game.Players:FindFirstChild(bai.playernamedied); if target and target.Character then carTeleport(target.Character.HumanoidRootPart.CFrame + Vector3.new(0,3,0)) end end })
devilCategory:Button({ Text = "斧头杀人", Callback = function() local target = game.Players:FindFirstChild(bai.playernamedied); if target and target.Character then local axe = lp.Character:FindFirstChildOfClass("Tool"); if axe then for i = 1, 10 do rep.Interaction.ClientInteracted:FireServer(axe, 'Click'); wait(0.1) end end end; notify("雪糕", "斧头杀人已执行", 3) end })
devilCategory:Button({ Text = "虚空搞人", Callback = function() local target = game.Players:FindFirstChild(bai.playernamedied); if target and target.Character then target.Character.HumanoidRootPart.CFrame = CFrame.new(9e9,9e9,9e9) end end })
devilCategory:Toggle({ Title = "查看玩家", Value = false, Callback = function(state) if state then local target = game.Players:FindFirstChild(bai.playernamedied); if target and target.Character then workspace.CurrentCamera.CameraSubject = target.Character.Humanoid end else workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid end end })
devilCategory:Toggle({ Title = "查看玩家基地", Value = false, Callback = function(state) local see = nil; for _, v in pairs(workspace.Properties:GetChildren()) do if v.Owner.Value == game.Players[bai.playernamedied] then see = v.OriginSquare end end; if state then if see then workspace.CurrentCamera.CameraSubject = see else notify("雪糕","没有找到基地",3) end else workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid end end })

local donateCategory = devilTab:Category({ Title = "快速转钱", IconName = "coins" })
local donateDropdown = donateCategory:Dropdown({ Title = "选择玩家", Values = bai.dropdown, Value = bai.dropdown[1] or "", Multi = false, Callback = function(v) bai.moneytoplayername = v end })
donateCategory:Button({ Text = "刷新列表", Callback = function() shuaxinlb(true); donateDropdown:SetValues(bai.dropdown) end })
donateCategory:TextInput({ Title = "转钱数量（输入数字）", Placeholder = "例如 10000", Value = "1", Callback = function(v) bai.moneyaoumt = tonumber(v) or 1 end })
donateCategory:Button({ Text = "开始转钱", Callback = function() donate(bai.moneytoplayername, bai.moneyaoumt) end })

local baseTab = mainWindow:Tab({ Title = "基地", Icon = "home" })
local baseCategory = baseTab:Category({ Title = "土地管理", IconName = "map" })
baseCategory:Button({ Text = "免费土地（点击空地）", Callback = function()
    local freeland = false
    notify("雪糕", "请你点击一个空的土地", 4)
    local click = mouse.Button1Up:Connect(function()
        local target = mouse.Target.Parent
        if target.Name == "Property" and target.Owner.Value == nil then
            rep.PropertyPurchasing.ClientPurchasedProperty:FireServer(target, target.OriginSquare.OriginCFrame.Value.p + Vector3.new(0,3,0))
            wait(0.5)
            freeland = true
            Instance.new('RemoteEvent', game:service 'ReplicatedStorage'.Interaction).Name = "Ban"
            lp.Character.HumanoidRootPart.CFrame = target.OriginSquare.CFrame + Vector3.new(0,10,0)
        else notify("雪糕", "这个土地有主人了", 4) end
    end)
    repeat task.wait() until freeland
    click:Disconnect()
end})
baseCategory:Button({ Text = "一键免费所有空地", Callback = function()
    for _, v in pairs(workspace.Properties:GetChildren()) do if v.Owner.Value == nil then rep.PropertyPurchasing.ClientPurchasedProperty:FireServer(v, v.OriginSquare.OriginCFrame.Value.p + Vector3.new(0,3,0)); wait(0.2) end end
    notify("雪糕", "已完成免费所有空地", 3)
end})
baseCategory:Button({ Text = "最大土地（需拥有土地）", Callback = function()
    local base, square
    for _, v in pairs(workspace.Properties:GetChildren()) do if v.Owner.Value == lp then base = v; square = v.OriginSquare end end
    if not base then notify("雪糕", "你没有土地", 3) return end
    local spos = square.Position
    local function expand(pos) rep.PropertyPurchasing.ClientExpandedProperty:FireServer(base, pos) end
    expand(CFrame.new(spos.X+40, spos.Y, spos.Z)); expand(CFrame.new(spos.X-40, spos.Y, spos.Z))
    expand(CFrame.new(spos.X, spos.Y, spos.Z+40)); expand(CFrame.new(spos.X, spos.Y, spos.Z-40))
    expand(CFrame.new(spos.X+80, spos.Y, spos.Z)); expand(CFrame.new(spos.X-80, spos.Y, spos.Z))
    notify("雪糕", "已尝试扩大土地", 3)
end})
local archiveCategory = baseTab:Category({ Title = "存档管理", IconName = "save" })
archiveCategory:TextInput({ Title = "选择存档编号 (1-6)", Placeholder = "输入1-6的数字", Value = "1", Callback = function(v) bai.soltnumber = v end })
archiveCategory:Button({ Text = "加载存档", Callback = function() local slot = tonumber(bai.soltnumber); if slot and slot >= 1 and slot <= 6 then pcall(function() rep.LoadSaveRequests.RequestLoad:InvokeServer(slot) end); notify("雪糕", "已尝试加载存档 "..slot, 3) else notify("雪糕", "存档编号无效", 3) end end })
archiveCategory:Button({ Text = "一键复制（保存并断线）", Callback = function() local slot = tonumber(bai.soltnumber); if not slot then notify("雪糕", "请先输入存档编号", 3) return end; local conn = workspace.PlayerModels.ChildAdded:Connect(function(v) if v:WaitForChild("Owner") and v.Owner.Value == lp then game:Shutdown() end end); pcall(function() rep.LoadSaveRequests.RequestLoad:InvokeServer(slot, lp) end) end })

local playerTab = mainWindow:Tab({ Title = "人物", Icon = "user" })
local playerSettings = playerTab:Category({ Title = "玩家设置", IconName = "sliders" })
playerSettings:TextInput({ Title = "移动速度（默认16，最大600）", Placeholder = "输入数字", Value = "16", Callback = function(v) local num = tonumber(v); if num then bai.walkspeed = num; spawn(function() while task.wait() do if lp.Character then lp.Character.Humanoid.WalkSpeed = bai.walkspeed end end end) end end })
playerSettings:TextInput({ Title = "跳跃高度（默认50，最大600）", Placeholder = "输入数字", Value = "50", Callback = function(v) local num = tonumber(v); if num then bai.JumpPower = num; spawn(function() while task.wait() do if lp.Character then lp.Character.Humanoid.JumpPower = bai.JumpPower end end end) end end })
playerSettings:TextInput({ Title = "臀部高度（默认0，0-1000）", Placeholder = "输入数字", Value = "0", Callback = function(v) local num = tonumber(v); if num and lp.Character then lp.Character.Humanoid.HipHeight = num end end })
playerSettings:TextInput({ Title = "重力（默认198，-999到999）", Placeholder = "输入数字", Value = "198", Callback = function(v) local num = tonumber(v); if num then game.workspace.Gravity = num end end })
playerSettings:Toggle({ Title = "穿墙", Value = false, Callback = function(state) if state then _G.Clipping = game:GetService("RunService").Stepped:Connect(function() for _, v in pairs(lp.Character:GetChildren()) do if v:IsA("BasePart") then v.CanCollide = false end end end) else if _G.Clipping then _G.Clipping:Disconnect() end end end })
playerSettings:Toggle({ Title = "自身发光", Value = false, Callback = function(state) if state then local light = Instance.new("PointLight", lp.Character.Head); light.Name = "bai"; light.Range = 150; light.Brightness = 1.7 else pcall(function() lp.Character.Head.bai:Destroy() end) end end })
playerSettings:Button({ Text = "安全自杀（删除头部）", Callback = function() lp.Character.Head:Destroy() end })
playerSettings:Button({ Text = "解锁最大焦距", Callback = function() lp.CameraMaxZoomDistance = 9e9 end })
playerSettings:Toggle({ Title = "隐身（实验性）", Value = false, Callback = function(state) if state then TurnInvisible() else TurnVisible() end end })

local teleList = { "恶魔鸭合成地点", "裂纹木所在地", "回家", "连接逻辑店", "土地商店", "会员商店", "画店", "桥对岸", "沙滩", "火木", "雪山", "洞穴", "码头", "黑市", "糖果原", "雪地入口", "盖克斯航运", "玻璃冰木入口", "云层", "山边商品", "章鱼哥祭坛", "沼泽商店", "石头商店", "沼泽", "冰胡", "星星岛", "辐射商店", "核污染区", "种子商人", "鲍勃的店", "家具店", "车店", "罗布克斯商店", "肯德坤专卖店", "秋季商店" }
local teleCategory = playerTab:Category({ Title = "普通传送", IconName = "map-pin" })
teleCategory:Dropdown({ Title = "选择地点", Values = teleList, Multi = false, Callback = function(val)
    local cf = nil
    if val == "恶魔鸭合成地点" then cf = CFrame.new(-208.76177978515625, 59.79999542236328, 924.8598022460938)
    elseif val == "裂纹木所在地" then cf = CFrame.new(-7612.0859375, 319.6391296386719, 4276.14990234375)
    elseif val == "回家" then for _, v in pairs(workspace.Properties:GetChildren()) do if v.Owner.Value == lp then cf = v.OriginSquare.CFrame + Vector3.new(0,10,0) break end end
    elseif val == "连接逻辑店" then cf = CFrame.new(4607, 9, -798)
    elseif val == "土地商店" then cf = CFrame.new(-374.26605224609375, 15.62093734741211, -1340.554443359375)
    elseif val == "会员商店" then cf = CFrame.new(907,4,-92)
    elseif val == "画店" then cf = CFrame.new(5207, -156, 719)
    elseif val == "桥对岸" then cf = CFrame.new(109,5,-1166)
    elseif val == "沙滩" then cf = CFrame.new(2549, 5, -42)
    elseif val == "火木" then cf = CFrame.new(-1585, 625, 1140)
    elseif val == "雪山" then cf = CFrame.new(6458.20703125, -85.10005187988281, -4557.05224609375)
    elseif val == "洞穴" then cf = CFrame.new(-7229.9619140625, 390.3774108886719, 4686.23486328125)
    elseif val == "码头" then cf = CFrame.new(1122,1,-203)
    elseif val == "黑市" then cf = CFrame.new(-22,61,1377)
    elseif val == "糖果原" then cf = CFrame.new(-561,272,2312)
    elseif val == "雪地入口" then cf = CFrame.new(-712.809, 26.8001, -248.328)
    elseif val == "盖克斯航运" then cf = CFrame.new(1894,-2,1581)
    elseif val == "玻璃冰木入口" then cf = CFrame.new(2305.939697265625, 255.29136657714844, 2976.620361328125)
    elseif val == "云层" then cf = CFrame.new(2073,495,2967)
    elseif val == "山边商品" then cf = CFrame.new(-640,160,374)
    elseif val == "章鱼哥祭坛" then cf = CFrame.new(-1622,196,941)
    elseif val == "沼泽商店" then cf = CFrame.new(-1274,133,-1443)
    elseif val == "石头商店" then cf = CFrame.new(-2387,302,-1899)
    elseif val == "沼泽" then cf = CFrame.new(-999,133,-1191)
    elseif val == "冰胡" then cf = CFrame.new(-2149,321,743)
    elseif val == "星星岛" then cf = CFrame.new(-520.5476684570312, -87.6123046875, -2028.247802734375)
    elseif val == "辐射商店" then cf = CFrame.new(172,12,-2627)
    elseif val == "核污染区" then cf = CFrame.new(207,15,-2752)
    elseif val == "种子商人" then cf = CFrame.new(-24,18,-2684)
    elseif val == "鲍勃的店" then cf = CFrame.new(261,9,-2541)
    elseif val == "家具店" then cf = CFrame.new(492,4,-1723)
    elseif val == "车店" then cf = CFrame.new(512,4,-1459)
    elseif val == "罗布克斯商店" then cf = CFrame.new(652,4,-1589)
    elseif val == "肯德坤专卖店" then cf = CFrame.new(65,4,-455)
    elseif val == "秋季商店" then cf = CFrame.new(6004,4,33)
    end
    if cf and lp.Character then lp.Character.HumanoidRootPart.CFrame = cf end
end})

local carTeleCategory = playerTab:Category({ Title = "汽车传送（需坐在车里）", IconName = "car" })
carTeleCategory:Dropdown({ Title = "选择地点", Values = teleList, Multi = false, Callback = function(val)
    local cf = nil
    if val == "恶魔鸭合成地点" then cf = CFrame.new(187,5,55)
    elseif val == "裂纹木所在地" then cf = CFrame.new(-7612.0859375, 319.6391296386719, 4276.14990234375)
    elseif val == "回家" then for _, v in pairs(workspace.Properties:GetChildren()) do if v.Owner.Value == lp then cf = v.OriginSquare.CFrame + Vector3.new(0,10,0) break end end
    elseif val == "连接逻辑店" then cf = CFrame.new(4607, 9, -740)
    elseif val == "土地商店" then cf = CFrame.new(230, 5, -99)
    elseif val == "会员商店" then cf = CFrame.new(907,4,-115)
    elseif val == "画店" then cf = CFrame.new(5207, -156, 719)
    elseif val == "桥对岸" then cf = CFrame.new(109,5,-1166)
    elseif val == "沙滩" then cf = CFrame.new(2549, 5, -42)
    elseif val == "火木" then cf = CFrame.new(-1585, 625, 1140)
    elseif val == "雪山" then cf = CFrame.new(1451.66248, 412.208405, 3183.47607)
    elseif val == "洞穴" then cf = CFrame.new(3581, -177, 430)
    elseif val == "码头" then cf = CFrame.new(1122,1,-203)
    elseif val == "黑市" then cf = CFrame.new(-15,61,1365)
    elseif val == "糖果原" then cf = CFrame.new(-561,272,2312)
    elseif val == "雪地入口" then cf = CFrame.new(888,61,1188)
    elseif val == "盖克斯航运" then cf = CFrame.new(1894,-2,1581)
    elseif val == "雪屋" then cf = CFrame.new(1929,256,2918)
    elseif val == "云层" then cf = CFrame.new(2060,495,2967)
    elseif val == "山边商品" then cf = CFrame.new(-640,160,374)
    elseif val == "章鱼哥祭坛" then cf = CFrame.new(-1622,196,941)
    elseif val == "沼泽商店" then cf = CFrame.new(-1274,133,-1443)
    elseif val == "石头商店" then cf = CFrame.new(-2395,302,-1899)
    elseif val == "沼泽" then cf = CFrame.new(-999,133,-1191)
    elseif val == "冰胡" then cf = CFrame.new(-2149,321,743)
    elseif val == "星星岛" then cf = CFrame.new(-612,46,-3169)
    elseif val == "辐射商店" then cf = CFrame.new(172,12,-2627)
    elseif val == "核污染区" then cf = CFrame.new(207,15,-2752)
    elseif val == "种子商人" then cf = CFrame.new(-15,18,-2680)
    elseif val == "鲍勃的店" then cf = CFrame.new(-712.809, 26.8001, -248.328)
    elseif val == "家具店" then cf = CFrame.new(490,4,-1690)
    elseif val == "车店" then cf = CFrame.new(512,4,-1490)
    elseif val == "罗布克斯商店" then cf = CFrame.new(652,4,-1565)
    elseif val == "肯德坤专卖店" then cf = CFrame.new(100,4,-455)
    elseif val == "秋季商店" then cf = CFrame.new(6004,4,33)
    end
    if cf then carTeleport(cf) end
end})

local treeTeleCategory = playerTab:Category({ Title = "传送到树旁边", IconName = "tree-pine" })
treeTeleCategory:Dropdown({ Title = "选择树种类", Values = treeNames, Multi = false, Callback = function(v)
    local treeClass = treeMapping[v]
    for _, region in pairs(workspace:GetChildren()) do
        if region.Name == "TreeRegion" then
            for _, tree in pairs(region:GetChildren()) do
                if tree:FindFirstChild("TreeClass") and tree.TreeClass.Value == treeClass then
                    lp.Character:MoveTo(tree.WoodSection.Position)
                    break
                end
            end
        end
    end
end})

local axeCategory = playerTab:Category({ Title = "斧头辅助", IconName = "axe" })
axeCategory:Toggle({ Title = "自动扔斧头", Value = false, Callback = function(state) bai.autodropae = state; spawn(function() while bai.autodropae do droptool(lp.Character.HumanoidRootPart.CFrame) wait(1) end end) end })
axeCategory:Toggle({ Title = "自动捡斧头", Value = false, Callback = function(state) bai.autopick = state; spawn(function() while bai.autopick do for _, v in pairs(workspace.PlayerModels:GetChildren()) do if v.Owner.Value == lp and v.Type.Value == "Tool" then rep.Interaction.ClientInteracted:FireServer(v, 'Pick up tool') end end wait(0.5) end end) end })
axeCategory:Button({ Text = "远程装备斧头", Callback = farAxeEquip })
axeCategory:TextInput({ Title = "死亡后加载时间（秒）", Placeholder = "输入秒数", Value = "3.1", Callback = function(v) bai.loaddupeaxewaittime = tonumber(v) or 3.1 end })
axeCategory:Button({ Text = "加载复制斧头（需要先死亡）(无用)", Callback = function() CanClientLoad(); wait(1); lp.Character.Head:Destroy(); wait(bai.loaddupeaxewaittime); LoadSlot(GetLoadedSlot()); wait(6); tp(lp.Character.HumanoidRootPart.CFrame) end })
axeCategory:Toggle({ Title = "斧头跟随鼠标", Value = false, Callback = function(state) bai.whthmose = state end })
axeCategory:Toggle({ Title = "斧头炸家（持续）(无用)", Value = false, Callback = function(state) if state then axefily() elseif bai.axeFling then bai.axeFling:Disconnect(); bai.axeFling = nil end end })

-- ================= 手动购买辅助功能（基于商店清单） =================
-- 商店坐标清单（从木材大亨2_商店坐标清单.txt 整理）
local shopCFrames = {
    ["AutumnCatalog"] = CFrame.new(5970.4, 2.6, 26.4),
    ["BlackMarket"] = CFrame.new(-85.3, 59.1, 1409.7),
    ["CarStore"] = CFrame.new(482.5, 3.6, -1474.9),
    ["FineArt"] = CFrame.new(5238.0, -167.2, 740.0),
    ["FineFinds"] = CFrame.new(51.3, 1.9, -454.5),
    ["FurnitureStore"] = CFrame.new(477.3, 2.4, -1722.4),
    ["HLStand"] = CFrame.new(-921.5, -248.0, 79.7),
    ["Igloo"] = CFrame.new(2311.5, 255.0, 2982.3),
    ["LandStore"] = CFrame.new(297.0, 8.4, -99.1),
    ["LogicStore"] = CFrame.new(4595.3, 6.2, -785.3),
    ["MountainSide"] = CFrame.new(-649.3, 158.3, 403.6),
    ["PlanterStore"] = CFrame.new(-597.4, 23.2, -111.4),
    ["PlantomicsChoice"] = CFrame.new(189.5, 11.7, -2662.4),
    ["SallysSeasonal"] = CFrame.new(-1275.4, 130.8, -1477.2),
    ["SamsStuff"] = CFrame.new(701.5, 2.6, -1598.2),
    ["SaplingCart"] = CFrame.new(-25.4, 16.7, -2691.3),
    ["SeaSide"] = CFrame.new(6698.3, 0.1, -3563.8),
    ["StoneRUs"] = CFrame.new(-2359.0, 299.8, -1853.1),
    ["TravelingTrader"] = CFrame.new(-266.4, -151.8, -328.4),
    ["VIPSHOP"] = CFrame.new(940.1, 2.2, -61.9),
    ["WoodRUs"] = CFrame.new(268.0, 2.0, 67.4),
}
-- 构建商店名称列表
local shopNames = {}
for name, _ in pairs(shopCFrames) do table.insert(shopNames, name) end
table.sort(shopNames)

-- 手动购买辅助：传送至商店，玩家手动购买，脚本自动检测新生成的属于玩家的物品并拖回原位
local manualPurchaseRunning = false
local function manualPurchaseAndRetrieve(storeName, storeCF)
    if manualPurchaseRunning then
        notify("请等待上次操作完成", 2)
        return
    end
    manualPurchaseRunning = true
    local originalPos = lp.Character and lp.Character.HumanoidRootPart.CFrame
    if not originalPos then
        notify("无法获取当前位置", 3)
        manualPurchaseRunning = false
        return
    end
    -- 传送至商店附近（Y轴偏移避免卡地）
    local targetCF = storeCF + Vector3.new(0, 3, 0)
    safeTeleport(targetCF)
    notify(string.format("已传送到 %s 附近，请手动购买物品", storeName), 4)
    notify("脚本将自动检测新生成的属于你的物品并拖回原位（超时60秒）", 3)
    -- 记录传送前属于玩家的物品（用于对比新增）
    local existingModels = {}
    for _, model in pairs(workspace.PlayerModels:GetChildren()) do
        if model:FindFirstChild("Owner") and model.Owner.Value == lp then
            existingModels[model] = true
        end
    end
    -- 等待新物品出现
    local startTime = tick()
    local purchasedItem = nil
    local timeout = 60 -- 秒
    while tick() - startTime < timeout do
        for _, model in pairs(workspace.PlayerModels:GetChildren()) do
            if model:FindFirstChild("Owner") and model.Owner.Value == lp and not existingModels[model] then
                purchasedItem = model
                break
            end
        end
        if purchasedItem then break end
        task.wait(0.5)
    end
    if not purchasedItem then
        notify("超时未检测到新购买的物品，请确保你购买了可拖拽的物品", 3)
        safeTeleport(originalPos)
        manualPurchaseRunning = false
        return
    end
    notify("检测到新购买的物品，正在拖回原位...", 2)
    dragToPosition(purchasedItem, originalPos)
    safeTeleport(originalPos)
    notify("物品已拖回原位，你已返回", 3)
    manualPurchaseRunning = false
end

-- 将手动购买功能加入自动购买分类下
local autoBuyCategory = playerTab:Category({ Title = "请勿使用（后果自负）", IconName = "shopping-cart" })
autoBuyCategory:Paragraph({
    Title = "使用说明",
    Desc = "选择一个商店，点击「传送并手动购买」后，你会被传送到商店附近。\n请手动与商店交互购买你想要的物品（必须是可拖拽的物品模型）。\n脚本会自动检测新生成的属于你的物品，并将其拖回你之前的位置。",
    Icon = "info"
})
local shopDropdown = autoBuyCategory:Dropdown({
    Title = "选择商店",
    Values = shopNames,
    Value = shopNames[1] or "",
    Multi = false,
    ConfigKey = "manualShop",
    Callback = function(v) end
})
autoBuyCategory:Button({
    Text = "传送并手动购买 (自动拖回物品)",
    Icon = "move-right",
    Callback = function()
        local selectedShop = shopDropdown.Value
        local storeCF = shopCFrames[selectedShop]
        if storeCF then
            manualPurchaseAndRetrieve(selectedShop, storeCF)
        else
            notify("未找到商店坐标", 3)
        end
    end
})
autoBuyCategory:Button({
    Text = "拖回当前所属物品（手动选择模型）",
    Icon = "mouse-pointer",
    Callback = function()
        notify("请勿点击（后果自负）", 3)
        local clickConn = mouse.Button1Up:Connect(function()
            local target = mouse.Target
            if not target then return end
            local model = target:FindFirstAncestorOfClass("Model")
            if not model then
                notify("请点击一个物品模型", 2)
                return
            end
            if not model:FindFirstChild("Owner") or model.Owner.Value ~= lp then
                notify("该物品不属于你", 2)
                return
            end
            local originalPos = lp.Character and lp.Character.HumanoidRootPart.CFrame
            if not originalPos then
                notify("无法获取当前位置", 3)
                return
            end
            dragToPosition(model, originalPos)
            notify("已将物品拖回当前位置", 3)
            clickConn:Disconnect()
        end)
        task.wait(10)
        clickConn:Disconnect()
    end
})
-- 保留原有部分按钮（仅供参考，但不再模拟购买）
autoBuyCategory:Button({ Text = "买黄金蓝图(废弃)", Callback = function() rep.NPCDialog.PlayerChatted:InvokeServer({ Character = workspace.Region_Main["Strange Man"], Name = "Strange Man", ID = getSpecialID("Strange Man"), Dialog = workspace.Region_Main["Strange Man"].Dialog }, "ConfirmPurchase") end })
autoBuyCategory:Button({ Text = "买桥（需在桥头）(废弃)", Callback = function() rep.NPCDialog.PlayerChatted:InvokeServer({ Character = workspace.Bridge.TollBooth0.Seranok, Name = "Seranok", ID = getSpecialID("Seranok"), Dialog = workspace.Bridge.TollBooth0.Seranok.Dialog }, "ConfirmPurchase") end })
autoBuyCategory:Button({ Text = "买船票(废弃)", Callback = function() rep.NPCDialog.PlayerChatted:InvokeServer({ Character = workspace.Ferry.Ferry.Hoover, Name = "Hoover", ID = getSpecialID("Hoover"), Dialog = workspace.Ferry.Ferry.Hoover.Dialog }, "ConfirmPurchase") end })
-- =============================================================

task.spawn(function()
    task.wait(0.5)
    game.StarterGui:SetCore("SendNotification", { Title = "雪糕", Text = "完整版加载完成（含手动购买辅助/全树木/全传送点/全鸭子召唤/复仇剑合成 + 翻译笔记 + 月亮鸭合成）", Duration = 4 })
end)
