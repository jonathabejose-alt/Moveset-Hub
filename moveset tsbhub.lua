if game.PlaceId ~= 10449761463 and game.PlaceId ~= 130818724007978 then
    local Players = game:GetService("Players")
    Players.LocalPlayer:Kick("Wrong Game - TSB Only")
    return
end

local success, rayfield = pcall(function()
    return loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
end)

if not success then return end

local config = {
    Name = "Movesets | Not My Movesets",
    LoadingTitle = "Loading Movesets...",
    LoadingSubtitle = "GUI By Mark22028_Official",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "MovesetLoader",
        FileName = "Movesets",
    },
    KeySystem = false
}

local Window = rayfield:CreateWindow(config)
if not Window then return end

local MovesetsTab = Window:CreateTab("Movesets", 4483362458)
local OthersTab = Window:CreateTab("Others", 4483362458)

-- ═══════════════ ALL MOVESETS DATABASE ═══════════════
local Movesets = {
    {"Trashcan Man (Any)", "https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Trashcan%20Man"},
    {"Naruto (Saitama)", "https://raw.githubusercontent.com/LolnotaKid/NarutoBeatUpSasukeAss/refs/heads/main/NarutoCums"},
    {"Choi Jong (Saitama)", "https://raw.githubusercontent.com/nil071n/fireman/refs/heads/main/TSB"},
    {"Deku (Martial Artist)", "https://github.com/aggiealledge/obfuscated-scripts/raw/refs/heads/main/deku%20suiryu%20thingy.txt"},
    {"Luffy (Saitama)", "https://github.com/aggiealledge/obfuscated-scripts/raw/refs/heads/main/Protected_7732857839120517.txt"},
    {"Angel V1.0 (Hero Hunter)", "https://gist.githubusercontent.com/GoldenHeads2/93ddb1b1e2935bc76fbc37aae8985ad2/raw/47dfa45e1e8f1933a1c031b198d40c3cd1499fa2/gistfile1.txt"},
    {"Sukuna (Saitama)", "https://raw.githubusercontent.com/damir512/sukunasaitamav1/main/thescript"},
    {"Manga Sukuna (Saitama)", "https://raw.githubusercontent.com/niki21233/undonethokunas/refs/heads/main/thokunasundone"},
    {"Shinjuko Itadori (Saitama)", "https://pastebin.com/raw/hmVdeZRp"},
    {"Hakari (Saitama) (Unfinished)", "https://raw.githubusercontent.com/Mark22028/HAKARI-UNFINISHED-ULT/refs/heads/main/1731596126969-HAKARI%20TSB%20SCRIPT%20(WORKING%20ON%20SOLARA).txt"},
    {"Volta (Deadly Ninja)", "https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/VOLTA.lua"},
    {"Floating Girl (Sword Master)", "https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/FLOATING_GIRL.lua"},
    {"Goku V2 (Hero Hunter)", "https://rawscripts.net/raw/The-Strongest-Battlegrounds-Goku-Moveset-V2-17977"},
    {"OverHaul (Saitama)", "https://raw.githubusercontent.com/skibiditoiletfan2007/SaitamaOverhaul/refs/heads/main/Latest.lua"},
    {"Sans Paid (Saitama)", "https://raw.githubusercontent.com/RadioUwU/BANNN/refs/heads/main/SANSDANCE"},
    {"Goku (Saitama)", "https://pastebin.com/raw/v0NPatvt"},
    {"Beerus (Saitama)", "https://raw.githubusercontent.com/sparksnaps/Beerus-The-Destroyer/refs/heads/main/Lua"},
    {"Hellish (Saitama)", "https://raw.githubusercontent.com/HellishAgem/HellishMovesetCutscene/refs/heads/main/Protected_6748082827088148.txt"},
    {"New Goku (Saitama)", "https://raw.githubusercontent.com/NetlessScripter/GOKU/refs/heads/main/%5BBETA%20TESTING%5D%20GOKU"},
    {"Star Glitcher (GUI)", "https://paste.ee/r/mmQkO"},
    {"Vexor (Saitama)", "https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/VEXOR.lua"},
    {"VHS Sans (Saitama)", "https://paste.ee/r/rF9d3"},
    {"Sonic (Hero Hunter)", "https://pastebin.com/raw/7V1mUBtQ"},
    {"Mahoraga (Saitama)", "https://raw.githubusercontent.com/RXScript/RX-GUI-Version-1/refs/heads/main/Saitama%20To%20Mahoraga%20Moveset"},
    {"Geto (Hero Hunter)", "https://paste.ee/r/70OTE"},
    {"Guts (Brutal Demon)", "https://raw.githubusercontent.com/Nova2ezz/GutsMoveset/refs/heads/main/Protected_5038752653618776.txt"},
    {"Sakamoto (Saitama)", "https://raw.githubusercontent.com/Nova2ezz/SakamotoTsb/refs/heads/main/Protected_7986324938641341.lua"},
    {"GT Chara (Saitama)", "https://paste.ee/r/0yYkO"},
    {"Suriyu (Hero Hunter)", "https://gist.githubusercontent.com/kjremaker/b092496fc11a57e2c50477154176fa3e/raw/2148f00a036a1799118541765675f3f6a0f8adae/GAROU%20TO%20SURIYU%20BETTER%20THAN%20THE%20OTHERS%20FR"},
    {"Mahito (Saitama)", "https://raw.githubusercontent.com/GreatestLime4K/mahitotsb/refs/heads/main/Protected_6381580361331378.txt"},
    {"A-Train (Hero Hunter)", "https://paste.ee/r/AnZ5j"},
    {"John Doe (Hero Hunter)", "https://raw.githubusercontent.com/Luckyfromyoutube/JohnDoe/refs/heads/main/TSBMODEL"},
    {"Star Glitcher (21 Mode)", "https://rawscripts.net/raw/Universal-Script-The-Strongest-Battleground-star-Glitcher-Moveset-30890"},
    {"Mahito V2 (Saitama)", "https://pastebin.com/raw/2HJnbJPM"},
    {"Gabriel (Hero Hunter)", "https://raw.githubusercontent.com/damir512/youinsinificants/main/insignificantFuck.txt"},
    {"Hyper Sonic (Hero Hunter)", "https://raw.githubusercontent.com/Nova2ezz/LitcoinA/refs/heads/main/Protected_8382569396837073.lua"},
    {"Manga Sukuna V2 (Saitama)", "https://raw.githubusercontent.com/niki1373v3/thokunadone/refs/heads/main/thokunadone"},
    {"Heian Sukuna (Saitama)", "https://raw.githubusercontent.com/damir512/whendoesbrickdie/main/tspno.txt"},
    {"Gojo Manga (Saitama)", "https://raw.githubusercontent.com/Skibiditoilethaterfr2024/Script-protected-blud-/refs/heads/main/Protected_4902678279449732.txt"},
    {"Sung Jinwoo (Saitama)", "https://rawscripts.net/raw/The-Strongest-Battlegrounds-Sung-Jin-Woo-Moveset-30600"},
    {"Consol (Saitama)", "https://raw.githubusercontent.com/Cv-jsSBzZ-U825F-ViuMPA-xo/Extras/refs/heads/main/Cansol.txt"},
    {"Senior Gojo (Saitama)", "https://raw.githubusercontent.com/Kamyk-player/FinalSuperSenior/refs/heads/main/SaitamaToSuperSeniorGojo"},
    {"Sukuna2 (Saitama)", "https://pastefy.app/Ck2z0lcr/raw"},
    {"Itadory x Sukuna (Garou)", "https://pastebin.com/raw/GNp0MuMy"},
    {"Megumi (Saitama)", "https://raw.githubusercontent.com/Kamyk-player/saitamatoMegumitenshadows/refs/heads/main/TENSHADOWSMAHORAGAULT"},
    {"Sukuna Manga2 (Saitama)", "https://pastefy.app/3dQB5Mv5/raw"},
    {"Lord Shadow (Saitama)", "https://raw.githubusercontent.com/sparksnaps/Lord-Shadow-Beta/refs/heads/main/Lua"},
    {"Uziman (Saitama)", "https://raw.githubusercontent.com/whatyoudoinhere/kbTSBEXRepo/refs/heads/main/Uziman%20Gunman%20moveset2"},
    {"Multiphex (Martial Artist)", "https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/MULTIPHEX.lua"},
    {"GoldenHead (Sword Master)", "https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/GOLDENHEAD.lua"},
    {"Akiha Vermillion (Monster Form)", "https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/AKIHA_VERMILLION.lua"},
    {"Jiren (Hero Hunter)", "https://raw.githubusercontent.com/sparksnaps/Jiren-Moveset-V2/refs/heads/main/Lua"},
    {"MIFIOSO (Saitama)", "https://raw.githubusercontent.com/Lovelymoonlight/Lovelymoonlight/refs/heads/main/Baldy%20to%20mafioso"},
    {"Wally West (Saitama)", "https://raw.githubusercontent.com/Nova2ezz/west/refs/heads/main/Protected_4638864115822087.lua.txt"},
    {"Laifu (Wild Psychic)", "https://paste.ee/r/Knl1L56b"},
    {"Sonic.Exe (Hero Hunter)", "https://pastefy.app/4zLt8a2P/raw"},
}

-- ═══════════════ LOAD ALL MOVESETS ═══════════════
for _, moveset in ipairs(Movesets) do
    MovesetsTab:CreateButton({
        Name = moveset[1],
        Callback = function()
            local ok, err = pcall(function()
                loadstring(game:HttpGet(moveset[2]))()
            end)
            if not ok then
                rayfield:Notify({Title = "Error", Content = "Failed: " .. moveset[1], Duration = 5})
            end
        end,
    })
end

-- ═══════════════ SPECIAL MOVESETS (Clipboard) ═══════════════
MovesetsTab:CreateButton({
    Name = "Jun Moveset (Saitama)",
    Callback = function()
        setclipboard("getgenv().speedtools = false\ngetgenv().speedpunch = true\ngetgenv().dance = false\ngetgenv().night = false\nloadstring(game:HttpGet(\"https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Shinji%20tp%20exploit\"))()")
        rayfield:Notify({Title = "Copied", Content = "Paste in executor", Duration = 3})
    end,
})

MovesetsTab:CreateButton({
    Name = "Apophenia (Brutal Demon)",
    Callback = function()
        setclipboard("getgenv().Music = false\ngetgenv().AttackQuality = 'High'\ngetgenv().ConstantSpeed = false\nloadstring(game:HttpGet(\"https://raw.githubusercontent.com/Reapvitalized/TSB/main/APOPHENIA.lua\"))()")
        rayfield:Notify({Title = "Copied", Content = "Paste in executor", Duration = 3})
    end,
})

MovesetsTab:CreateButton({
    Name = "A-Train 2XSpeed (Hero Hunter)",
    Callback = function()
        setclipboard("getgenv().settings = {morph = {enabled = false, dontchangeskincolor = false}, ult_forcewalkspeed = true, ult_walkspeed = 64, tp_duration = 0.15}\nloadstring(game:HttpGet(\"https://raw.githubusercontent.com/skibiditoiletfan2007/ATrainSounds/refs/heads/main/ATrain.lua\"))()")
        rayfield:Notify({Title = "Copied", Content = "Paste in executor", Duration = 3})
    end,
})

MovesetsTab:CreateButton({
    Name = "Chainsaw Man (Hero Hunter)",
    Callback = function()
        setclipboard("getgenv().RunSpeed = 65\ngetgenv().RunJump = 100\ngetgenv().InstaKill = false\ngetgenv().RevivePercent = 100\ngetgenv().ChangeWalk = true\ngetgenv().ChangeIdle = false\ngetgenv().Night = false\nloadstring(game:HttpGet(\"https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/CHAINSAW%20MAN/Chainsaw%20Man%20(Obfuscated).txt\"))()")
        rayfield:Notify({Title = "Copied", Content = "Paste in executor", Duration = 3})
    end,
})

MovesetsTab:CreateButton({
    Name = "Minos Prime (Hero Hunter)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/MINOS%20PRIME/Minos%20Prime%20(Obfuscated).txt"))()
    end,
})

MovesetsTab:CreateButton({
    Name = "Yuji X Sukuna (Saitama)",
    Callback = function()
        setclipboard("getgenv().secret = false\ngetgenv().Dance = true\ngetgenv().fog = true\ngetgenv().infinitedash = false\ngetgenv().night = false\nloadstring(game:HttpGet('https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Sigma%20v2%20vessel%20tp'))()")
        rayfield:Notify({Title = "Copied", Content = "Paste in executor", Duration = 3})
    end,
})

MovesetsTab:CreateButton({
    Name = "Baldy KJ (Saitama)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Baldy%20KJ"))()
    end,
})

MovesetsTab:CreateButton({
    Name = "Gojo V2 (Saitama)",
    Callback = function()
        getgenv().morph = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/BaldyToSorcerer/refs/heads/main/LatestV2.lua"))()
    end,
})

MovesetsTab:CreateButton({
    Name = "Mahito (Saitama) - Alt",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GreatestLime4K/mahitotsb/refs/heads/main/Protected_6381580361331378.txt"))()
    end,
})

MovesetsTab:CreateButton({
    Name = "Gojo (Saitama)",
    Callback = function()
        setclipboard("getgenv().FatalCombatSkillLayout = true\ngetgenv().MovesetReachSound = true\nloadstring(game:HttpGet(\"https://gist.githubusercontent.com/SonicexePort/d83f3eca5e8092468df1551df09db39a/raw/861f16fbae8fab8803cabfbc01295bb5b687f86a/Death%20Port%20Six%20Eyes%20Public%20Beta\"))()")
        rayfield:Notify({Title = "Copied", Content = "Paste in executor", Duration = 3})
    end,
})

MovesetsTab:CreateButton({
    Name = "Shinji (Saitama)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Shinji%20tp%20exploit"))()
    end,
})

MovesetsTab:CreateButton({
    Name = "Naruto (3 Char) (GUI)",
    Callback = function()
        setclipboard("getgenv().Cutscene = False\nloadstring(game:HttpGet(\"https://raw.githubusercontent.com/LolnotaKid/SCRIPTSBYVEUX/refs/heads/main/BoombasticLol.lua.txt\"))()")
        rayfield:Notify({Title = "Copied", Content = "Paste in executor", Duration = 3})
    end,
})

-- ═══════════════ OTHERS TAB ═══════════════
OthersTab:CreateButton({
    Name = "Phantasm (OP)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ATrainz/Phantasm/refs/heads/main/Games/TSB.lua"))()
    end,
})

OthersTab:CreateButton({
    Name = "VexonHub (Key but Op)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DiosDi/VexonHub/refs/heads/main/VexonHub"))()
    end,
})

OthersTab:CreateButton({
    Name = "Auto Block",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Mark22028/AutoBlock/main/AutoBlock.lua"))()
    end,
})

OthersTab:CreateButton({
    Name = "Auto Farm",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Mark22028/AutoFarm/main/AutoFarm.lua"))()
    end,
})

OthersTab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end,
})

OthersTab:CreateButton({
    Name = "M1Reset+EmoteDash",
    Callback = function()
        setclipboard("getgenv().keybinds = {m1reset = Enum.KeyCode.R, emotedash = Enum.KeyCode.T, rotation = Enum.KeyCode.H}\nloadstring(game:HttpGet(\"https://raw.githubusercontent.com/Slaphello/M1-Reset-And-Emote-Dash-TSB-OLD-/refs/heads/main/M1R%26ED%20TSB\"))()")
        rayfield:Notify({Title = "Copied", Content = "Paste in executor", Duration = 3})
    end,
})

OthersTab:CreateButton({
    Name = "No Dash Endlag",
    Callback = function()
        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local hum = char:WaitForChild("Humanoid")
        hum.DashEnded:Connect(function()
            hum.WalkSpeed = 16
        end)
        rayfield:Notify({Title = "Enabled", Content = "No Dash Endlag active", Duration = 3})
    end,
})

OthersTab:CreateButton({
    Name = "Auto Kyoto Combo",
    Callback = function()
        local uis = game:GetService("UserInputService")
        local combo = {Enum.KeyCode.Z, Enum.KeyCode.X, Enum.KeyCode.C, Enum.KeyCode.V}
        local index = 1
        game:GetService("RunService").Heartbeat:Connect(function()
            if uis:IsKeyDown(Enum.KeyCode.LeftControl) then
                keypress(combo[index])
                index = index % #combo + 1
                task.wait(0.1)
            end
        end)
        rayfield:Notify({Title = "Enabled", Content = "Hold LeftCtrl for auto combo", Duration = 5})
    end,
})

OthersTab:CreateButton({
    Name = "Camlock",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Mark22028/Camlock/refs/heads/main/Camlock%20V1.txt"))()
        getgenv().CamlockSetKeybind("C")
    end,
})

OthersTab:CreateButton({
    Name = "Devine Form Emote",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IdkRandomUsernameok/PublicAssets/refs/heads/main/Releases/MUI.lua"))()
    end,
})

OthersTab:CreateButton({
    Name = "Free Limited Emotes GUI (Key)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NetlessScripter/GOKU/refs/heads/main/FREE%20EMOTES%20GUI"))()
    end,
})

-- ═══════════════ NO STUN ═══════════════
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer
local noStunEnabled = false
local stunConn1, stunConn2
local defaultWalkSpeed = 16

localPlayer.CharacterAdded:Connect(function(char)
    if noStunEnabled then
        task.wait(0.2)
        setupNoStun(char)
    end
end)

function setupNoStun(char)
    local hum = char:WaitForChild("Humanoid")
    defaultWalkSpeed = hum.WalkSpeed or 16
    if stunConn1 then stunConn1:Disconnect() end
    stunConn1 = RunService.Heartbeat:Connect(function()
        if noStunEnabled and hum and hum.WalkSpeed < defaultWalkSpeed then
            hum.WalkSpeed = defaultWalkSpeed
        end
    end)
    if stunConn2 then stunConn2:Disconnect() end
    stunConn2 = hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        if noStunEnabled and hum.WalkSpeed < defaultWalkSpeed then
            hum.WalkSpeed = defaultWalkSpeed
        end
    end)
end

OthersTab:CreateToggle({
    Name = "No Stun",
    CurrentValue = false,
    Callback = function(value)
        noStunEnabled = value
        if value then
            local char = localPlayer.Character or localPlayer.CharacterAdded:Wait()
            setupNoStun(char)
        else
            if stunConn1 then stunConn1:Disconnect() end
            if stunConn2 then stunConn2:Disconnect() end
        end
    end,
})

-- ═══════════════ NO DEBRIS ═══════════════
local debrisEnabled = false
local debrisConn

OthersTab:CreateToggle({
    Name = "No Debris",
    CurrentValue = false,
    Callback = function(value)
        debrisEnabled = value
        if value then
            clearDebris()
            debrisConn = RunService.Heartbeat:Connect(function()
                if debrisEnabled then clearDebris() end
            end)
        else
            if debrisConn then debrisConn:Disconnect(); debrisConn = nil end
        end
    end,
})

function clearDebris()
    local thrown = workspace:FindFirstChild("Thrown")
    if thrown then
        for _, obj in ipairs(thrown:GetChildren()) do
            if obj:IsA("BasePart") then obj:Destroy() end
        end
    end
end

-- ═══════════════ NO CLONE ═══════════════
local noCloneEnabled = false
local noCloneConn
local originalClones = {}

localPlayer.CharacterAdded:Connect(function(char)
    if noCloneEnabled then
        task.wait(0.2)
        removeClones()
        setupNoClone(char)
    end
end)

function removeClones()
    local thrown = workspace:FindFirstChild("Thrown")
    if thrown then
        for _, obj in ipairs(thrown:GetChildren()) do
            if not originalClones[obj] then originalClones[obj] = obj:Clone() end
            if obj.Name:lower():match("clone") then obj:Destroy() end
        end
    end
end

function restoreClones()
    local thrown = workspace:FindFirstChild("Thrown")
    if thrown then
        for obj, clone in pairs(originalClones) do
            if not thrown:FindFirstChild(obj.Name) then
                clone:Clone().Parent = thrown
            end
        end
    end
    originalClones = {}
end

function setupNoClone(char)
    local hum = char:WaitForChild("Humanoid")
    hum.Died:Connect(function()
        if noCloneEnabled then
            local newChar = localPlayer.CharacterAdded:Wait()
            task.wait(2)
            removeClones()
            setupNoClone(newChar)
        end
    end)
end

OthersTab:CreateToggle({
    Name = "No Clone - Reduce Lag (Don't use Blink Emote)",
    CurrentValue = false,
    Callback = function(value)
        noCloneEnabled = value
        if value then
            removeClones()
            local char = localPlayer.Character or localPlayer.CharacterAdded:Wait()
            setupNoClone(char)
            noCloneConn = RunService.Heartbeat:Connect(function()
                if noCloneEnabled then removeClones() end
            end)
        else
            if noCloneConn then noCloneConn:Disconnect(); noCloneConn = nil end
            restoreClones()
        end
    end,
})

rayfield:Notify({Title = "Loaded!", Content = "Moveset Loader ready!", Duration = 5})
