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

local frame = CreateFrame("FRAME", "DRFFrame");
frame:RegisterEvent("PLAYER_ENTERING_WORLD");

DRF_Version = GetAddOnMetadata("DressingRoomFunctions","Version");

DRF_button1 = CreateFrame("Button","UndressButton",DressUpFrame,"UIPanelButtonTemplate");
DRF_button2 = CreateFrame("Button","TargetButton",DressUpFrame,"UIPanelButtonTemplate");


DRF_button1:SetPoint("Center",DressUpFrame,"TopLeft",50,-421);
DRF_button1:SetSize(70,22);
DRF_button1.text = _G["UndressButton"];
DRF_button1.text:SetText("Undress");
DRF_button1:SetScript("OnClick",function(self,event,arg1)
	DressUpModel:Undress();
	PlaySound("gsTitleOptionOK");
end);

DRF_button2:SetPoint("Center",UndressButton,"Center",62,0);
DRF_button2:SetSize(60,22);
DRF_button2.text = _G["TargetButton"];
DRF_button2.text:SetText("Target");
DRF_button2:SetScript("OnClick",function(self,event,arg1)
	local race, fileName = UnitRace("target");

	if ( UnitIsPlayer("target") ) then
		DressUpModel:SetUnit("target");
		SetDressUpBackground(DressUpFrame, fileName);
	else
		race, fileName = UnitRace("player");
		DressUpModel:SetUnit("player");
		SetDressUpBackground(DressUpFrame, fileName);
	end
	PlaySound("gsTitleOptionOK");
end);

DressUpFrameResetButton:SetScript("OnClick",function(self,event,arg1)
	local race, fileName = UnitRace("player");

	DressUpModel:SetUnit("player");
	DressUpModel:Dress();
	SetDressUpBackground(DressUpFrame, fileName);
	PlaySound("gsTitleOptionOK");
end);
