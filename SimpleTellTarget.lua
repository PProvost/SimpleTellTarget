--[[
Copyright 2009 Quaiche of Dragonblight

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
]]

local f = CreateFrame("frame")
f:SetScript("OnEvent", function(self, event, ...) if self[event] then return self[event](self, event, ...) end end)
f:RegisterEvent("ADDON_LOADED")

function f:ADDON_LOADED(event, addon)
	if addon:lower() ~= "simpletelltarget" then return end
	LibStub("tekKonfig-AboutPanel").new(nil, "SimpleTellTarget") -- Make first arg nil if no parent config panel
	self:UnregisterEvent("ADDON_LOADED"); self.ADDON_LOADED = nil
end

SLASH_SIMPLETELLTARGET1 = "/tt"
SLASH_SIMPLETELLTARGET2 = "/telltarget"
SlashCmdList.SIMPLETELLTARGET = function(msg)
	if not UnitExists("target") or not UnitIsPlayer("target") or not UnitIsFriend("player","target") then
		UIErrorsFrame:AddMessage("Unable to whisper target", 1.0, 0.0, 0.0, 1, 5)
	end
	SendChatMessage(msg, "WHISPER", nil, UnitName("target"))
end

