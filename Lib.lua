getgenv().Key = getgenv().Key or "BYPASS_KEY_0000000000000000"
getgenv().ReadyExecute = nil
getgenv().__BANANA_LOADER_RAN = nil
getgenv().__BF_LOADED = nil
getgenv().HideUI = false
getgenv().ShowUI = true
print("[Banana] patched boot")

rejectWhitelist = function(msg)
    warn("[Banana] WL ignored:", msg)
    return true
end

local Features = {}
local blackScreen, blackScreen2, HttpService, rejectWhitelist, nextEntry2, nextEntry3, nextEntry
local logPrefix, hasEntry, entryKey, hasEntry2, entryValue, entryKey2, hasEntry3, entryValue2
local result, entryKey3, hasEntry4, entryValue3, entryKey4, hasEntry5, entryValue4, entryKey5
local hasEntry6, entryValue5, entryKey6, hasEntry7, entryValue6, entryKey7, hasEntry8, entryKey8
local entryKey9, hasEntry9, entryValue7, entryKey10, hasEntry10, entryValue8, entryKey11, hasEntry11
local entryValue9, entryKey12, hasEntry12, entryValue10, hasEntry13, entryKey13, hasEntry14
local entryKey14, entryValue11, hasEntry15, hasEntry22, hasEntry32, hasEntry42, entryValue22
local entryValue32, entryKey15, entryValue42, entryValue52, entryKey22, result2, createToggle
local createToggle2, tweenService
local Runtime = {}
-- [graft] logic + tabs ported from BananaCat_newui_v2 (Farming Other ... Setting)
function __BF_GraftHelpers()
function ElevateIdentity()
	pcall(function()
		local f = setthreadidentity or setidentity or set_thread_identity or (syn and syn.set_thread_identity) or setthreadcontext
		if f then
			f(8)
		end
	end)
end

function readText(inst)
	if not inst then
		return nil
	end
	if inst:IsA("TextLabel") or inst:IsA("TextButton") or inst:IsA("TextBox") then
		return inst.Text ~= "" and inst.Text or nil
	end
	for _, d in ipairs(inst:GetDescendants()) do
		if d:IsA("TextLabel") and d.Text ~= "" then
			return d.Text
		end
	end
	return nil
end

function GetQuestTitle()
	local lp = game:GetService("Players").LocalPlayer
	local pg = lp and lp:FindFirstChild("PlayerGui")
	if not pg then
		return nil
	end
	-- V1
	local main = pg:FindFirstChild("Main") or pg:FindFirstChild("Main (minimal)")
	local q = main and main:FindFirstChild("Quest")
	if q and q.Visible then
		local c = q:FindFirstChild("Container")
		local qt = c and c:FindFirstChild("QuestTitle")
		local txt = readText(qt and qt:FindFirstChild("Title"))
		if txt then
			return txt
		end
	end
	-- V2
	local tr = pg:FindFirstChild("TrackedQuestFrame")
	if tr then
		local on = (tr:IsA("ScreenGui") and tr.Enabled) or (tr:IsA("GuiObject") and tr.Visible)
		local fr = tr:FindFirstChild("Frame")
		if on and fr and fr.Visible then
			return readText(fr:FindFirstChild("header"))
		end
	end
	return nil
end

_rawHasQuest = function()
	return GetQuestTitle() ~= nil
end

_questSeenUntil = 0

function HasQuest()
	-- Giu trang thai "co quest" trong 1s sau lan cuoi thay UI hien quest,
	-- de tranh doc UI ngay luc dang animation/lag -> tuong nham la mat quest
	-- roi goi lai TakeQuestLevel giua chung, gay farm level chap chon.
	if _rawHasQuest() then
		_questSeenUntil = tick() + 1
		return true
	end
	return tick() < _questSeenUntil
end

-- Lay TOAN BO text cua UI quest (V1 + V2), khong chi moi title.
-- Dung cho cac che do can so ten boss/mob (Elite Hunter, Rainbow Haki, CDK...)

function QuestHas(name)
	if not name then
		return false
	end
	name = tostring(name):lower()
	if GetQuestText():lower():find(name, 1, true) then
		return true
	end
	if GetQuestTitle() and GetQuestTitle():lower():find(name, 1, true) then
		return true
	end
	return false
end
-- Dung cho Elite Hunter: dam bao dang giu quest cua boss `name`.
-- Tra ve true = co the danh boss ngay. Co cooldown de khong abandon/nhan lien tuc khi UI cap nhat cham.

_lastEliteTake = 0

function EnsureEliteQuest(name)
	if QuestHas(name) then
		return true
	end
	if tick() - _lastEliteTake < 6 then
		return true
	end
	_lastEliteTake = tick()
	local CF = game:GetService("ReplicatedStorage").Remotes.CommF_
	pcall(function()
		if HasQuest() then
			CF:InvokeServer("AbandonQuest")
		end
		CF:InvokeServer("EliteHunter")
	end)
	task.wait(1)
	return QuestHas(name)
end

getgenv().ExploitReq = (syn and syn.request)
	or (identifyexecutor and identifyexecutor() == "Fluxus" and request)
	or http_request
	or (http and http.request)
	or request
	or requests

getgenv().request = getgenv().request or getgenv().ExploitReq

getgenv().CheckPlaceId3 = game.PlaceId == 2753915549 and 2753915549 or 85211729168715

G = {
	BuyBlackLeg = "Dark Step Teacher",
	BuySuperhuman = "Martial Arts Master",
	BuySharkmanKarate = "Sharkman Teacher",
	DragonClaw = "Sabi",
	BuyDragonTalon = "Uzoth",
	BuyElectro = "Mad Scientist",
	BuyFishmanKarate = "Water Kung-fu Teacher",
	BuyDeathStep = "Phoeyu, the Reformed",
	BuyGodhuman = "Ancient Monk",
	BuyElectricClaw = "Previous Hero",
	BuySanguineArt = "Shafi",
}

G = ""

K = { "Deandre", "Urban", "Diablo" }

K = 0

K = require(game.ReplicatedStorage:WaitForChild("Controllers"):WaitForChild("UI"):WaitForChild("Inventory"))

function I()
	L = tick() + 1.5
	if not S:HasTag(t, "Teleporting") then
		S:AddTag(t, "Teleporting")
		d = true
	end
end

function o(V)
	local N = t.Character:FindFirstChild("Portal-Portal") or (t.Backpack:FindFirstChild("Portal-Portal"))
	if not N then
		return false
	end
	t.Character:FindFirstChildOfClass("Humanoid"):EquipTool(N)
	N = t.PlayerGui.Main:FindFirstChild("Gateway")
	if not N then
		return false
	end
	d:SendKeyEvent(true, "C", false, game)
	d:SendKeyEvent(false, "C", false, game)
	local y = tick() + 3
	repeat
		task.wait(0.1)
	until N.Visible or tick() > y
	if not N.Visible then
		return false
	end
	y = N:FindFirstChild("MainContent")
	if not y then
		return false
	end
	N = y.ScrollingFrame:FindFirstChild(tostring(V))
	if N and N.MouseButton1Click then
		for V, V in pairs(getconnections(N.MouseButton1Click)) do
			pcall(function()
				V.Function()
			end)
		end
		return true
	end
	return false
end

G = {
	[Vector3.new(-16455.29, 527.75, 436.11)] = Vector3.new(-4967.68, 314.88, -3157.1),
	[Vector3.new(-9513.47, 142.1, 5528.84)] = Vector3.new(-4967.68, 314.88, -3157.1),
	[Vector3.new(-340.89, 20.6, 5549.8)] = Vector3.new(5661.53, 1013.41, -334.96),
	[Vector3.new(-2100.75, 69.98, -12128.27)] = Vector3.new(28282.57, 14896.85, 105.1),
	[Vector3.new(380.74, 126.58, -12726.16)] = Vector3.new(28282.57, 14896.85, 105.1),
	[Vector3.new(-916.08, 56.24, -10858.4)] = Vector3.new(28282.57, 14896.85, 105.1),
	[Vector3.new(-2039.6, 9.67, -9947.76)] = Vector3.new(28282.57, 14896.85, 105.1),
}

G = false

function V(N)
	local y, x
	for k, P in ipairs(workspace._WorldOrigin.Locations:GetChildren()) do
		if P:IsA("BasePart") and not P:GetAttribute("IgnoreInTracking") then
			k = (P.Position - N).Magnitude
			if not y or k < y then
				y, x = k, P
			end
		end
	end
	return x
end

function N(y)
	local x = V(y)
	if not x then
		return nil
	end
	local k = x:FindFirstChild("Mesh")
	if k then
		if k.Scale.X / 2 >= (x.Position - y).Magnitude then
			return x
		else
			return nil
		end
	end
	return x
end

L = game:GetService("ReplicatedStorage")

function H()
	local B = getgenv().CharSpeed
	if not B then
		B = { cap = 1000, nextRaise = 0 }
		getgenv().CharSpeed = B
	end
	return B
end

function B(Z, C, J, F)
	if not Z or typeof(C) ~= "CFrame" then
		return
	end
	local q = t.Character
	local c = q and (q:FindFirstChildOfClass("Humanoid"))
	if not q or Z.Parent ~= q or not c or c.Health <= 0 then
		return
	end
	if tick() - k.LastTP < 1 and C == k.LastCF then
		return
	end
	TweenManager.CancelTweenOnly()
	if k.ActiveConnection and coroutine.status(k.ActiveConnection) == "suspended" then
		pcall(coroutine.close, k.ActiveConnection)
	end
	J = math.max(tonumber(J) or 350, 1)
	F = tonumber(F) or 2.5
	k.LastTP = tick()
	k.LastCF = C
	local c, D = false
	local r = {}
	local function n()
		if k.ActiveConnection == D then
			k.ActiveConnection = nil
		end
		if TweenManager.currentTween == r then
			TweenManager.currentTween = nil
			TweenManager.currentPart = nil
			TweenManager.currentGoal = nil
			TweenManager.TweenRunning = false
		end
		if getgenv().Tween == r then
			getgenv().Tween = nil
		end
	end
	r.Pause = function(u)
		c = true
		if D and coroutine.status(D) == "suspended" then
			pcall(coroutine.close, D)
		end
	end
	r.Cancel = function(u)
		u:Pause()
		n()
	end
	r.Destroy = function(u)
		u:Cancel()
	end
	D = coroutine.create(function()
		local u, W = Z.Position, C.Position
		local O, z, U, h, p, w = (W - u).Magnitude, 1 / 0, (tick()), true
		while not c do
			local M = t.Character
			local j = M and (M:FindFirstChildOfClass("Humanoid"))
			if M ~= q or Z.Parent ~= M or not j or j.Health <= 0 or Z.Anchored or O <= F then
				break
			end
			local q, v0, T0 = x.Heartbeat:Wait(), H(), Z.Position
			M = (W - T0).Magnitude
			if M < z - 5 then
				z, U = M, (tick())
			else
				h = (function() if tick() - U > 2.5 then return false else return h end end)()
			end
			if h and p and w and M > w + Y then
				v0.cap = math.max(v0.cap * 0.7, e)
				v0.nextRaise = tick() + 3
				u = T0
			else
				u = (function() if h and p and (T0 - p).Magnitude > Y then return T0 else return u end end)()
			end
			j = W - u
			local e, Y = j.Magnitude, math.min(math.min(J, v0.cap) * q, P)
			if e > Y and tick() >= v0.nextRaise then
				v0.cap = math.min(v0.cap * 1.08, J)
				v0.nextRaise = tick() + 1.5
			end
			u = (function() if e <= Y or e <= 0.05 then return W else return u + j / e * Y end end)()
			O = (W - u).Magnitude
			I()
			getgenv().noclip = true
			Z.CFrame = CFrame.new(u)
			Z.AssemblyLinearVelocity = Vector3.new(0.0, 0.0, 0.0)
			Z.AssemblyAngularVelocity = Vector3.new(0.0, 0.0, 0.0)
			p, w = u, M
		end
		if not c and Z.Parent == t.Character and (W - Z.Position).Magnitude <= F then
			Z.CFrame = C
			Z.AssemblyLinearVelocity = Vector3.new(0.0, 0.0, 0.0)
			Z.AssemblyAngularVelocity = Vector3.new(0.0, 0.0, 0.0)
		end
		n()
	end)
	k.ActiveConnection = D
	TweenManager.currentTween = r
	TweenManager.currentPart = Z
	TweenManager.currentGoal = C
	TweenManager.TweenRunning = true
	getgenv().Tween = r
	if not coroutine.resume(D) then
		r:Cancel()
		return
	end
	return r
end

-- ===== SEA1 GATE: Sky2 <-> Sky3 | Xoáy Nước <-> Under City =====

function HoldDelay(key, toolName)
	local tool = t.Character and t.Character:FindFirstChild(toolName)
	local tip = tool and tool:IsA("Tool") and tool.ToolTip or ""
	return tonumber(Settings["Skill " .. tostring(key) .. " " .. tostring(tip)]) or 0.5
end

function Q(d)
	local I = {}
	for _, _ in pairs(game:GetService("Workspace"):WaitForChild("Enemies"):GetChildren()) do
		table.insert(I, _)
	end
	if d then
		for d, d in pairs(game:GetService("Workspace"):WaitForChild("Characters"):GetChildren()) do
			table.insert(I, d)
		end
	end
	return I
end

G = require(game:GetService("ReplicatedStorage").Mouse)

function I(_, o)
	local V, N = "Select Skills " .. _, {}
	for y, y in ipairs(o) do
		N[y] = false
	end
	EnsureAllTrueDefaults(V, o)
	_ = PrepareMultiSelectList(N, Settings[V], true)
	SelectSkillsSection.CreateDropdown(
		{ Title = V, List = _, Search = true, Selected = true, Default = Settings[V] or nil },
		function(_, o)
			SaveSettings(V, _, o)
		end
	)
end

H = require(game.ReplicatedStorage.Quests)

function B()
	local Z, C = t.Data.Level.Value, 0
	if Z >= 1450 and game.PlaceId == getgenv().CheckPlaceId2 then
		getgenv().NameMobQuest = "Water Fighter"
		getgenv().NameQuest = "ForgottenQuest"
		getgenv().IDQuest = 2
	elseif Z >= 700 and game.PlaceId == getgenv().CheckPlaceId3 then
		getgenv().NameMobQuest = "Galley Captain"
		getgenv().NameQuest = "FountainQuest"
		getgenv().IDQuest = 2
	else
		for J, F in pairs(H) do
			for q, c in pairs(F) do
				if not table.find(V, J) then
					local F = c.LevelReq
					for D, r in pairs(c.Task) do
						if Z >= F and F >= C and r > 1 then
							getgenv().NameMobQuest = D
							getgenv().NameQuest = J
							getgenv().IDQuest = q
							C = F
						end
					end
				end
			end
		end
	end
end

Z = require(game.ReplicatedStorage:WaitForChild("GuideModule"))

function B(C)
	local J = Z.Data.QuestData
	local F, q, c = J and (next(J.Task)), 0, {}
	for D, r in pairs(Z.Data.NPCList) do
		if not table.find(V, r.InternalQuestName) then
			for V, n in pairs(r.Levels) do
				D = H[r.InternalQuestName][V]
				if D then
					local u, W = next(D.Task)
					if W and W > 1 and n <= C and n >= q then
						c = {
							Level = n,
							Name = r.NPCName,
							QuestName = r.InternalQuestName,
							Pos = r.Position,
							Id = V,
							Mob = u,
						}
						if F == u and V > 1 then
							J = H[r.InternalQuestName][V - 1]
							if J and J.Task then
								for H, C in pairs(J.Task) do
									if H ~= F and C > 1 then
										c.Mob = H
										c.Id = V - 1
										break
									end
								end
							end
						end
						q = n
					end
				end
			end
		end
	end
	return c
end

V = { "Control-Control", "Buddha-Buddha", "Diamond-Diamond", "Falcon-Falcon" }

function H(B, C)
	local J = t.PlayerGui.Main.Skills[B]:FindFirstChild(C)
	if not J then
		return false
	end
	return J:IsA("Frame") and J.Title.TextColor3 == Color3.new(1, 1, 1) and J.Cooldown.Size == UDim2.new(0, 0, 1, -1)
		or J.Cooldown.Size == UDim2.new(1, 0, 1, -1)
end

function B(C)
	if H(C, "Z") then
		local H = game:GetService("VirtualInputManager")
		H:SendKeyEvent(true, "Z", false, game)
		H:SendKeyEvent(false, "Z", false, game)
	end
end

function H(C)
	local J = t.PlayerGui.Main.Skills[C.Name]
	if not J then
		return nil
	end
	for F, F in ipairs(J:GetChildren()) do
		if
			F:IsA("Frame")
			and F.Name ~= "Template"
			and (F.Name ~= "Z" or F.Name == "Z" and not table.find(V, C.Name))
			and Settings["Select Skills " .. C.ToolTip]
			and Settings["Select Skills " .. C.ToolTip][F.Name]
			and (
				F.Title.TextColor3 == Color3.new(1, 1, 1) and F.Cooldown.Size == UDim2.new(0, 0, 1, -1)
				or F.Cooldown.Size == UDim2.new(1, 0, 1, -1)
			)
		then
			return F.Name
		end
	end
end

function B()
	local C, J = {}, require(game:GetService("ReplicatedStorage"):WaitForChild("ItemReplicationService")).KEYS
	for F, F in V:GetItems(J.QUANTITY) do
		if F.Value and F.Value > 0 then
			local q, c = pcall(function()
				return H.match(F.ItemId):unwrap()
			end)
			if q and c and c.Display then
				local H, q = c.Display.Category, c.Index and c.Index.StorageKey
				local D, r =
					(function() if H == "Blox Fruit" then return q or c.Display.Name or "ItemId_" .. F.ItemId else return c.Display.Name or q or "ItemId_" .. F.ItemId end end)(),
					V:ReadItem(J.MASTERY, F.ItemId, F.NetworkedUID) or 0
				table.insert(
					C,
					{ Name = D, Type = H, Count = F.Value, Mastery = r, ItemId = F.ItemId, UID = F.NetworkedUID }
				)
			end
		end
	end
	return C
end

V = "https://raw.banana-hub.xyz/api"

function H(C, J)
	local J
	local F, F = pcall(function()
		J =
			ExploitReq({ Url = ("%s/data/recent?name=%s&limit=%s"):format(V, C, 100):gsub(" ", "%%20"), Method = "GET" })
	end)
	if F then
		return false
	end
	return J.Body
end

function GetPathFruit()
	local f, V, Y = next, game.Workspace:GetChildren()
	for H, H in f, V, Y do
		if (H:IsA("Tool") or (H:IsA("Model"))) and (string.find(H.Name, "Fruit")) and (H:FindFirstChild("Handle")) then
			return H
		end
	end
end

function GetPirateRaid(f)
	for V, V in ipairs(((function() if f then return game.ReplicatedStorage else return game.workspace.Enemies end end)()):GetChildren()) do
		if
			V:IsA("Model")
			and V.Name ~= "Oni2"
			and not string.find(V.Name, "Boss")
			and not string.find(V.Name, "Friend")
			and not string.find(V.Name, "Wraith")
			and V.Name ~= "rip_indra True Form"
			and (IsMobAlive(V))
			and (V.HumanoidRootPart.Position - Vector3.new(-5543, 313, -2964)).magnitude < 1000
		then
			return V
		end
	end
end

function DetectButtons()
	local f, V, Y = next, game:GetService("Workspace").Map["Boat Castle"].Summoner.Circle:GetChildren()
	for H, H in f, V, Y do
		if H:IsA("Part") and H.Part.BrickColor.Name ~= "Lime green" then
			return H
		end
	end
end

f = { "Winter Sky", "Pure Red", "Snow White" }

function IsMisisngLegHaki(V)
	V = V and {}
	local Y
	for H, H in pairs(CommF:InvokeServer("getColors")) do
		if table.find(f, H.HiddenName) and not H.Unlocked then
			if V then
				table.insert(V, H.HiddenName)
			else
				Y = (function() if not Y then return H.HiddenName else return Y .. ", " .. H.HiddenName end end)()
			end
		end
	end
	if V then
		return V
	end
	return Y
end

function TouchPadHaki()
	local f = DetectButtons()
	if f then
		if f.BrickColor.Name == "Hot pink" then
			game:GetService("ReplicatedStorage").Modules.Net
				:FindFirstChild("RF/FruitCustomizerRF")
				:InvokeServer(unpack({ [1] = { StorageName = "Winter Sky", Type = "AuraSkin", Context = "Equip" } }))
			toTarget(f.CFrame)
			wait(2)
		elseif f.BrickColor.Name == "Really red" then
			game:GetService("ReplicatedStorage").Modules.Net
				:FindFirstChild("RF/FruitCustomizerRF")
				:InvokeServer(unpack({ [1] = { StorageName = "Pure Red", Type = "AuraSkin", Context = "Equip" } }))
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Pure Red")
			toTarget(f.CFrame)
			wait(2)
		elseif f.BrickColor.Name == "Oyster" then
			game:GetService("ReplicatedStorage").Modules.Net
				:FindFirstChild("RF/FruitCustomizerRF")
				:InvokeServer(unpack({ [1] = { StorageName = "Snow White", Type = "AuraSkin", Context = "Equip" } }))
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Snow White")
			toTarget(f.CFrame)
			wait(2)
		end
	end
end

getgenv().CheckCountItem = function(f, V)
	local Y, H, C = next, B()
	for J, J in Y, H, C do
		if J.Name == f and J.Count and J.Count >= V then
			return true
		end
	end
	return false
end

function getbackpack()
	mybackpack = {}
	local f, V, Y = next, game.Players.LocalPlayer.Backpack:GetChildren()
	for H, H in f, V, Y do
		if H:IsA("Tool") and (table.find(whitelistedfruit, H.Name)) then
			table.insert(mybackpack, H.Name)
		end
	end
	f, Y, V = next, game.Players.LocalPlayer.Character:GetChildren()
	for H, H in f, Y, V do
		if H:IsA("Tool") and (table.find(whitelistedfruit, H.Name)) then
			table.insert(mybackpack, H.Name)
		end
	end
	return mybackpack
end

function CheckFruitplr()
	local f
	for V, V in pairs(t.Backpack:GetChildren()) do
		f = (function() if string.find(V.Name, "Fruit") then return V.Name else return f end end)()
	end
	for V, V in pairs(t.Character:GetChildren()) do
		f = (function() if string.find(V.Name, "Fruit") then return V.Name else return f end end)()
	end
	return f
end

function TakeFruitInventory(f)
	local V, Y, H = next, B()
	local C, J = 1 / 0
	for F, F in V, Y, H do
		if F.Type == "Blox Fruit" then
			if not f then
				for f, V in pairs(getgenv().tablefruitausea3) do
					if F.Name == f then
						if tonumber(V) < tonumber(C) then
							C, J = V, f
						end
					end
				end
			elseif not getgenv().tablefruitausea3[F.Name] then
				return F.Name
			end
		end
	end
	return J
end

function checkplatebarito()
	return ((game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate1.BrickColor
			== BrickColor.new("Sand yellow")) and "Plate1" or ((game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate2.BrickColor
				== BrickColor.new("Sand yellow")) and "Plate2" or ((game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate3.BrickColor
					== BrickColor.new("Sand yellow")) and "Plate3" or ((game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate4.BrickColor
						== BrickColor.new("Sand yellow")) and "Plate4" or ((game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate5.BrickColor
							== BrickColor.new("Sand yellow")) and "Plate5" or ((game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate6.BrickColor
								== BrickColor.new("Sand yellow")) and "Plate6" or ((game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate7.BrickColor
									== BrickColor.new("Sand yellow")) and "Plate7" or ((game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate8.BrickColor
										== BrickColor.new("Sand yellow")) and "Plate8" or nil))))))))
end

function AutoQuestBarito()
	if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 0 then
		if
			QuestHas("Swan Pirates")
			and (QuestHas("50"))
			and HasQuest()
		then
			local f, V = "Swan Pirate", DetectMob("Swan Pirate")
			if not V then
				if typeof(f) == "table" then
					if #N >= 11 then
						N = {}
						return
					end
					local Y = DetectPartSpawnMob(DetectNameTablePart(f))
					if Y then
						table.insert(N, DetectNameTablePart(f))
						repeat
							wait()
							toTarget(Y.CFrame * CFrame.new(0, 60, 0))
						until (Y.Position - t.Character.HumanoidRootPart.Position).Magnitude <= 100 or (DetectMob(f))
						wait(1)
					end
				else
					local Y = DetectPartSpawnMob(f, true)
					if Y then
						Instance.new("IntValue", Y).Name = "Ignored"
						repeat
							wait()
							toTarget(Y.CFrame * CFrame.new(0, 60, 0))
						until (Y.Position - t.Character.HumanoidRootPart.Position).Magnitude <= 100 or (DetectMob(f))
						wait(1)
					else
						DeleteIgnoredMobSpawn()
					end
				end
			else
				repeat
					task.wait()
					sizepart(V)
					BringMob(V)
					UsedualFlock()
					ClickM1(V)
					if Settings["Select Weapon"] == "Blox Fruit" then
						toTarget(V.HumanoidRootPart.CFrame * CFrame.new(-7, 20, 0))
					else
						toTarget(V.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
					end
				until not IsMobAlive(V)
			end
		elseif
			(t.Character.HumanoidRootPart.Position - CFrame.new(-456.28952, 73.0200958, 299.895966).Position).Magnitude
			> 8
		then
			toTarget(CFrame.new(-456.28952, 73.0200958, 299.895966))
		else
			game:GetService("ReplicatedStorage").Remotes.CommF_
				:InvokeServer(unpack({ [1] = "StartQuest", [2] = "BartiloQuest", [3] = 1 }))
		end
	elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 1 then
		local f = CheckNameBoss("Jeremy")
		if f then
			repeat
				task.wait()
				sizepart(f)
				UsedualFlock()
				ClickM1(f)
				if Settings["Select Weapon"] == "Blox Fruit" then
					toTarget(f.HumanoidRootPart.CFrame * CFrame.new(-7, 20, 0))
				else
					toTarget(f.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
				end
			until not IsMobAlive(f)
		end
	elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 2 then
		repeat
			task.wait()
			if (t.Character.HumanoidRootPart.Position - Vector3.new(-1835.65, 10.4325, 1679.75)).Magnitude > 100 then
				toTarget(CFrame.new(-1835.65, 10.4325, 1679.75))
			else
				t.Character.HumanoidRootPart.CFrame =
					game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()].CFrame
				task.wait()
				firetouchinterest(
					game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()],
					game.Players.LocalPlayer.Character.HumanoidRootPart,
					0
				)
				firetouchinterest(
					game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()],
					game.Players.LocalPlayer.Character.HumanoidRootPart,
					1
				)
			end
		until game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 3
	end
end

f = 0

function PathFindChest()
	local V, Y, H = next, game:GetService("Workspace")._WorldOrigin.PlayerSpawns.Pirates:GetChildren()
	for C, C in V, Y, H do
		if C:IsA("Model") and (C:FindFirstChild("Part")) and not C:FindFirstChild("Ignored") then
			return C
		end
	end
end

function GetNearestChest()
	local V, Y, H = next, game:GetService("CollectionService"):GetTagged("_ChestTagged")
	local C, J, F = 1 / 0
	for q, c in V, Y, H do
		if not c:GetAttribute("IsDisabled") and not c:FindFirstChild("Ignored") then
			q = t:DistanceFromCharacter(c.Position)
			if q < C then
				C, J, F = q, i, c
			end
		end
	end
	return F
end
-- [sync] helpers needed by the newer tab logic (copied from the full script)
BuyMeleeSecretForce = BuyMeleeSecretForce or false
function IsSecretQuestOn()
	return (Settings and Settings["Auto Secret Quest"]) or BuyMeleeSecretForce
end
function IsRepairHold()
	if not (Settings and Settings["Auto Repair Ur Ship"]) then
		return false
	end
	if tick() >= (getgenv().RepairShipHoldUntil or 0) then
		return false
	end
	local c = game:GetService("Players").LocalPlayer.Character
	local hum = c and c:FindFirstChildOfClass("Humanoid")
	return hum ~= nil and not hum.Sit
end
function BuddhaFarmOn()
	return Settings ~= nil
		and Settings["Use Buddha with farming"] == true
		and getgenv().FarmingTabActive == true
		and tick() - (getgenv().BuddhaBossAt or 0) > 1.5
		and not getgenv().BuddhaRemoteHold
end
function BuddhaFarmY()
	return BuddhaFarmOn() and 30 or 20
end
-- Tắt Phật (nếu đang biến) trước khi chạy remote tele. Không phụ thuộc toggle farm.
if type(BananaOwner) ~= "function" then BananaOwner = function() end end
if not getgenv().ClickWorldPos then
do
	local st = { pos = nil, tick = 0, running = false }

	local function screenOf(pos)
		local cam = workspace.CurrentCamera
		local v = cam:WorldToViewportPoint(pos)
		local vp = cam.ViewportSize
		if v.Z <= 0 or v.X < 0 or v.Y < 0 or v.X > vp.X or v.Y > vp.Y then
			cam.CFrame = CFrame.lookAt(cam.CFrame.Position, pos)
			v = cam:WorldToViewportPoint(pos)
		end
		local x = math.clamp(v.X, 1, vp.X - 1)
		local y = math.clamp(v.Y, 1, vp.Y - 1)
		if getgenv().ClickUseInset then
			y = y + game:GetService("GuiService"):GetGuiInset().Y
		end
		return x, y
	end

	getgenv().ClickWorldPos = function(pos)
		local now = tick()
		if now - (st.last or 0) < (getgenv().TreeClickInterval or 0.7) then
			return
		end
		st.last = now
		local x, y = screenOf(pos)
		if getgenv().DebugTreeClick then
			print("[TreeClick]", math.floor(x), math.floor(y))
		end
		local vim = game:GetService("VirtualInputManager")
		vim:SendMouseButtonEvent(x, y, 0, true, game, 1)
		vim:SendMouseButtonEvent(x, y, 0, false, game, 1)
	end
end
end
if not getgenv().ShootGunDS then
do
	local RS = game:GetService("ReplicatedStorage")
	local VIM = game:GetService("VirtualInputManager")
	local GuiService = game:GetService("GuiService")
	local lp = game:GetService("Players").LocalPlayer

	getgenv().ShootGunRange = getgenv().ShootGunRange or 500
	getgenv().ShootGunDelay = getgenv().ShootGunDelay or 0.02

	local function findNetRemote(name)
		local net = RS:FindFirstChild("Modules") and RS.Modules:FindFirstChild("Net")
		if not net then
			return
		end
		local r = net:FindFirstChild(name)
		if r then
			return r
		end
		for _, v in ipairs(net:GetDescendants()) do
			if v:IsA("RemoteEvent") and v.Name == name then
				return v
			end
		end
	end

	local function shootPart(m)
		if not m:IsA("Model") then
			return
		end
		local hum = m:FindFirstChildOfClass("Humanoid")
		if hum then
			if hum.Health <= 0 then
				return
			end
			return m:FindFirstChild("HumanoidRootPart") or m:FindFirstChild("Head")
		end
		local hv = m:FindFirstChild("Health")
		if hv and hv:IsA("ValueBase") and hv.Value <= 0 then
			return
		end
		local n = m.Name
		if n:find("Leviathan", 1, true) then
			if n == "Leviathan" and m:GetAttribute("Armored") then
				return
			end
			if n == "Leviathan Tail" and not m:GetAttribute("HealthEnabled") then
				return
			end
			return m:FindFirstChild("Hitbox11") or m:FindFirstChild("HumanoidRootPart") or m.PrimaryPart
		end
		if m:FindFirstChild("Engine") and hv then
			return m.Engine
		end
		if m:FindFirstChild("HealthBBG") then
			return m:FindFirstChild("HumanoidRootPart")
		end
	end

	getgenv().GetShootGunTarget = function(range)
		local char = lp.Character
		local root = char and char:FindFirstChild("HumanoidRootPart")
		if not root then
			return
		end
		local best, bd = nil, range or getgenv().ShootGunRange
		for _, folder in ipairs({ workspace:FindFirstChild("Enemies"), workspace:FindFirstChild("SeaBeasts") }) do
			if folder then
				for _, m in ipairs(folder:GetChildren()) do
					local part = shootPart(m)
					if part then
						local d = (root.Position - part.Position).Magnitude
						if d < bd then
							best, bd = part, d
						end
					end
				end
			end
		end
		return best
	end

	getgenv().ShootGunDS = function(part)
		if not part then
			return
		end
		local char = lp.Character
		if not (char and char:FindFirstChild("Dragonstorm")) then
			return
		end
		local ev = findNetRemote("RE/ShootGunEvent")
		if ev then
			pcall(function()
				ev:FireServer(part.Position, { part })
			end)
		end
		pcall(function()
			VIM:SendMouseButtonEvent(0, 0, 0, true, game, 1)
			VIM:SendMouseButtonEvent(0, 0, 0, false, game, 1)
		end)
	end

	-- Support: bắn bằng MỌI súng (ToolTip == "Gun"). Chỉ dùng cho Farm Mastery (Gun).
	-- Không tự trang bị súng. Trả về false nếu không có súng đang cầm / không có part.
	local CombatUtilSupport
	pcall(function()
		CombatUtilSupport = require(RS.Modules.CombatUtil)
	end)
	getgenv().ShootAllGun = function(part, gun)
		if not part then
			return false
		end
		local char = lp.Character
		if not char then
			return false
		end
		if not gun then
			for _, v in ipairs(char:GetChildren()) do
				if v:IsA("Tool") and v.ToolTip == "Gun" then
					gun = v
					break
				end
			end
		end
		if not gun or gun.Parent ~= char then
			return false
		end
		if CombatUtilSupport then
			local ok, reloading = pcall(function()
				return CombatUtilSupport:IsGunReloading(gun)
			end)
			if ok and reloading then
				return true
			end
		end
		if gun.Name == "Skull Guitar" then
			local re = gun:FindFirstChild("RemoteEvent")
			if re then
				pcall(function()
					re:FireServer("TAP", part.Position)
				end)
			end
			FireHumanoidTap(part.Position)
			return true
		end
		local ev = findNetRemote("RE/ShootGunEvent")
		if ev then
			pcall(function()
				ev:FireServer(part.Position, { part })
			end)
		end
		return true
	end
end
end
end
function __BF_GraftPage0()
FarmotherMain = Main.CreatePage({ Page_Name = "Farming Other", Page_Title = "Farming Other" })

do
	localPlayer = t or game.Players.LocalPlayer

	ToTarget = ToTarget or toTarget or getgenv().toTarget or function(cf)
		if type(toTarget) == "function" then
			return toTarget(cf)
		end
		if type(getgenv().BackupTween) == "function" then
			return getgenv().BackupTween(cf)
		end
	end

	SizePart = SizePart or sizepart
	if type(getgenv().ClickM1) == "function" then
		ClickM1 = getgenv().ClickM1
	end
	EquipTool = EquipTool or equiptool
	if type(UsedualFlock) ~= "function" and type(getgenv().UsedualFlock) == "function" then
		UsedualFlock = getgenv().UsedualFlock
	end

	Place_Id = Place_Id or {}
	Place_Id.sea1 = Place_Id.sea1 or function()
		return game.PlaceId == (getgenv().CheckPlaceId3 or 2753915549)
			or game.PlaceId == 2753915549
			or game.PlaceId == 85211729168715
	end
	Place_Id.sea2 = Place_Id.sea2 or function()
		return game.PlaceId == (getgenv().CheckPlaceId2 or 4442272183)
	end
	Place_Id.sea3 = Place_Id.sea3 or function()
		return game.PlaceId == (getgenv().CheckPlaceId or 7449423635)
	end

	VxezeNotify = VxezeNotify or function(title, desc, kind, extra)
		local text = tostring(title or "")
		if desc and tostring(desc) ~= "" then
			text = text .. ": " .. tostring(desc)
		end
		if A and A.CreateNoti then
			pcall(function()
				A.CreateNoti({ Title = "BananaCat - Secret Quest", Desc = text, ShowTime = (extra and extra.Duration) or 5 })
			end)
		else
			pcall(function()
				require(game:GetService("ReplicatedStorage").Notification)
					.new("<Color=Yellow>" .. text .. "<Color=/>")
					:Display()
			end)
		end
	end

	if type(GetInventoryItems) ~= "function" then
		GetInventoryItems = function()
			local ok, list = pcall(function()
				local IRS = require(game:GetService("ReplicatedStorage"):WaitForChild("ItemReplicationService"))
				local IC = require(game:GetService("ReplicatedStorage"):WaitForChild("ItemConfig"))
				local out = {}
				local keys = IRS.KEYS
				for _, item in IRS:GetItems(keys.QUANTITY) do
					if item.Value and item.Value > 0 then
						local ok2, cfg = pcall(function()
							return IC.match(item.ItemId):unwrap()
						end)
						if ok2 and cfg and cfg.Display then
							local cat = cfg.Display.Category
							local storage = cfg.Index and cfg.Index.StorageKey
							local name = (cat == "Blox Fruit") and (storage or cfg.Display.Name)
								or (cfg.Display.Name or storage or ("ItemId_" .. item.ItemId))
							local mastery = IRS:ReadItem(keys.MASTERY, item.ItemId, item.NetworkedUID) or 0
							table.insert(out, {
								Name = name,
								Type = cat,
								Count = item.Value,
								Mastery = mastery,
								ItemId = item.ItemId,
								UID = item.NetworkedUID,
							})
						end
					end
				end
				return out
			end)
			return ok and list or {}
		end
	end

	StopTweenNow = StopTweenNow or function()
		pcall(function()
			if TweenManager and TweenManager.CancelCurrent then
				TweenManager.CancelCurrent()
			elseif TweenManager and TweenManager.CancelTweenOnly then
				TweenManager.CancelTweenOnly()
			end
		end)
	end

	ReleaseTweenPhysics = ReleaseTweenPhysics or function()
		pcall(function()
			local c = localPlayer.Character
			local hrp = c and c:FindFirstChild("HumanoidRootPart")
			if hrp then
				hrp.Anchored = false
				local ff = hrp:FindFirstChild("FloatForce")
				if ff and not IsSecretQuestOn() then
					ff:Destroy()
				end
			end
		end)
	end

	EnforceGate = EnforceGate or function(_, name, ok, msg)
		if not ok then
			SaveSettings(name, false)
			VxezeNotify(name, msg or "Cannot enable", "warning")
			return false
		end
		return true
	end

	VxezeLog = VxezeLog or function(a, b)
		print("[SecretQuest]", tostring(a), tostring(b))
	end

	ReplicatedStorage = ReplicatedStorage or game:GetService("ReplicatedStorage")

	VirtualInputManager = VirtualInputManager or game:GetService("VirtualInputManager")
	NoclipChanged = NoclipChanged or setmetatable({}, { __mode = "k" })

	FormatMagnetTime = FormatMagnetTime or function(n)
		n = math.floor(tonumber(n) or 0)
		return string.format("%02d:%02d", math.floor(n / 60), n % 60)
	end

	SeaOnly = SeaOnly or function(label, title, seas)
		local cur = Place_Id.sea1() and 1 or Place_Id.sea2() and 2 or Place_Id.sea3() and 3 or 0
		for _, s in ipairs(seas) do
			if s == cur then
				return true
			end
		end
		local names = {}
		for _, s in ipairs(seas) do
			table.insert(names, "Sea " .. s)
		end
		if label and label.SetText then
			label.SetText(title .. " : Not in " .. (cur > 0 and ("Sea " .. cur) or "Unknown") .. ", go to " .. table.concat(names, " or "))
		end
		return false
	end
end


HiddenEventSection = FarmotherMain.CreateSection("Secret Quest")
StatusHiddenProgress = HiddenEventSection.CreateLabel({ Title = "Secret Quest : 0/39 Quests" })
StatusHiddenQuest = HiddenEventSection.CreateLabel({ Title = "Title Quest : ..." })
StatusHiddenStep = HiddenEventSection.CreateLabel({ Title = "Doing Quest : None" })
StatusHiddenBoss = HiddenEventSection.CreateLabel({ Title = "Title Awakened Boss : None" })


	HiddenEvent = {
		progress = {},
		checked = 0,
		current = nil,
		step = "Idle",
		handlers = {},
		skipped = {},
		lastNotify = {},
	}

	GetHiddenProgress = function(arg)
		local flag

		if arg then
			flag = arg
		else
			local checked = HiddenEvent.checked
			flag = os.clock() - checked > 15
		end

		if flag then
			HiddenEvent.checked = os.clock()

			local ok, result = pcall(function()
				return ReplicatedStorage.Modules.Net["RF/RequestBonusMomentReplication"]:InvokeServer({ Type = "GetMomentProgress" })
			end)

			if ok and type(result) == "table" and type(result.Data) == "table" then
				ReportHiddenDone(HiddenEvent.progress, result.Data)
				HiddenEvent.progress = result.Data
			end
		end

		return HiddenEvent.progress
	end

	ReportHiddenDone = function(arg, arg2)
		local done = 0

		for k, v6 in pairs(arg2) do
			if type(v6) == "table" and v6.Completed then
				done = done + (1)
				local flag = type(arg) == "table" and arg[k]

				if type(flag) == "table" and not flag.Completed then
					HiddenNotify((tostring(k):match("([^/]+)$") or tostring(k)) .. " completed", "done" .. tostring(k), "reward", { SubContent = done .. "/39 secret quests", Duration = 8 })
				end
			end
		end

		HiddenEvent.done = done
	end

	HiddenNotify = function(arg, key, arg2, arg3)
		key = key or arg
		if os.clock() - (HiddenEvent.lastNotify[key] or 0) < 20 then
			return
		end
		HiddenEvent.lastNotify[key] = os.clock()
		local tbl9 = arg3 or {}
		tbl9.Key = key
		VxezeNotify("Hidden Event", arg, arg2 or "info", tbl9)
	end

	SetHiddenStep = function(step)
		if step ~= HiddenEvent.step then
			local stepShape = tostring(step):gsub("%d+", "#")

			if stepShape ~= HiddenEvent.stepShape then
				HiddenEvent.stepShape = stepShape
				VxezeLog("Hidden", step)
			end
		end

		HiddenEvent.step = step
	end

	HiddenModules = setmetatable({}, { __index = function(arg, arg2)
		local handlers = {
			Controller = function()
				return require(ReplicatedStorage.Controllers.BonusMomentsController)
			end,
			Guide = function()
				return require(ReplicatedStorage.BonusMomentsGuide)
			end,
			Map = function()
				return require(ReplicatedStorage.Definitions.Map)
			end,
			NpcList = function()
				return require(ReplicatedStorage.NPCManager.NPCList)
			end,
			Dialogues = function()
				return require(ReplicatedStorage.DialoguesList)
			end,
			RegisterAttack = function()
				return ReplicatedStorage.Modules.Net:WaitForChild("RE/RegisterAttack")
			end,
			RegisterHit = function()
				return require(ReplicatedStorage.Modules.Net):RemoteEvent("RegisterHit", true)
			end,
		}

		local v6 = handlers[arg2] and handlers[arg2]()
		rawset(arg, arg2, v6)
		return v6
	end })

	GetHiddenIsland = function(arg)
		HiddenEvent.islands = HiddenEvent.islands or {}

		if HiddenEvent.islands[arg] == nil then
			local v6 = HiddenModules.Map.findCurrentMap()
			local v7 = pairs
			local islands = v6 and v6.Islands or {}

			for _, island in v7(islands) do
				if island.Index.Key == arg then
					HiddenEvent.islands[arg] = island
				end
			end
		end

		return HiddenEvent.islands[arg]
	end

	GetHiddenMoment = function(arg)
		return HiddenModules.Controller:GetLoadedMoments()[arg]
	end

	HiddenRelease = function()
		local anchored = HiddenEvent.anchored

		if anchored and anchored.Parent then
			anchored.Anchored = false
		end

		HiddenEvent.anchored = nil
	end

	HiddenMove = function(arg)
		HiddenRelease()

		if IsSecretQuestOn() then
			ToTarget(arg)
		end
	end

	HiddenGoTo = function(arg, arg2)
		if localPlayer:DistanceFromCharacter(arg) <= (arg2 or 8) then
			return true
		end
		HiddenMove(CFrame.new(arg))
		return false
	end

	HiddenGoToIsland = function(arg)
		local v6 = GetHiddenIsland(arg)
		if not v6 then
			return
		end
		SetHiddenStep("Travel to " .. arg)
		local position = v6.TeleportPoints[1].Position
		local v7 = nil

		for _, child in ipairs(workspace._WorldOrigin.Locations:GetChildren()) do
			if child.Name == v6.Reference.Location then
				local magnitude = (child.Position - v6.World.Position).Magnitude

				if not v7 or magnitude < v7 then
					position = child.Position
					v7 = magnitude
				end
			end
		end

		return HiddenGoTo(position + Vector3.new(0, 30, 0), 150)
	end

	HiddenHold = function(arg)
		local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return
		end

		if (humanoidRootPart.Position - arg.Position).Magnitude > 3 then
			HiddenMove(arg)
			return
		end

		if HiddenEvent.anchored ~= humanoidRootPart then
			humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
			humanoidRootPart.Anchored = true
			HiddenEvent.anchored = humanoidRootPart
		end

		HiddenEvent.holdTime = tick()
		TweenHoldUntil = tick() + 1
	end

	SweepHiddenTrigger = function(arg, arg2, arg3)
		HiddenRelease()
		local character = localPlayer.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		character = character and character:FindFirstChildOfClass("Humanoid")
		if not humanoidRootPart or not character then
			return
		end
		HiddenEvent.walking = true
		local floatForce = humanoidRootPart:FindFirstChild("FloatForce")
		local maxForce = floatForce and floatForce.MaxForce

		if floatForce then
			floatForce.MaxForce = Vector3.zero
		end

		for k in pairs(NoclipChanged) do
			if k.Parent then
				k.CanCollide = true
			end
		end

		table.clear(NoclipChanged)
		humanoidRootPart.CFrame = CFrame.new(arg2)
		humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
		task.wait(0.4)
		character:MoveTo(arg3)
		local now = tick()

		while true do local __brk = false repeat 
			task.wait(0.1)
			tbl3.LastCall = tick()
			TweenHoldUntil = tick() + 1
			if not ((humanoidRootPart.Position - arg3).Magnitude < 6 or tick() - now > 6 or not humanoidRootPart.Parent) then
				break
			end
			__brk = true break
		until true if __brk then break end end

		if floatForce and floatForce.Parent then
			floatForce.MaxForce = maxForce
		end

		HiddenEvent.walking = false
	end

	HiddenDialoguePriority = {
		"not this time",
		"help hasan",
		"return the hat",
		"you're welcome",
		"hand over",
		"claim",
		"reward",
		"i'll get it",
		"accept",
		"let's go",
		"start",
		"yes",
		"sure",
		"okay",
		"go on",
		"continue",
		"so go get it back",
	}

	HiddenDialogueAvoid = {
		"walk away",
		"leave",
		"nevermind",
		"never mind",
		"not now",
		"maybe later",
		"no thanks",
		"no, ",
		"cancel",
		"skip",
		"bye",
		"goodbye",
		"forget it",
		"i'll pass",
		"decline",
		"quit",
		"exit",
		"stop",
	}

	PickHiddenDialogue = function(arg)
		local DialogueController = require(ReplicatedStorage.DialogueController)
		if not DialogueController.Active then
			return false
		end
		local ok, result = pcall(DialogueController.getActiveDialogue)
		ok = ok and result and result._pageStack and result._pageStack[#result._pageStack]
		if not ok then
			return false
		end
		local options2 = ok._options or {}
		if #options2 == 0 then
			pcall(DialogueController.advance)
			return false
		end
		local v6 = ipairs
		arg = arg or {}

		for _, v7 in v6(arg) do
			for _, v8 in ipairs(options2) do
				if string.find(string.lower(type(v8._text) == "table" and table.concat(v8._text, " ") or tostring(v8._text)), string.lower(v7), 1, true) then
					pcall(DialogueController.select, v8)
					return true
				end
			end
		end

		return false
	end

	AutoHiddenDialogue = function()
		if tick() < (HiddenEvent.talking or 0) then
			HiddenEvent.strayDialogue = nil
			return
		end

		if PickHiddenDialogue(HiddenDialoguePriority) then
			HiddenEvent.strayDialogue = nil
			return
		end
		local DialogueController = require(ReplicatedStorage.DialogueController)
		local ok, result = pcall(DialogueController.getActiveDialogue)
		local pageStack = DialogueController.Active and ok and result and result._pageStack and result._pageStack[#result._pageStack]

		if pageStack then
			pageStack = #(pageStack._options or {}) > 0
		end

		if pageStack then
			pageStack = tick() > (HiddenEvent.dialogueBusy or 0)
		end

		if pageStack then
			HiddenEvent.strayDialogue = HiddenEvent.strayDialogue or tick()
			local strayDialogue = HiddenEvent.strayDialogue

			if tick() - strayDialogue > 1.5 then
				HiddenEvent.strayDialogue = nil
				pcall(DialogueController.close)
			end
		else
			HiddenEvent.strayDialogue = nil
		end
	end

	HiddenDialogueLoop = function()
		while IsSecretQuestOn() do
			pcall(AutoHiddenDialogue)
			task.wait(0.4)
		end
	end

	HiddenMaterialMobs = {
		["Yeti Fur"] = { mobs = { "Snow Bandit", "Snowman" }, center = Vector3.new(1350, 60, -1300) },
		Leather = { mobs = { "Brute", "Pirate" }, center = Vector3.new(-1436, 28, 4357) },
		["Scrap Metal"] = { mobs = { "Brute", "Pirate" }, center = Vector3.new(-1436, 28, 4357) },
		["Magma Ore"] = { mobs = { "Military Soldier", "Military Spy" }, center = Vector3.new(-5300, 20, 8500) },
		["Angel Wings"] = { mobs = { "Royal Soldier", "Royal Squad" }, center = Vector3.new(-7030, 5545, 1120) },
		["Fish Tail"] = { mobs = { "Fishman Warrior", "Fishman Commando" }, center = Vector3.new(61000, 23, 1300) },
	}

	CountHiddenMaterial = function(arg)
		local v6, v7, v8 = ipairs(GetInventoryItems() or {})
		local n = 0

		for _, v9 in v6, v7, v8 do
			if tostring(v9.Name) == arg then
				n = tonumber(v9.Count) or tonumber(v9.Amount) or 1
			end
		end

		return n
	end

	FarmHiddenMaterial = function(arg, arg2)
		local v6 = HiddenMaterialMobs[arg]
		if not v6 then
			return
		end
		arg2 = arg2 or 1
		local now = tick()
		local now2 = tick()
		local str2

		while true do local __brk = false repeat 
			local v7 = FindHiddenEnemy(v6.mobs, v6.center, 1500)

			if not v7 then
				HiddenGoTo(v6.center, 120)
				str2 = "Look for " .. v6.mobs[1] .. " to farm " .. arg
				task.wait(0.2)
			else
				str2 = "Farm " .. arg .. " from " .. v7.Name
				HiddenEvent.stallGrace = tick() + 20
				SizePart(v7)
				BringMob(v7)
				UsedualFlock()
				HiddenMove(GetHiddenFarmCFrame(v7))
				getgenv().ClickM1(v7, true)
				task.wait()
			end

			local flag

			if tick() - now2 > 4 then
				local now3 = tick()

				if not (arg2 <= CountHiddenMaterial(arg)) then
					now2 = now3
					flag = tick() - now > 45 or not IsSecretQuestOn()

					if flag then
						__brk = true break
					else
						break
					end
				end
			else
				flag = tick() - now > 45 or not IsSecretQuestOn()

				if flag then
					__brk = true break
				else
					break
				end
			end

			__brk = true break
		until true if __brk then break end end

		return str2
	end

	FindHiddenWaterSpot = function()
		local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return
		end
		local GetWaterHeightAtLocation = require(ReplicatedStorage.Util.GetWaterHeightAtLocation)
		local raycastParams = RaycastParams.new()
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude
		raycastParams.FilterDescendantsInstances = { localPlayer.Character, workspace.Characters, workspace.Enemies }

		local function fn(arg)
			local ok, result = pcall(GetWaterHeightAtLocation, arg)
			return ok and tonumber(result)
		end

		local function fn2(arg, arg2)
			local hit = workspace:Raycast(Vector3.new(arg.X, arg2 + 200, arg.Z), Vector3.new(0, -500, 0), raycastParams)
			return hit and hit.Position or nil
		end

		for i_ = 15, 400, 15 do
			for i_2 = 0, 11 do
				local v6 = math.rad(i_2 * 30)
				local sin = math.sin
				local vector = Vector3.new(math.cos(v6), 0, sin(v6))
				local n = humanoidRootPart.Position + vector * i_
				local v7 = fn(n)

				if v7 then
					local v8 = fn2(n, v7)

					if v8 and v8.Y >= v7 - 1 then
						local n3 = n + vector * 14
						local v9 = fn(n3)
						local v10 = v9 and fn2(n3, v9)
						if v9 and (not v10 or v10.Y < v9 - 2) then
							return Vector3.new(v8.X, v8.Y + 3, v8.Z), Vector3.new(n3.X, v9, n3.Z)
						end
					end
				end
			end
		end
	end

	TalkFishermanDialogue = function(arg, arg2, arg3)
		local DialogueController = require(ReplicatedStorage.DialogueController)
		HiddenEvent.dialogueBusy = tick() + (arg3 or 20) + 4
		pcall(DialogueController.close)
		task.wait(0.4)
		local fisherman = HiddenModules.NpcList.List.Fisherman
		if not fisherman then
			return false
		end
		local ok, result = pcall(fisherman.DialogueCallback)
		if not ok or not result then
			return false
		end
		task.spawn(pcall, DialogueController.start, result)
		local now = tick()
		local n = 1

		while true do local __brk = false repeat 
			task.wait(0.4)
			local ok2, result2 = pcall(DialogueController.getActiveDialogue)
			local pageStack = ok2 and result2 and result2._pageStack and result2._pageStack[#result2._pageStack]

			if pageStack then
				local options2 = pageStack._options or {}

				if #options2 == 0 then
					pcall(DialogueController.advance)
				else
					local v6 = nil

					for _, v7 in ipairs(options2) do
						local v8 = string.lower(type(v7._text) == "table" and table.concat(v7._text, " ") or tostring(v7._text))
						local v9 = ipairs
						local tbl9 = arg or {}

						for _, v10 in v9(tbl9) do
							if not v6 and string.find(v8, string.lower(v10), 1, true) then
								v6 = v7
							end
						end
					end

					pcall(DialogueController.select, v6 or options
