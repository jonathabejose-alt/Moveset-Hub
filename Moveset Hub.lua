local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/jonathabejose-alt/Wind-UI-Boreal/refs/heads/main/WindUI%20Boreal"))()

local Window = WindUI:CreateWindow({
    Title = "Moveset Hub",
    Author = "Tze",
    Folder = "MovesetHub",
    Icon = "swords",
    IconThemed = true,
    Theme = "Violet",
    Size = UDim2.fromOffset(600, 500),
    Transparent = false,
    SideBarWidth = 180,
    ScrollBarEnabled = true,
    Resizable = true,
    User = {
        Enabled = true,
        Callback = function()
            WindUI:Notify({ Title = "Moveset Hub", Content = "Made by Tze | discord: tze0638", Icon = "moon", Duration = 4 })
        end
    },
    OpenButton = {
        Enabled = true,
        Title = "MovesetHub",
        Icon = "panel-left-open",
        Position = UDim2.new(0, 120, 0, 120),
        Draggable = true,
        OnlyMobile = false,
        Scale = 1
    },

    Watermark = {
        Enabled = true,
        Text = "Moveset Hub v1",
        Position = "bottom-right",
        Opacity = 0.5,
        Size = 13,
    },
})

Window:SideBarLabel({ Title = "Quick Links", Icon = "zap" })

Window:SideBarButton({
    Title = "Discord",
    Icon = "message-circle",
    Callback = function()
        setclipboard("tze0638")
        WindUI:Notify({ Title = "Discord", Content = "Copied 'tze0638'", Icon = "check", Duration = 3 })
    end,
})

Window:SideBarDivider({})


local HomeTab = Window:Tab({ Title = "Home", Icon = "house" })

HomeTab:Paragraph({
    Title = "Welcome to Moveset Hub",
    Desc = "Select a moveset from the tabs above. F4 to disable any moveset.",
    Buttons = {
        {
            Title = "Discord",
            Icon = "message-circle",
            Callback = function()
                setclipboard("https://discord.gg/qgK4zegPgb")
                WindUI:Notify({ Title = "Discord", Content = "Invite copied!", Icon = "check", Duration = 3 })
            end,
        },
    },
})

HomeTab:Divider({})

HomeTab:Stats({
    Title = "Hub Info",
    Items = {
        { Key = "Author",   Value = "Tze + celeron + daffy" },
        { Key = "Version",  Value = "v1" },
        { Key = "Movesets", Value = "14" },
    },
})

HomeTab:Code({
    Title = "Loader",
    Code = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/jonathabejose-alt/AbyssUI/refs/heads/main/loander1"))()]],
    OnCopy = function()
        WindUI:Notify({ Title = "Loader", Content = "Copied!", Icon = "copy", Duration = 3 })
    end,
})

local TzeTab = Window:Tab({ Title = "Tze", Icon = "moon" })

TzeTab:Paragraph({ Title = "Messi ", Desc = "Requires Bachira" })
TzeTab:Button({
    Title = "Load Messi",
    Desc = "Dribble, Trap Shot, Riptide, Intercept, Nutmeg Steal + Flow. F4 to disable.",
    Icon = "star",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jonathabejose-alt/AbyssUI/refs/heads/main/Messi%20style", true))()
    end,
})
TzeTab:Divider({})

TzeTab:Paragraph({ Title = "KJ", Desc = "Requires Shidou" })
TzeTab:Button({
    Title = "Load KJ",
    Desc = "Unlimited Flexworks, Handball, 20-20-20 Dropkick + Off Ball Flow. F4 to disable.",
    Icon = "zap",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jonathabejose-alt/AbyssUI/refs/heads/main/kj.lua", true))()
    end,
})
TzeTab:Divider({})

TzeTab:Paragraph({ Title = "Ronaldo", Desc = "Requires Shidou" })
TzeTab:Button({
    Title = "Load Ronaldo V4",
    Desc = "CR7 Dribble, Bicycle Kick, Flawless Pass + Flow. F4 to disable.",
    Icon = "zap",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jonathabejose-alt/AbyssUI/refs/heads/main/ronaldo%20v4", true))()
    end,
})
TzeTab:Divider({})

TzeTab:Paragraph({ Title = "Izayoi", Desc = "Requires Kunigami or Shidou" })
TzeTab:Button({
    Title = "Load Izayoi",
    Desc = "Step Behind, Powerful Striker, Time Stop, Intercept + Flow. F4 to disable.",
    Icon = "moon",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jonathabejose-alt/AbyssUI/refs/heads/main/izayoi", true))()
    end,
})

local DaffyTab = Window:Tab({ Title = "Daffy", Icon = "star" })

local daffyMovesets = {
    {"DIO (Req. Kunigami)", "Greatest High, Time Skip, Za Warudo timestop. F4 to disable.", "https://pastebin.com/raw/FZc7Fway"},
    {"Sonic.EXE (Req. Isagi)", "Strike Shot, Exterminate, Shortcut. F4 to disable.", "https://pastebin.com/raw/3XaQHzCX"},
    {"Gojo (Req. Isagi)", "F4 to disable.", "https://pastebin.com/raw/TH8xDy9X"},
    {"Hugo (Req. Kunigami)", "F4 to disable, rejoin to fix music.", "https://pastebin.com/raw/ND6yrPyk"},
    {"Naoya (Req. Sae)", "F4 to disable.", "https://pastebin.com/raw/PDwm0ZcF"},
    {"Lore Sae (Req. Sae)", "Rejoin to disable.", "https://pastebin.com/raw/kMQ0v88u"},
}

for _, m in pairs(daffyMovesets) do
    DaffyTab:Button({ Title = m[1], Desc = m[2], Icon = "swords", Callback = function() loadstring(game:HttpGet(m[3], true))() end })
end

local CeleronTab = Window:Tab({ Title = "Celeron", Icon = "github" })

local celeronMovesets = {
    {"Goku (Req. Isagi)", "F4 to disable.", "https://raw.githubusercontent.com/ghostofcelleron/Celeron/refs/heads/main/goku%20moveset%20(azl)"},
    {"Aizen (Req. Isagi)", "F4 to disable.", "https://raw.githubusercontent.com/ghostofcelleron/Celeron/refs/heads/main/aizen%20moveset"},
    {"Loki V2 (Req. Isagi)", "F4 to disable, rejoin to fix music.", "https://raw.githubusercontent.com/ghostofcelleron/Celeron/refs/heads/main/loki%20v2"},
    {"Ronaldo V3 (Req. Shidou)", "F4 to disable.", "https://raw.githubusercontent.com/ghostofcelleron/Celeron/refs/heads/main/ronaldov3"},
}

for _, m in pairs(celeronMovesets) do
    CeleronTab:Button({ Title = m[1], Desc = m[2], Icon = "swords", Callback = function() loadstring(game:HttpGet(m[3], true))() end })
end

Window:SelectTab(HomeTab)

WindUI:Notify({
    Title = "Moveset Hub",
    Content = "Loaded!",
    Icon = "check",
    Duration = 3,
})
