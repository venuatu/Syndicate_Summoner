SynSummoner = {}
SynSummoner.Raid = {}
SynSummoner.DefaultMessage = 'damn, %t is lazy, click for them'
SynSummoner.BakedWords = {
	["123"] = 1,
	["1"] = 1,
	["inv"] = 1,
	["summon plz"] = 1,
	["summon"] = 1,
	["sum"] = 1,
	["summ"] = 1,
}
SynSummoner.TriggerWords = { }
SynSummoner.ZoneWords = {
    ['Booty Bay'] = {'bb', 'bootybay', 'stv',},
    ['Dire Maul'] = {'dm', 'dmt', 'trib', 'tribute', 'diremaul',},
    ['Felwood'] = {'fel', 'sf', 'songflower', 'song',},
    ['Gates of Ahn\'Qiraj'] = {'aq', 'aq40', 'aq20', 'ahnqiraj', 'sili'},
    ['Orgrimmar'] = {'org'},
    ['Stormwind City'] = {'sw'},
    ['Plaguewood'] = {'epl', 'nax', 'naxx', 'naxxramas', 'pl'},
    ['Westfall'] = {'wf', 'sent', 'sentinelhill'},
}
SynSummoner.SentSummons = {}
SynSummoner.Guildies = {}
SynSummoner.MESSAGE_PREFIX = "synsum"
SynSummoner.MESSAGE_INV_TEXT = "syndicate is the best"
function SynSummoner.MakeFrame()
	SynSummoner.LootFrame = {}
	SynSummoner.LootFrame = CreateFrame("frame", "SynSummonerLootFrame", UIParent)
	SynSummoner.LootFrame:SetWidth(1)
	SynSummoner.LootFrame:SetHeight(1)
	SynSummoner.LootFrame:SetMovable(true)
	SynSummoner.LootFrame:EnableMouse(true)
	SynSummoner.LootFrame:SetFrameStrata("LOW")
	--SynSummoner.LootFrame:Hide()
	SynSummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, 0)
	SynSummoner.LootFrame:SetScript("OnMouseDown", function(self, button)
		if button == "LeftButton" then
			SynSummoner.LootFrame:StartMoving();
			SynSummoner.LootFrame.isMoving = true;
		end
	end)
	SynSummoner.LootFrame:SetScript("OnMouseUp", function(self, button)
		if button == "LeftButton" and SynSummoner.LootFrame.isMoving then
			SynSummoner.LootFrame:StopMovingOrSizing();
			SynSummoner.LootFrame.isMoving = false;
			SynSummon1.Left = SynSummoner.LootFrame:GetLeft()
			SynSummon1.Top = SynSummoner.LootFrame:GetTop() - GetScreenHeight()
			SynSummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", SynSummon1.Left, SynSummon1.Top)
		end
	end)
	SynSummoner.LootFrame:SetScript("OnHide", function(self)
		if ( SynSummoner.LootFrame.isMoving ) then
			SynSummoner.LootFrame:StopMovingOrSizing();
			SynSummoner.LootFrame.isMoving = false;
			SynSummon1.Left = SynSummoner.LootFrame:GetLeft()
			SynSummon1.Top = SynSummoner.LootFrame:GetTop() - GetScreenHeight()
			SynSummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", SynSummon1.Left, SynSummon1.Top)
		end
	end)
	SynSummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", SynSummon1.Left, SynSummon1.Top)

	SynSummoner.LootFrame["TopGuildFrame"] = CreateFrame("frame", "LootPasserTopFrame", SynSummoner.LootFrame)
	SynSummoner.LootFrame["TopGuildFrame"]:SetWidth(100)
	SynSummoner.LootFrame["TopGuildFrame"]:SetHeight(70)
	SynSummoner.LootFrame["TopGuildFrame"]:SetPoint("TOPLEFT", SynSummoner.LootFrame, "TOPLEFT",0,0)
	SynSummoner.LootFrame["TopGuildFrame"]:SetScale(1)
	SynSummoner.LootFrame["TopGuildFrame"]:SetBackdrop( {
			bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
			tile = true, tileSize = 5, edgeSize = 15, insets = { left = 1, right = 1, top = 1, bottom = 1 }
		});
	SynSummoner.LootFrame["TopGuildFrame"]:SetMovable(true)
	SynSummoner.LootFrame["TopGuildFrame"]:EnableMouse(true)
		SynSummoner.LootFrame["TopGuildFrame"]:SetScript("OnMouseDown", function(self, button)
		if button == "LeftButton" then
			SynSummoner.LootFrame:StartMoving();
			SynSummoner.LootFrame.isMoving = true;
		end
	end)
	SynSummoner.LootFrame["TopGuildFrame"]:SetScript("OnMouseUp", function(self, button)
		if button == "LeftButton" and SynSummoner.LootFrame.isMoving then
			SynSummoner.LootFrame:StopMovingOrSizing();
			SynSummoner.LootFrame.isMoving = false;
			SynSummon1.Left = SynSummoner.LootFrame:GetLeft()
			SynSummon1.Top = SynSummoner.LootFrame:GetTop() - GetScreenHeight()
			SynSummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", SynSummon1.Left, SynSummon1.Top)
		end
	end)
	SynSummoner.LootFrame["TopGuildFrame"]:SetScript("OnHide", function(self)
		if ( SynSummoner.LootFrame.isMoving ) then
			SynSummoner.LootFrame:StopMovingOrSizing();
			SynSummoner.LootFrame.isMoving = false;
			SynSummon1.Left = SynSummoner.LootFrame:GetLeft()
			SynSummon1.Top = SynSummoner.LootFrame:GetTop() - GetScreenHeight()
			SynSummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", SynSummon1.Left, SynSummon1.Top)
		end
	end)

	SynSummoner.LootFrame.TopGuildFrame.Button2 = CreateFrame("Button", "CRI_InvButtsaon2", SynSummoner.LootFrame.TopGuildFrame)
	SynSummoner.LootFrame.TopGuildFrame.Button2:SetPoint("TOPRIGHT",SynSummoner.LootFrame.TopGuildFrame,"TOPRIGHT",0,10)
	SynSummoner.LootFrame.TopGuildFrame.Button2:SetWidth(35)
	SynSummoner.LootFrame.TopGuildFrame.Button2:SetHeight(20)
	SynSummoner.LootFrame.TopGuildFrame.Button2:SetText("Clear")
	SynSummoner.LootFrame.TopGuildFrame.Button2:SetParent(SynSummoner.LootFrame.TopGuildFrame)
	SynSummoner.LootFrame.TopGuildFrame.Button2:SetNormalFontObject("GameFontNormal")
	SynSummoner.LootFrame.TopGuildFrame.Button2ntex = SynSummoner.LootFrame.TopGuildFrame.Button2:CreateTexture()
	SynSummoner.LootFrame.TopGuildFrame.Button2ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
	SynSummoner.LootFrame.TopGuildFrame.Button2ntex:SetTexCoord(0, 0.625, 0, 0.6875)
	SynSummoner.LootFrame.TopGuildFrame.Button2ntex:SetAllPoints()
	SynSummoner.LootFrame.TopGuildFrame.Button2:SetNormalTexture(SynSummoner.LootFrame.TopGuildFrame.Button2ntex)
	SynSummoner.LootFrame.TopGuildFrame.Button2pdis = SynSummoner.LootFrame.TopGuildFrame.Button2:CreateTexture()
	SynSummoner.LootFrame.TopGuildFrame.Button2pdis:SetTexture("Interface/Buttons/UI-Panel-Button-Disabled")
	SynSummoner.LootFrame.TopGuildFrame.Button2pdis:SetTexCoord(0, 0.625, 0, 0.6875)
	SynSummoner.LootFrame.TopGuildFrame.Button2pdis:SetAllPoints()
	SynSummoner.LootFrame.TopGuildFrame.Button2:SetDisabledTexture(SynSummoner.LootFrame.TopGuildFrame.Button2pdis)
	SynSummoner.LootFrame.TopGuildFrame.Button2htex = SynSummoner.LootFrame.TopGuildFrame.Button2:CreateTexture()
	SynSummoner.LootFrame.TopGuildFrame.Button2htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
	SynSummoner.LootFrame.TopGuildFrame.Button2htex:SetTexCoord(0, 0.625, 0, 0.6875)
	SynSummoner.LootFrame.TopGuildFrame.Button2htex:SetAllPoints()
	SynSummoner.LootFrame.TopGuildFrame.Button2:SetHighlightTexture(SynSummoner.LootFrame.TopGuildFrame.Button2htex)
	SynSummoner.LootFrame.TopGuildFrame.Button2ptex = SynSummoner.LootFrame.TopGuildFrame.Button2:CreateTexture()
	SynSummoner.LootFrame.TopGuildFrame.Button2ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
	SynSummoner.LootFrame.TopGuildFrame.Button2ptex:SetTexCoord(0, 0.625, 0, 0.6875)
	SynSummoner.LootFrame.TopGuildFrame.Button2ptex:SetAllPoints()
	SynSummoner.LootFrame.TopGuildFrame.Button2:SetPushedTexture(SynSummoner.LootFrame.TopGuildFrame.Button2ptex)
	SynSummoner.LootFrame.TopGuildFrame.Button2:SetScript("OnClick", function(self, arg1)
		SynSummoner.whotosummon = nil
		SynSummoner.CheckRaid()
	end)



	for h=1, 20 do
		SynSummoner.LootFrame.TopGuildFrame[h] = {}
		SynSummoner.LootFrame.TopGuildFrame[h].Button = CreateFrame("Button", "ConsmyButtonzz"..h, SynSummoner.LootFrame.TopGuildFrame, "SecureActionButtonTemplate");
		SynSummoner.LootFrame.TopGuildFrame[h].Button:SetPoint("TOPRIGHT",SynSummoner.LootFrame.TopGuildFrame,"TOPRIGHT",-10,-((h*25)-15))
		SynSummoner.LootFrame.TopGuildFrame[h].Button:SetWidth(80)
		SynSummoner.LootFrame.TopGuildFrame[h].Button:SetHeight(25)
		SynSummoner.LootFrame.TopGuildFrame[h].Button:SetText("Zyrreal")
		SynSummoner.LootFrame.TopGuildFrame[h].Button:SetNormalFontObject("GameFontNormal")
		SynSummoner.LootFrame.TopGuildFrame[h].Buttonntex = SynSummoner.LootFrame.TopGuildFrame[h].Button:CreateTexture()
		SynSummoner.LootFrame.TopGuildFrame[h].Buttonntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
		SynSummoner.LootFrame.TopGuildFrame[h].Buttonntex:SetTexCoord(0, 0.625, 0, 0.6875)
		SynSummoner.LootFrame.TopGuildFrame[h].Buttonntex:SetAllPoints()
		SynSummoner.LootFrame.TopGuildFrame[h].Button:SetNormalTexture(SynSummoner.LootFrame.TopGuildFrame[h].Buttonntex)
		SynSummoner.LootFrame.TopGuildFrame[h].Buttonhtex = SynSummoner.LootFrame.TopGuildFrame[h].Button:CreateTexture()
		SynSummoner.LootFrame.TopGuildFrame[h].Buttonhtex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		SynSummoner.LootFrame.TopGuildFrame[h].Buttonhtex:SetTexCoord(0, 0.625, 0, 0.6875)
		SynSummoner.LootFrame.TopGuildFrame[h].Buttonhtex:SetAllPoints()
		SynSummoner.LootFrame.TopGuildFrame[h].Button:SetHighlightTexture(SynSummoner.LootFrame.TopGuildFrame[h].Buttonhtex)
		SynSummoner.LootFrame.TopGuildFrame[h].Buttonptex = SynSummoner.LootFrame.TopGuildFrame[h].Button:CreateTexture()
		SynSummoner.LootFrame.TopGuildFrame[h].Buttonptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
		SynSummoner.LootFrame.TopGuildFrame[h].Buttonptex:SetTexCoord(0, 0.625, 0, 0.6875)
		SynSummoner.LootFrame.TopGuildFrame[h].Buttonptex:SetAllPoints()
		SynSummoner.LootFrame.TopGuildFrame[h].Buttonpdis = SynSummoner.LootFrame.TopGuildFrame[h].Button:CreateTexture()
		SynSummoner.LootFrame.TopGuildFrame[h].Buttonpdis:SetTexture("Interface/Buttons/UI-Panel-Button-Disabled")
		SynSummoner.LootFrame.TopGuildFrame[h].Buttonpdis:SetTexCoord(0, 0.625, 0, 0.6875)
		SynSummoner.LootFrame.TopGuildFrame[h].Buttonpdis:SetAllPoints()
		SynSummoner.LootFrame.TopGuildFrame[h].Button:SetDisabledTexture(SynSummoner.LootFrame.TopGuildFrame[h].Buttonpdis)
		SynSummoner.LootFrame.TopGuildFrame[h].Button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		SynSummoner.LootFrame.TopGuildFrame[h].Button:SetPushedTexture(SynSummoner.LootFrame.TopGuildFrame[h].Buttonptex)
		SynSummoner.LootFrame.TopGuildFrame[h].Button:SetAttribute("type1", "macro");
		SynSummoner.LootFrame.TopGuildFrame[h].Button:SetAttribute("macrotext", "/target party1 \n/cast Ritual of Summoning")
		SynSummoner.LootFrame["TopGuildFrame"]:SetHeight(20+h*25)



		SynSummoner.LootFrame.TopGuildFrame[h].Time = CreateFrame("frame", "LootPasserTopFramett"..h, SynSummoner.LootFrame.TopGuildFrame)
		SynSummoner.LootFrame.TopGuildFrame[h].Time:SetWidth(50)
		SynSummoner.LootFrame.TopGuildFrame[h].Time:SetHeight(25)
		SynSummoner.LootFrame.TopGuildFrame[h].Time:SetPoint("TOPLEFT", SynSummoner.LootFrame.TopGuildFrame, "TOPRIGHT",0,-((h*25)-15))
		SynSummoner.LootFrame.TopGuildFrame[h].Time:SetBackdrop( {
				bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
				edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
				tile = true, tileSize = 5, edgeSize = 15, insets = { left = 1, right = 1, top = 1, bottom = 1 }
			});
		SynSummoner.LootFrame.TopGuildFrame[h].Time:SetMovable(true)
		SynSummoner.LootFrame.TopGuildFrame[h].Time:EnableMouse(true)
			SynSummoner.LootFrame.TopGuildFrame[h].Time:SetScript("OnMouseDown", function(self, button)
			if button == "LeftButton" then
				SynSummoner.LootFrame:StartMoving();
				SynSummoner.LootFrame.isMoving = true;
			end
		end)
		SynSummoner.LootFrame.TopGuildFrame[h].Time:SetScript("OnMouseUp", function(self, button)
			if button == "LeftButton" and SynSummoner.LootFrame.isMoving then
				SynSummoner.LootFrame:StopMovingOrSizing();
				SynSummoner.LootFrame.isMoving = false;
				SynSummon1.Left = SynSummoner.LootFrame:GetLeft()
				SynSummon1.Top = SynSummoner.LootFrame:GetTop() - GetScreenHeight()
				SynSummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", SynSummon1.Left, SynSummon1.Top)
			end
		end)
		SynSummoner.LootFrame.TopGuildFrame[h].Time:SetScript("OnHide", function(self)
			if ( SynSummoner.LootFrame.isMoving ) then
				SynSummoner.LootFrame:StopMovingOrSizing();
				SynSummoner.LootFrame.isMoving = false;
				SynSummon1.Left = SynSummoner.LootFrame:GetLeft()
				SynSummon1.Top = SynSummoner.LootFrame:GetTop() - GetScreenHeight()
				SynSummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", SynSummon1.Left, SynSummon1.Top)
			end
		end)
		SynSummoner.LootFrame.TopGuildFrame[h].Time["FS"] = SynSummoner.LootFrame.TopGuildFrame[h].Time:CreateFontString("ConsLootS1TGFss"..h,"ARTWORK", "ChatFontNormal")
		SynSummoner.LootFrame.TopGuildFrame[h].Time["FS"]:SetParent(SynSummoner.LootFrame.TopGuildFrame[h].Time)
		SynSummoner.LootFrame.TopGuildFrame[h].Time["FS"]:SetPoint("TOP",SynSummoner.LootFrame.TopGuildFrame[h].Time,"TOP",0,0)
		SynSummoner.LootFrame.TopGuildFrame[h].Time["FS"]:SetWidth(150)
		SynSummoner.LootFrame.TopGuildFrame[h].Time["FS"]:SetHeight(25)
		SynSummoner.LootFrame.TopGuildFrame[h].Time["FS"]:SetJustifyH("CENTER")
		SynSummoner.LootFrame.TopGuildFrame[h].Time["FS"]:SetFontObject("GameFontNormalSmall")
		SynSummoner.LootFrame.TopGuildFrame[h].Time["FS"]:SetText("time")

	end

end
function SynSummoner.CheckRange()
	for k, _ in pairs(SynSummoner.whotosummon) do
		if (IsSpellInRange("Unending Breath", k) == 1) then
			SynSummoner.whotosummon[k] = nil
		end
	end
	local sddssd = 0
	for _, _ in pairs(SynSummoner.whotosummon) do
		sddssd = 1
	end
	if (sddssd == 0) then
		SynSummoner.whotosummon = nil
	end
end
function SynSummoner:strconcat(...)
	local str = ''
	local args = {...}
	for i = 1, #args do
		str = str .. tostring(args[i])
	end
	return str
end
function SynSummoner:strjoin(arr, sep)
	local str = ''
	local len = #arr

	for i, s in ipairs(arr) do
		str = str .. tostring(s)
		if i ~= len then
			str = str .. sep
		end
	end
	return str
end
function SynSummoner:SendMessageGroup(...)
	local words = SynSummoner:strconcat(...)
	-- words = "Big" words
	if IsInRaid() then
		SendChatMessage(words, "RAID")
	elseif IsInGroup() then
		SendChatMessage(words, "PARTY")
	else--for solo raid
	--     SendChatMessage(words, "SAY")
		print(words)
	end
end
function SynSummoner:NotifySummon(name)
	if not self:UnitInGroup(name) then
		InviteUnit(name)
	end
	SynSummoner:SendMessageGroup(SynSummon1.Message)
	SynSummoner.SentSummons[name] = (SynSummoner.SentSummons[name] or 0) + 1
end
function SynSummoner.CheckRaid()
	for h=1, 20 do
		SynSummoner.LootFrame.TopGuildFrame[h].Button:Hide()
		SynSummoner.LootFrame.TopGuildFrame[h].Time:Hide()
		SynSummoner.LootFrame.TopGuildFrame[h].Button:Enable()
	end
	SynSummoner.LootFrame.TopGuildFrame.Button2:Enable()
	if (SynSummoner.whotosummon) then
		local count = 0
		local now = GetTime()
		local times = {}
		local names_by_times = {}
		for name, dur in pairs(SynSummoner.whotosummon) do
			table.insert(times, dur)
			names_by_times[dur] = name
		end
		local onlines = {}
		for i = 1, 40 do
			local name, _, _, _, _, _, _, online, dead = GetRaidRosterInfo(i)
			if name then
				onlines[name] = online == true and dead ~= true
			end
		end

		table.sort(times)

		for _, start in ipairs(times) do
			local name = names_by_times[start]
			if onlines[name] then
				local elapsed = now - start
				count = count + 1
				local frame = SynSummoner.LootFrame.TopGuildFrame[count]
				frame.Button:SetText(name)
				frame.Button:Show()
				local sent = SynSummoner.SentSummons[name] or 0
				frame.Time["FS"]:SetText(string.format(SecondsToTime(elapsed) .. ' #'..sent))
				local strwd = frame.Time["FS"]:GetStringWidth()
				frame.Time:SetWidth(strwd+10)
				frame.Time:Show()
				frame.Button:SetAttribute("type1", "macro");
				frame.Button:SetAttribute("macrotext", "/target "..name.."\n/script SynSummoner:NotifySummon('"..name.."')\n/cast Ritual of Summoning")
			end
		end
		SynSummoner.LootFrame["TopGuildFrame"]:SetHeight(20+count*25)
		SynSummoner.LootFrame:Show()
	else
		SynSummoner.LootFrame:Hide()
	end
end
function SynSummoner.pairsByKeys (t, f)
	local a = {}
	for n in pairs(t) do table.insert(a, n) end
	table.sort(a, f)
	local i = 0      -- iterator variable
	local iter = function ()   -- iterator function
		i = i + 1
		if a[i] == nil then return nil
		else return a[i], t[a[i]]
		end
	 end
	 return iter
end
function SynSummoner:starts_with(str, start)
   return str:sub(1, #start) == start
end
function SynSummoner:ends_with(str, ending)
   return ending == "" or str:sub(-#ending) == ending
end
function SynSummoner:strtok(word, ch)
  local toks = {}
  local i
  local j = 0
  while j ~= nil do
	local start = j and j + 1 or 0
	i, j = word:find(ch, start)
	if i == nil then
	  i = #word + 1
	end
	local str = word:sub(start, i - 1)
	table.insert(toks, str)
	-- print(str .. ',' .. tostring(i) .. ',' .. tostring(j))
  end
  return toks
end
function SynSummoner:GuildSpam(forced)
	local words = {}
	local found = false
	self.TriggerWords = {}
	for _, x in ipairs({GetSubZoneText(), GetZoneText()}) do
		for _, y in ipairs(self.ZoneWords[x] or {}) do
			if not self.TriggerWords[y] then
				self.TriggerWords[y] = 1
				table.insert(words, y)
				found = true
			end
		end
		for _, y in ipairs(self:strtok(x:lower(), " ")) do
			if y ~= '' and not self.TriggerWords[y] then
				self.TriggerWords[y] = 1
				table.insert(words, y)
			end
		end
	end
	if found and (forced or self:CanDefaultInvite()) then
		local zone = (GetSubZoneText() ~= '' and GetSubZoneText() ~= GetZoneText() and (GetSubZoneText() .. '/') or '') .. GetZoneText()
		local text = 'whisper or gchat for summon to ' .. zone .. ': '
		table.sort(words)
		local words_str = SynSummoner:strjoin(words, '/')
		SendChatMessage(text .. words_str, "GUILD")
	end
	return found
end
function SynSummoner:CanDefaultInvite()
	if SynSummon1.ForceInvite ~= nil then
		return SynSummon1.ForceInvite
	end
	local level = UnitLevel('player')
	return (level >= 20 and level < 44)
end
function SynSummoner:CanEnable(skip_zone)
	local cls, _ = UnitClass("player")
	local level = UnitLevel('player')
	return (skip_zone or SynSummoner:GuildSpam()) and (level <= 5 or (cls == "Warlock" and level >= 20))
end
function SynSummoner:Initialise()
	if self.INITIALISED then
		return
	end
	self.INITIALISED = true

	if not self:CanEnable(true) then
		return self.EventFrame:UnregisterAllEvents()
	end
	if (not SynSummon1) then
		SynSummon1 = {}
		SynSummon1.Left = 300
		SynSummon1.Top = -200
		SynSummon1.Message = self.DefaultMessage
	end

	self.Timer = self.EventFrame:CreateAnimationGroup()
	self.Timer.anim = self.Timer:CreateAnimation()
	self.Timer.anim:SetDuration(1)
	self.Timer:SetLooping("REPEAT")
	self.Timer:SetScript("OnLoop", function(timer, ...)
		if (SynSummoner.whotosummon) then
			if (InCombatLockdown()) then
				for h=1, 20 do
					SynSummoner.LootFrame.TopGuildFrame[h].Button:Disable()
				end
				SynSummoner.LootFrame.TopGuildFrame.Button2:Disable()
			else
				SynSummoner.CheckRange()
				SynSummoner.CheckRaid()
			end
		else
			if (InCombatLockdown()) then
				for h=1, 20 do
					SynSummoner.LootFrame.TopGuildFrame[h].Button:Disable()
				end
				SynSummoner.LootFrame.TopGuildFrame.Button2:Disable()
			else
				SynSummoner.CheckRaid()
				SynSummoner.Timer:Stop()
			end
		end
	end)
	self.MakeFrame()
	self.CheckRaid()
	C_ChatInfo.RegisterAddonMessagePrefix(SynSummoner.MESSAGE_PREFIX)
	self:GuildSpam()
end
function SynSummoner:UnitInGroup(unit)
	return UnitInRaid(unit) or UnitInParty(unit)
end
function SynSummoner:UnitCannotInvite(unit)
	if not self:UnitInGroup(unit) then
		return true
	end
	return not (UnitIsGroupLeader(unit) or UnitIsGroupAssistant(unit))
end
function SynSummoner:InvAlts()
	print(SynSummoner:strconcat("Syndicate_Summoner inviting clickers"))
	if self:UnitCannotInvite("player") then
		SynSummoner.LeaveGroup()
	end
	C_ChatInfo.SendAddonMessage(SynSummoner.MESSAGE_PREFIX, "send_inv", "SAY")
end
SynSummoner.LeaveGroup = C_PartyInfo.LeaveParty
if not SynSummoner.LeaveGroup then
	SynSummoner.LeaveGroup = LeaveParty
end
SynSummoner.EventFrame = CreateFrame("Frame")
SynSummoner.EventFrame:RegisterEvent("ADDON_LOADED")
SynSummoner.EventFrame:RegisterEvent("CHAT_MSG_ADDON")
SynSummoner.EventFrame:RegisterEvent("CHAT_MSG_GUILD")
SynSummoner.EventFrame:RegisterEvent("CHAT_MSG_PARTY")
SynSummoner.EventFrame:RegisterEvent("CHAT_MSG_PARTY_LEADER")
SynSummoner.EventFrame:RegisterEvent("CHAT_MSG_RAID")
SynSummoner.EventFrame:RegisterEvent("CHAT_MSG_RAID_LEADER")
SynSummoner.EventFrame:RegisterEvent("CHAT_MSG_SAY")
SynSummoner.EventFrame:RegisterEvent("CHAT_MSG_SYSTEM")
SynSummoner.EventFrame:RegisterEvent("CHAT_MSG_WHISPER")
SynSummoner.EventFrame:RegisterEvent("GUILD_ROSTER_UPDATE")
SynSummoner.EventFrame:RegisterEvent("PARTY_INVITE_REQUEST")
SynSummoner.EventFrame:RegisterEvent("ZONE_CHANGED")
SynSummoner.EventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
SynSummoner.EventFrame:SetScript("OnEvent", function(_, event, ...)
	local self = SynSummoner
	if (event=="ADDON_LOADED") then
		local arg1 = ...;
		if (arg1 == "Syndicate_Summoner") then
			self:Initialise()
		end
		return
	end
	if event == "CHAT_MSG_ADDON" then
		local prefix, text, channel, sender = ...
		local sname, _ = strsplit("-", sender)
		if prefix ~= self.MESSAGE_PREFIX or sname == UnitName('player') then
			return
		end
		if text == "inv" and channel == "WHISPER" and not self:UnitInGroup(sname) then
			print(self:strconcat("Syndicate_Summoner inviting clicker ", sname))
			InviteUnit(sender)
		end
		if text == "send_inv" and channel == "SAY" and self:CanEnable() then
			if self:UnitCannotInvite(sname) and GetNumGroupMembers() > 1 then
				self.LeaveGroup()
			end
			C_ChatInfo.SendAddonMessage(self.MESSAGE_PREFIX, "inv", "WHISPER", sender)
		else
			return
		end
	end
	if event == "GUILD_ROSTER_UPDATE" then
		local total = GetNumGuildMembers()
		SynSummoner.Guildies = {}
		for i = 1, total do
			local name = GetGuildRosterInfo(i)
			local sname, _ = strsplit("-", name)
			SynSummoner.Guildies[sname] = true
		end
	end
	-- accept invite requests if I am level 5 or lower and in a summoning keyword zone
	if event == "PARTY_INVITE_REQUEST" then
		local level = UnitLevel('player')
		if level <= 5 and self:CanEnable() then
			AcceptGroup()
			print(self:strconcat("Syndicate_Summoner accepting group invite"))
			StaticPopup_Hide("PARTY_INVITE")
		end
		return
	end
	if event == "CHAT_MSG_SAY" then
		local msg, sender = ...
		msg = msg:lower()
		if msg == self.MESSAGE_INV_TEXT or msg:find(self.MESSAGE_INV_TEXT) then
			C_ChatInfo.SendAddonMessage(self.MESSAGE_PREFIX, "inv", "WHISPER", sender)
		end
		return
	end
	if self:starts_with(event, "ZONE_CHANGED") then
		self:Initialise()
		self:GuildSpam()
		return
	end
	if event == "CHAT_MSG_SYSTEM" then
		local arg1 = ...;
		local text = arg1 and arg1:lower() or ''
		local bits = self:strtok(text, ' ')
		local name = bits[1]
		if self:ends_with(text, 'is already in a group.') and not SynSummoner:UnitInGroup(name) then
			SendChatMessage("Drop your group and ask again to join.", "WHISPER", nil, name)
		end
		return
	end
	if self:starts_with(event, "CHAT_MSG") then
		local arg1, arg2 = ...;
		local text = arg1 and arg1:lower() or ''
		local cls, _ = UnitClass("player")
		if cls == 'Warlock' and (self.BakedWords[text] or self.TriggerWords[text]) then
			local sname, _ = strsplit("-", arg2)
			if self:CanDefaultInvite() then
				if (event == 'CHAT_MSG_GUILD' or event == 'CHAT_MSG_WHISPER') and
						(not SynSummon1.GuildInvite or SynSummoner.Guildies[sname])
						then
					print(self:strconcat("Syndicate_Summoner inviting ", sname))
					if not IsInRaid() and GetNumGroupMembers() >= 4 then
						ConvertToRaid()
					end
					InviteUnit(sname)
				end
				if (not self.whotosummon) then
					self.whotosummon = {}
				end
				if not self.whotosummon[sname] then
					self.whotosummon[sname] = GetTime()
				end
				if (SynSummon1.Flash == nil or SynSummon1.Flash) and (SynSummoner.last_flash == nil or (time() - SynSummoner.last_flash) > 15) then
					SynSummoner.last_flash = time()
					-- teleport sound
					PlaySound(3226, "Master", false)
					FlashClientIcon()
					if _G["DBM"] and DBM.Flash then
						--:Show(red, green, blue, dur, alpha, repeatFlash)
						DBM.Flash:Show(0.53, 0.53, 0.93, 0.4, 0.3, 3)
					end
				end
				self.Timer:Play()
			else
				print(self:strconcat("Syndicate_Summoner ignored inviting ", sname))
			end
		end
		return
	end
end)

function SynSummoner:slice(tbl, first, last, step)
  local sliced = {}

  for i = first or 1, last or #tbl, step or 1 do
	sliced[#sliced+1] = tbl[i]
  end

  return sliced
end

SLASH_SYNSUMM1 = "/synsum"
SLASH_SYNSUMM2 = "/ssum"
SLASH_SYNSUMM3 = "/sysum"

SlashCmdList.SYNSUMM = function(input)
	local bits = SynSummoner:strtok(input:lower(), ' ')
	if bits[1] == 'message' or bits[1] == 'msg' then
		SynSummon1.Message = SynSummoner:strjoin(SynSummoner:slice(SynSummoner:strtok(input, ' '), 2), " ")
		if SynSummon1.Message == '' then
			SynSummon1.Message = SynSummoner.DefaultMessage
		end
		print(SynSummoner:strconcat("Message is now: ", SynSummon1.Message))
	elseif bits[1] == 'c' or bits[1] == 'ci' or bits[1] == 'clicker' or bits[1] == 'click' or bits[1] == 'clickinv' or bits[1] == 'inv' then
		SynSummoner:InvAlts()
	elseif bits[1] == 'guild' then
		SynSummoner:GuildSpam(true)
	elseif bits[1] == 'guildinviter' then
		SynSummon1.GuildInvite = not SynSummon1.GuildInvite
		print(SynSummoner:strconcat("Guild inviter is now: ", SynSummon1.GuildInvite))
	elseif bits[1] == 'flash' then
		SynSummon1.Flash = not SynSummon1.Flash
		print(SynSummoner:strconcat("Flash is now: ", SynSummon1.Flash))
	elseif bits[1] == 'inviter' then
		SynSummon1.ForceInvite = not SynSummon1.ForceInvite
		if bits[2] == 'default' or bits[2] == 'nil' then
			SynSummon1.ForceInvite = nil
		end
		print(SynSummoner:strconcat("Autoinviter is now: ", SynSummon1.ForceInvite))
	else
		print(SynSummoner:strconcat("Syndicate_Summoner"))
		print(SynSummoner:strconcat("Guild spam: /synsum guild"))
		print(SynSummoner:strconcat("Change summon message: /synsum message summon that guy %t"))
		print(SynSummoner:strconcat("Toggle autoinviter: /synsum inviter"))
		print(SynSummoner:strconcat("Toggle guild only inviting: /synsum guildinviter"))
		print(SynSummoner:strconcat("Toggle flashing/sounds: /synsum flash"))
		print(SynSummoner:strconcat("Invite nearby clickers with addon: /synsum clickinv"))
	end
end
