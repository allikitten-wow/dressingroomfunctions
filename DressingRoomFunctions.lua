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

local function Noop() end

local _backgroundList = {
	[1] = "Human",
	[2] = "Orc",
	[3] = "Dwarf",
	[4] = "NightElf",
	[5] = "Scourge",
	[6] = "Tauren",
	[7] = "Gnome",
	[8] = "Troll",
	[9] = "Goblin",
	[10] = "BloodElf",
	[11] = "Draenei",
	[22] = "Worgen",
	[24] = "Pandaren"
};

DRF_Version = GetAddOnMetadata("DressingRoomFunctions","Version");

local DRF_button1 = CreateFrame("Button","DRF_UndressButton",DressUpFrame,"UIPanelButtonTemplate");
local DRF_button2 = CreateFrame("Button","DRF_TargetButton",DressUpFrame,"UIPanelButtonTemplate");
local DRF_button3 = CreateFrame("Button","DRF_RaceButton",DressUpFrame,"UIPanelButtonTemplate");
local DRF_menu1 = CreateFrame("FRAME","DRF_RaceMenu",DRF_button3,"UIDropDownMenuTemplate");


DRF_button1:SetPoint("Center",DressUpFrame,"TopLeft",50,-421);
DRF_button1:SetSize(70,22);
DRF_button1.text = _G["DRF_UndressButton"];
DRF_button1.text:SetText("Undress");
DRF_button1:SetScript("OnClick",function(self,event,arg1)
	DressUpModel:Undress();
	PlaySound("gsTitleOptionOK");
end);

DRF_button2:SetPoint("Center",DRF_UndressButton,"Center",62,0);
DRF_button2:SetSize(60,22);
DRF_button2.text = _G["DRF_TargetButton"];
DRF_button2.text:SetText("Target");
DRF_button2:SetScript("OnClick",function(self,event,arg1)
	local race, fileName = UnitRace("target");

	if ( UnitIsPlayer("target") ) then
		DressUpModel:SetUnit("target");
		SetDressUpBackground(DressUpFrame, fileName);
		DressUpModel:SetPortraitZoom(0.8);
		Model_Reset(DressUpModel);
	else
		race, fileName = UnitRace("player");
		DressUpModel:SetUnit("player");
		SetDressUpBackground(DressUpFrame, fileName);
		DressUpModel:SetPortraitZoom(0.8);
		Model_Reset(DressUpModel);
	end
	PlaySound("gsTitleOptionOK");
end);

DRF_button3:SetPoint("Center",DRF_TargetButton,"Center",42,0);
DRF_button3:SetSize(30,22);
DRF_button3.text = _G["DRF_RaceButton"];
DRF_button3.text:SetText("...");

local function DRF_SetArbitraryRace(id,gender)
	if ( gender == 0 or gender == 1 ) then
		DressUpModel:SetCustomRace(id,gender);
		-- Puts a helmet on the character, to fix a bug using hidden helmets.
		-- This chosen helmet is somewhat invisible, it's a holiday reward from
		-- the midsummer fire festival.
		DressUpModel:TryOn(23323);
		DressUpModel:UndressSlot(1);
		DressUpModel:SetPortraitZoom(0.8);
		Model_Reset(DressUpModel);
	end
	SetDressUpBackground(DressUpFrame, _backgroundList[id]);
end

local function DRF_menu1_OnClick(self, arg1, arg2, checked)
	DRF_SetArbitraryRace(arg1,arg2);
	CloseDropDownMenus();
end

DRF_menu1:SetPoint("CENTER");
--UIDropDownMenu_SetWidth(DRF_menu1, 200);
--UIDropDownMenu_SetText(DRF_menu1, "Select Race/Gender:");
UIDropDownMenu_Initialize(DRF_menu1, function(self, level, menuList)
	local info = UIDropDownMenu_CreateInfo();
	if level == 1 then
		info.checked = false;
		info.notCheckable = true;

		info.hasArrow, info.text, info.isTitle = false, "- Gender -", true;
		UIDropDownMenu_AddButton(info, level);
		info = UIDropDownMenu_CreateInfo();
		info.checked = false;
		info.notCheckable = true;

		info.text = "Male";
		info.menuList, info.hasArrow = 0, true;
		UIDropDownMenu_AddButton(info, level);
		info.text = "Female";
		info.menuList, info.hasArrow = 1, true;
		UIDropDownMenu_AddButton(info, level);

		info.hasArrow, info.text, info.isTitle = false, "- Other -", true;
		UIDropDownMenu_AddButton(info, level);
		info = UIDropDownMenu_CreateInfo();
		info.checked = false;
		info.notCheckable = true;

		info.text = "Background";
		info.menuList, info.hasArrow = 2, true;
		UIDropDownMenu_AddButton(info, level);
	else
		info.notCheckable = true;
		info.func = DRF_menu1_OnClick;
		info.arg2 = menuList;

		info.text, info.isTitle = "- Alliance -", true;
		UIDropDownMenu_AddButton(info, level);
		info = UIDropDownMenu_CreateInfo();
		info.notCheckable = true;
		info.func = DRF_menu1_OnClick;
		info.arg2 = menuList;

		info.text, info.arg1 = "Human", 1;
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = "Dwarf", 3;
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = "Night Elf", 4;
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = "Gnome", 7;
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = "Draenei", 11;
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = "Worgen", 22;
		UIDropDownMenu_AddButton(info, level);

		info.text, info.isTitle = "- Horde -", true;
		UIDropDownMenu_AddButton(info, level);
		info = UIDropDownMenu_CreateInfo();
		info.notCheckable = true;
		info.func = DRF_menu1_OnClick;
		info.arg2 = menuList;

		info.text, info.arg1 = "Orc", 2;
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = "Undead", 5;
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = "Tauren", 6;
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = "Troll", 8;
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = "Goblin", 9;
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = "Blood Elf", 10;
		UIDropDownMenu_AddButton(info, level);

		info.text, info.isTitle = "- Neutral -", true;
		UIDropDownMenu_AddButton(info, level);
		info = UIDropDownMenu_CreateInfo();
		info.notCheckable = true;
		info.func = DRF_menu1_OnClick;
		info.arg2 = menuList;

		info.text, info.arg1 = "Pandaren", 24;
		UIDropDownMenu_AddButton(info, level);
	end
end, "MENU");

DressUpFrameResetButton:SetScript("OnClick",function(self,event,arg1)
	local race, fileName = UnitRace("player");

	DressUpModel:SetUnit("player");
	DressUpModel:Dress();
	DressUpModel:SetPortraitZoom(0.8);
	Model_Reset(DressUpModel);

	SetDressUpBackground(DressUpFrame, fileName);
	PlaySound("gsTitleOptionOK");
end);


DRF_button3:SetScript("OnClick",function(self,event,arg1)
	ToggleDropDownMenu(1, nil, DRF_menu1, "cursor", 3, -3);
end);
