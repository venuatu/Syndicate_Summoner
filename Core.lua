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
    ['Westfall'] = {'wf', 'sent', 'sentinel', 'sentinelhill'},
    ['Dire Maul'] = {'dm', 'dmt', 'trib', 'tribute', 'diremaul',},
    ['Booty Bay'] = {'bb', 'bootybay', 'stv',},
    ['Felwood'] = {'fel', 'sf', 'songflower', 'song',},
    ['Gates of Ahn\'Qiraj'] = {'aq', 'gates', 'aq40', 'aq20', 'ahnqiraj', 'sili', 'silithus'},
}
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
	for k, v in pairs(SynSummoner.whotosummon) do
		if (IsSpellInRange("Unending Breath", k) == 1) then
			SynSummoner.whotosummon[k] = nil
		end
	end
	local sddssd = 0
	for k, v in pairs(SynSummoner.whotosummon) do
		sddssd = 1
		break
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
function SynSummoner:NotifySummon()
	SynSummoner:SendMessageGroup(SynSummon1.Message)
end
function SynSummoner.CheckRaid()
	for h=1, 20 do
		SynSummoner.LootFrame.TopGuildFrame[h].Button:Hide()
		SynSummoner.LootFrame.TopGuildFrame[h].Time:Hide()
		SynSummoner.LootFrame.TopGuildFrame[h].Button:Enable()
	end
	SynSummoner.LootFrame.TopGuildFrame.Button2:Enable()
	if (SynSummoner.whotosummon) then
		local derpz = 0
		for AAPC_Name,AAPC_Lootz in SynSummoner.pairsByKeys(SynSummoner.whotosummon) do
			derpz = derpz + 1
			SynSummoner.LootFrame.TopGuildFrame[derpz].Button:SetText(AAPC_Name)
			SynSummoner.LootFrame.TopGuildFrame[derpz].Button:Show()
			SynSummoner.LootFrame.TopGuildFrame[derpz].Time["FS"]:SetText(string.format(SecondsToTime(AAPC_Lootz)))
			local strwd = SynSummoner.LootFrame.TopGuildFrame[derpz].Time["FS"]:GetStringWidth()
			SynSummoner.LootFrame.TopGuildFrame[derpz].Time:SetWidth(strwd+10)
			SynSummoner.LootFrame.TopGuildFrame[derpz].Time:Show()
			SynSummoner.LootFrame.TopGuildFrame[derpz].Button:SetAttribute("type1", "macro");
			SynSummoner.LootFrame.TopGuildFrame[derpz].Button:SetAttribute("macrotext", "/target "..AAPC_Name.." \n/script SynSummoner:NotifySummon()\n/cast Ritual of Summoning")
		end
		SynSummoner.LootFrame["TopGuildFrame"]:SetHeight(20+derpz*25)
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
	for i, x in ipairs({GetSubZoneText(), GetZoneText()}) do
	    for j, y in ipairs(SynSummoner.ZoneWords[x] or {}) do
			SynSummoner.TriggerWords[y] = 1
			table.insert(words, y)
			found = true
	    end
	    for j, y in ipairs(SynSummoner:strtok(x:lower(), " ")) do
			if y ~= '' and not SynSummoner.TriggerWords[y] then
				SynSummoner.TriggerWords[y] = 1
				table.insert(words, y)
			end
	    end
	end
	local level = UnitLevel('player')
	if found and (forced or (level > 20 and level < 44)) then
		local zone = (GetSubZoneText() ~= '' and (GetSubZoneText() .. '/') or '') .. GetZoneText()
		local text = 'whisper or gchat for summon to ' .. zone .. ': '
		table.sort(words)
		local words_str = SynSummoner:strjoin(words, '/')
	    SendChatMessage(text .. words_str, "GUILD")
	end
end

SynSummoner.EventFrame = CreateFrame("Frame")
SynSummoner.EventFrame:RegisterEvent ("ADDON_LOADED")
SynSummoner.EventFrame:RegisterEvent ("CHAT_MSG_PARTY")
SynSummoner.EventFrame:RegisterEvent ("CHAT_MSG_PARTY_LEADER")
SynSummoner.EventFrame:RegisterEvent ("CHAT_MSG_RAID")
SynSummoner.EventFrame:RegisterEvent ("CHAT_MSG_RAID_LEADER")
SynSummoner.EventFrame:RegisterEvent ("CHAT_MSG_GUILD")
SynSummoner.EventFrame:RegisterEvent ("CHAT_MSG_WHISPER")
SynSummoner.EventFrame:RegisterEvent ("ZONE_CHANGED_NEW_AREA")
SynSummoner.EventFrame:RegisterEvent ("ZONE_CHANGED")
SynSummoner.EventFrame:SetScript("OnEvent", function(self, event, ...)
	if (event=="ADDON_LOADED") then
		local arg1, arg2, arg3, arg4, arg5 = ...;
		if (arg1 == "Syndicate_Summoner") then
			local playerClass, englishClass = UnitClass("player")
			if (playerClass ~= "Warlock") then
				return SynSummoner.EventFrame:UnregisterAllEvents()
			end
			if (not SynSummon1) then
				SynSummon1 = {}
				SynSummon1.Left = 300
				SynSummon1.Top = -200
				SynSummon1.Message = SynSummoner.DefaultMessage
			end

			SynSummoner.Timer = SynSummoner.EventFrame:CreateAnimationGroup()
			SynSummoner.Timer.anim = SynSummoner.Timer:CreateAnimation()
			SynSummoner.Timer.anim:SetDuration(1)
			SynSummoner.Timer:SetLooping("REPEAT")
			SynSummoner.Timer:SetScript("OnLoop", function(self, event, ...)
				if (SynSummoner.whotosummon) then
					for k, v in pairs(SynSummoner.whotosummon) do
						SynSummoner.whotosummon[k] =  v + 1
					end
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
			SynSummoner.MakeFrame()
			SynSummoner.CheckRaid()
		end
	end
	if SynSummoner:starts_with(event, "ZONE_CHANGED") then
		SynSummoner:GuildSpam()
	end
	if SynSummoner:starts_with(event, "CHAT_MSG") then
		local arg1, arg2, arg3, arg4, arg5 = ...;
		local text = arg1 and arg1:lower() or ''
		if SynSummoner.BakedWords[text] or SynSummoner.TriggerWords[text] then
			local playerClass, englishClass = UnitClass("player")

			if event == 'CHAT_MSG_GUILD' or event == 'CHAT_MSG_WHISPER' then
		        if not IsInRaid() and GetNumGroupMembers() == 5 then 
		            ConvertToRaid()
		        end
		        InviteUnit(arg2)
		    end

			local zname, zserv = strsplit("-",arg2)
			if (not SynSummoner.whotosummon) then
				SynSummoner.whotosummon = {}
			end
			SynSummoner.whotosummon[zname] = 0
			SynSummoner.Timer:Play()
		end
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
    elseif bits[1] == 'guild' then
    	SynSummoner:GuildSpam(true)
    else
    	print(SynSummoner:strconcat("Guild spam: /synsum guild"))
    	print(SynSummoner:strconcat("Summon message change: /synsum message summon that guy %t"))
    end
end

-- function (e, m, author)
--     if not aura_env.keywords or e == 'OPTIONS' then
--         -- /dump GetSubZoneText() or GetZoneText()
--     end
--     --print(text)
--     local msg = m and m:lower() or ''
--     for i, kw in ipairs(aura_env.keywords) do
--         if msg == kw then
            -- if not IsInRaid() and GetNumGroupMembers() == 5 then 
            --     ConvertToRaid()
            -- end
            -- InviteUnit(author)
            -- return
--         end
--     end
-- end
