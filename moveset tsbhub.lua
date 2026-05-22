-- ts file was generated at discord.gg/25ms

if game.PlaceId == 10449761463 or game.PlaceId == 130818724007978 then
    local v1, v2 = pcall(function()
        return loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    end)

    if not v1 then
        return print('Script failed to load. Error')
    end

    local v3 = v2:CreateWindow({
        Name = 'Movesets | Not My Movesets',
        LoadingTitle = 'Loading Movesets...',
        LoadingSubtitle = 'GUI By tze',
        ConfigurationSaving = {
            Enabled = true,
            FolderName = 'MovesetLoader',
            FileName = 'Movesets',
        },
        KeySystem = false,
    })

    if not v3 then
        return print('Rayfield UI failed to initialize.')
    end

    local _Movesets = v3:CreateTab('Movesets', 4483362458)
    local _Others = v3:CreateTab('Others', 4483362458);

    (function(p6, p7)
        local v8, v9, v10 = ipairs(p7)

        while true do
            local u11

            v10, u11 = v8(v9, v10)

            if v10 == nil then
                break
            end

            p6:CreateButton({
                Name = u11[1],
                Callback = function()
                    local v12, v13 = pcall(function()
                        loadstring(game:HttpGet(u11[2]))()
                    end)

                    if not v12 then
                        print('Failed to load ' .. u11[1] .. ': ' .. tostring(v13))
                    end
                end,
            })
        end
    end)(_Movesets, {
        {
            'Trashcan Man (Any)',
            'https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Trashcan%20Man',
        },
        {
            'Naruto (Saitama)',
            'https://raw.githubusercontent.com/LolnotaKid/NarutoBeatUpSasukeAss/refs/heads/main/NarutoCums',
        },
        {
            'Choi Jong (Saitama)',
            'https://raw.githubusercontent.com/nil071n/fireman/refs/heads/main/TSB',
        },
        {
            'Deku (Martial Artist)',
            'https://github.com/aggiealledge/obfuscated-scripts/raw/refs/heads/main/deku%20suiryu%20thingy.txt',
        },
        {
            'Luffy (Saitama)',
            'https://github.com/aggiealledge/obfuscated-scripts/raw/refs/heads/main/Protected_7732857839120517.txt',
        },
        {
            'Angel V1.0 (Hero Hunter)',
            'https://gist.githubusercontent.com/GoldenHeads2/93ddb1b1e2935bc76fbc37aae8985ad2/raw/47dfa45e1e8f1933a1c031b198d40c3cd1499fa2/gistfile1.txt',
        },
        {
            'Sukuna (Saitama)',
            'https://raw.githubusercontent.com/damir512/sukunasaitamav1/main/thescript',
        },
        {
            'Manga Sukuna (Saitama)',
            'https://raw.githubusercontent.com/niki21233/undonethokunas/refs/heads/main/thokunasundone',
        },
        {
            'Shinjuko Itadori (Saitama)',
            'https://pastebin.com/raw/hmVdeZRp',
        },
        {
            'Hakari (Saitama) (Unfinished)',
            'https://raw.githubusercontent.com/Mark22028/HAKARI-UNFINISHED-ULT/refs/heads/main/1731596126969-HAKARI%20TSB%20SCRIPT%20(WORKING%20ON%20SOLARA).txt',
        },
        {
            'Volta (Deadly Ninja)',
            'https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/VOLTA.lua',
        },
        {
            'Floating Girl (Sword Master)',
            'https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/FLOATING_GIRL.lua',
        },
        {
            'Goku V2 (Hero Hunter)',
            'https://rawscripts.net/raw/The-Strongest-Battlegrounds-Goku-Moveset-V2-17977',
        },
        {
            'OverHaul (Saitama)',
            'https://raw.githubusercontent.com/skibiditoiletfan2007/SaitamaOverhaul/refs/heads/main/Latest.lua',
        },
        {
            'Sans Paid (Saitama)',
            'https://raw.githubusercontent.com/RadioUwU/BANNN/refs/heads/main/SANSDANCE',
        },
        {
            'Goku (Saitama)',
            'https://pastebin.com/raw/v0NPatvt',
        },
        {
            'Beerus (Saitama)',
            'https://raw.githubusercontent.com/sparksnaps/Beerus-The-Destroyer/refs/heads/main/Lua',
        },
        {
            'Hellish (Saitama)',
            'https://raw.githubusercontent.com/HellishAgem/HellishMovesetCutscene/refs/heads/main/Protected_6748082827088148.txt',
        },
        {
            'New Goku (Saitama)',
            'https://raw.githubusercontent.com/NetlessScripter/GOKU/refs/heads/main/%5BBETA%20TESTING%5D%20GOKU',
        },
        {
            'Star Glitcher (GUI)',
            'https://paste.ee/r/mmQkO',
        },
        {
            'Vexor (Saitama)',
            'https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/VEXOR.lua',
        },
        {
            'VHS Sans (Saitama)',
            'https://paste.ee/r/rF9d3',
        },
        {
            'Sonic (Hero Hunter)',
            'https://pastebin.com/raw/7V1mUBtQ',
        },
        {
            'Mahoraga (Saitama)',
            'https://raw.githubusercontent.com/RXScript/RX-GUI-Version-1/refs/heads/main/Saitama%20To%20Mahoraga%20Moveset',
        },
        {
            'Geto (Hero Hunter)',
            'https://paste.ee/r/70OTE',
        },
        {
            'Guts (Brutal Demon)',
            'https://raw.githubusercontent.com/Nova2ezz/GutsMoveset/refs/heads/main/Protected_5038752653618776.txt',
        },
        {
            'Sakamoto (Saitama)',
            'https://raw.githubusercontent.com/Nova2ezz/SakamotoTsb/refs/heads/main/Protected_7986324938641341.lua',
        },
        {
            'GT Chara (Saitama)',
            'https://paste.ee/r/0yYkO',
        },
        {
            'Suriyu (Hero Hunter)',
            'https://gist.githubusercontent.com/kjremaker/b092496fc11a57e2c50477154176fa3e/raw/2148f00a036a1799118541765675f3f6a0f8adae/GAROU%20TO%20SURIYU%20BETTER%20THAN%20THE%20OTHERS%20FR',
        },
        {
            'Mahito (Saitama)',
            'https://raw.githubusercontent.com/GreatestLime4K/mahitotsb/refs/heads/main/Protected_6381580361331378.txt',
        },
        {
            'A-Train (Hero Hunter)',
            'https://paste.ee/r/AnZ5j',
        },
        {
            'John Doe (Hero Hunter)',
            'https://raw.githubusercontent.com/Luckyfromyoutube/JohnDoe/refs/heads/main/TSBMODEL',
        },
        {
            'Star Glitcher (21 Mode)',
            'https://rawscripts.net/raw/Universal-Script-The-Strongest-Battleground-star-Glitcher-Moveset-30890',
        },
        {
            'Mahito (Saitama)',
            'https://pastebin.com/raw/2HJnbJPM',
        },
        {
            'Gabriel (Hero Hunter)',
            'https://raw.githubusercontent.com/damir512/youinsinificants/main/insignificantFuck.txt',
        },
        {
            'Hyper Sonic (Hero Hunter)',
            'https://raw.githubusercontent.com/Nova2ezz/LitcoinA/refs/heads/main/Protected_8382569396837073.lua',
        },
        {
            'Manga Sukuna V2 (Saitama)',
            'https://raw.githubusercontent.com/niki1373v3/thokunadone/refs/heads/main/thokunadone',
        },
        {
            'Heian Sukuna (Saitama)',
            'https://raw.githubusercontent.com/damir512/whendoesbrickdie/main/tspno.txt',
        },
        {
            'Gojo Manga (Saitama)',
            'https://raw.githubusercontent.com/Skibiditoilethaterfr2024/Script-protected-blud-/refs/heads/main/Protected_4902678279449732.txt',
        },
        {
            'Sung Jinwoo (Saitama)',
            'https://rawscripts.net/raw/The-Strongest-Battlegrounds-Sung-Jin-Woo-Moveset-30600',
        },
        {
            'Consol (Saitama)',
            'https://raw.githubusercontent.com/Cv-jsSBzZ-U825F-ViuMPA-xo/Extras/refs/heads/main/Cansol.txt',
        },
        {
            'Senior Gojo (Saitama)',
            'https://raw.githubusercontent.com/Kamyk-player/FinalSuperSenior/refs/heads/main/SaitamaToSuperSeniorGojo',
        },
        {
            'Sukuna2 (Saitama)',
            'https://pastefy.app/Ck2z0lcr/raw',
        },
        {
            'Itadory x Sukuna (Garou)',
            'https://pastebin.com/raw/GNp0MuMy',
        },
        {
            'Megumi (Saitama)',
            'https://raw.githubusercontent.com/Kamyk-player/saitamatoMegumitenshadows/refs/heads/main/TENSHADOWSMAHORAGAULT',
        },
        {
            'Sukuna Manga2 (Saitama)',
            'https://pastefy.app/3dQB5Mv5/raw',
        },
        {
            'Lord Shadow (Saitama)',
            'https://raw.githubusercontent.com/sparksnaps/Lord-Shadow-Beta/refs/heads/main/Lua',
        },
        {
            'Uziman (Saitama)',
            'https://raw.githubusercontent.com/whatyoudoinhere/kbTSBEXRepo/refs/heads/main/Uziman%20Gunman%20moveset2',
        },
        {
            'Multiphex (Martial Artist)',
            'https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/MULTIPHEX.lua',
        },
        {
            'GoldenHead (Sword Master)',
            'https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/GOLDENHEAD.lua',
        },
        {
            'Akiha Vermillion (Monster Form)',
            'https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/AKIHA_VERMILLION.lua',
        },
        {
            'Jiren (Hero Hunter)',
            'https://raw.githubusercontent.com/sparksnaps/Jiren-Moveset-V2/refs/heads/main/Lua',
        },
        {
            'MIFIOSO (Saitama)',
            'https://raw.githubusercontent.com/Lovelymoonlight/Lovelymoonlight/refs/heads/main/Baldy%20to%20mafioso',
        },
        {
            'Wally West (Saitama)',
            'https://raw.githubusercontent.com/Nova2ezz/west/refs/heads/main/Protected_4638864115822087.lua.txt',
        },
        {
            'Laifu (Wild Psychic)',
            'https://paste.ee/r/Knl1L56b',
        },
        {
            'Sonic.Exe (Hero Hunter',
            'https://pastefy.app/4zLt8a2P/raw',
        },
    })
    _Movesets:CreateButton({
        Name = 'Jun Moveset (Saitama)',
        Callback = function()
            setclipboard('getgenv().speedtools = false\ngetgenv().speedpunch = true\ngetgenv().dance = false\ngetgenv().night = false\nloadstring(game:HttpGet("https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Shinji%20tp%20exploit"))()')
        end,
    })
    _Movesets:CreateButton({
        Name = 'Apophenia (Brutal Demon)',
        Callback = function()
            setclipboard('getgenv().Music = false\ngetgenv().AttackQuality = \'High\'\ngetgenv().ConstantSpeed = false\nloadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/main/APOPHENIA.lua"))()')
        end,
    })
    _Movesets:CreateButton({
        Name = 'A-Train 2XSpeed (Hero Hunter)',
        Callback = function()
            setclipboard([[getgenv().settings = {
    ["morph"] = {
        ["enabled"] = false,
        ["dontchangeskincolor"] = false,
    },
    ["ult_forcewalkspeed"] = true, -- forces walkspeed even if set to 0
    ["ult_walkspeed"] = 64, -- how fast you walk in ult
    ["tp_duration"] = 0.15 -- how long it takes to tp
} 
loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/ATrainSounds/refs/heads/main/ATrain.lua"))()]])
        end,
    })
    _Movesets:CreateButton({
        Name = 'Chainsaw Man (Hero Hunter)',
        Callback = function()
            setclipboard([[--/ run speed \\--
getgenv().RunSpeed = 65

--/ jump power while running \\--
getgenv().RunJump = 100

--/ instant kill (first and second skill) \\--
getgenv().InstaKill = false

--/ chance to revive after dying (100% in this case, 0% to 100%) \\--
getgenv().RevivePercent = 100

--/ walk anim \\\--
getgenv().ChangeWalk = true

--/ idle anim \\--
getgenv().ChangeIdle = false

--/ night time \\--
getgenv().Night = false

loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/CHAINSAW%20MAN/Chainsaw%20Man%20(Obfuscated).txt"))()]])
        end,
    })
    _Movesets:CreateButton({
        Name = 'Minos Prime (Hero Hunter)',
        Callback = function()
            setclipboard(' _G.SkipIntro = true\n_G.Night = false\nloadstring(game:HttpGet("https://raw.githubusercontent.com/S1gmaGuy/MinosPrimeFixed/refs/heads/main/ThefixIsSoSigma"))()')
        end,
    })
    _Movesets:CreateButton({
        Name = 'Yuji X Sukuna (Saitama)',
        Callback = function()
            setclipboard("getgenv().secret = false -- unknown (don't set true)\ngetgenv().Dance = true -- dance boppin\ngetgenv().fog = true -- set true if you want cool cloud\ngetgenv().infinitedash = false -- set true if you want infinite dash sigma\ngetgenv().night = false -- set true night \nloadstring(game:HttpGet('https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Sigma%20v2%20vessel%20tp'))()")
        end,
    })
    _Movesets:CreateButton({
        Name = 'Baldy KJ (Saitama)',
        Callback = function()
            setclipboard([[

getgenv().Moveset_Settings = {
    ["ExecuteOnRespawn"] = true, --// If true, the moveset will load everytime you respawn

    ["TSBStyleNotification"] = true, --// If true, uses the TSB notification when you spawn in with KJ

    ["UseOldCollateralRuin"] = true, --// If true, uses the old Collateral Ruin VFX and SFX

    ["NoWarning"] = true, --// If true, removes the warning that appears when you're not on Saitama
    ["NoDeathCounterImages"] = false, --// If true, will disable the images that appear in death counter slap
    ["NoBarrageArms"] = false, --// If true, will destroy the barrage arms that appear when you use consecutive punch
    ["NoPreysPerilAttract"] = true, --// If true, preys peril will not be able to attract you.
    ["NoWalls"] = false,
    ["NoTrees"] = false,

    ["RavageTool"] = true,
    ["AdrenalineBoostTool"] = true,
    ["Adrenaline_Multiplier"] = 2, --// how much adrenaline multiplies your speed by

    ["CustomUppercutAnimation"] = true,
    ["CustomDownslamAnimation"] = true,
    ["CustomIdleAnimation"] = true,

    ["UltNames"] = {
        "20 SERIES",
        "COME AT ME",
        "I'M DONE",
    },

    ["MoveNames"] = {
        ["Normal Punch"] = "Ravaging Kick",
        ["Consecutive Punches"] = "Fist Fusillade",
        ["Shove"] = "Swift Sweep",
        ["Uppercut"] = "Collateral Storm",

        ["Death Counter"] = "Sudden Strike",
        ["Table Flip"] = "Stoic Bomb",
        ["Serious Punch"] = "Destructive Power",
        ["Omni Directional Punch"] = "Omni Directional Fists"
    },
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/BaldyToKJ/refs/heads/main/Latest.lua"))()]])
        end,
    })
    _Movesets:CreateButton({
        Name = 'Gojo V2 (Saitama)',
        Callback = function()
            getgenv().morph = true

            loadstring(game:HttpGet('https://raw.githubusercontent.com/skibiditoiletfan2007/BaldyToSorcerer/refs/heads/main/LatestV2.lua'))()
        end,
    })
    _Movesets:CreateButton({
        Name = 'Mahito (Saitama)',
        Callback = function()
            setclipboard([[getgenv().Swordm1= true -- set trueif you want have sword thing on mahito m1

getgenv().night = false  -- set true if you want night 

getgenv().plushie = false ---set true if you want plushie mahito

getgenv().blackflash = true ---set true if you want v1 truly black flash

getgenv().chat = false ---set true if you visual to other pov that your mahito

loadstring(game:HttpGet('https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Mahito%20v2%20sigma%20tp%20exploit'))()]])
        end,
    })
    _Movesets:CreateButton({
        Name = 'Gojo (Saitama)',
        Callback = function()
            setclipboard('getgenv().FatalCombatSkillLayout = true -- [ DOESNT WORK ON ALL DEVICES. ]\ngetgenv().MovesetReachSound = true -- [ PLAYS AN SOUND WHEN YOU FILL AN SECTION OF THE ULT BAR. ]\n \nloadstring(game:HttpGet("https://gist.githubusercontent.com/SonicexePort/d83f3eca5e8092468df1551df09db39a/raw/861f16fbae8fab8803cabfbc01295bb5b687f86a/Death%20Port%20Six%20Eyes%20Public%20Beta"))()')
        end,
    })
    _Movesets:CreateButton({
        Name = 'Shinji (Saitama)',
        Callback = function()
            setclipboard("getgenv().speedtools = false --- use this tool if you want to run\ngetgenv().speedpunch= true ---tp and normal Punch (have a bug)\ngetgenv().dance= false ---song made by rebzyyx all I want is you \ngetgenv().night= false -- idk night?\n\nloadstring(game:HttpGet('https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Shinji%20tp%20exploit'))()")
        end,
    })
    _Movesets:CreateButton({
        Name = 'Naruto (3 Char) (Gui)',
        Callback = function()
            setclipboard('getgenv().Cutscene = False -- true if you want to disable cutsence\n\nloadstring(game:HttpGet("https://raw.githubusercontent.com/LolnotaKid/SCRIPTSBYVEUX/refs/heads/main/BoombasticLol.lua.txt"))()')
        end,
    })
    _Others:CreateButton({
        Name = 'Phantasm (OP)',
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/ATrainz/Phantasm/refs/heads/main/Games/TSB.lua'))()
        end,
    })
    _Others:CreateButton({
        Name = 'VexonHub (Key but Op)',
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/DiosDi/VexonHub/refs/heads/main/VexonHub'))()
        end,
    })
    _Others:CreateButton({
        Name = 'Auto Block',
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Cyborg883/TSB/refs/heads/main/CombatGui'))()
        end,
    })
    _Others:CreateButton({
        Name = 'Auto Farm',
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Mark22028/Tp-spin-script-and-Movesets/refs/heads/main/Auto%20Farm.txt'))()
        end,
    })
    _Others:CreateButton({
        Name = 'Infinite Yield',
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        end,
    })
    _Others:CreateButton({
        Name = 'M1Reset+EmoteDash',
        Callback = function()
            setclipboard([[-- Set Keybile for Pc here (keycode.[adjusthere])
getgenv().keybinds = {
    m1reset = Enum.KeyCode.R,      -- M1 Reset 
    emotedash = Enum.KeyCode.T,    -- Emote Dash
    rotation = Enum.KeyCode.H      -- Auto Rotation
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/Slaphello/M1-Reset-And-Emote-Dash-TSB-OLD-/refs/heads/main/M1R%26ED%20TSB"))()]])
        end,
    })
    _Others:CreateButton({
        Name = 'No Dash Endlag',
        Callback = function()
            local _LocalPlayer = game:GetService('Players').LocalPlayer
            local _UserInputService = game:GetService('UserInputService')
            local _TouchEnabled = _UserInputService.TouchEnabled

            if not _G._AspectAlreadyRan then
                _G._AspectAlreadyRan = true

                local u17 = {
                    {
                        Dash = Enum.KeyCode.W,
                        Key = Enum.KeyCode.Q,
                        Goal = 'KeyPress',
                    },
                }

                local function u18()
                    _LocalPlayer.Character.Communicate:FireServer(unpack(u17))
                end
                local function v23(p19)
                    local u22 = _UserInputService.InputBegan:Connect(function(p20, p21)
                        if not p21 then
                            if p20.KeyCode == Enum.KeyCode.Q and (not _UserInputService:IsKeyDown(Enum.KeyCode.D) and (not _UserInputService:IsKeyDown(Enum.KeyCode.A) and (not _UserInputService:IsKeyDown(Enum.KeyCode.S) and p19:FindFirstChild('UsedDash')))) then
                                u18()
                            end
                        end
                    end)

                    p19.Destroying:Connect(function()
                        u22:Disconnect()
                    end)
                end
                local function u27(p24, p25)
                    if p25.Magnitude == 0 then
                        return 0
                    end

                    local v26 = p24.CFrame:VectorToObjectSpace(p25)

                    return (math.deg(math.atan2(v26.Z, v26.X)) + 360) % 360
                end
                local function u32(p28, p29)
                    task.wait()
                    p29.MouseButton1Down:Connect(function()
                        local _Humanoid = p28:WaitForChild('Humanoid')
                        local v31 = u27(p28:FindFirstChild('HumanoidRootPart'), _Humanoid.MoveDirection)

                        if (v31 == 0 and 'front' or ((v31 >= 315 or v31 < 45) and 'right' or (135 <= v31 and v31 < 225 and 'left' or (45 <= v31 and v31 < 135 and 'back' or (225 <= v31 and v31 < 315 and 'front' or nil))))) == 'front' and not (p28:FindFirstChild('Freeze') or (p28:FindFirstChild('Slowed') or p28:FindFirstChild('WallCombo'))) then
                            u18()
                        end
                    end)
                end

                if _LocalPlayer.Character then
                    local v33 = _TouchEnabled and _LocalPlayer:WaitForChild('PlayerGui'):WaitForChild('TouchGui'):WaitForChild('TouchControlFrame'):WaitForChild('JumpButton'):WaitForChild('DashButton')

                    if v33 then
                        task.spawn(u32, _LocalPlayer.Character, v33)
                    end

                    task.spawn(v23, _LocalPlayer.Character)
                end

                _LocalPlayer.PlayerGui.DescendantAdded:Connect(function(p34)
                    if p34.Name == 'DashButton' then
                        repeat
                            task.wait()
                        until _LocalPlayer.Character

                        task.spawn(u32, _LocalPlayer.Character, p34)
                    end
                end)
                _LocalPlayer.CharacterAdded:Connect(v23)
            end
        end,
    })
    _Others:CreateButton({
        Name = 'Auto Kyoto Combo',
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Mark22028/Auto-Kyoto-Combo/refs/heads/main/Skibidi%20Sigma%20Combo.txt'))()
        end,
    })
    _Others:CreateButton({
        Name = 'Camlock',
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Mark22028/Camlock/refs/heads/main/Camlock%20V1.txt'))()
            getgenv().CamlockSetKeybind('C')
        end,
    })
    _Others:CreateButton({
        Name = 'Devine Form Emote',
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/IdkRandomUsernameok/PublicAssets/refs/heads/main/Releases/MUI.lua'))()
        end,
    })
    _Others:CreateButton({
        Name = 'Free Limited Emotes GUI (Key)',
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/NetlessScripter/GOKU/refs/heads/main/FREE%20EMOTES%20GUI'))()
        end,
    })

    local _Players = game:GetService('Players')
    local _RunService = game:GetService('RunService')
    local _LocalPlayer2 = _Players.LocalPlayer
    local u38 = false
    local u39 = nil
    local u40 = nil
    local u41 = nil

    local function u44(p42)
        local _Humanoid2 = p42:WaitForChild('Humanoid')

        if not u39 then
            u39 = _Humanoid2.WalkSpeed
        end
        if u40 then
            u40:Disconnect()
        end

        u40 = _RunService.Heartbeat:Connect(function()
            if u38 and (_Humanoid2 and _Humanoid2.WalkSpeed < u39) then
                _Humanoid2.WalkSpeed = u39
            end
        end)

        if u41 then
            u41:Disconnect()
        end

        u41 = _Humanoid2:GetPropertyChangedSignal('WalkSpeed'):Connect(function()
            if u38 and _Humanoid2.WalkSpeed < u39 then
                _Humanoid2.WalkSpeed = u39
            end
        end)
    end

    _LocalPlayer2.CharacterAdded:Connect(function(p45)
        if u38 then
            task.wait(0.2)
            u44(p45)
        end
    end)
    _Others:CreateToggle({
        Name = 'No Stun',
        CurrentValue = false,
        Callback = function(p46)
            u38 = p46

            if p46 then
                u44(_LocalPlayer2.Character or _LocalPlayer2.CharacterAdded:Wait())
            else
                if u40 then
                    u40:Disconnect()
                end
                if u41 then
                    u41:Disconnect()
                end
            end
        end,
    })

    local _Players2 = game:GetService('Players')
    local _RunService2 = game:GetService('RunService')
    local _LocalPlayer3 = _Players2.LocalPlayer
    local _Thrown = workspace:WaitForChild('Thrown')
    local u51 = {}
    local u52 = false
    local u53 = nil
    local u54 = nil
    local u55 = nil

    local function u57(p56)
        return string.find(p56.Name:lower(), 'debris') ~= nil
    end
    local function u63()
        local v58 = _Thrown
        local v59, v60, v61 = ipairs(v58:GetChildren())

        while true do
            local v62

            v61, v62 = v59(v60, v61)

            if v61 == nil then
                break
            end
            if u57(v62) then
                if not u51[v62] then
                    u51[v62] = v62:Clone()
                end

                v62:Destroy()
            end
        end
    end
    local function u68()
        local v64, v65, v66 = pairs(u51)

        while true do
            local v67

            v66, v67 = v64(v65, v66)

            if v66 == nil then
                break
            end
            if not _Thrown:FindFirstChild(v67.Name) then
                v67:Clone().Parent = _Thrown
            end
        end

        u51 = {}
    end
    local function u74()
        u55 = _RunService2.Heartbeat:Connect(function()
            if u52 then
                local v69 = _Thrown
                local v70, v71, v72 = ipairs(v69:GetChildren())

                while true do
                    local v73

                    v72, v73 = v70(v71, v72)

                    if v72 == nil then
                        break
                    end
                    if u57(v73) then
                        if not u51[v73] then
                            u51[v73] = v73:Clone()
                        end

                        v73:Destroy()
                    end
                end
            end
        end)
    end
    local function u75()
        if u55 then
            u55:Disconnect()

            u55 = nil
        end
    end
    local function u78()
        u52 = true

        u63()
        u74();
        (function(p76)
            local _Humanoid3 = p76:WaitForChild('Humanoid')

            if u53 then
                u53:Disconnect()
            end

            u53 = _Humanoid3.Died:Connect(function()
                if u52 then
                    u54 = _LocalPlayer3.CharacterAdded:Connect(function(_)
                        u54:Disconnect()
                        task.wait(2)
                        u63()
                    end)
                end
            end)
        end)(_LocalPlayer3.Character or _LocalPlayer3.CharacterAdded:Wait())
    end
    local function u79()
        u52 = false

        u75()

        if u53 then
            u53:Disconnect()
        end
        if u54 then
            u54:Disconnect()
        end

        u68()
    end

    _Others:CreateToggle({
        Name = 'No Debris',
        CurrentValue = false,
        Callback = function(p80)
            if p80 then
                u78()
            else
                u79()
            end
        end,
    })

    local _Players3 = game:GetService('Players')
    local _RunService3 = game:GetService('RunService')
    local _LocalPlayer4 = _Players3.LocalPlayer
    local _Thrown2 = workspace:WaitForChild('Thrown')
    local u85 = false
    local u86 = nil
    local u87 = nil
    local u88 = nil

    local function u91(p89)
        local v90 = p89.Name:lower()

        return v90 == 'aurora' or (v90 == 'donation leaderboard' or string.find(v90, 'debris') ~= nil)
    end
    local function u97()
        local v92 = _Thrown2
        local v93, v94, v95 = ipairs(v92:GetChildren())

        while true do
            local v96

            v95, v96 = v93(v94, v95)

            if v95 == nil then
                break
            end
            if not u91(v96) then
                v96:Destroy()
            end
        end
    end
    local function u103()
        u88 = _RunService3.Heartbeat:Connect(function()
            if u85 then
                local v98 = _Thrown2
                local v99, v100, v101 = ipairs(v98:GetChildren())

                while true do
                    local v102

                    v101, v102 = v99(v100, v101)

                    if v101 == nil then
                        break
                    end
                    if not u91(v102) then
                        v102:Destroy()
                    end
                end
            end
        end)
    end
    local function u104()
        if u88 then
            u88:Disconnect()

            u88 = nil
        end
    end
    local function u108(p105)
        local v106 = p105:FindFirstChild('Humanoid') or p105:WaitForChild('Humanoid')

        if u86 then
            u86:Disconnect()
        end

        u86 = v106.Died:Connect(function()
            if u85 then
                u87 = _LocalPlayer4.CharacterAdded:Connect(function(p107)
                    u87:Disconnect()
                    task.wait(2)
                    u97()
                    u108(p107)
                end)
            end
        end)
    end
    local function u109()
        u85 = true

        u97()
        u103()
        u108(_LocalPlayer4.Character or _LocalPlayer4.CharacterAdded:Wait())
    end
    local function u110()
        u85 = false

        u104()

        if u86 then
            u86:Disconnect()
        end
        if u87 then
            u87:Disconnect()
        end
    end

    _Others:CreateToggle({
        Name = "No Clone idk Reduce Lag (Don't use Blink Emote)",
        CurrentValue = false,
        Callback = function(p111)
            if p111 then
                u109()
            else
                u110()
            end
        end,
    })
else
    game:GetService('Players').LocalPlayer:Kick('Wrong Game? Go Touch Some Grass\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}')
end
