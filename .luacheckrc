std = "lua51"
max_line_length = false
exclude_files = {
    "**/Libs/**/*.lua",
    ".luacheckrc"
}
ignore = {
    "11./SLASH_.*", -- Setting an undefined (Slash handler) global variable
    "11./BINDING_.*", -- Setting an undefined (Keybinding header) global variable
--  "113/LE_.*", -- Accessing an undefined (Lua ENUM type) global variable
--  "113/NUM_LE_.*", -- Accessing an undefined (Lua ENUM type) global variable
    -- "211", -- Unused local variable
    -- "211/L", -- Unused local variable "L"
    -- "211/CL", -- Unused local variable "CL"
    "212", -- Unused argument
--  "431", -- shadowing upvalue
    -- "43.", -- Shadowing an upvalue, an upvalue argument, an upvalue loop variable.
    -- "542", -- An empty if branch
}
globals = {
    "_G",
    "bit",
    "time",

    -- Saved Variables
    "SynSummon1",

    -- functions
    "SynSummoner",

    "DBM",

    -- blizz
    "BackdropTemplateMixin",
    "ChatEdit_InsertLink",
    "FlashClientIcon",
    "GameTooltip",
    "GetContainerItemID",
    "GetItemInfo",
    "GetRaidRosterInfo",
    "HandleModifiedItemClick",
    "IsAltKeyDown",
    "IsInGroup",
    "IsInRaid",
    "Item",
    "ItemRefTooltip",
    "SendChatMessage",
    "SlashCmdList",
    "SocialPostFrame",
    "Social_InsertLink",
    "Social_IsShown",
    'AcceptGroup',
    'C_ChatInfo',
    'C_PartyInfo',
    'ConvertToRaid',
    'CreateFrame',
    'GetGuildRosterInfo',
    'GetNumGroupMembers',
    'GetNumGuildMembers',
    'GetScreenHeight',
    'GetSubZoneText',
    'GetTime',
    'GetZoneText',
    'GuildRoster',
    'GuildRosterSetOfficerNote',
    'InCombatLockdown',
    'InviteUnit',
    'IsSpellInRange',
    'LeaveParty',
    'PlaySound',
    'SecondsToTime',
    'SetGuildRosterShowOffline',
    'StaticPopup_Hide',
    'UIParent',
    'UnitClass',
    'UnitInParty',
    'UnitInRaid',
    'UnitIsGroupAssistant',
    'UnitIsGroupLeader',
    'UnitLevel',
    'UnitName',

    -- lua
    "strsub",
    "strsplit",
}
