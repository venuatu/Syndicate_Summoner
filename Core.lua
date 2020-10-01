ConsSummoner = {}
ConsSummoner.Raid = {}
ConsSummoner.TriggerWord = {
	["123"] = 1,
	["summon plz"] = 1,
}
function ConsSummoner.MakeFrame()
	ConsSummoner.LootFrame = {}
	ConsSummoner.LootFrame = CreateFrame("frame", "ConsSummonerLootFrame", UIParent)
	ConsSummoner.LootFrame:SetWidth(1)
	ConsSummoner.LootFrame:SetHeight(1)
	ConsSummoner.LootFrame:SetMovable(true)
	ConsSummoner.LootFrame:EnableMouse(true)
	ConsSummoner.LootFrame:SetFrameStrata("LOW")
	--ConsSummoner.LootFrame:Hide()
	ConsSummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, 0)
	ConsSummoner.LootFrame:SetScript("OnMouseDown", function(self, button)
		if button == "LeftButton" then
			ConsSummoner.LootFrame:StartMoving();
			ConsSummoner.LootFrame.isMoving = true;
		end
	end)
	ConsSummoner.LootFrame:SetScript("OnMouseUp", function(self, button)
		if button == "LeftButton" and ConsSummoner.LootFrame.isMoving then
			ConsSummoner.LootFrame:StopMovingOrSizing();
			ConsSummoner.LootFrame.isMoving = false;
			ConsSummon1.Settings.Left = ConsSummoner.LootFrame:GetLeft()
			ConsSummon1.Settings.Top = ConsSummoner.LootFrame:GetTop() - GetScreenHeight()
			ConsSummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", ConsSummon1.Settings.Left, ConsSummon1.Settings.Top)
		end
	end)
	ConsSummoner.LootFrame:SetScript("OnHide", function(self)
		if ( ConsSummoner.LootFrame.isMoving ) then
			ConsSummoner.LootFrame:StopMovingOrSizing();
			ConsSummoner.LootFrame.isMoving = false;
			ConsSummon1.Settings.Left = ConsSummoner.LootFrame:GetLeft()
			ConsSummon1.Settings.Top = ConsSummoner.LootFrame:GetTop() - GetScreenHeight()
			ConsSummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", ConsSummon1.Settings.Left, ConsSummon1.Settings.Top)
		end
	end)
	ConsSummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", ConsSummon1.Settings.Left, ConsSummon1.Settings.Top)
	
	ConsSummoner.LootFrame["TopGuildFrame"] = CreateFrame("frame", "LootPasserTopFrame", ConsSummoner.LootFrame)
	ConsSummoner.LootFrame["TopGuildFrame"]:SetWidth(100)
	ConsSummoner.LootFrame["TopGuildFrame"]:SetHeight(70)
	ConsSummoner.LootFrame["TopGuildFrame"]:SetPoint("TOPLEFT", ConsSummoner.LootFrame, "TOPLEFT",0,0)
	ConsSummoner.LootFrame["TopGuildFrame"]:SetScale(0.7)
	ConsSummoner.LootFrame["TopGuildFrame"]:SetBackdrop( { 
			bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
			tile = true, tileSize = 5, edgeSize = 15, insets = { left = 1, right = 1, top = 1, bottom = 1 }
		});
	ConsSummoner.LootFrame["TopGuildFrame"]:SetMovable(true)
	ConsSummoner.LootFrame["TopGuildFrame"]:EnableMouse(true)
		ConsSummoner.LootFrame["TopGuildFrame"]:SetScript("OnMouseDown", function(self, button)
		if button == "LeftButton" then
			ConsSummoner.LootFrame:StartMoving();
			ConsSummoner.LootFrame.isMoving = true;
		end
	end)
	ConsSummoner.LootFrame["TopGuildFrame"]:SetScript("OnMouseUp", function(self, button)
		if button == "LeftButton" and ConsSummoner.LootFrame.isMoving then
			ConsSummoner.LootFrame:StopMovingOrSizing();
			ConsSummoner.LootFrame.isMoving = false;
			ConsSummon1.Settings.Left = ConsSummoner.LootFrame:GetLeft()
			ConsSummon1.Settings.Top = ConsSummoner.LootFrame:GetTop() - GetScreenHeight()
			ConsSummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", ConsSummon1.Settings.Left, ConsSummon1.Settings.Top)
		end
	end)
	ConsSummoner.LootFrame["TopGuildFrame"]:SetScript("OnHide", function(self)
		if ( ConsSummoner.LootFrame.isMoving ) then
			ConsSummoner.LootFrame:StopMovingOrSizing();
			ConsSummoner.LootFrame.isMoving = false;
			ConsSummon1.Settings.Left = ConsSummoner.LootFrame:GetLeft()
			ConsSummon1.Settings.Top = ConsSummoner.LootFrame:GetTop() - GetScreenHeight()
			ConsSummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", ConsSummon1.Settings.Left, ConsSummon1.Settings.Top)
		end
	end)
	
	ConsSummoner.LootFrame.TopGuildFrame.Button2 = CreateFrame("Button", "CRI_InvButtsaon2", ConsSummoner.LootFrame.TopGuildFrame)
	ConsSummoner.LootFrame.TopGuildFrame.Button2:SetPoint("TOPRIGHT",ConsSummoner.LootFrame.TopGuildFrame,"TOPRIGHT",0,10)
	ConsSummoner.LootFrame.TopGuildFrame.Button2:SetWidth(35)
	ConsSummoner.LootFrame.TopGuildFrame.Button2:SetHeight(20)
	ConsSummoner.LootFrame.TopGuildFrame.Button2:SetText("Clear")
	ConsSummoner.LootFrame.TopGuildFrame.Button2:SetParent(ConsSummoner.LootFrame.TopGuildFrame)
	ConsSummoner.LootFrame.TopGuildFrame.Button2:SetNormalFontObject("GameFontNormal")
	ConsSummoner.LootFrame.TopGuildFrame.Button2ntex = ConsSummoner.LootFrame.TopGuildFrame.Button2:CreateTexture()
	ConsSummoner.LootFrame.TopGuildFrame.Button2ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
	ConsSummoner.LootFrame.TopGuildFrame.Button2ntex:SetTexCoord(0, 0.625, 0, 0.6875)
	ConsSummoner.LootFrame.TopGuildFrame.Button2ntex:SetAllPoints()	
	ConsSummoner.LootFrame.TopGuildFrame.Button2:SetNormalTexture(ConsSummoner.LootFrame.TopGuildFrame.Button2ntex)
	ConsSummoner.LootFrame.TopGuildFrame.Button2pdis = ConsSummoner.LootFrame.TopGuildFrame.Button2:CreateTexture()
	ConsSummoner.LootFrame.TopGuildFrame.Button2pdis:SetTexture("Interface/Buttons/UI-Panel-Button-Disabled")
	ConsSummoner.LootFrame.TopGuildFrame.Button2pdis:SetTexCoord(0, 0.625, 0, 0.6875)
	ConsSummoner.LootFrame.TopGuildFrame.Button2pdis:SetAllPoints()
	ConsSummoner.LootFrame.TopGuildFrame.Button2:SetDisabledTexture(ConsSummoner.LootFrame.TopGuildFrame.Button2pdis)
	ConsSummoner.LootFrame.TopGuildFrame.Button2htex = ConsSummoner.LootFrame.TopGuildFrame.Button2:CreateTexture()
	ConsSummoner.LootFrame.TopGuildFrame.Button2htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
	ConsSummoner.LootFrame.TopGuildFrame.Button2htex:SetTexCoord(0, 0.625, 0, 0.6875)
	ConsSummoner.LootFrame.TopGuildFrame.Button2htex:SetAllPoints()
	ConsSummoner.LootFrame.TopGuildFrame.Button2:SetHighlightTexture(ConsSummoner.LootFrame.TopGuildFrame.Button2htex)
	ConsSummoner.LootFrame.TopGuildFrame.Button2ptex = ConsSummoner.LootFrame.TopGuildFrame.Button2:CreateTexture()
	ConsSummoner.LootFrame.TopGuildFrame.Button2ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
	ConsSummoner.LootFrame.TopGuildFrame.Button2ptex:SetTexCoord(0, 0.625, 0, 0.6875)
	ConsSummoner.LootFrame.TopGuildFrame.Button2ptex:SetAllPoints()
	ConsSummoner.LootFrame.TopGuildFrame.Button2:SetPushedTexture(ConsSummoner.LootFrame.TopGuildFrame.Button2ptex)
	ConsSummoner.LootFrame.TopGuildFrame.Button2:SetScript("OnClick", function(self, arg1)
		ConsSummoner.whotosummon = nil
		ConsSummoner.CheckRaid()
	end)
	
	
	
	for h=1, 20 do
		ConsSummoner.LootFrame.TopGuildFrame[h] = {}
		ConsSummoner.LootFrame.TopGuildFrame[h].Button = CreateFrame("Button", "ConsmyButtonzz"..h, ConsSummoner.LootFrame.TopGuildFrame, "SecureActionButtonTemplate");
		ConsSummoner.LootFrame.TopGuildFrame[h].Button:SetPoint("TOPRIGHT",ConsSummoner.LootFrame.TopGuildFrame,"TOPRIGHT",-10,-((h*25)-15))
		ConsSummoner.LootFrame.TopGuildFrame[h].Button:SetWidth(80)
		ConsSummoner.LootFrame.TopGuildFrame[h].Button:SetHeight(25)
		ConsSummoner.LootFrame.TopGuildFrame[h].Button:SetText("Zyrreal")
		ConsSummoner.LootFrame.TopGuildFrame[h].Button:SetNormalFontObject("GameFontNormal")
		ConsSummoner.LootFrame.TopGuildFrame[h].Buttonntex = ConsSummoner.LootFrame.TopGuildFrame[h].Button:CreateTexture()
		ConsSummoner.LootFrame.TopGuildFrame[h].Buttonntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
		ConsSummoner.LootFrame.TopGuildFrame[h].Buttonntex:SetTexCoord(0, 0.625, 0, 0.6875)
		ConsSummoner.LootFrame.TopGuildFrame[h].Buttonntex:SetAllPoints()	
		ConsSummoner.LootFrame.TopGuildFrame[h].Button:SetNormalTexture(ConsSummoner.LootFrame.TopGuildFrame[h].Buttonntex)
		ConsSummoner.LootFrame.TopGuildFrame[h].Buttonhtex = ConsSummoner.LootFrame.TopGuildFrame[h].Button:CreateTexture()
		ConsSummoner.LootFrame.TopGuildFrame[h].Buttonhtex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		ConsSummoner.LootFrame.TopGuildFrame[h].Buttonhtex:SetTexCoord(0, 0.625, 0, 0.6875)
		ConsSummoner.LootFrame.TopGuildFrame[h].Buttonhtex:SetAllPoints()
		ConsSummoner.LootFrame.TopGuildFrame[h].Button:SetHighlightTexture(ConsSummoner.LootFrame.TopGuildFrame[h].Buttonhtex)
		ConsSummoner.LootFrame.TopGuildFrame[h].Buttonptex = ConsSummoner.LootFrame.TopGuildFrame[h].Button:CreateTexture()
		ConsSummoner.LootFrame.TopGuildFrame[h].Buttonptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
		ConsSummoner.LootFrame.TopGuildFrame[h].Buttonptex:SetTexCoord(0, 0.625, 0, 0.6875)
		ConsSummoner.LootFrame.TopGuildFrame[h].Buttonptex:SetAllPoints()
		ConsSummoner.LootFrame.TopGuildFrame[h].Buttonpdis = ConsSummoner.LootFrame.TopGuildFrame[h].Button:CreateTexture()
		ConsSummoner.LootFrame.TopGuildFrame[h].Buttonpdis:SetTexture("Interface/Buttons/UI-Panel-Button-Disabled")
		ConsSummoner.LootFrame.TopGuildFrame[h].Buttonpdis:SetTexCoord(0, 0.625, 0, 0.6875)
		ConsSummoner.LootFrame.TopGuildFrame[h].Buttonpdis:SetAllPoints()
		ConsSummoner.LootFrame.TopGuildFrame[h].Button:SetDisabledTexture(ConsSummoner.LootFrame.TopGuildFrame[h].Buttonpdis)
		ConsSummoner.LootFrame.TopGuildFrame[h].Button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		ConsSummoner.LootFrame.TopGuildFrame[h].Button:SetPushedTexture(ConsSummoner.LootFrame.TopGuildFrame[h].Buttonptex)
		ConsSummoner.LootFrame.TopGuildFrame[h].Button:SetAttribute("type1", "macro");
		ConsSummoner.LootFrame.TopGuildFrame[h].Button:SetAttribute("macrotext", "/target party1 \n/cast Ritual of Summoning")
		ConsSummoner.LootFrame["TopGuildFrame"]:SetHeight(20+h*25)
		
		
		
		ConsSummoner.LootFrame.TopGuildFrame[h].Time = CreateFrame("frame", "LootPasserTopFramett"..h, ConsSummoner.LootFrame.TopGuildFrame)
		ConsSummoner.LootFrame.TopGuildFrame[h].Time:SetWidth(50)
		ConsSummoner.LootFrame.TopGuildFrame[h].Time:SetHeight(25)
		ConsSummoner.LootFrame.TopGuildFrame[h].Time:SetPoint("TOPLEFT", ConsSummoner.LootFrame.TopGuildFrame, "TOPRIGHT",0,-((h*25)-15))
		ConsSummoner.LootFrame.TopGuildFrame[h].Time:SetBackdrop( { 
				bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
				edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
				tile = true, tileSize = 5, edgeSize = 15, insets = { left = 1, right = 1, top = 1, bottom = 1 }
			});
		ConsSummoner.LootFrame.TopGuildFrame[h].Time:SetMovable(true)
		ConsSummoner.LootFrame.TopGuildFrame[h].Time:EnableMouse(true)
			ConsSummoner.LootFrame.TopGuildFrame[h].Time:SetScript("OnMouseDown", function(self, button)
			if button == "LeftButton" then
				ConsSummoner.LootFrame:StartMoving();
				ConsSummoner.LootFrame.isMoving = true;
			end
		end)
		ConsSummoner.LootFrame.TopGuildFrame[h].Time:SetScript("OnMouseUp", function(self, button)
			if button == "LeftButton" and ConsSummoner.LootFrame.isMoving then
				ConsSummoner.LootFrame:StopMovingOrSizing();
				ConsSummoner.LootFrame.isMoving = false;
				ConsSummon1.Settings.Left = ConsSummoner.LootFrame:GetLeft()
				ConsSummon1.Settings.Top = ConsSummoner.LootFrame:GetTop() - GetScreenHeight()
				ConsSummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", ConsSummon1.Settings.Left, ConsSummon1.Settings.Top)
			end
		end)
		ConsSummoner.LootFrame.TopGuildFrame[h].Time:SetScript("OnHide", function(self)
			if ( ConsSummoner.LootFrame.isMoving ) then
				ConsSummoner.LootFrame:StopMovingOrSizing();
				ConsSummoner.LootFrame.isMoving = false;
				ConsSummon1.Settings.Left = ConsSummoner.LootFrame:GetLeft()
				ConsSummon1.Settings.Top = ConsSummoner.LootFrame:GetTop() - GetScreenHeight()
				ConsSummoner.LootFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", ConsSummon1.Settings.Left, ConsSummon1.Settings.Top)
			end
		end)
		ConsSummoner.LootFrame.TopGuildFrame[h].Time["FS"] = ConsSummoner.LootFrame.TopGuildFrame[h].Time:CreateFontString("ConsLootS1TGFss"..h,"ARTWORK", "ChatFontNormal")
		ConsSummoner.LootFrame.TopGuildFrame[h].Time["FS"]:SetParent(ConsSummoner.LootFrame.TopGuildFrame[h].Time)
		ConsSummoner.LootFrame.TopGuildFrame[h].Time["FS"]:SetPoint("TOP",ConsSummoner.LootFrame.TopGuildFrame[h].Time,"TOP",0,0)
		ConsSummoner.LootFrame.TopGuildFrame[h].Time["FS"]:SetWidth(150)
		ConsSummoner.LootFrame.TopGuildFrame[h].Time["FS"]:SetHeight(25)
		ConsSummoner.LootFrame.TopGuildFrame[h].Time["FS"]:SetJustifyH("CENTER")
		ConsSummoner.LootFrame.TopGuildFrame[h].Time["FS"]:SetFontObject("GameFontNormalSmall")
		ConsSummoner.LootFrame.TopGuildFrame[h].Time["FS"]:SetText("time")
		
	end

end
function ConsSummoner.CheckRange()
	for AAPC_index2,AAPC_value2 in pairs(ConsSummoner.whotosummon) do
		if (IsSpellInRange("Unending Breath", AAPC_index2) == 1) then
			ConsSummoner.whotosummon[AAPC_index2] = nil
		end
	end
	local sddssd = 0
	for AAPC_index2,AAPC_value2 in pairs(ConsSummoner.whotosummon) do
		sddssd = 1
		break
	end
	if (sddssd == 0) then
		ConsSummoner.whotosummon = nil
	end
end
function ConsSummoner.CheckRaid()
	for h=1, 20 do
		ConsSummoner.LootFrame.TopGuildFrame[h].Button:Hide()
		ConsSummoner.LootFrame.TopGuildFrame[h].Time:Hide()
		ConsSummoner.LootFrame.TopGuildFrame[h].Button:Enable()
	end
	ConsSummoner.LootFrame.TopGuildFrame.Button2:Enable()
	if (ConsSummoner.whotosummon) then
		local derpz = 0
		for AAPC_Name,AAPC_Lootz in ConsSummoner.pairsByKeys(ConsSummoner.whotosummon) do
			derpz = derpz + 1
			ConsSummoner.LootFrame.TopGuildFrame[derpz].Button:SetText(AAPC_Name)
			ConsSummoner.LootFrame.TopGuildFrame[derpz].Button:Show()
			ConsSummoner.LootFrame.TopGuildFrame[derpz].Time["FS"]:SetText(string.format(SecondsToTime(AAPC_Lootz)))
			local strwd = ConsSummoner.LootFrame.TopGuildFrame[derpz].Time["FS"]:GetStringWidth()
			ConsSummoner.LootFrame.TopGuildFrame[derpz].Time:SetWidth(strwd+10)
			ConsSummoner.LootFrame.TopGuildFrame[derpz].Time:Show()
			ConsSummoner.LootFrame.TopGuildFrame[derpz].Button:SetAttribute("type1", "macro");
			ConsSummoner.LootFrame.TopGuildFrame[derpz].Button:SetAttribute("macrotext", "/target "..AAPC_Name.." \n/script SendChatMessage('Summoning "..AAPC_Name.." - PLEASE CLICK THE PORTAL', 'RAID', nil, nil)\n/script SendChatMessage('Summoning "..AAPC_Name.." - PLEASE CLICK THE PORTAL', 'SAY', nil, nil)\n/cast Ritual of Summoning\n/cleartarget")
		end
		ConsSummoner.LootFrame["TopGuildFrame"]:SetHeight(20+derpz*25)
		ConsSummoner.LootFrame:Show()
	else
		ConsSummoner.LootFrame:Hide()
	end
end
function ConsSummoner.pairsByKeys (t, f)
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
ConsSummoner.EventFrame = CreateFrame("Frame")
ConsSummoner.EventFrame:RegisterEvent ("ADDON_LOADED")
ConsSummoner.EventFrame:RegisterEvent ("CHAT_MSG_PARTY")
ConsSummoner.EventFrame:RegisterEvent ("CHAT_MSG_PARTY_LEADER")
ConsSummoner.EventFrame:RegisterEvent ("CHAT_MSG_RAID")
ConsSummoner.EventFrame:RegisterEvent ("CHAT_MSG_RAID_LEADER")
ConsSummoner.EventFrame:SetScript("OnEvent", function(self, event, ...)
	if (event=="ADDON_LOADED") then
		local arg1, arg2, arg3, arg4, arg5 = ...;
		if (arg1 == "Consequence-Summons") then
			local playerClass, englishClass = UnitClass("player")
			if (playerClass ~= "Warlock") then
				return
			end
			if (not ConsSummon1) then
				ConsSummon1 = {}
			end
			if (not ConsSummon1.Settings) then
				ConsSummon1.Settings = {}
				ConsSummon1.Settings.Left = 300
				ConsSummon1.Settings.Top = -200
			end
			ConsSummoner.Timer = ConsSummoner.EventFrame:CreateAnimationGroup()
			ConsSummoner.Timer.anim = ConsSummoner.Timer:CreateAnimation()
			ConsSummoner.Timer.anim:SetDuration(1)
			ConsSummoner.Timer:SetLooping("REPEAT")
			ConsSummoner.Timer:SetScript("OnLoop", function(self, event, ...)
				if (ConsSummoner.whotosummon) then
					for AAPC_index2,AAPC_value2 in pairs(ConsSummoner.whotosummon) do
						ConsSummoner.whotosummon[AAPC_index2] = AAPC_value2 + 1
					end
					if (InCombatLockdown()) then
						for h=1, 20 do
							ConsSummoner.LootFrame.TopGuildFrame[h].Button:Disable()
						end
						ConsSummoner.LootFrame.TopGuildFrame.Button2:Disable()
					else
						ConsSummoner.CheckRange()
						ConsSummoner.CheckRaid()
					end
				else
					if (InCombatLockdown()) then
						for h=1, 20 do
							ConsSummoner.LootFrame.TopGuildFrame[h].Button:Disable()
						end
						ConsSummoner.LootFrame.TopGuildFrame.Button2:Disable()
					else
						ConsSummoner.CheckRaid()
						ConsSummoner.Timer:Stop()
					end
				end
			end)
			ConsSummoner.MakeFrame()
			ConsSummoner.CheckRaid()
			print("ConsSummoner Loaded")
		end
	elseif (event=="CHAT_MSG_RAID_LEADER" or event=="CHAT_MSG_RAID" or event=="CHAT_MSG_PARTY" or event=="CHAT_MSG_PARTY_LEADER") then
		local arg1, arg2, arg3, arg4, arg5 = ...;
		if (arg1 and ConsSummoner.TriggerWord[string.lower(arg1)]) then
			local playerClass, englishClass = UnitClass("player")
			if (playerClass ~= "Warlock") then
				return
			end
			local zname, zserv = strsplit("-",arg2)
			if (not ConsSummoner.whotosummon) then
				ConsSummoner.whotosummon = {}
			end
			ConsSummoner.whotosummon[zname] = 0
			ConsSummoner.Timer:Play()
		end
	end
end)