local plr = game.Players.LocalPlayer
local cam = game.Workspace.CurrentCamera
local rep = game:GetService("ReplicatedStorage")
local remote = rep:WaitForChild("ByteNetReliable")
local messiFolder = rep.Resources.messi
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Debris = game:GetService("Debris")
local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local ContextActionService = game:GetService("ContextActionService") -- Para móvil
local VirtualInputManager = game:GetService("VirtualInputManager") -- Para bloquear teclas

local messiVFX = require(rep.client.replication.otherReplication.messiVFX)
local mainreplication = require(rep.client.replication.mainreplication)
local soundUtil = require(rep.util.soundUtil)

local anims = messiFolder.Animations
local sounds = messiFolder.Sounds

local stopped = false
local flowOnCD = false
local buffers = {}

loadstring(game:HttpGet("https://pastebin.com/raw/8XJh7dzh"))()
repeat task.wait() until game.Lighting:FindFirstChild("BUFFERSTRINGS")
for _, val in ipairs(game.Lighting:FindFirstChild("BUFFERSTRINGS"):GetChildren()) do
    buffers[val.Name] = val.Value
end
game.Lighting:FindFirstChild("BUFFERSTRINGS"):Destroy()

local blockedSounds = {
    "rbxassetid://133946857483198",
    "rbxassetid://110043103592232",
    "rbxassetid://89551484323719",
    "rbxassetid://93479045121219",
    "rbxassetid://81199411973051",
    "rbxassetid://115699700590432",
    "rbxassetid://134456641764445",
}
SoundService.DescendantAdded:Connect(function(sound)
    if sound:IsA("Sound") then
        for _, id in pairs(blockedSounds) do
            if sound.SoundId == id then
                sound:Stop()
                sound:Destroy()
            end
        end
    end
end)

pcall(function()
    local sv = Instance.new("StringValue")
    sv.Name = "Messi"
    sv.Value = "Messi"
    sv.Parent = plr:WaitForChild("storage"):WaitForChild("styles")
end)

-- ========== BLOQUEAR SKILLS ORIGINALES ==========
local blockedRemotes = {
    "skill1", "skill2", "skill3", "skill4", "skill5", "skill6",
    "dribble", "tackle", "kick", "pass"
}

-- Metodo 1: Bloquear el remote original
local originalFireServer = remote.FireServer
remote.FireServer = function(self, ...)
    local args = {...}
    local bufferData = args[1]
    
    -- Si es buffer, convertir a string para verificar
    local str = type(bufferData) == "buffer" and buffer.tostring(bufferData) or tostring(bufferData)
    
    -- Bloquear skills originales
    for _, blocked in pairs(blockedRemotes) do
        if str:lower():find(blocked) then
            return -- No enviar el remote
        end
    end
    
    -- Si no esta bloqueado, enviar normalmente
    return originalFireServer(self, ...)
end

-- Metodo 2: Bloquear teclas fisicas (PC)
local blockedKeys = {
    [Enum.KeyCode.One] = true,
    [Enum.KeyCode.Two] = true,
    [Enum.KeyCode.Three] = true,
    [Enum.KeyCode.Four] = true,
    [Enum.KeyCode.Five] = true,
    [Enum.KeyCode.Q] = true,
    [Enum.KeyCode.E] = true,
    [Enum.KeyCode.R] = true,
    [Enum.KeyCode.F] = true,
    [Enum.KeyCode.G] = true,
}

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if stopped then return end
    if blockedKeys[input.KeyCode] then
        -- Bloquear la tecla para que el juego no la detecte
        gameProcessed = true
        return
    end
end)

-- Metodo 3: Bloquear botones táctiles (Móvil)
local function blockMobileButtons()
    local hotbar = plr.PlayerGui:FindFirstChild("Hotbar")
    if not hotbar then return end
    
    local buttons = hotbar.Backpack.Hotbar
    for i = 1, 5 do
        local btn = buttons:FindFirstChild("skill" .. i)
        if btn and btn:FindFirstChild("Base") then
            -- Desconectar conexiones existentes
            if btn._connection then btn._connection:Disconnect() end
            -- Bloquear el click original
            btn._connection = btn.Base.MouseButton1Down:Connect(function()
                -- No hacer nada, bloquear la skill original
                return
            end)
        end
    end
    
    -- Bloquear T special
    local tBtn = buttons:FindFirstChild("Tspecialer")
    if tBtn and tBtn:FindFirstChild("Base") then
        if tBtn._connection then tBtn._connection:Disconnect() end
        tBtn._connection = tBtn.Base.MouseButton1Down:Connect(function()
            return
        end)
    end
end

-- ========== FUNCIONES AUXILIARES ==========
local function HasBall()
    return plr.Character and plr.Character:FindFirstChild("Ball")
end

local function Stunned()
    return plr.Character and plr.Character.state.stun.Value
end

local function CancelMove()
    local char = plr.Character
    if char and not char.state.stun.Value then
        char.state.stun.Value = true
        task.wait(0.04)
        char.state.stun.Value = false
    end
end

local function IsOnCD(name)
    local hotbar = plr.PlayerGui:FindFirstChild("Hotbar")
    if not hotbar then return false end
    local btn = hotbar.Backpack.Hotbar:FindFirstChild(name)
    if btn and btn:FindFirstChild("Cooldown") then return btn.Cooldown.Visible end
    return false
end

local function DoCD(name, duration)
    local hotbar = plr.PlayerGui:FindFirstChild("Hotbar")
    if not hotbar then return end
    local btn = hotbar.Backpack.Hotbar:FindFirstChild(name)
    if btn and btn:FindFirstChild("Cooldown") then
        btn.Cooldown.Visible = true
        btn.Cooldown.Size = UDim2.new(1, 0, -1, 0)
        TweenService:Create(btn.Cooldown, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = UDim2.new(1, 0, 0, 0)}):Play()
        task.delay(duration, function() btn.Cooldown.Visible = false end)
    end
end

local function PlaySFX(sound, parent)
    if not sound then return end
    pcall(function() soundUtil:play(sound, parent) end)
end

-- ========== SKILLS DEL MOVESET ==========
local function Dribble()
    if stopped then return end
    local char = plr.Character
    if not char or Stunned() or not HasBall() or IsOnCD("skill1") then return end
    CancelMove()
    DoCD("skill1", 3)
    local humanoid = char.Humanoid
    local root = char.HumanoidRootPart
    humanoid:LoadAnimation(anims.Dribble):Play()
    PlaySFX(sounds.Superstar, root)
    pcall(function() messiVFX.messiDribbleVFX(char, true) end)
end

local function TrapShot()
    if stopped then return end
    local char = plr.Character
    if not char or Stunned() or not HasBall() or IsOnCD("skill2") then return end
    CancelMove()
    DoCD("skill2", 20)
    local humanoid = char.Humanoid
    local root = char.HumanoidRootPart
    PlaySFX(sounds.TrapShot, root)
    pcall(function() messiVFX.messiShootVFX(char) end)
    humanoid:LoadAnimation(anims.InterceptShot):Play()
    task.delay(0.1, function() pcall(function() messiVFX.messiInterceptShot(char) end) end)
    task.delay(2.3, function() 
        remote:FireServer(buffer.fromstring(buffers["base"]), {{"skill3"}}) 
    end)
end

local function Riptide()
    if stopped then return end
    local char = plr.Character
    if not char or Stunned() or not HasBall() or IsOnCD("skill3") then return end
    CancelMove()
    DoCD("skill3", 20)
    local humanoid = char.Humanoid
    local root = char.HumanoidRootPart
    PlaySFX(sounds.Riptide, root)
    pcall(function() messiVFX.messiShootVFX(char) end)
    humanoid:LoadAnimation(anims.Riptide):Play()
    task.delay(0.8, function() remote:FireServer(buffer.fromstring(buffers["base"]), {{"skill3"}}) end)
end

local function Intercept()
    if stopped then return end
    local char = plr.Character
    if not char or IsOnCD("skill4") or Stunned() then return end
    if HasBall() then return end
    
    local ball = workspace.Terrain:FindFirstChild("Ball")
    if not ball then return end
    
    local humanoid = char.Humanoid
    local root = char.HumanoidRootPart
    
    local dist = (root.Position - ball.Position).Magnitude
    if dist > 300 then return end
    
    CancelMove()
    DoCD("skill4", 3)
    
    humanoid:LoadAnimation(anims.InterceptStart):Play()
    pcall(function() 
        local s = Instance.new("Sound")
        s.SoundId = "rbxassetid://89339537870505"
        s.Volume = 1
        s.Parent = root
        s:Play()
        Debris:AddItem(s, 3)
    end)
    pcall(function() messiVFX.messiInterceptStart(char) end)
    
    humanoid.HipHeight = 10
    task.wait(0.3)
    
    for _ = 1, 9 do
        remote:FireServer(buffer.fromstring(buffers["grabball"]))
        task.wait(0.05)
        if HasBall() then break end
    end
    
    TweenService:Create(humanoid, TweenInfo.new(0.4, Enum.EasingStyle.Cubic), {HipHeight = 0}):Play()
    
    if HasBall() then
        root.Anchored = true
        root.AssemblyLinearVelocity = Vector3.zero
        humanoid.AutoRotate = false
        
        for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do track:Stop(0) end
        humanoid:LoadAnimation(anims.Intercept):Play()
        PlaySFX(sounds.TrapCutscene, root)
        pcall(function() messiVFX.messiInterceptCutscene(char) end)
        
        task.wait(1)
        
        root.Anchored = false
        root.AssemblyLinearVelocity = Vector3.new(0, -100, 0)
        humanoid.AutoRotate = true
    else
        char.state.stun.Value = true
        task.delay(0.5, function() char.state.stun.Value = false end)
    end
end

local function NutmegSteal()
    if stopped then return end
    local char = plr.Character
    if not char or Stunned() or IsOnCD("skill5") then return end
    if HasBall() then return end
    
    CancelMove()
    DoCD("skill5", 5)
    
    local humanoid = char.Humanoid
    local root = char.HumanoidRootPart
    
    humanoid:LoadAnimation(anims.NutmegStart):Play()
    PlaySFX(sounds.NutmegUse, root)
    
    task.wait(0.5)
    remote:FireServer(buffer.fromstring(buffers["base"]), {{"tackle"}})
    task.wait(0.3)
    
    if HasBall() then
        for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do track:Stop(0) end
        humanoid:LoadAnimation(anims.NutmegHitUser):Play()
        PlaySFX(sounds.NutmegHit, root)
        pcall(function() messiVFX.messiNutmeg(char) end)
        
        local bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(math.huge, 0, math.huge)
        bv.Velocity = root.CFrame.LookVector * 150
        bv.Parent = root
        Debris:AddItem(bv, 0.5)
    else
        char.state.stun.Value = true
        task.delay(0.5, function() char.state.stun.Value = false end)
    end
end

local function MessiFlow()
    if stopped then return end
    local char = plr.Character
    if not char or Stunned() then return end
    if not HasBall() then return end
    if flowOnCD then return end
    
    flowOnCD = true
    
    task.wait(0.5)
     
    pcall(function()
        if sounds.Themes and sounds.Themes:FindFirstChild("Normal") then
            soundUtil:play(sounds.Themes.Normal, SoundService)
        end
    end)
    
    pcall(function() messiVFX.messiFlow(char) end)
    
    if anims:FindFirstChild("Flow") then
        for _, track in pairs(char.Humanoid:GetPlayingAnimationTracks()) do track:Stop(0) end
        char.Humanoid:LoadAnimation(anims.Flow):Play()
    end
    
    task.delay(60, function() flowOnCD = false end)
end

local function SuperPass()
    if stopped then return end
    local char = plr.Character
    if not char or Stunned() or not HasBall() then return end
    
    local root = char.HumanoidRootPart
    local humanoid = char.Humanoid
    
    local closestTeammate = nil
    local shortestDistance = 180
    
    for _, p in ipairs(Players:GetPlayers()) do
        if p == plr then continue end
        if not p.Character then continue end
        if p.Team ~= plr.Team then continue end
        if p.Team == game.Teams.lobby then continue end
        local targetRoot = p.Character:FindFirstChild("HumanoidRootPart")
        if not targetRoot then continue end
        local dist = (root.Position - targetRoot.Position).Magnitude
        if dist < shortestDistance then
            shortestDistance = dist
            closestTeammate = p
        end
    end
    
    if not closestTeammate then return end
    
    local targetRoot = closestTeammate.Character.HumanoidRootPart
    local distance = shortestDistance
    
    for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do track:Stop(0) end
    humanoid:LoadAnimation(anims.SuperPass):Play()
    
    pcall(function() messiVFX.messiPassVFX(char) end)
    
    if sounds:FindFirstChild("Perfect Pass") then
        local s = sounds["Perfect Pass"]:Clone()
        s.Parent = root
        s:Play()
        Debris:AddItem(s, 3)
    end
    
    local passDelay = 0.3
    task.wait(passDelay)
    
    local direction = (targetRoot.Position - root.Position).Unit
    local kickDir = Vector3.new(direction.X, 0.18, direction.Z).Unit
    local power = math.clamp(distance / 1.4, 18, 95)
    
    remote:FireServer(
        buffer.fromstring(buffers["base"]),
        { {"kick", power, true, vector.create(kickDir.X, kickDir.Y, kickDir.Z)} }
    )
end

-- ========== CONFIGURAR BOTONES (PC Y MOVIL) ==========
local function SetupButtons()
    local hotbar = plr.PlayerGui:WaitForChild("Hotbar")
    local buttons = hotbar.Backpack.Hotbar
    
    -- Remover conexiones antiguas
    for i = 1, 5 do
        local btn = buttons["skill"..i]
        if btn and btn._connection then
            btn._connection:Disconnect()
        end
        if btn and btn.Base then
            btn._connection = btn.Base.MouseButton1Down:Connect(function()
                if i == 1 then Dribble()
                elseif i == 2 then TrapShot()
                elseif i == 3 then Riptide()
                elseif i == 4 then Intercept()
                elseif i == 5 then NutmegSteal()
                end
            end)
        end
        
        -- Cambiar nombres
        if btn and btn.Base and btn.Base.ToolName then
            local names = {"Superstar", "Heads Up", "Riptide", "Heads Up", "Forced Nutmeg"}
            btn.Base.ToolName.Text = names[i]
            
            local reuseTexts = {"Ball", "Shot", "Shot", "Off-ball", "Steal"}
            btn.Base.Reuse.Text = reuseTexts[i]
            btn.Base.Reuse.Visible = true
        end
    end
    
    -- Boton T special (Super Pass)
    local tBtn = buttons:FindFirstChild("Tspecialer")
    if tBtn then
        if tBtn._connection then tBtn._connection:Disconnect() end
        if tBtn:FindFirstChild("Base") then
            tBtn._connection = tBtn.MouseButton1Click:Connect(SuperPass)
            if tBtn.Base.ToolName then tBtn.Base.ToolName.Text = "Super Pass" end
            if tBtn.Base.Reuse then 
                tBtn.Base.Reuse.Text = "Pass"
                tBtn.Base.Reuse.Visible = true
            end
        end
    end
    
    -- Configurar UI de Flow
    local magicHealth = hotbar:FindFirstChild("MagicHealth")
    if magicHealth then
        if magicHealth:FindFirstChild("Awakening") then
            magicHealth.Awakening.Text = "Argentina's Best"
        end
        if magicHealth:FindFirstChild("Health") and magicHealth.Health:FindFirstChild("Frame") then
            local gradient = magicHealth.Health.Frame:FindFirstChild("UIGradient")
            if gradient then
                gradient.Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 157, 255)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 157, 255))
                }
            end
        end
    end
end

-- ========== REGISTRAR TOUCH PARA MOVIL ==========
local function SetupMobileTouch()
    -- Registrar acciones táctiles con ContextActionService
    ContextActionService:BindAction("Messi_Dribble", function(actionName, userInputState, inputObject)
        if userInputState == Enum.UserInputState.Begin then
            Dribble()
        end
        return Enum.ContextActionResult.Sink
    end, false, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL1)
    
    -- Nota: Los botones táctiles ya están manejados por los MouseButton1Down
end

-- ========== FLOW DETECTION ==========
local function SetupFlow(char)
    char:GetAttributeChangedSignal("FlowActive"):Connect(function()
        if char:GetAttribute("FlowActive") == true and not stopped then
            char:SetAttribute("FlowActive", false)
            MessiFlow()
        end
    end)
end

-- ========== INICIALIZACION ==========
local function SetupCharacter(char)
    if stopped then return end
    repeat task.wait() until plr.Team ~= game.Teams.lobby
    task.wait(0.1)
    
    plr:SetAttribute("style", "messi")
    
    SetupButtons()
    SetupMobileTouch()
    SetupFlow(char)
end

-- Conectar eventos
SetupCharacter(plr.Character)
plr.CharacterAdded:Connect(function(char)
    flowOnCD = false
    task.wait(1)
    SetupCharacter(char)
end)

-- Bloquear botones móviles cuando cambia la GUI
plr.PlayerGui:WaitForChild("Hotbar").DescendantAdded:Connect(function(desc)
    if desc.Name == "Hotbar" or desc.Name:match("skill%d") or desc.Name == "Tspecialer" then
        task.wait(0.1)
        SetupButtons()
    end
end)

-- ========== INPUTS TECLADO (PC) ==========
UserInputService.InputBegan:Connect(function(input, bg)
    if bg or stopped then return end
    if input.KeyCode == Enum.KeyCode.One then Dribble()
    elseif input.KeyCode == Enum.KeyCode.Two then TrapShot()
    elseif input.KeyCode == Enum.KeyCode.Three then Riptide()
    elseif input.KeyCode == Enum.KeyCode.Four then Intercept()
    elseif input.KeyCode == Enum.KeyCode.Five then NutmegSteal()
    elseif input.KeyCode == Enum.KeyCode.T then SuperPass()
    elseif input.KeyCode == Enum.KeyCode.G then MessiFlow()
    elseif input.KeyCode == Enum.KeyCode.F4 then 
        stopped = true
        print("Moveset stopped")
        -- Restaurar remote original
        remote.FireServer = originalFireServer
    end
end)

-- ========== BLOQUEAR HABILIDADES ORIGINALES CADA CIERTO TIEMPO ==========
task.spawn(function()
    while not stopped do
        task.wait(2)
        -- Re-aplicar bloqueo de remotes
        remote.FireServer = function(self, ...)
            local args = {...}
            local str = tostring(args[1])
            for _, blocked in pairs(blockedRemotes) do
                if str:lower():find(blocked) then
                    return
                end
            end
            return originalFireServer(self, ...)
        end
    end
end)

-- ========== NOTIFICACIONES ==========
game.StarterGui:SetCore("SendNotification", {
    Title = "Moveset",
    Text = "Messi Moveset loaded!",
    Duration = 5,
    Button1 = "Ok",
})

task.wait(0.5)

game.StarterGui:SetCore("SendNotification", {
    Title = "Made By",
    Text = "tze",
    Duration = 5,
    Button1 = "Ok",
})

task.wait(0.5)

game.StarterGui:SetCore("SendNotification", {
    Title = "Version script:",
    Text = "v2 (PC + Mobile)",
    Duration = 5,
    Button1 = "Ok",
})

print("Messi Moveset loaded! PC + Mobile compatible")
