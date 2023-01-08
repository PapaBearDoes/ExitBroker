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
local ExitBroker = addon
local L = ExitBroker:GetLocale()
-- End Imports
--[[ ######################################################################## ]]
--   ## Do All The Things!!!
--LDB
ExitBroker_LDB = LibStub("LibDataBroker-1.1")
ExitBrokerLDB = ExitBroker_LDB:NewDataObject("ExitBrokerLDB", {
  type = "launcher",
  label = myName,
  text = "",
  icon = "Interface\\Icons\\inv_pandarenserpentmount_yellow",
  OnClick = function(self, click)
    if click == "LeftButton" then
			if IsShiftKeyDown() then
				ExitBroker:ButtonClick("SHIFT")
			elseif IsControlKeyDown() then
				ExitBroker:ButtonClick("CONTROL")
			elseif IsAltKeyDown() then
				ExitBroker:ButtonClick("ALT")
			else
				ReloadUI();
			end
		elseif click == "RightButton" then
      ExitBroker:ShowConfig()
    end
  end,
  OnTooltipShow = function(tooltip)
    if not tooltip or not tooltip.AddLine then
      return
    end
    tooltip:AddLine(myName .. " " .. GetAddOnMetadata(myName, "Version"))
    tooltip:AddDoubleLine("To " .. ExitBroker:Colorize(L["RELOAD"], "1eff00"), ExitBroker:Colorize(L["LeftClick"], "1eff00") .. " " .. L["Icon"] .. ".");
    tooltip:AddDoubleLine("To " .. ExitBroker:Colorize(L["LOGOUT"], "ff8000"), ExitBroker:Colorize(L["ShiftLeftClick"], "ff8000") .. L["Icon"] .. ".");
    tooltip:AddDoubleLine("To " .. ExitBroker:Colorize(L["EXIT"], "a335ee"), ExitBroker:Colorize(L["ControlLeftClick"], "a335ee") .. L["Icon"] .. ".");
    tooltip:AddLine(" ")
    tooltip:AddLine(ExitBroker:Colorize(L["RightClick"] .. " ", "eda55f") .. L["RightToolTip"])
  end,
})

function ExitBroker:MiniMapIcon()
  ExitBrokerIcon = LibStub("LibDBIcon-1.0")
  if not ExitBrokerIcon:IsRegistered(myName .. "_mapIcon") then
    ExitBrokerIcon:Register(myName .. "_mapIcon", ExitBrokerLDB, ExitBroker.db.profile.mmIcon)
  end
end

function ExitBroker:ButtonClick(modifier)
	if modifier == "SHIFT" then
    --Logout() is now a protected function, we must figure out another way
	elseif modifier == "CONTROL" then
    --Quit() is now a protected function, we must figure out another way
	elseif modifier == "ALT" then
		--Do Nothing (yet)
	else
    ReloadUI()
	end
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