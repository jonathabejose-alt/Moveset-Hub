--[[
       ____  ________  _______  ____________   ____  __  ________________________     _______________  _____   ________   _    __   ___ 
      / __ \/ ____/  |/  / __ \/_  __/ ____/  / __ )/ / / / ____/ ____/ ____/ __ \   / ___/_  __/ __ \/  _/ | / / ____/  | |  / /  |__ \
     / /_/ / __/ / /|_/ / / / / / / / __/    / __  / / / / /_  / /_  / __/ / /_/ /   \__ \ / / / /_/ // //  |/ / / __    | | / /   __/ /
    / _, _/ /___/ /  / / /_/ / / / / /___   / /_/ / /_/ / __/ / __/ / /___/ _, _/   ___/ // / / _, _// // /|  / /_/ /    | |/ /   / __/ 
   /_/ |_/_____/_/  /_/\____/ /_/ /_____/  /_____/\____/_/   /_/   /_____/_/ |_|  /____//_/ /_/ |_/___/_/ |_/\____/      |___/   /____/ 
                                                                                                                                     
   
 REMOTE BUFFER V2
    Author: tze      | Original by: daffy
    remote buffer v2 | Original buffer: https://pastebin.com/8XJh7dzh

    Compatible with PC and Mobile Devices
    
    NEW IN V2: Full mobile support
    - Buffers automatically adapt based on platform
    - PC: uses string.char() (1 byte per character)
    - Mobile: uses string.pack(">I2") (2 bytes in big-endian)
    - Buttons now respond to TouchTap in addition to MouseButton1Down
    
    IMPORTANT: Some mobile games require buffers to have exactly
    2 bytes for the remote ID. This version automatically detects
    if you're on mobile and adjusts the format.
    
    QUICK START GUIDE
    
    1. Load the module:
       local rb = loadstring(game:HttpGet("SCRIPT_URL"))()
    
    2. Use the functions:
       rb.grabBall({loop = true})        -- Auto grab ball
       rb.useSkill(1)                     -- Use skill 1
       rb.passBall({maxDistance = 200})   -- Pass to closest teammate
       rb.setStun(0.5, true)             -- Stun for 0.5 seconds
    
    3. Access buffers (pre-calculated):
       rb.buffers.base      -- Main buffer
       rb.buffers.grabball  -- Ball grab buffer
       rb.buffers.kick      -- Kick buffer
       
    PC vs MOBILE BUFFER DIFFERENCES
    
    PC (Windows/Mac):
    - string.char(25) = 1 byte (0x19)
    - Game expects 1 byte per ID
    
    Mobile (iOS/Android):
    - string.pack(">I2", 25) = 2 bytes (0x00, 0x19)
    - Game expects 2 bytes in big-endian format
    
    This version HANDLES BOTH PLATFORMS AUTOMATICALLY.
    
    COMPLETE FUNCTION LIST
    
    CORE FUNCTIONS:
    - grabBall(config)          : Auto grabs the ball
    - stopGrab()                : Stops auto grab
    - setStun(duration, disableRotate) : Freezes character
    - passBall(config)          : Pass to closest teammate
    - kickBall(config)          : Kick ball in direction
    - useSkill(skillNumber, target) : Activate skill
    - useDribble()              : Perform dribble
    - useTackle()               : Perform tackle
    
    UI FUNCTIONS:
    - setSkillName(slot, name, reuse) : Change skill button name
    - createSkill(slot, name, reuse)  : Create new skill button
    - showCooldown(slot, duration)    : Show cooldown on button
    - isOnCooldown(slot)              : Check if on cooldown
    - setupTSpecial(config)           : Setup T special button
    - setAwakening(config)            : Change awakening UI
    - changeStyle(style)              : Change player style
    
    CONTROL FUNCTIONS:
    - blockOriginalSkills()           : Block original game skills
    - restoreOriginalSkills()         : Restore original game skills
    - setupMobileInputs(skillCallbacks) : Setup touch inputs
    - setupPCInputs(skillCallbacks)     : Setup keyboard inputs
    - clearMobileInputs()               : Clear all connections
    
    AVAILABLE BUFFERS:
    - buffers.base     : Main buffer for sending skills
    - buffers.grabball : Buffer for grabbing ball
    - buffers.tackle   : Buffer for tackles
    - buffers.dribble  : Buffer for dribbling
    - buffers.skill1-5 : Individual skill buffers
    - buffers.kick     : Buffer for kicking


    load buffer
    loadstring(game:HttpGet("https://raw.githubusercontent.com/jonathabejose-alt/Moveset-Hub/refs/heads/main/remote%20buffer%20string%20v2.lua"))()
repeat task.wait() until game.Lighting:FindFirstChild("BUFFERSTRINGS")
for _, val in ipairs(game.Lighting:FindFirstChild("BUFFERSTRINGS"):GetChildren()) do
    buffers[val.Name] = val.Value
end
game.Lighting:FindFirstChild("BUFFERSTRINGS"):Destroy()

--]]

local remote = game.ReplicatedStorage:WaitForChild("ByteNetReliable")
local Players = game.Players
local player = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local buffers = {}
local info = game.ReplicatedStorage.BytenetStorage.Networking.Value
local baseNum = info:match('"bytenet_use"%s*:%s*(%d+)')
local grabballNum = info:match('"bytenet_findBall"%s*:%s*(%d+)')
local tackleNum = info:match('"bytenet_tackle"%s*:%s*(%d+)')
local dribbleNum = info:match('"bytenet_dribble"%s*:%s*(%d+)')
local skill1Num = info:match('"bytenet_skill1"%s*:%s*(%d+)')
local skill2Num = info:match('"bytenet_skill2"%s*:%s*(%d+)')
local skill3Num = info:match('"bytenet_skill3"%s*:%s*(%d+)')
local skill4Num = info:match('"bytenet_skill4"%s*:%s*(%d+)')
local skill5Num = info:match('"bytenet_skill5"%s*:%s*(%d+)')
local kickNum = info:match('"bytenet_kick"%s*:%s*(%d+)')

local isMobile = UserInputService.TouchEnabled

local function createBuffer(remoteId, singleByte)
    if not remoteId then return nil end
    local id = tonumber(remoteId)
    if isMobile then
        if singleByte then
            return string.pack(">I2", id)
        else
            return string.pack(">I2", id) .. string.char(1)
        end
    else
        if singleByte then
            return string.char(id)
        else
            return string.char(id) .. string.char(1)
        end
    end
end

if baseNum then buffers.base = createBuffer(baseNum, false) end
if grabballNum then buffers.grabball = createBuffer(grabballNum, true) end
if tackleNum then buffers.tackle = createBuffer(tackleNum, true) end
if dribbleNum then buffers.dribble = createBuffer(dribbleNum, true) end
if skill1Num then buffers.skill1 = createBuffer(skill1Num, true) end
if skill2Num then buffers.skill2 = createBuffer(skill2Num, true) end
if skill3Num then buffers.skill3 = createBuffer(skill3Num, true) end
if skill4Num then buffers.skill4 = createBuffer(skill4Num, true) end
if skill5Num then buffers.skill5 = createBuffer(skill5Num, true) end
if kickNum then buffers.kick = createBuffer(kickNum, true) end

local hotbar = player.PlayerGui:WaitForChild("Hotbar")
local buttons = hotbar.Backpack.Hotbar
local skillTemplate = buttons:FindFirstChild("skill1") and buttons.skill1:Clone()

local grabConnection = nil
local function grabBall(config)
    local conf = config or {}
    if grabConnection then grabConnection:Disconnect(); grabConnection = nil; return end
    local char = player.Character
    if not char or char:FindFirstChild("Ball") then return end
    local root = char:WaitForChild("HumanoidRootPart")
    local targetPart = workspace.Terrain:FindFirstChild("Ball")
    if not targetPart then return end
    local savedRotation = root.CFrame - root.Position
    local function doGrab()
        local c = player.Character
        if not c or c:FindFirstChild("Ball") then if grabConnection then grabConnection:Disconnect(); grabConnection = nil end; return end
        local r = c:FindFirstChild("HumanoidRootPart")
        local ball = workspace.Terrain:FindFirstChild("Ball")
        if not r or not ball then return end
        local pos = ball.Position
        local correctedPos = Vector3.new(pos.X, pos.Y - 3, pos.Z)
        r.CFrame = CFrame.new(correctedPos) * savedRotation
        for _ = 1, (conf.maxAttempts or 3) do remote:FireServer(buffers.grabball) end
    end
    doGrab()
    if conf.loop then grabConnection = RunService.Heartbeat:Connect(doGrab) end
end

local function stopGrab()
    if grabConnection then grabConnection:Disconnect(); grabConnection = nil end
end

local function setStun(duration, disableRotate)
    local char = player.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if disableRotate then char:SetAttribute("disableRotate", true) end
    if hum then hum.WalkSpeed = 0; hum.JumpPower = 0; hum.PlatformStand = true end
    if root then root.Anchored = true end
    local startTime = tick()
    while tick() - startTime < (duration or 0.5) do
        if not char or not char.Parent then break end
        if char.state then char.state.stun.Value = true end
        task.wait(0.03)
    end
    if char then
        if char.state then char.state.stun.Value = false end
        if disableRotate then char:SetAttribute("disableRotate", false) end
        if hum then hum.WalkSpeed = 16; hum.JumpPower = 50; hum.PlatformStand = false end
        if root then root.Anchored = false end
    end
end

local function passBall(config)
    local conf = config or {}
    local char = player.Character
    if not char or not char:FindFirstChild("Ball") then return end
    local root = char.HumanoidRootPart
    local closestTeammate, shortestDistance = nil, conf.maxDistance or 180
    for _, p in ipairs(Players:GetPlayers()) do
        if p == player then continue end
        if not p.Character then continue end
        if p.Team ~= player.Team then continue end
        if p.Team == game.Teams.lobby then continue end
        local targetRoot = p.Character:FindFirstChild("HumanoidRootPart")
        if not targetRoot then continue end
        local dist = (root.Position - targetRoot.Position).Magnitude
        if dist < shortestDistance then
            shortestDistance = dist
            closestTeammate = p
        end
    end
    local direction, power = nil, conf.power or 50
    if closestTeammate and closestTeammate.Character then
        local targetRoot = closestTeammate.Character.HumanoidRootPart
        direction = (targetRoot.Position - root.Position).Unit
        power = math.clamp((targetRoot.Position - root.Position).Magnitude / 1.4, 18, 95)
    else
        direction = conf.direction or root.CFrame.LookVector
    end
    remote:FireServer(buffers.base, {{"kick", power, true, direction}})
end

local function kickBall(config)
    local conf = config or {}
    local power = conf.power or 100
    local direction = conf.direction
    local curve = conf.curve
    if not direction then
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            direction = char.HumanoidRootPart.CFrame.LookVector * power
        else
            direction = Vector3.new(0, 0, -power)
        end
    end
    if curve == "Left" then
        direction = (CFrame.new(Vector3.zero, direction) * CFrame.Angles(0, math.rad(25), 0)).LookVector
    elseif curve == "Right" then
        direction = (CFrame.new(Vector3.zero, direction) * CFrame.Angles(0, math.rad(-25), 0)).LookVector
    end
    remote:FireServer(buffers.base, {{"kick", power, false, direction}})
end

local function useSkill(skillNumber, target)
    local args = {{"skill" .. skillNumber}}
    if target then args[1][2] = target end
    remote:FireServer(buffers.base, args)
end

local function useDribble()
    remote:FireServer(buffers.base, {{"dribble", false}})
end

local function useTackle()
    remote:FireServer(buffers.base, {{"tackle"}})
end

local registeredSkills = {}
local function refreshSkillPositions()
    local sorted = {}
    for slot, skill in pairs(registeredSkills) do
        if skill and skill.Parent then
            table.insert(sorted, {slot = slot, skill = skill})
        end
    end
    table.sort(sorted, function(a, b) return a.slot < b.slot end)
    local skillSize = 50
    local gap = 4
    local totalW = (#sorted * skillSize) + ((#sorted - 1) * gap)
    local startX = -(totalW / 2)
    for i, entry in ipairs(sorted) do
        local xOffset = startX + (i - 1) * (skillSize + gap)
        entry.skill.Position = UDim2.new(0.5, xOffset, 0, 0)
        entry.skill.Size = UDim2.new(0, skillSize, 0, skillSize)
    end
end

local function setSkillName(slot, name, reuse)
    local skill = buttons:FindFirstChild("skill"..slot)
    if skill then
        skill.Base.ToolName.Text = name or ""
        if reuse then
            skill.Base.Reuse.Text = reuse
            skill.Base.Reuse.Visible = true
        end
        registeredSkills[slot] = skill
        refreshSkillPositions()
    end
end

local function createSkill(slot, name, reuse)
    if registeredSkills[slot] then
        registeredSkills[slot]:Destroy()
        registeredSkills[slot] = nil
    end
    if not skillTemplate then return nil end
    local skill = skillTemplate:Clone()
    skill.Name = "skill"..slot
    skill.Base.Number.Text = tostring(slot)
    skill.Base.ToolName.Text = name or ""
    skill.Base.Reuse.Text = reuse or "Special"
    skill.Base.Reuse.Visible = true
    local oldCd = skill:FindFirstChild("Cooldown")
    if oldCd then oldCd:Destroy() end
    skill.Parent = buttons
    registeredSkills[slot] = skill
    refreshSkillPositions()
    return skill
end

local cooldowns = {}
local function showCooldown(slot, duration)
    if cooldowns[slot] then return end
    cooldowns[slot] = true
    local skill = registeredSkills[slot] or buttons:FindFirstChild("skill"..slot)
    if not skill then
        skill = hotbar.Backpack.Hotbar:FindFirstChild("Tspecialer") or hotbar.Backpack.Hotbar:FindFirstChild("TspecialerX")
    end
    if not skill then
        cooldowns[slot] = false
        return
    end
    if not skill:FindFirstChild("Cooldown") then
        local cd = Instance.new("Frame")
        cd.Name = "Cooldown"
        cd.Size = UDim2.new(1, 0, 1, 0)
        cd.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        cd.BackgroundTransparency = 0.5
        cd.Visible = false
        cd.ZIndex = 10
        cd.Parent = skill
    end
    local cd = skill.Cooldown
    cd.Visible = true
    cd.Size = UDim2.new(1, 0, 1, 0)
    cd.ZIndex = 10
    TweenService:Create(cd, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = UDim2.new(1, 0, 0, 0)}):Play()
    task.delay(duration, function()
        cd.Visible = false
        cooldowns[slot] = false
    end)
end

local function isOnCooldown(slot)
    return cooldowns[slot] == true
end

local function setupTSpecial(config)
    local conf = config or {}
    local name = conf.name or "Special"
    local callback = conf.callback
    local size = 50
    local position = conf.position or "bottom"
    local tBtn = hotbar.Backpack.Hotbar:FindFirstChild("Tspecialer") or hotbar.Backpack.Hotbar:FindFirstChild("TspecialerX")
    if not tBtn then
        local template = buttons.skill1
        if not template then return end
        tBtn = template:Clone()
        tBtn.Name = "Tspecialer"
        tBtn.Parent = hotbar.Backpack.Hotbar
    end
    tBtn.Size = UDim2.new(0, size, 0, size)
    if position == "left" then
        tBtn.Position = UDim2.new(0, -(50 + 8), 0.5, -25)
    elseif position == "right" then
        tBtn.Position = UDim2.new(1, 8, 0.5, -25)
    elseif position == "top" then
        tBtn.Position = UDim2.new(0.5, -25, 0, -(50 + 8))
    elseif position == "bottom" then
        tBtn.Position = UDim2.new(0.5, -25, 1, 8)
    elseif typeof(position) == "UDim2" then
        tBtn.Position = position
    end
    tBtn.Base.ToolName.Text = name
    tBtn.Base.Reuse.Text = "Special"
    tBtn.Base.Reuse.Visible = true
    if callback then
        tBtn.Base.MouseButton1Down:Connect(callback)
        if isMobile then
            tBtn.Base.TouchTap:Connect(callback)
        end
    end
end

local function setAwakening(config)
    local conf = config or {}
    if conf.bottomText then
        hotbar.MagicHealth.Awakening.Text = conf.bottomText
    end
    if conf.subText then
        hotbar.MagicHealth.TextLabel.Visible = true
        hotbar.MagicHealth.TextLabel.Text = conf.subText
    end
    if conf.color1 and conf.color2 then
        hotbar.MagicHealth.Health.Frame.UIGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, conf.color1),
            ColorSequenceKeypoint.new(1, conf.color2)
        })
    end
    if conf.icon then
        hotbar.MagicHealth.Icon.Image = conf.icon
    end
    if conf.visible ~= nil then
        hotbar.MagicHealth.Visible = conf.visible
    end
end

local function changeStyle(style)
    player:SetAttribute("style", style)
end

local blockActive = false
local blockedButtons = {}
local function blockOriginalSkills()
    if blockActive then return end
    blockActive = true
    local backpack = hotbar:FindFirstChild("Backpack")
    if not backpack then return end
    local hotbarFrame = backpack:FindFirstChild("Hotbar")
    if not hotbarFrame then return end
    for i = 1, 5 do
        local btn = hotbarFrame:FindFirstChild("skill" .. i)
        if btn then
            if btn._original then
                btn._original:Disconnect()
                btn._original = nil
            end
            local overlay = Instance.new("TextButton")
            overlay.Size = UDim2.new(1, 0, 1, 0)
            overlay.BackgroundTransparency = 1
            overlay.Text = ""
            overlay.Active = true
            overlay.Selectable = true
            overlay.Parent = btn
            overlay.MouseButton1Down:Connect(function() end)
            if isMobile then
                overlay.TouchTap:Connect(function() end)
            end
            blockedButtons[btn] = overlay
        end
    end
    local tBtn = hotbarFrame:FindFirstChild("Tspecialer")
    if tBtn then
        if tBtn._original then
            tBtn._original:Disconnect()
            tBtn._original = nil
        end
        local overlay = Instance.new("TextButton")
        overlay.Size = UDim2.new(1, 0, 1, 0)
        overlay.BackgroundTransparency = 1
        overlay.Text = ""
        overlay.Active = true
        overlay.Selectable = true
        overlay.Parent = tBtn
        overlay.MouseButton1Down:Connect(function() end)
        if isMobile then
            overlay.TouchTap:Connect(function() end)
        end
        blockedButtons[tBtn] = overlay
    end
    local originalFire = remote.FireServer
    remote.FireServer = function(self, ...)
        local args = {...}
        local isMoveSetPacket = false
        if args[1] == buffers.base and type(args[2]) == "table" then
            local action = args[2][1] and args[2][1][1]
            if action == "skill1" or action == "skill2" or action == "skill3" or 
               action == "skill4" or action == "skill5" or action == "tackle" or 
               action == "kick" or action == "dribble" then
                isMoveSetPacket = true
            end
        end
        if not isMoveSetPacket then
            return
        end
        return originalFire(self, unpack(args))
    end
    remote._original = originalFire
end

local function restoreOriginalSkills()
    blockActive = false
    for btn, overlay in pairs(blockedButtons) do
        if overlay and overlay.Parent then
            overlay:Destroy()
        end
    end
    blockedButtons = {}
    if remote._original then
        remote.FireServer = remote._original
        remote._original = nil
    end
end

local inputConnections = {}
local function setupMobileInputs(skillCallbacks)
    local backHotbar = hotbar:FindFirstChild("Backpack")
    if not backHotbar then return end
    local hotbarFrame = backHotbar:FindFirstChild("Hotbar")
    if not hotbarFrame then return end
    
    for i = 1, 5 do
        local btn = hotbarFrame:FindFirstChild("skill" .. i)
        if btn and skillCallbacks[i] then
            local conn1 = btn.Base.MouseButton1Down:Connect(skillCallbacks[i])
            local conn2 = btn.Base.TouchTap:Connect(skillCallbacks[i])
            table.insert(inputConnections, conn1)
            table.insert(inputConnections, conn2)
        end
    end
    
    local tBtn = hotbarFrame:FindFirstChild("Tspecialer") or hotbarFrame:FindFirstChild("TspecialerX")
    if tBtn and skillCallbacks.tspecial then
        local conn1 = tBtn.Base.MouseButton1Down:Connect(skillCallbacks.tspecial)
        local conn2 = tBtn.Base.TouchTap:Connect(skillCallbacks.tspecial)
        table.insert(inputConnections, conn1)
        table.insert(inputConnections, conn2)
    end
end

local function clearMobileInputs()
    for _, conn in ipairs(inputConnections) do
        conn:Disconnect()
    end
    inputConnections = {}
end

local function setupPCInputs(skillCallbacks)
    local conn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Enum.KeyCode.One and skillCallbacks[1] then skillCallbacks[1]()
        elseif input.KeyCode == Enum.KeyCode.Two and skillCallbacks[2] then skillCallbacks[2]()
        elseif input.KeyCode == Enum.KeyCode.Three and skillCallbacks[3] then skillCallbacks[3]()
        elseif input.KeyCode == Enum.KeyCode.Four and skillCallbacks[4] then skillCallbacks[4]()
        elseif input.KeyCode == Enum.KeyCode.Five and skillCallbacks[5] then skillCallbacks[5]()
        elseif input.KeyCode == Enum.KeyCode.T and skillCallbacks.tspecial then skillCallbacks.tspecial()
        elseif input.KeyCode == Enum.KeyCode.G and skillCallbacks.flow then skillCallbacks.flow()
        end
    end)
    table.insert(inputConnections, conn)
end

return {
    grabBall = grabBall,
    stopGrab = stopGrab,
    setStun = setStun,
    passBall = passBall,
    kickBall = kickBall,
    useSkill = useSkill,
    useDribble = useDribble,
    useTackle = useTackle,
    setSkillName = setSkillName,
    createSkill = createSkill,
    showCooldown = showCooldown,
    isOnCooldown = isOnCooldown,
    setupTSpecial = setupTSpecial,
    setAwakening = setAwakening,
    changeStyle = changeStyle,
    blockOriginalSkills = blockOriginalSkills,
    restoreOriginalSkills = restoreOriginalSkills,
    setupMobileInputs = setupMobileInputs,
    setupPCInputs = setupPCInputs,
    clearMobileInputs = clearMobileInputs,
    buffers = buffers,
}


print([[

       ____  ________  _______  ____________   ____  __  ________________________     _______________  _____   ________   _    __   ___ 
      / __ \/ ____/  |/  / __ \/_  __/ ____/  / __ )/ / / / ____/ ____/ ____/ __ \   / ___/_  __/ __ \/  _/ | / / ____/  | |  / /  |__ \
     / /_/ / __/ / /|_/ / / / / / / / __/    / __  / / / / /_  / /_  / __/ / /_/ /   \__ \ / / / /_/ // //  |/ / / __    | | / /   __/ /
    / _, _/ /___/ /  / / /_/ / / / / /___   / /_/ / /_/ / __/ / __/ / /___/ _, _/   ___/ // / / _, _// // /|  / /_/ /    | |/ /   / __/ 
   /_/ |_/_____/_/  /_/\____/ /_/ /_____/  /_____/\____/_/   /_/   /_____/_/ |_|  /____//_/ /_/ |_/___/_/ |_/\____/      |___/   /____/ 
                                                                                                                                     
   REMOTE BUFFER V2
   Author: tze | Original by: daffy
   Pastebin: https://pastebin.com/8XJh7dzh original buffer
   Compatible with PC and Mobile Devices
   
]])
