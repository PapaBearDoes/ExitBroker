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
-- Config window --
function ExitBroker:ShowConfig()
  InterfaceOptionsFrame_OpenToCategory(ExitBrokerFrames.general)
  InterfaceOptionsFrame_OpenToCategory(ExitBrokerFrames.profile)
end
-- End Options --

function ExitBroker:UpdateOptions()
  LibStub("AceConfigRegistry-3.0"):NotifyChange(me)
end

function ExitBroker:UpdateProfile()
  ExitBroker:ScheduleTimer("UpdateProfileDelayed", 0)
end

function ExitBroker:OnProfileChanged(event, database, newProfileKey)
  ExitBroker.db.profile = database.profile
end

function ExitBroker:UpdateProfileDelayed()
  for timerKey, timerValue in ExitBroker:IterateModules() do
    if timerValue.db.profile.on then
      if timerValue:IsEnabled() then
        timerValue:Disable()
        timerValue:Enable()
      else
        timerValue:Enable()
      end
    else
      timerValue:Disable()
    end
  end
  ExitBroker:UpdateOptions()
end

function ExitBroker:OnProfileReset()
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