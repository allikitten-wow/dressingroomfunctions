--
--    Dressing Room Functions - Allows undress and target model for dressing room
--    Copyright (C) 2013  Rachael Alexanderson
--
--    This program is free software: you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation, either version 3 of the License, or
--    (at your option) any later version.
--
--    This program is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with this program.  If not, see <http://www.gnu.org/licenses/>.
--

local function SysMessage(text)
	DEFAULT_CHAT_FRAME:AddMessage("|cffffff90DRF:|r "..text);
end
local function englishOnOff(conditional)
	if (conditional) then return "|cff00ff00enabled|r"; else return "|cffff0000disabled|r"; end
end

if not ( DRF_Version == DRF_CoreVersion ) then
	return;
end

if DRF_Global == nil then DRF_Global = {} end;

-- Code based on LUA-only options panel code found on wowpedia.org
-- Credit goes to CurtWulf and Mortilus
DRF = {};
DRF.config = {}; DRF.change = {}; DRF.text = {};
DRF.config.s1 = "AutoUndress";
DRF.config.s2 = "Conservative";
DRF.config.s3 = "UndressTarget";
DRF.change.s1 = "Always Undress ";
DRF.change.s2 = "Conservative Mode ";
DRF.change.s3 = "Undress Target ";
DRF.text.s1 = "Undress self on open";
DRF.text.s2 = "Use conservative 'undress'";
DRF.text.s3 = "Undress on Target Change";

DRF.panel = CreateFrame( "Frame", "DRFPanel", UIParent );

-- Register in the Interface Addon Options GUI
-- Set the name for the Category for the Options Panel
DRF.panel.name = "DressingRoomFunctions";
-- Add the panel to the Interface Options
InterfaceOptions_AddCategory(DRF.panel);

DRF.panel.text1 = DRF.panel:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall");
DRF.panel.text1:SetPoint("TOP",0,-100);
DRF.panel.text1:SetText("Dressing Room Functions "..DRF_Version.." by Allikitten (Allicilea of US-MoonGuard)");

DRF.panel.option1 = CreateFrame("CheckButton", "DRFOption1", DRF.panel, "UICheckButtonTemplate");
DRF.panel.option1:SetPoint("CENTER",-90,45);
DRF.panel.option1.text = _G["DRFOption1Text"];
DRF.panel.option1.text:SetText(DRF.text.s1);
DRF.panel.option1:SetScript("OnClick",function(self,event,arg1)
	DRF_Global[DRF.config.s1] = self:GetChecked()
	SysMessage(DRF.change.s1..englishOnOff(DRF_Global[DRF.config.s1])..".");
end);

DRF.panel.option2 = CreateFrame("CheckButton", "DRFOption2", DRF.panel, "UICheckButtonTemplate");
DRF.panel.option2:SetPoint("CENTER",-90,15);
DRF.panel.option2.text = _G["DRFOption2Text"];
DRF.panel.option2.text:SetText(DRF.text.s2);
DRF.panel.option2:SetScript("OnClick",function(self,event,arg1)
	DRF_Global[DRF.config.s2] = self:GetChecked()
	SysMessage(DRF.change.s2..englishOnOff(DRF_Global[DRF.config.s2])..".");
end);

DRF.panel.option3 = CreateFrame("CheckButton", "DRFOption3", DRF.panel, "UICheckButtonTemplate");
DRF.panel.option3:SetPoint("CENTER",-90,-15);
DRF.panel.option3.text = _G["DRFOption3Text"];
DRF.panel.option3.text:SetText(DRF.text.s3);
DRF.panel.option3:SetScript("OnClick",function(self,event,arg1)
	DRF_Global[DRF.config.s3] = self:GetChecked()
	SysMessage(DRF.change.s3..englishOnOff(DRF_Global[DRF.config.s3])..".");
end);

local function SetOptionsPanel()
	if ( DRF_Global[DRF.config.s1] ) then DRF.panel.option1:SetChecked(true); end
	DRF_Option1 = DRF_Global[DRF.config.s1];
	if ( DRF_Global[DRF.config.s2] ) then DRF.panel.option2:SetChecked(true); end
	DRF_Option2 = DRF_Global[DRF.config.s2];
	if ( DRF_Global[DRF.config.s3] ) then DRF.panel.option3:SetChecked(true); end
	DRF_Option3 = DRF_Global[DRF.config.s3];
end

local function DRF_Cancel()
	local didchange = false;
	if ( DRF_Global[DRF.config.s1] ~= DRF_Option1 ) then didchange = true; end
	if ( DRF_Global[DRF.config.s2] ~= DRF_Option2 ) then didchange = true; end
	if ( DRF_Global[DRF.config.s3] ~= DRF_Option3 ) then didchange = true; end
	DRF_Global[DRF.config.s1] = DRF_Option1;
	DRF_Global[DRF.config.s2] = DRF_Option2;
	DRF_Global[DRF.config.s3] = DRF_Option3;
	if didchange then
		SysMessage("Canceled Options Change");
	end
end

DRF.panel.cancel = function (self) DRF_Cancel();  end;
DRF.panel.refresh = function (self) SetOptionsPanel();  end;

