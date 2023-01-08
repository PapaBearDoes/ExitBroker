--[[
                                      \\\\///
                                     /       \
                                   (| (.)(.) |)
     .---------------------------.OOOo--()--oOOO.---------------------------.
     |                                                                      |
     |  PapaBearDoes's DadGratz Addon for World of Warcraft                 |
     |  @project-version@
     ######################################################################## ]]
--   ## Let's init this file shall we?
-- Imports
local _G = _G
local myName, addon = ...
local initOptions = {
  profile = "Default",
  noswitch = false,
  nogui = false,
  nohelp = false,
  enhancedProfile = true
}
local ExitBroker = LibStub("LibInit"):NewAddon(addon, myName, initOptions, true)
local L = ExitBroker:GetLocale()
-- End Imports
--   ######################################################################## ]]
--   ## Do All The Things!!!
--[[FUNCTIONS]]
function ExitBroker:OnInitialize()
  ExitBroker.db = LibStub("AceDB-3.0"):New("ExitBrokerSV", ExitBroker.dbDefaults, "Default")
  ExitBroker.db.RegisterCallback(self, "OnProfileChanged", "UpdateProfile")
  ExitBroker.db.RegisterCallback(self, "OnProfileCopied", "UpdateProfile")
  ExitBroker.db.RegisterCallback(self, "OnProfileReset", "UpdateProfile")
  
  ExitBroker.options.args.profile = LibStub("AceDBOptions-3.0"):GetOptionsTable(ExitBroker.db)
  LibStub("AceConfig-3.0"):RegisterOptionsTable(myName, ExitBroker.options, nil)

  ExitBroker:MiniMapIcon()
end

function ExitBroker:OnEnable()
  local ExitBrokerDialog = LibStub("AceConfigDialog-3.0")
  ExitBrokerOptionFrames = {}
  ExitBrokerOptionFrames.general = ExitBrokerDialog:AddToBlizOptions(myName, nil, nil, "general")
  ExitBrokerOptionFrames.profile = ExitBrokerDialog:AddToBlizOptions(myName, L["Profiles"], myName, "profile")
end
--[[
     ########################################################################
     |  Last Editted By: @file-author@ - @file-date-iso@
     |  @file-hash@
     |                                                                      |
     '-------------------------.oooO----------------------------------------|
                              (    )     Oooo.
                              \  (     (    )
                               \__)     )  /
                                       (__/                                   ]]