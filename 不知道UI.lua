-- ts file was generated at discord.gg/25ms

repeat
    task.wait()
until game:IsLoaded()

local u1 = {}
local u2 = false

u1.currentTab = nil
u1.flags = {}

local u4 = setmetatable({}, {
    __index = function(_, p3)
        return game.GetService(game, p3)
    end,
})
local u5 = u4.Players.LocalPlayer:GetMouse()

function Tween(p6, p7, p8)
    u4.TweenService:Create(p6, TweenInfo.new(p7[1], Enum.EasingStyle[p7[2] ], Enum.EasingDirection[p7[3] ]), p8):Play()

    return true
end
function Ripple(p9)
    spawn(function()
        if p9.ClipsDescendants ~= true then
            p9.ClipsDescendants = true
        end

        local _ImageLabel = Instance.new('ImageLabel')

        _ImageLabel.Name = 'Ripple'
        _ImageLabel.Parent = p9
        _ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        _ImageLabel.BackgroundTransparency = 1
        _ImageLabel.ZIndex = 8
        _ImageLabel.Image = 'rbxassetid://2708891598'
        _ImageLabel.ImageTransparency = 0.8
        _ImageLabel.ScaleType = Enum.ScaleType.Fit
        _ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
        _ImageLabel.Position = UDim2.new((u5.X - _ImageLabel.AbsolutePosition.X) / p9.AbsoluteSize.X, 0, (u5.Y - _ImageLabel.AbsolutePosition.Y) / p9.AbsoluteSize.Y, 0)

        Tween(_ImageLabel, {
            0.3,
            'Linear',
            'InOut',
        }, {
            Position = UDim2.new(-5.5, 0, -5.5, 0),
            Size = UDim2.new(12, 0, 12, 0),
        })
        wait(0.15)
        Tween(_ImageLabel, {
            0.3,
            'Linear',
            'InOut',
        }, {ImageTransparency = 1})
        wait(0.3)
        _ImageLabel:Destroy()
    end)
end

local u11 = false
local u12 = false

function switchTab(p13)
    if u12 then
        return
    else
        local _currentTab = u1.currentTab

        if _currentTab == nil then
            p13[2].Visible = true
            u1.currentTab = p13

            u4.TweenService:Create(p13[1], TweenInfo.new(0.1), {ImageTransparency = 0}):Play()
            u4.TweenService:Create(p13[1].TabText, TweenInfo.new(0.1), {TextTransparency = 0}):Play()

            return
        elseif _currentTab[1] ~= p13[1] then
            u12 = true
            u1.currentTab = p13

            u4.TweenService:Create(_currentTab[1], TweenInfo.new(0.1), {ImageTransparency = 0.2}):Play()
            u4.TweenService:Create(p13[1], TweenInfo.new(0.1), {ImageTransparency = 0}):Play()
            u4.TweenService:Create(_currentTab[1].TabText, TweenInfo.new(0.1), {TextTransparency = 0.2}):Play()
            u4.TweenService:Create(p13[1].TabText, TweenInfo.new(0.1), {TextTransparency = 0}):Play()

            _currentTab[2].Visible = false
            p13[2].Visible = true

            task.wait(0.1)

            u12 = false
        end
    end
end
function drag(p15, p16)
    local u17 = nil
    local u18 = nil
    local u19 = nil
    local u20 = nil

    local function u23(p21)
        local v22 = p21.Position - u19

        p15.Position = UDim2.new(u20.X.Scale, u20.X.Offset + v22.X, u20.Y.Scale, u20.Y.Offset + v22.Y)
    end

    (p16 or p15).InputBegan:Connect(function(p24)
        if p24.UserInputType == Enum.UserInputType.MouseButton1 then
            u17 = true
            u19 = p24.Position
            u20 = p15.Position

            p24.Changed:Connect(function()
                if p24.UserInputState == Enum.UserInputState.End then
                    u17 = false
                end
            end)
        end
    end)
    p15.InputChanged:Connect(function(p25)
        if p25.UserInputType == Enum.UserInputType.MouseMovement then
            u18 = p25
        end
    end)
    u4.UserInputService.InputChanged:Connect(function(p26)
        if p26 == u18 and u17 then
            u23(p26)
        end
    end)
end
function u1.new(p27, p28, p29)
    local v30 = next
    local v31, v32 = u4.CoreGui:GetChildren()

    while true do
        local v33, v34 = v30(v31, v32)

        if v33 == nil then
            break
        end

        v32 = v33

        if v34.Name == 'frosty' then
            v34:Destroy()
        end
    end

    if p29 == 'dark' then
        MainColor = Color3.fromRGB(25, 25, 25)
        Background = Color3.fromRGB(25, 25, 25)
        zyColor = Color3.fromRGB(25, 25, 25)
        beijingColor = Color3.fromRGB(25, 25, 25)
    else
        MainColor = Color3.fromRGB(25, 25, 25)
        Background = Color3.fromRGB(25, 25, 25)
        zyColor = Color3.fromRGB(30, 30, 30)
        beijingColor = Color3.fromRGB(255, 255, 255)
    end

    local _ScreenGui = Instance.new('ScreenGui')
    local _Frame = Instance.new('Frame')
    local _Frame2 = Instance.new('Frame')
    local _UICorner = Instance.new('UICorner')
    local _Frame3 = Instance.new('Frame')
    local _UICorner2 = Instance.new('UICorner')
    local _Frame4 = Instance.new('Frame')
    local _UIGradient = Instance.new('UIGradient')
    local _ScrollingFrame = Instance.new('ScrollingFrame')
    local _UIListLayout = Instance.new('UIListLayout')
    local _TextLabel = Instance.new('TextLabel')
    local _UIGradient2 = Instance.new('UIGradient')
    local _TextButton = Instance.new('TextButton')
    local _UIGradient3 = Instance.new('UIGradient')
    local _Frame5 = Instance.new('Frame')
    local _ImageLabel2 = Instance.new('ImageLabel')
    local _UICorner3 = Instance.new('UICorner')
    local _UIGradient4 = Instance.new('UIGradient')
    local _UIGradient5 = Instance.new('UIGradient')

    if syn and syn.protect_gui then
        syn.protect_gui(_ScreenGui)
    end

    _ScreenGui.Name = 'frosty'
    _ScreenGui.Parent = u4.CoreGui

    function UiDestroy()
        _ScreenGui:Destroy()
    end
    function ToggleUILib()
        if u2 then
            u2 = false
            _ScreenGui.Enabled = true
        else
            _ScreenGui.Enabled = false
            u2 = true
        end
    end

    _Frame.Name = 'Main'
    _Frame.Parent = _ScreenGui
    _Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    _Frame.BackgroundColor3 = Background
    _Frame.BorderColor3 = MainColor
    _Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    _Frame.Size = UDim2.new(0, 572, 0, 353)
    _Frame.ZIndex = 1
    _Frame.Active = true
    _Frame.Draggable = true

    u4.UserInputService.InputEnded:Connect(function(p54)
        if p54.KeyCode == Enum.KeyCode.LeftControl then
            if _Frame.Visible ~= true then
                _Frame.Visible = true
            else
                _Frame.Visible = false
            end
        end
    end)
    drag(_Frame)

    _UICorner3.Parent = _Frame
    _UICorner3.CornerRadius = UDim.new(0, 3)
    _Frame5.Name = 'DropShadowHolder'
    _Frame5.Parent = _Frame
    _Frame5.BackgroundTransparency = 1
    _Frame5.BorderSizePixel = 0
    _Frame5.Size = UDim2.new(1, 0, 1, 0)
    _Frame5.BorderColor3 = Color3.fromRGB(255, 255, 255)
    _Frame5.ZIndex = 0
    _ImageLabel2.Name = 'DropShadow'
    _ImageLabel2.Parent = _Frame5
    _ImageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
    _ImageLabel2.BackgroundTransparency = 1
    _ImageLabel2.BorderSizePixel = 0
    _ImageLabel2.Position = UDim2.new(0.5, 0, 0.5, 0)
    _ImageLabel2.Size = UDim2.new(1, 43, 1, 43)
    _ImageLabel2.ZIndex = 0
    _ImageLabel2.Image = 'rbxassetid://6015897843'
    _ImageLabel2.ImageColor3 = Color3.fromRGB(255, 255, 255)
    _ImageLabel2.ImageTransparency = 0.5
    _ImageLabel2.ScaleType = Enum.ScaleType.Slice
    _ImageLabel2.SliceCenter = Rect.new(49, 49, 450, 450)
    _UIGradient4.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.1, Color3.fromRGB(255, 127, 0)),
        ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 255, 0)),
        ColorSequenceKeypoint.new(0.3, Color3.fromRGB(0, 255, 0)),
        ColorSequenceKeypoint.new(0.4, Color3.fromRGB(0, 255, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 0, 255)),
        ColorSequenceKeypoint.new(0.6, Color3.fromRGB(139, 0, 255)),
        ColorSequenceKeypoint.new(0.7, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.8, Color3.fromRGB(255, 127, 0)),
        ColorSequenceKeypoint.new(0.9, Color3.fromRGB(255, 255, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 0)),
    })
    _UIGradient4.Parent = _ImageLabel2

    game:GetService('TweenService'):Create(_UIGradient4, TweenInfo.new(7, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1), {Rotation = 360}):Play()

    function toggleui()
        u11 = not u11

        spawn(function()
            if u11 then
                wait(0.3)
            end
        end)
        Tween(_Frame, {
            0.3,
            'Sine',
            'InOut',
        }, {
            Size = UDim2.new(0, 609, 0, u11 and 505 or 0),
        })
    end

    _Frame2.Name = 'TabMain'
    _Frame2.Parent = _Frame
    _Frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _Frame2.BackgroundTransparency = 1
    _Frame2.Position = UDim2.new(0.217000037, 0, 0, 3)
    _Frame2.Size = UDim2.new(0, 448, 0, 353)
    _UICorner.CornerRadius = UDim.new(0, 5.5)
    _UICorner.Name = 'MainC'
    _UICorner.Parent = Frame
    _Frame3.Name = 'SB'
    _Frame3.Parent = _Frame
    _Frame3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _Frame3.BorderColor3 = MainColor
    _Frame3.Size = UDim2.new(0, 8, 0, 353)
    _UICorner2.CornerRadius = UDim.new(0, 6)
    _UICorner2.Name = 'SBC'
    _UICorner2.Parent = _Frame3
    _Frame4.Name = 'Side'
    _Frame4.Parent = _Frame3
    _Frame4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _Frame4.BorderColor3 = Color3.fromRGB(255, 255, 255)
    _Frame4.BorderSizePixel = 0
    _Frame4.ClipsDescendants = true
    _Frame4.Position = UDim2.new(1, 0, 0, 0)
    _Frame4.Size = UDim2.new(0, 110, 0, 353)
    _UIGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, zyColor),
        ColorSequenceKeypoint.new(1, zyColor),
    })
    _UIGradient.Rotation = 90
    _UIGradient.Name = 'SideG'
    _UIGradient.Parent = _Frame4
    _ScrollingFrame.Name = 'TabBtns'
    _ScrollingFrame.Parent = _Frame4
    _ScrollingFrame.Active = true
    _ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _ScrollingFrame.BackgroundTransparency = 1
    _ScrollingFrame.BorderSizePixel = 0
    _ScrollingFrame.Position = UDim2.new(0, 0, 0.0973535776, 0)
    _ScrollingFrame.Size = UDim2.new(0, 110, 0, 318)
    _ScrollingFrame.CanvasSize = UDim2.new(0, 0, 1, 0)
    _ScrollingFrame.ScrollBarThickness = 0
    _UIListLayout.Name = 'TabBtnsL'
    _UIListLayout.Parent = _ScrollingFrame
    _UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    _UIListLayout.Padding = UDim.new(0, 12)
    _TextLabel.Name = 'ScriptTitle'
    _TextLabel.Parent = _Frame4
    _TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel.BackgroundTransparency = 1
    _TextLabel.Position = UDim2.new(0, 0, 0.00953488424, 0)
    _TextLabel.Size = UDim2.new(0, 102, 0, 20)
    _TextLabel.Font = Enum.Font.GothamSemibold
    _TextLabel.Text = p28
    _TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel.TextSize = 14
    _TextLabel.TextScaled = true
    _TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    _UIGradient5.Parent = _TextLabel

    coroutine.wrap(function()
        local _UIGradient6 = Instance.new('LocalScript', _TextLabel).Parent.UIGradient
        local u56 = game:GetService('TweenService'):Create(_UIGradient6, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
            Offset = Vector2.new(1, 0),
        })
        local u57 = Vector2.new(-1, 0)
        local u58 = {}
        local _new = ColorSequence.new
        local _new2 = ColorSequenceKeypoint.new
        local u61 = 'down'

        _UIGradient6.Offset = u57;

        (function()
            local v62 = 255
            local v63 = 255

            for v64 = 1, 10 do
                local v65 = v64 * 17

                table.insert(u58, Color3.fromHSV(v65 / 255, v62 / 255, v63 / 255))
            end
        end)()

        _UIGradient6.Color = _new({
            _new2(0, u58[#u58]),
            _new2(0.5, u58[#u58 - 1]),
            _new2(1, u58[#u58 - 2]),
        })

        local u66 = #u58

        local function u67()
            u56:Play()
            u56.Completed:Wait()

            _UIGradient6.Offset = u57
            _UIGradient6.Rotation = 180

            if u66 ~= #u58 - 1 or u61 ~= 'down' then
                if u66 ~= #u58 or u61 ~= 'down' then
                    if u66 <= #u58 - 2 and u61 == 'down' then
                        _UIGradient6.Color = _new({
                            _new2(0, _UIGradient6.Color.Keypoints[1].Value),
                            _new2(0.5, u58[u66 + 1]),
                            _new2(1, u58[u66 + 2]),
                        })
                        u66 = u66 + 2
                        u61 = 'up'
                    end
                else
                    _UIGradient6.Color = _new({
                        _new2(0, _UIGradient6.Color.Keypoints[1].Value),
                        _new2(0.5, u58[1]),
                        _new2(1, u58[2]),
                    })
                    u66 = 2
                    u61 = 'up'
                end
            else
                _UIGradient6.Color = _new({
                    _new2(0, _UIGradient6.Color.Keypoints[1].Value),
                    _new2(0.5, u58[#u58]),
                    _new2(1, u58[1]),
                })
                u66 = 1
                u61 = 'up'
            end

            u56:Play()
            u56.Completed:Wait()

            _UIGradient6.Offset = u57
            _UIGradient6.Rotation = 0

            if u66 ~= #u58 - 1 or u61 ~= 'up' then
                if u66 ~= #u58 or u61 ~= 'up' then
                    if u66 <= #u58 - 2 and u61 == 'up' then
                        _UIGradient6.Color = _new({
                            _new2(0, u58[u66 + 2]),
                            _new2(0.5, u58[u66 + 1]),
                            _new2(1, _UIGradient6.Color.Keypoints[3].Value),
                        })
                        u66 = u66 + 2
                        u61 = 'down'
                    end
                else
                    _UIGradient6.Color = _new({
                        _new2(0, u58[2]),
                        _new2(0.5, u58[1]),
                        _new2(1, _UIGradient6.Color.Keypoints[3].Value),
                    })
                    u66 = 2
                    u61 = 'down'
                end
            else
                _UIGradient6.Color = _new({
                    _new2(0, u58[1]),
                    _new2(0.5, u58[#u58]),
                    _new2(1, _UIGradient6.Color.Keypoints[3].Value),
                })
                u66 = 1
                u61 = 'down'
            end

            u67()
        end

        u67()
    end)()

    _UIGradient2.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, zyColor),
        ColorSequenceKeypoint.new(1, zyColor),
    })
    _UIGradient2.Rotation = 90
    _UIGradient2.Name = 'SBG'
    _UIGradient2.Parent = _Frame3

    _UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
        _ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout.AbsoluteContentSize.Y + 18)
    end)

    _TextButton.Name = 'Open'
    _TextButton.Parent = _ScreenGui
    _TextButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    _TextButton.Position = UDim2.new(0.00829315186, 0, 0.31107837, 0)
    _TextButton.Size = UDim2.new(0, 61, 0, 32)
    _TextButton.Font = Enum.Font.SourceSans
    _TextButton.Text = '\u{6253}\u{5f00}'
    _TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    _TextButton.TextSize = 14
    _TextButton.Active = true
    _TextButton.Draggable = true

    _TextButton.MouseButton1Click:Connect(function()
        _Frame.Visible = not _Frame.Visible
    end)

    _UIGradient3.Parent = _TextButton

    return {
        Tab = function(_, p68, p69)
            local _ScrollingFrame2 = Instance.new('ScrollingFrame')
            local _ImageLabel3 = Instance.new('ImageLabel')
            local _TextLabel2 = Instance.new('TextLabel')
            local _TextButton2 = Instance.new('TextButton')
            local _UIListLayout2 = Instance.new('UIListLayout')

            _ScrollingFrame2.Name = 'Tab'
            _ScrollingFrame2.Parent = _Frame2
            _ScrollingFrame2.Active = true
            _ScrollingFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _ScrollingFrame2.BackgroundTransparency = 1
            _ScrollingFrame2.Size = UDim2.new(1, 0, 1, 0)
            _ScrollingFrame2.ScrollBarThickness = 2
            _ScrollingFrame2.Visible = false
            _ImageLabel3.Name = 'TabIco'
            _ImageLabel3.Parent = _ScrollingFrame
            _ImageLabel3.BackgroundTransparency = 1
            _ImageLabel3.BorderSizePixel = 0
            _ImageLabel3.Size = UDim2.new(0, 24, 0, 24)
            _ImageLabel3.Image = ('rbxassetid://%s'):format(p69 or 4370341699)
            _ImageLabel3.ImageTransparency = 0.2
            _TextLabel2.Name = 'TabText'
            _TextLabel2.Parent = _ImageLabel3
            _TextLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _TextLabel2.BackgroundTransparency = 1
            _TextLabel2.Position = UDim2.new(1.41666663, 0, 0, 0)
            _TextLabel2.Size = UDim2.new(0, 76, 0, 24)
            _TextLabel2.Font = Enum.Font.GothamSemibold
            _TextLabel2.Text = p68
            _TextLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
            _TextLabel2.TextSize = 14
            _TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
            _TextLabel2.TextTransparency = 0.2
            _TextButton2.Name = 'TabBtn'
            _TextButton2.Parent = _ImageLabel3
            _TextButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _TextButton2.BackgroundTransparency = 1
            _TextButton2.BorderSizePixel = 0
            _TextButton2.Size = UDim2.new(0, 110, 0, 24)
            _TextButton2.AutoButtonColor = false
            _TextButton2.Font = Enum.Font.SourceSans
            _TextButton2.Text = ''
            _TextButton2.TextColor3 = Color3.fromRGB(0, 0, 0)
            _TextButton2.TextSize = 14
            _UIListLayout2.Name = 'TabL'
            _UIListLayout2.Parent = _ScrollingFrame2
            _UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
            _UIListLayout2.Padding = UDim.new(0, 4)

            _TextButton2.MouseButton1Click:Connect(function()
                spawn(function()
                    Ripple(_TextButton2)
                end)

                local v75 = {_ImageLabel3, _ScrollingFrame2}

                switchTab(v75)
            end)

            if p27.currentTab == nil then
                switchTab({_ImageLabel3, _ScrollingFrame2})
            end

            _UIListLayout2:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
                _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout2.AbsoluteContentSize.Y + 8)
            end)

            return {
                section = function(_, p76, p77)
                    local _Frame6 = Instance.new('Frame')
                    local _UICorner4 = Instance.new('UICorner')
                    local _TextLabel3 = Instance.new('TextLabel')
                    local _ImageLabel4 = Instance.new('ImageLabel')
                    local _ImageLabel5 = Instance.new('ImageLabel')
                    local _ImageButton = Instance.new('ImageButton')
                    local _Frame7 = Instance.new('Frame')
                    local _UIListLayout3 = Instance.new('UIListLayout')

                    _Frame6.Name = 'Section'
                    _Frame6.Parent = _ScrollingFrame2
                    _Frame6.BackgroundColor3 = zyColor
                    _Frame6.BackgroundTransparency = 1
                    _Frame6.BorderSizePixel = 0
                    _Frame6.ClipsDescendants = true
                    _Frame6.Size = UDim2.new(0.981000006, 0, 0, 36)
                    _UICorner4.CornerRadius = UDim.new(0, 6)
                    _UICorner4.Name = 'SectionC'
                    _UICorner4.Parent = _Frame6
                    _TextLabel3.Name = 'SectionText'
                    _TextLabel3.Parent = _Frame6
                    _TextLabel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel3.BackgroundTransparency = 1
                    _TextLabel3.Position = UDim2.new(0.0887396261, 0, 0, 0)
                    _TextLabel3.Size = UDim2.new(0, 401, 0, 36)
                    _TextLabel3.Font = Enum.Font.GothamSemibold
                    _TextLabel3.Text = p76
                    _TextLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel3.TextSize = 16
                    _TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
                    _ImageLabel4.Name = 'SectionOpen'
                    _ImageLabel4.Parent = _TextLabel3
                    _ImageLabel4.BackgroundTransparency = 1
                    _ImageLabel4.BorderSizePixel = 0
                    _ImageLabel4.Position = UDim2.new(0, -33, 0, 5)
                    _ImageLabel4.Size = UDim2.new(0, 26, 0, 26)
                    _ImageLabel4.Image = 'http://www.roblox.com/asset/?id=6031302934'
                    _ImageLabel5.Name = 'SectionOpened'
                    _ImageLabel5.Parent = _ImageLabel4
                    _ImageLabel5.BackgroundTransparency = 1
                    _ImageLabel5.BorderSizePixel = 0
                    _ImageLabel5.Size = UDim2.new(0, 26, 0, 26)
                    _ImageLabel5.Image = 'http://www.roblox.com/asset/?id=6031302932'
                    _ImageLabel5.ImageTransparency = 1
                    _ImageButton.Name = 'SectionToggle'
                    _ImageButton.Parent = _ImageLabel4
                    _ImageButton.BackgroundTransparency = 1
                    _ImageButton.BorderSizePixel = 0
                    _ImageButton.Size = UDim2.new(0, 26, 0, 26)
                    _Frame7.Name = 'Objs'
                    _Frame7.Parent = _Frame6
                    _Frame7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _Frame7.BackgroundTransparency = 1
                    _Frame7.BorderSizePixel = 0
                    _Frame7.Position = UDim2.new(0, 6, 0, 36)
                    _Frame7.Size = UDim2.new(0.986347735, 0, 0, 0)
                    _UIListLayout3.Name = 'ObjsL'
                    _UIListLayout3.Parent = _Frame7
                    _UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
                    _UIListLayout3.Padding = UDim.new(0, 8)

                    local u86 = p77

                    if p77 ~= false then
                        _Frame6.Size = UDim2.new(0.981000006, 0, 0, u86 and (36 + _UIListLayout3.AbsoluteContentSize.Y + 8 or 36) or 36)
                        _ImageLabel5.ImageTransparency = u86 and 0 or 1
                        _ImageLabel4.ImageTransparency = u86 and 1 or 0
                    end

                    _ImageButton.MouseButton1Click:Connect(function()
                        u86 = not u86
                        _Frame6.Size = UDim2.new(0.981000006, 0, 0, u86 and 36 + _UIListLayout3.AbsoluteContentSize.Y + 8 or 36)
                        _ImageLabel5.ImageTransparency = u86 and 0 or 1
                        _ImageLabel4.ImageTransparency = u86 and 1 or 0
                    end)
                    _UIListLayout3:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
                        if u86 then
                            _Frame6.Size = UDim2.new(0.981000006, 0, 0, 36 + _UIListLayout3.AbsoluteContentSize.Y + 8)
                        end
                    end)

                    return {
                        Button = function(_, p87, p88)
                            local u89 = p88 or function() end
                            local _Frame8 = Instance.new('Frame')
                            local _TextButton3 = Instance.new('TextButton')
                            local _UICorner5 = Instance.new('UICorner')

                            _Frame8.Name = 'BtnModule'
                            _Frame8.Parent = _Frame7
                            _Frame8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _Frame8.BackgroundTransparency = 1
                            _Frame8.BorderSizePixel = 0
                            _Frame8.Position = UDim2.new(0, 0, 0, 0)
                            _Frame8.Size = UDim2.new(0, 428, 0, 38)
                            _TextButton3.Name = 'Btn'
                            _TextButton3.Parent = _Frame8
                            _TextButton3.BackgroundColor3 = zyColor
                            _TextButton3.BorderSizePixel = 0
                            _TextButton3.Size = UDim2.new(0, 428, 0, 38)
                            _TextButton3.AutoButtonColor = false
                            _TextButton3.Font = Enum.Font.GothamSemibold
                            _TextButton3.Text = '   ' .. p87
                            _TextButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextButton3.TextSize = 16
                            _TextButton3.TextXAlignment = Enum.TextXAlignment.Left
                            _UICorner5.CornerRadius = UDim.new(0, 6)
                            _UICorner5.Name = 'BtnC'
                            _UICorner5.Parent = _TextButton3

                            _TextButton3.MouseButton1Click:Connect(function()
                                spawn(function()
                                    Ripple(_TextButton3)
                                end)
                                spawn(u89)
                            end)
                        end,
                        Label = function(_, p93)
                            local _Frame9 = Instance.new('Frame')
                            local _TextLabel4 = Instance.new('TextLabel')
                            local _UICorner6 = Instance.new('UICorner')

                            _Frame9.Name = 'LabelModule'
                            _Frame9.Parent = _Frame7
                            _Frame9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _Frame9.BackgroundTransparency = 1
                            _Frame9.BorderSizePixel = 0
                            _Frame9.Position = UDim2.new(0, 0, NAN, 0)
                            _Frame9.Size = UDim2.new(0, 428, 0, 19)
                            _TextLabel4.Parent = _Frame9
                            _TextLabel4.BackgroundColor3 = zyColor
                            _TextLabel4.Size = UDim2.new(0, 428, 0, 22)
                            _TextLabel4.Font = Enum.Font.GothamSemibold
                            _TextLabel4.Text = p93
                            _TextLabel4.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel4.TextSize = 14
                            _UICorner6.CornerRadius = UDim.new(0, 6)
                            _UICorner6.Name = 'LabelC'
                            _UICorner6.Parent = _TextLabel4

                            return _TextLabel4
                        end,
                        Toggle = function(_, p97, p98, p99, p100)
                            local u101 = p100 or function() end
                            local v102 = p99 or false

                            assert(p97, 'No text provided')
                            assert(p98, 'No flag provided')

                            p27.flags[p98] = v102

                            local _Frame10 = Instance.new('Frame')
                            local _TextButton4 = Instance.new('TextButton')
                            local _UICorner7 = Instance.new('UICorner')
                            local _Frame11 = Instance.new('Frame')
                            local _Frame12 = Instance.new('Frame')
                            local _UICorner8 = Instance.new('UICorner')
                            local _UICorner9 = Instance.new('UICorner')

                            _Frame10.Name = 'ToggleModule'
                            _Frame10.Parent = _Frame7
                            _Frame10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _Frame10.BackgroundTransparency = 1
                            _Frame10.BorderSizePixel = 0
                            _Frame10.Position = UDim2.new(0, 0, 0, 0)
                            _Frame10.Size = UDim2.new(0, 428, 0, 38)
                            _TextButton4.Name = 'ToggleBtn'
                            _TextButton4.Parent = _Frame10
                            _TextButton4.BackgroundColor3 = zyColor
                            _TextButton4.BorderSizePixel = 0
                            _TextButton4.Size = UDim2.new(0, 428, 0, 38)
                            _TextButton4.AutoButtonColor = false
                            _TextButton4.Font = Enum.Font.GothamSemibold
                            _TextButton4.Text = '   ' .. p97
                            _TextButton4.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextButton4.TextSize = 16
                            _TextButton4.TextXAlignment = Enum.TextXAlignment.Left
                            _UICorner7.CornerRadius = UDim.new(0, 6)
                            _UICorner7.Name = 'ToggleBtnC'
                            _UICorner7.Parent = _TextButton4
                            _Frame11.Name = 'ToggleDisable'
                            _Frame11.Parent = _TextButton4
                            _Frame11.BackgroundColor3 = Background
                            _Frame11.BorderSizePixel = 0
                            _Frame11.Position = UDim2.new(0.901869178, 0, 0.208881587, 0)
                            _Frame11.Size = UDim2.new(0, 36, 0, 22)
                            _Frame12.Name = 'ToggleSwitch'
                            _Frame12.Parent = _Frame11
                            _Frame12.BackgroundColor3 = beijingColor
                            _Frame12.Size = UDim2.new(0, 24, 0, 22)
                            _UICorner8.CornerRadius = UDim.new(0, 6)
                            _UICorner8.Name = 'ToggleSwitchC'
                            _UICorner8.Parent = _Frame12
                            _UICorner9.CornerRadius = UDim.new(0, 6)
                            _UICorner9.Name = 'ToggleDisableC'
                            _UICorner9.Parent = _Frame11

                            local u111 = {
                                SetState = function(_, p110)
                                    if p110 == nil then
                                        p110 = not p27.flags[p98]
                                    end
                                    if p27.flags[p98] ~= p110 then
                                        u4.TweenService:Create(_Frame12, TweenInfo.new(0.2), {
                                            Position = UDim2.new(0, p110 and _Frame12.Size.X.Offset / 2 or 0, 0, 0),
                                            BackgroundColor3 = p110 and Color3.fromRGB(255, 255, 255) or beijingColor,
                                        }):Play()

                                        p27.flags[p98] = p110

                                        u101(p110)
                                    end
                                end,
                                Module = _Frame10,
                            }

                            if v102 ~= false then
                                u111:SetState(p98, true)
                            end

                            _TextButton4.MouseButton1Click:Connect(function()
                                u111:SetState()
                            end)

                            return u111
                        end,
                        Keybind = function(_, p112, p113, p114)
                            local u115 = p114 or function() end

                            assert(p112, 'No text provided')
                            assert(p113, 'No default key provided')

                            if typeof(p113) == 'string' then
                                p113 = Enum.KeyCode[p113] or p113
                            end

                            local u116 = {
                                Return = true,
                                Space = true,
                                Tab = true,
                                Backquote = true,
                                CapsLock = true,
                                Escape = true,
                                Unknown = true,
                            }
                            local u117 = {
                                RightControl = 'Right Ctrl',
                                LeftControl = 'Left Ctrl',
                                LeftShift = 'Left Shift',
                                RightShift = 'Right Shift',
                                Semicolon = ';',
                                Quote = '"',
                                LeftBracket = '[',
                                RightBracket = ']',
                                Equals = '=',
                                Minus = '-',
                                RightAlt = 'Right Alt',
                                LeftAlt = 'Left Alt',
                            }
                            local u118 = not p113 or u117[p113.Name] or (p113.Name or 'None')
                            local _Frame13 = Instance.new('Frame')
                            local _TextButton5 = Instance.new('TextButton')
                            local _UICorner10 = Instance.new('UICorner')
                            local _TextButton6 = Instance.new('TextButton')
                            local _UICorner11 = Instance.new('UICorner')
                            local _UIListLayout4 = Instance.new('UIListLayout')
                            local _UIPadding = Instance.new('UIPadding')

                            _Frame13.Name = 'KeybindModule'
                            _Frame13.Parent = _Frame7
                            _Frame13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _Frame13.BackgroundTransparency = 1
                            _Frame13.BorderSizePixel = 0
                            _Frame13.Position = UDim2.new(0, 0, 0, 0)
                            _Frame13.Size = UDim2.new(0, 428, 0, 38)
                            _TextButton5.Name = 'KeybindBtn'
                            _TextButton5.Parent = _Frame13
                            _TextButton5.BackgroundColor3 = zyColor
                            _TextButton5.BorderSizePixel = 0
                            _TextButton5.Size = UDim2.new(0, 428, 0, 38)
                            _TextButton5.AutoButtonColor = false
                            _TextButton5.Font = Enum.Font.GothamSemibold
                            _TextButton5.Text = '   ' .. p112
                            _TextButton5.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextButton5.TextSize = 16
                            _TextButton5.TextXAlignment = Enum.TextXAlignment.Left
                            _UICorner10.CornerRadius = UDim.new(0, 6)
                            _UICorner10.Name = 'KeybindBtnC'
                            _UICorner10.Parent = _TextButton5
                            _TextButton6.Name = 'KeybindValue'
                            _TextButton6.Parent = _TextButton5
                            _TextButton6.BackgroundColor3 = Background
                            _TextButton6.BorderSizePixel = 0
                            _TextButton6.Position = UDim2.new(0.763033211, 0, 0.289473683, 0)
                            _TextButton6.Size = UDim2.new(0, 100, 0, 28)
                            _TextButton6.AutoButtonColor = false
                            _TextButton6.Font = Enum.Font.Gotham
                            _TextButton6.Text = u118
                            _TextButton6.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextButton6.TextSize = 14
                            _UICorner11.CornerRadius = UDim.new(0, 6)
                            _UICorner11.Name = 'KeybindValueC'
                            _UICorner11.Parent = _TextButton6
                            _UIListLayout4.Name = 'KeybindL'
                            _UIListLayout4.Parent = _TextButton5
                            _UIListLayout4.HorizontalAlignment = Enum.HorizontalAlignment.Right
                            _UIListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
                            _UIListLayout4.VerticalAlignment = Enum.VerticalAlignment.Center
                            _UIPadding.Parent = _TextButton5
                            _UIPadding.PaddingRight = UDim.new(0, 6)

                            u4.UserInputService.InputBegan:Connect(function(p126, p127)
                                if p127 then
                                    return
                                elseif p126.UserInputType == Enum.UserInputType.Keyboard then
                                    if p126.KeyCode == p113 then
                                        u115(p113.Name)
                                    end
                                else
                                    return
                                end
                            end)
                            _TextButton6.MouseButton1Click:Connect(function()
                                _TextButton6.Text = '...'

                                wait()

                                local v128, _ = u4.UserInputService.InputEnded:Wait()
                                local v129 = tostring(v128.KeyCode.Name)

                                if v128.UserInputType == Enum.UserInputType.Keyboard then
                                    if u116[v129] then
                                        _TextButton6.Text = u118
                                    else
                                        wait()

                                        p113 = Enum.KeyCode[v129]
                                        _TextButton6.Text = u117[v129] or v129
                                    end
                                else
                                    _TextButton6.Text = u118

                                    return
                                end
                            end)

                            local v130 = _TextButton6

                            _TextButton6.GetPropertyChangedSignal(v130, 'TextBounds'):Connect(function()
                                _TextButton6.Size = UDim2.new(0, _TextButton6.TextBounds.X + 30, 0, 28)
                            end)

                            _TextButton6.Size = UDim2.new(0, _TextButton6.TextBounds.X + 30, 0, 28)
                        end,
                        Textbox = function(_, p131, p132, p133, p134)
                            local u135 = p134 or function() end

                            assert(p131, 'No text provided')
                            assert(p132, 'No flag provided')
                            assert(p133, 'No default text provided')

                            p27.flags[p132] = p133

                            local _Frame14 = Instance.new('Frame')
                            local _TextButton7 = Instance.new('TextButton')
                            local _UICorner12 = Instance.new('UICorner')
                            local _TextButton8 = Instance.new('TextButton')
                            local _UICorner13 = Instance.new('UICorner')
                            local _TextBox = Instance.new('TextBox')
                            local _UIListLayout5 = Instance.new('UIListLayout')
                            local _UIPadding2 = Instance.new('UIPadding')

                            _Frame14.Name = 'TextboxModule'
                            _Frame14.Parent = _Frame7
                            _Frame14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _Frame14.BackgroundTransparency = 1
                            _Frame14.BorderSizePixel = 0
                            _Frame14.Position = UDim2.new(0, 0, 0, 0)
                            _Frame14.Size = UDim2.new(0, 428, 0, 38)
                            _TextButton7.Name = 'TextboxBack'
                            _TextButton7.Parent = _Frame14
                            _TextButton7.BackgroundColor3 = zyColor
                            _TextButton7.BorderSizePixel = 0
                            _TextButton7.Size = UDim2.new(0, 428, 0, 38)
                            _TextButton7.AutoButtonColor = false
                            _TextButton7.Font = Enum.Font.GothamSemibold
                            _TextButton7.Text = '   ' .. p131
                            _TextButton7.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextButton7.TextSize = 16
                            _TextButton7.TextXAlignment = Enum.TextXAlignment.Left
                            _UICorner12.CornerRadius = UDim.new(0, 6)
                            _UICorner12.Name = 'TextboxBackC'
                            _UICorner12.Parent = _TextButton7
                            _TextButton8.Name = 'BoxBG'
                            _TextButton8.Parent = _TextButton7
                            _TextButton8.BackgroundColor3 = Background
                            _TextButton8.BorderSizePixel = 0
                            _TextButton8.Position = UDim2.new(0.763033211, 0, 0.289473683, 0)
                            _TextButton8.Size = UDim2.new(0, 100, 0, 28)
                            _TextButton8.AutoButtonColor = false
                            _TextButton8.Font = Enum.Font.Gotham
                            _TextButton8.Text = ''
                            _TextButton8.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextButton8.TextSize = 14
                            _UICorner13.CornerRadius = UDim.new(0, 6)
                            _UICorner13.Name = 'BoxBGC'
                            _UICorner13.Parent = _TextButton8
                            _TextBox.Parent = _TextButton8
                            _TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextBox.BackgroundTransparency = 1
                            _TextBox.BorderSizePixel = 0
                            _TextBox.Size = UDim2.new(1, 0, 1, 0)
                            _TextBox.Font = Enum.Font.Gotham
                            _TextBox.Text = p133
                            _TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextBox.TextSize = 14
                            _UIListLayout5.Name = 'TextboxBackL'
                            _UIListLayout5.Parent = _TextButton7
                            _UIListLayout5.HorizontalAlignment = Enum.HorizontalAlignment.Right
                            _UIListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
                            _UIListLayout5.VerticalAlignment = Enum.VerticalAlignment.Center
                            _UIPadding2.Name = 'TextboxBackP'
                            _UIPadding2.Parent = _TextButton7
                            _UIPadding2.PaddingRight = UDim.new(0, 6)

                            _TextBox.FocusLost:Connect(function()
                                if _TextBox.Text == '' then
                                    _TextBox.Text = p133
                                end

                                p27.flags[p132] = _TextBox.Text

                                u135(_TextBox.Text)
                            end)

                            local v144 = _TextBox

                            _TextBox.GetPropertyChangedSignal(v144, 'TextBounds'):Connect(function()
                                _TextButton8.Size = UDim2.new(0, _TextBox.TextBounds.X + 30, 0, 28)
                            end)

                            _TextButton8.Size = UDim2.new(0, _TextBox.TextBounds.X + 30, 0, 28)
                        end,
                        Slider = function(_, p145, p146, p147, p148, p149, p150, p151)
                            local u152 = p151 or function() end
                            local u153 = p148 or 1
                            local u154 = p149 or 10
                            local u155 = p147 or u153
                            local u156 = p150 or false

                            p27.flags[p146] = u155

                            assert(p145, 'No text provided')
                            assert(p146, 'No flag provided')
                            assert(u155, 'No default value provided')

                            local _Frame15 = Instance.new('Frame')
                            local _TextButton9 = Instance.new('TextButton')
                            local _UICorner14 = Instance.new('UICorner')
                            local _Frame16 = Instance.new('Frame')
                            local _UICorner15 = Instance.new('UICorner')
                            local _Frame17 = Instance.new('Frame')
                            local _UICorner16 = Instance.new('UICorner')
                            local _TextButton10 = Instance.new('TextButton')
                            local _UICorner17 = Instance.new('UICorner')
                            local _TextBox2 = Instance.new('TextBox')
                            local _TextButton11 = Instance.new('TextButton')
                            local _TextButton12 = Instance.new('TextButton')

                            _Frame15.Name = 'SliderModule'
                            _Frame15.Parent = _Frame7
                            _Frame15.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _Frame15.BackgroundTransparency = 1
                            _Frame15.BorderSizePixel = 0
                            _Frame15.Position = UDim2.new(0, 0, 0, 0)
                            _Frame15.Size = UDim2.new(0, 428, 0, 38)
                            _TextButton9.Name = 'SliderBack'
                            _TextButton9.Parent = _Frame15
                            _TextButton9.BackgroundColor3 = zyColor
                            _TextButton9.BorderSizePixel = 0
                            _TextButton9.Size = UDim2.new(0, 428, 0, 38)
                            _TextButton9.AutoButtonColor = false
                            _TextButton9.Font = Enum.Font.GothamSemibold
                            _TextButton9.Text = '   ' .. p145
                            _TextButton9.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextButton9.TextSize = 16
                            _TextButton9.TextXAlignment = Enum.TextXAlignment.Left
                            _UICorner14.CornerRadius = UDim.new(0, 6)
                            _UICorner14.Name = 'SliderBackC'
                            _UICorner14.Parent = _TextButton9
                            _Frame16.Name = 'SliderBar'
                            _Frame16.Parent = _TextButton9
                            _Frame16.AnchorPoint = Vector2.new(0, 0.5)
                            _Frame16.BackgroundColor3 = Background
                            _Frame16.BorderSizePixel = 0
                            _Frame16.Position = UDim2.new(0.369000018, 40, 0.5, 0)
                            _Frame16.Size = UDim2.new(0, 140, 0, 12)
                            _UICorner15.CornerRadius = UDim.new(0, 4)
                            _UICorner15.Name = 'SliderBarC'
                            _UICorner15.Parent = _Frame16
                            _Frame17.Name = 'SliderPart'
                            _Frame17.Parent = _Frame16
                            _Frame17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _Frame17.BorderSizePixel = 0
                            _Frame17.Size = UDim2.new(0, 54, 0, 13)
                            _UICorner16.CornerRadius = UDim.new(0, 4)
                            _UICorner16.Name = 'SliderPartC'
                            _UICorner16.Parent = _Frame17
                            _TextButton10.Name = 'SliderValBG'
                            _TextButton10.Parent = _TextButton9
                            _TextButton10.BackgroundColor3 = Background
                            _TextButton10.BorderSizePixel = 0
                            _TextButton10.Position = UDim2.new(0.883177578, 0, 0.131578952, 0)
                            _TextButton10.Size = UDim2.new(0, 44, 0, 28)
                            _TextButton10.AutoButtonColor = false
                            _TextButton10.Font = Enum.Font.Gotham
                            _TextButton10.Text = ''
                            _TextButton10.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextButton10.TextSize = 14
                            _UICorner17.CornerRadius = UDim.new(0, 6)
                            _UICorner17.Name = 'SliderValBGC'
                            _UICorner17.Parent = _TextButton10
                            _TextBox2.Name = 'SliderValue'
                            _TextBox2.Parent = _TextButton10
                            _TextBox2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextBox2.BackgroundTransparency = 1
                            _TextBox2.BorderSizePixel = 0
                            _TextBox2.Size = UDim2.new(1, 0, 1, 0)
                            _TextBox2.Font = Enum.Font.Gotham
                            _TextBox2.Text = '1000'
                            _TextBox2.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextBox2.TextSize = 14
                            _TextButton11.Name = 'MinSlider'
                            _TextButton11.Parent = _Frame15
                            _TextButton11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextButton11.BackgroundTransparency = 1
                            _TextButton11.BorderSizePixel = 0
                            _TextButton11.Position = UDim2.new(0.296728969, 40, 0.236842096, 0)
                            _TextButton11.Size = UDim2.new(0, 20, 0, 20)
                            _TextButton11.Font = Enum.Font.Gotham
                            _TextButton11.Text = '-'
                            _TextButton11.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextButton11.TextSize = 24
                            _TextButton11.TextWrapped = true
                            _TextButton12.Name = 'AddSlider'
                            _TextButton12.Parent = _Frame15
                            _TextButton12.AnchorPoint = Vector2.new(0, 0.5)
                            _TextButton12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextButton12.BackgroundTransparency = 1
                            _TextButton12.BorderSizePixel = 0
                            _TextButton12.Position = UDim2.new(0.810906529, 0, 0.5, 0)
                            _TextButton12.Size = UDim2.new(0, 20, 0, 20)
                            _TextButton12.Font = Enum.Font.Gotham
                            _TextButton12.Text = '+'
                            _TextButton12.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextButton12.TextSize = 24
                            _TextButton12.TextWrapped = true

                            local u173 = {
                                SetValue = function(_, p169)
                                    local v170 = (u5.X - _Frame16.AbsolutePosition.X) / _Frame16.AbsoluteSize.X

                                    if p169 then
                                        v170 = (p169 - u153) / (u154 - u153)
                                    end

                                    local v171 = math.clamp(v170, 0, 1)
                                    local v172

                                    if u156 then
                                        v172 = p169 or tonumber(string.format('%.1f', tostring(u153 + (u154 - u153) * v171)))
                                    else
                                        v172 = p169 or math.floor(u153 + (u154 - u153) * v171)
                                    end

                                    p27.flags[p146] = tonumber(v172)
                                    _TextBox2.Text = tostring(v172)
                                    _Frame17.Size = UDim2.new(v171, 0, 1, 0)

                                    u152(tonumber(v172))
                                end,
                            }

                            _TextButton11.MouseButton1Click:Connect(function()
                                local v174 = p27.flags[p146]

                                u173:SetValue((math.clamp(v174 - 1, u153, u154)))
                            end)
                            _TextButton12.MouseButton1Click:Connect(function()
                                local v175 = p27.flags[p146]

                                u173:SetValue((math.clamp(v175 + 1, u153, u154)))
                            end)

                            local v176 = u173

                            u173.SetValue(v176, u155)

                            local u177 = false
                            local u178 = false
                            local u179 = {
                                [''] = true,
                                ['-'] = true,
                            }

                            _Frame16.InputBegan:Connect(function(p180)
                                if p180.UserInputType == Enum.UserInputType.MouseButton1 then
                                    u173:SetValue()

                                    u177 = true
                                end
                            end)
                            u4.UserInputService.InputEnded:Connect(function(p181)
                                if u177 and p181.UserInputType == Enum.UserInputType.MouseButton1 then
                                    u177 = false
                                end
                            end)
                            u4.UserInputService.InputChanged:Connect(function(p182)
                                if u177 and p182.UserInputType == Enum.UserInputType.MouseMovement then
                                    u173:SetValue()
                                end
                            end)
                            _Frame16.InputBegan:Connect(function(p183)
                                if p183.UserInputType == Enum.UserInputType.Touch then
                                    u173:SetValue()

                                    u177 = true
                                end
                            end)
                            u4.UserInputService.InputEnded:Connect(function(p184)
                                if u177 and p184.UserInputType == Enum.UserInputType.Touch then
                                    u177 = false
                                end
                            end)
                            u4.UserInputService.InputChanged:Connect(function(p185)
                                if u177 and p185.UserInputType == Enum.UserInputType.Touch then
                                    u173:SetValue()
                                end
                            end)
                            _TextBox2.Focused:Connect(function()
                                u178 = true
                            end)
                            _TextBox2.FocusLost:Connect(function()
                                u178 = false

                                if _TextBox2.Text == '' then
                                    u173:SetValue(u155)
                                end
                            end)

                            local v186 = _TextBox2

                            _TextBox2.GetPropertyChangedSignal(v186, 'Text'):Connect(function()
                                if u178 then
                                    _TextBox2.Text = _TextBox2.Text:gsub('%D+', '')

                                    local _Text = _TextBox2.Text

                                    if tonumber(_Text) then
                                        if not u179[_Text] then
                                            if u154 < tonumber(_Text) then
                                                _Text = u154
                                                _TextBox2.Text = tostring(u154)
                                            end

                                            u173:SetValue(tonumber(_Text))
                                        end
                                    else
                                        _TextBox2.Text = _TextBox2.Text:gsub('%D+', '')
                                    end
                                end
                            end)

                            return u173
                        end,
                        Dropdown = function(_, p188, p189, p190, p191)
                            local u192 = p191 or function() end

                            assert(p188, 'No text provided')
                            assert(p189, 'No flag provided')

                            p27.flags[p189] = nil

                            local _Frame18 = Instance.new('Frame')
                            local _TextButton13 = Instance.new('TextButton')
                            local _UICorner18 = Instance.new('UICorner')
                            local _TextButton14 = Instance.new('TextButton')
                            local _TextBox3 = Instance.new('TextBox')
                            local _UIListLayout6 = Instance.new('UIListLayout')

                            Instance.new('TextButton')
                            Instance.new('UICorner')

                            _Frame18.Name = 'DropdownModule'
                            _Frame18.Parent = _Frame7
                            _Frame18.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _Frame18.BackgroundTransparency = 1
                            _Frame18.BorderSizePixel = 0
                            _Frame18.ClipsDescendants = true
                            _Frame18.Position = UDim2.new(0, 0, 0, 0)
                            _Frame18.Size = UDim2.new(0, 428, 0, 38)
                            _TextButton13.Name = 'DropdownTop'
                            _TextButton13.Parent = _Frame18
                            _TextButton13.BackgroundColor3 = zyColor
                            _TextButton13.BorderSizePixel = 0
                            _TextButton13.Size = UDim2.new(0, 428, 0, 38)
                            _TextButton13.AutoButtonColor = false
                            _TextButton13.Font = Enum.Font.GothamSemibold
                            _TextButton13.Text = ''
                            _TextButton13.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextButton13.TextSize = 16
                            _TextButton13.TextXAlignment = Enum.TextXAlignment.Left
                            _UICorner18.CornerRadius = UDim.new(0, 6)
                            _UICorner18.Name = 'DropdownTopC'
                            _UICorner18.Parent = _TextButton13
                            _TextButton14.Name = 'DropdownOpen'
                            _TextButton14.Parent = _TextButton13
                            _TextButton14.AnchorPoint = Vector2.new(0, 0.5)
                            _TextButton14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextButton14.BackgroundTransparency = 1
                            _TextButton14.BorderSizePixel = 0
                            _TextButton14.Position = UDim2.new(0.918383181, 0, 0.5, 0)
                            _TextButton14.Size = UDim2.new(0, 20, 0, 20)
                            _TextButton14.Font = Enum.Font.Gotham
                            _TextButton14.Text = '+'
                            _TextButton14.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextButton14.TextSize = 24
                            _TextButton14.TextWrapped = true
                            _TextBox3.Name = 'DropdownText'
                            _TextBox3.Parent = _TextButton13
                            _TextBox3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextBox3.BackgroundTransparency = 1
                            _TextBox3.BorderSizePixel = 0
                            _TextBox3.Position = UDim2.new(0.0373831764, 0, 0, 0)
                            _TextBox3.Size = UDim2.new(0, 184, 0, 38)
                            _TextBox3.Font = Enum.Font.GothamSemibold
                            _TextBox3.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
                            _TextBox3.PlaceholderText = p188
                            _TextBox3.Text = ''
                            _TextBox3.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextBox3.TextSize = 16
                            _TextBox3.TextXAlignment = Enum.TextXAlignment.Left
                            _UIListLayout6.Name = 'DropdownModuleL'
                            _UIListLayout6.Parent = _Frame18
                            _UIListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
                            _UIListLayout6.Padding = UDim.new(0, 4)

                            local function u202()
                                local v199 = _Frame18:GetChildren()

                                for v200 = 1, #v199 do
                                    local v201 = v199[v200]

                                    if v201:IsA('TextButton') then
                                        if v201.Name:match('Option_') then
                                            v201.Visible = true
                                        end
                                    end
                                end
                            end
                            local function u207(p203)
                                local v204 = _Frame18:GetChildren()

                                for v205 = 1, #v204 do
                                    local v206 = v204[v205]

                                    if p203 == '' then
                                        u202()
                                    elseif v206:IsA('TextButton') then
                                        if v206.Name:match('Option_') then
                                            if v206.Text:lower():match(p203:lower()) then
                                                v206.Visible = true
                                            else
                                                v206.Visible = false
                                            end
                                        end
                                    end
                                end
                            end

                            local u208 = false

                            local function u209()
                                u208 = not u208

                                if u208 then
                                    u202()
                                end

                                _TextButton14.Text = u208 and '-' or '+'
                                _Frame18.Size = UDim2.new(0, 428, 0, u208 and _UIListLayout6.AbsoluteContentSize.Y + 4 or 38)
                            end

                            _TextButton14.MouseButton1Click:Connect(u209)
                            _TextBox3.Focused:Connect(function()
                                if not u208 then
                                    u209()
                                end
                            end)

                            local v210 = _TextBox3

                            _TextBox3.GetPropertyChangedSignal(v210, 'Text'):Connect(function()
                                if u208 then
                                    u207(_TextBox3.Text)
                                end
                            end)

                            local v211 = _UIListLayout6

                            _UIListLayout6.GetPropertyChangedSignal(v211, 'AbsoluteContentSize'):Connect(function()
                                if u208 then
                                    _Frame18.Size = UDim2.new(0, 428, 0, _UIListLayout6.AbsoluteContentSize.Y + 4)
                                end
                            end)

                            local u225 = {
                                AddOption = function(_, p212)
                                    local _TextButton15 = Instance.new('TextButton')
                                    local _UICorner19 = Instance.new('UICorner')

                                    _TextButton15.Name = 'Option_' .. p212
                                    _TextButton15.Parent = _Frame18
                                    _TextButton15.BackgroundColor3 = zyColor
                                    _TextButton15.BorderSizePixel = 0
                                    _TextButton15.Position = UDim2.new(0, 0, 0.328125, 0)
                                    _TextButton15.Size = UDim2.new(0, 428, 0, 26)
                                    _TextButton15.AutoButtonColor = false
                                    _TextButton15.Font = Enum.Font.Gotham
                                    _TextButton15.Text = p212
                                    _TextButton15.TextColor3 = Color3.fromRGB(255, 255, 255)
                                    _TextButton15.TextSize = 14
                                    _UICorner19.CornerRadius = UDim.new(0, 6)
                                    _UICorner19.Name = 'OptionC'
                                    _UICorner19.Parent = _TextButton15

                                    _TextButton15.MouseButton1Click:Connect(function()
                                        u209()
                                        u192(_TextButton15.Text)

                                        _TextBox3.Text = _TextButton15.Text
                                        p27.flags[p189] = _TextButton15.Text
                                    end)
                                end,
                                RemoveOption = function(_, p215)
                                    local v216 = _Frame18:FindFirstChild('Option_' .. p215)

                                    if v216 then
                                        v216:Destroy()
                                    end
                                end,
                                SetOptions = function(_, p217)
                                    local v218 = next
                                    local v219, v220 = _Frame18:GetChildren()

                                    while true do
                                        local v221

                                        v220, v221 = v218(v219, v220)

                                        if v220 == nil then
                                            break
                                        end
                                        if v221.Name:match('Option_') then
                                            v221:Destroy()
                                        end
                                    end

                                    local v222 = next
                                    local v223 = nil

                                    while true do
                                        local v224

                                        v223, v224 = v222(p217, v223)

                                        if v223 == nil then
                                            break
                                        end

                                        u225:AddOption(v224)
                                    end
                                end,
                            }
                            local v226 = u225

                            u225.SetOptions(v226, p190 or {})

                            return u225
                        end,
                    }
                end,
            }
        end,
    }
end

return u1
