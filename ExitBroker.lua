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
  type = "data source",
  text = "ExitBroker",
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
