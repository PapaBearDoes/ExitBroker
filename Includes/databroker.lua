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
		end
  end,
  OnTooltipShow = function(tooltip)
    if not tooltip or not tooltip.AddLine then
      return
    end
    tooltip:AddLine(myName .. " " .. GetAddOnMetadata(myName, "Version"))
    tooltip:AddDoubleLine("To |cff1eff00RELOAD|r:", "|cff1eff00Left Click|r Icon.");
    tooltip:AddDoubleLine("To |cffff8000LOGOUT|r:", "|cffff8000<SHIFT> + Left Click|r Icon.");
    tooltip:AddDoubleLine("To |cffa335eeEXIT|r:", "|cffa335ee<CONTROL> + Left Click|r Icon.");
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
		hooksecurefunc("Logout", function() Logout() end) --Logout
	elseif modifier == "CONTROL" then
		hooksecurefunc("Quit", function() Quit() end) --Quit
	elseif modifier == "ALT" then
		--Do Nothing (yet)
	else
		hooksecurefunc("ReloadUI", function() ReloadUI() end)
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