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

  -- Enable/disable modules based on saved settings
	for name, module in ExitBroker:IterateModules() do
		module:SetEnabledState(ExitBroker.db.profile.moduleEnabledState[name] or false)
    if module.OnEnable then
      hooksecurefunc(module, "OnEnable", ExitBroker.OnModuleEnable_Common)
    end
  end

  ExitBroker:MiniMapIcon()
end

function ExitBroker:OnEnable()
  local ExitBrokerDialog = LibStub("AceConfigDialog-3.0")
  ExitBrokerFrames = {}
  ExitBrokerFrames.general = ExitBrokerDialog:AddToBlizOptions(myName, nil, nil, "general")
  ExitBrokerOptionFrames.profile = ExitBrokerDialog:AddToBlizOptions(myName, L["Profiles"], myName, L["Profile"])
end

function ExitBroker:OnModuleEnable_Common()
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

--[[
local exitbroker = LibStub("AceAddon-3.0"):NewAddon("ExitBroker", "AceConsole-3.0")
local ExitBrokerButton = CreateFrame("Button", "ExitBrokerClickButton", UIParent, "SecureHandlerClickTemplate")
ExitBrokerButton:SetAttribute("_onclick", [=[
	function (self, button)
		if button == "LeftButton" then
			if IsShiftKeyDown() then
				-- exitbroker:ButtonClick("SHIFT")
			elseif IsControlKeyDown() then
				-- exitbroker:ButtonClick("CONTROL")
			elseif IsAltKeyDown() then
				-- exitbroker:ButtonClick("ALT")
			else
				ReloadUI(); -- Reload the UI
			end
		end
	end
]=])
ExitBrokerButton:RegisterForClicks("LeftButtonUp")

local ExitBrokerLDB = LibStub("LibDataBroker-1.1"):NewDataObject("ExitBroker", {
  type = "launcher",
  text = myName,
	icon = "Interface\\Icons\\inv_pandarenserpentmount_yellow",
	OnTooltipShow = function(tooltip)
		tooltip:AddDoubleLine("To |cff1eff00RELOAD|r:", "|cff1eff00Left Click|r Icon.");
		tooltip:AddDoubleLine("To |cffff8000LOGOUT|r:", "|cffff8000<SHIFT> + Left Click|r Icon.");
		tooltip:AddDoubleLine("To |cffa335eeEXIT|r:", "|cffa335ee<CONTROL> + Left Click|r Icon.");
	end,
	OnClick = function(self, button)
		ExitBrokerButton:Click();
	end
})

local ExitBrokerIcon = LibStub("LibDBIcon-1.0")

--Functions
function exitbroker:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("ExitBrokerSV", {
  	profile = {
    	minimap = {
      	hide = false,
				minimapPos = 90,
    	},
  	},
	})
	ExitBrokerIcon:Register("ExitBroker", ExitBrokerLDB, self.db.profile.minimap)
end

--[[function exitbroker:ButtonClick(modifier)
	if modifier == "SHIFT" then
		-- Logout
	elseif modifier == "CONTROL" then
		--Hard Quit
	elseif modifier == "ALT" then
		--Do Nothing
	else
		ReloadUI()
	end
end]]--




--[[
local ldb = LibStub:GetLibrary("LibDataBroker-1.1");
local myexitbutton = CreateFrame("BUTTON", "ExitButton", UIParent, "SecureHandlerClickTemplate")
	ExitButton:SetAttribute("type", "macro")
	ExitButton:SetAttribute("macrotext", "/exit")
local mylogbutton = CreateFrame("BUTTON", "LogButton", UIParent, "SecureHandlerClickTemplate")
	LogButton:SetAttribute("type", "macro")
	LogButton:SetAttribute("macrotext", "/logout")

local dataobj = ldb:NewDataObject("ExitBroker", {
	type = "data source",
	icon = "Interface\\Icons\\inv_pandarenserpentmount_yellow",
	OnClick = function(self, button)
		if button == "LeftButton" then
			if IsShiftKeyDown() then
				securecall(Logout());
--				LogButton:Click();
			elseif IsControlKeyDown() then
--				ExitButton:Click();
			elseif IsAltKeyDown() then
				-- Do Nothing
			else
				ReloadUI(); --Reload the UI
			end
		end
	end,
	OnTooltipShow = function(tooltip)
		tooltip:AddDoubleLine("To |cff1eff00RELOAD|r:", "|cff1eff00Left Click|r Icon.");
		tooltip:AddDoubleLine("To |cffff8000LOGOUT|r:", "|cffff8000<SHIFT> + Left Click|r Icon.");
		tooltip:AddDoubleLine("To |cffa335eeEXIT|r:", "|cffa335ee<CONTROL> + Left Click|r Icon.");
	end
});
]]--
