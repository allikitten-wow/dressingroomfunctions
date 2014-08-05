--
--    Dressing Room Functions - Allows undress and target model for dressing room
--    Copyright (C) 2014  Rachael Alexanderson
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

if not ( DRF_Version == DRF_CoreVersion ) then
	return;
end

-- Use No-Taint library - I know this looks weird but this is the way I prefer to do it
local UIDropDownMenu_Initialize = Lib_UIDropDownMenu_Initialize;
local UIDropDownMenu_CreateInfo = Lib_UIDropDownMenu_CreateInfo;
local UIDropDownMenu_AddButton = Lib_UIDropDownMenu_AddButton;
local ToggleDropDownMenu = Lib_ToggleDropDownMenu;
local CloseDropDownMenus = Lib_CloseDropDownMenus;

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

-- _raceList is the content-reference table for the background list.
local _raceList = { };
for x, name in ipairs(_backgroundList) do
	_raceList[name] = x;
end

local DRF_button1 = CreateFrame("Button","DRF_UndressButton",DressUpFrame,"UIPanelButtonTemplate");
local DRF_button2 = CreateFrame("Button","DRF_TargetButton",DressUpFrame,"UIPanelButtonTemplate");
local DRF_button3 = CreateFrame("Button","DRF_RaceButton",DressUpFrame,"UIPanelButtonTemplate");
local DRF_menu1 = CreateFrame("FRAME","DRF_RaceMenu",DRF_button3,"Lib_UIDropDownMenuTemplate");

local function DRF_HookedUpdate(self, delta)
	if ( not DRF_UndressQueued ) then return; end
	DRF_TimeLeft = DRF_TimeLeft - delta;
	if ( DRF_TimeLeft <=0 ) then
		DRF_DoUndress(1);
		DRF_UndressQueued = nil;
	end
end
DressUpModel:HookScript("OnUpdate",DRF_HookedUpdate);

function DRF_DoUndress(NoTimer)
	DressUpModel:Undress();
	-- This function is implemented to hide the default "swim suits" for people who
	-- do not want to see them. This would be useful with the auto-undress function
	-- for people who play a character gender that they'd rather not see with only
	-- the "bare necessities" all the time. And besides, most male characters have
	-- really ugly underwear, anyhow!

	if ( DRF_Global["Conservative"] ) then
		-- White Tuxedo Shirt
		DressUpModel:TryOn(6833);
		-- Black Tuxedo Pants
		DressUpModel:TryOn(6835);
		-- Brightwood Sandals
		DressUpModel:TryOn(55726);
	end
	if not NoTimer then
		DRF_UndressQueued = 1;
		DRF_TimeLeft = 1.25;
	end
	if ( DRF_LastQueuedItem ~= nil ) then
		DressUpModel:TryOn(DRF_LastQueuedItem);
	end
end

DRF_button1:SetPoint("Center",DressUpFrame,"TopLeft",50,-421);
DRF_button1:SetSize(70,22);
DRF_button1.text = _G["DRF_UndressButton"];
DRF_button1.text:SetText(DRF_L["Undress"]);
DRF_button1:SetScript("OnClick",function(self,event,arg1)
	DRF_LastQueuedItem = nil;
	DRF_DoUndress(1);
	PlaySound("gsTitleOptionOK");
end);

DRF_button2:SetPoint("Center",DRF_UndressButton,"Center",62,0);
DRF_button2:SetSize(60,22);
DRF_button2.text = _G["DRF_TargetButton"];
DRF_button2.text:SetText(DRF_L["Target"]);
DRF_button2:SetScript("OnClick",function(self,event,arg1)
	local race, fileName = UnitRace("target");

	if ( UnitIsPlayer("target") ) then
		DressUpModel:SetUnit("target");
		DRF_LastGender = UnitSex("target");
		SetDressUpBackground(DressUpFrame, fileName);
		if ( DRF_DebugMode == false ) then
			DressUpModel:SetPortraitZoom(0.8);
			Model_Reset(DressUpModel);
		end
	else
		race, fileName = UnitRace("player");
		DressUpModel:SetUnit("player");
		DRF_LastGender = UnitSex("player");
		SetDressUpBackground(DressUpFrame, fileName);
		if ( DRF_DebugMode == false ) then
			DressUpModel:SetPortraitZoom(0.8);
			Model_Reset(DressUpModel);
		end
	end
	DRF_LastQueuedItem = nil;
	if ( DRF_Global["UndressTarget"] ) then
		DRF_DoUndress();
	end
	PlaySound("gsTitleOptionOK");
end);

DRF_button3:SetPoint("Center",DRF_TargetButton,"Center",42,0);
DRF_button3:SetSize(30,22);
DRF_button3.text = _G["DRF_RaceButton"];
DRF_button3.text:SetText(DRF_L["ButtonMore"]);

local function DRF_SetArbitraryRace(id,gender)
	DRF_LastQueuedItem = nil;
	if ( gender == 0 or gender == 1 ) then
		DressUpModel:SetCustomRace(id,gender);
		DRF_LastGender = 2 + gender;
		if ( DRF_Global["UndressTarget"] ) then
			DRF_DoUndress();
		end
		-- Puts a helmet on the character, to fix a bug using hidden helmets.
		-- This chosen helmet is somewhat invisible, it's a holiday reward from
		-- the midsummer fire festival.
		if ( DRF_DebugMode == false ) then
			DressUpModel:TryOn(23323);
			DressUpModel:UndressSlot(GetInventorySlotInfo("HeadSlot"));
			DressUpModel:SetPortraitZoom(0.8);
			Model_Reset(DressUpModel);
		end
	elseif ( gender == 3 ) then
		DressUpModel:SetModel("character\\".._backgroundList[id].."\\male\\".._backgroundList[id].."male.m2");
		DRF_LastGender = 2;
	elseif ( gender == 4 ) then
		DressUpModel:SetModel("character\\".._backgroundList[id].."\\female\\".._backgroundList[id].."female.m2");
		DRF_LastGender = 3;
	end
	if not ( id == 0 ) then
		SetDressUpBackground(DressUpFrame, _backgroundList[id]);
	else
		DressUpBackgroundTopLeft:SetTexture(0,0,0,0.0)
		DressUpBackgroundTopRight:SetTexture(0,0,0,0.0);
		DressUpBackgroundBotLeft:SetTexture(0,0,0,0.0);
		DressUpBackgroundBotRight:SetTexture(0,0,0,0.0);
	end
end

local function DRF_PerformOtherAction(arg1,arg2)
	if ( arg1 == 14 ) then
		DressUpModel:UndressSlot(arg2);
	end
end

local function DRF_menu1_OnClick(self, arg1, arg2, checked)
	DRF_SetArbitraryRace(arg1,arg2);
	CloseDropDownMenus();
end

local function DRF_menu2_OnClick(self, arg1, arg2, checked)
	DRF_PerformOtherAction(arg2,arg1);
	CloseDropDownMenus();
end

local function DRF_menuOptions_OnClick(self, arg1, arg2, checked)
	PlaySound("gsTitleOptionOK");
	InterfaceOptionsFrame_OpenToCategory(DRF.panel);
	CloseDropDownMenus();
end

DRF_menu1:SetPoint("CENTER");
--UIDropDownMenu_SetWidth(DRF_menu1, 200);
--UIDropDownMenu_SetText(DRF_menu1, "Select Race/Gender:");
UIDropDownMenu_Initialize(DRF_menu1, function(self, level, menuList)
	local info = UIDropDownMenu_CreateInfo();
	if menuList == nil then menuList = 0 end
	if level == 1 then
		info.checked, info.notCheckable = false, true;

		info.hasArrow, info.text, info.isTitle = false, DRF_L["M_Gender"], true;
		UIDropDownMenu_AddButton(info, level);
		info = UIDropDownMenu_CreateInfo();
		info.checked, info.notCheckable = false, true;

		info.text = DRF_L["Male"];
		info.menuList, info.hasArrow = 0, true;
		UIDropDownMenu_AddButton(info, level);
		info.text = DRF_L["Female"];
		info.menuList, info.hasArrow = 1, true;
		UIDropDownMenu_AddButton(info, level);

		info.hasArrow, info.text, info.isTitle = false, DRF_L["M_Other"], true;
		UIDropDownMenu_AddButton(info, level);
		info = UIDropDownMenu_CreateInfo();
		info.checked, info.notCheckable = false, true;

		info.text = DRF_L["Background"];
		info.menuList, info.hasArrow = 2, true;
		UIDropDownMenu_AddButton(info, level);

		if ( DRF_DebugMode ) then
			info.hasArrow, info.text, info.isTitle = false, "- Debug -", true;
			UIDropDownMenu_AddButton(info, level);
			info = UIDropDownMenu_CreateInfo();
			info.checked, info.notCheckable = false, true;

			info.text = "Male Model";
			info.menuList, info.hasArrow = 3, true;
			UIDropDownMenu_AddButton(info, level);

			info.text = "Female Model";
			info.menuList, info.hasArrow = 4, true;
			UIDropDownMenu_AddButton(info, level);
		end

		info.hasArrow, info.text, info.isTitle = false, DRF_L["M_Unequip"], true;
		UIDropDownMenu_AddButton(info, level);
		info = UIDropDownMenu_CreateInfo();
		info.checked, info.notCheckable = false, true;

		info.text = DRF_L["Remove"];
		info.menuList, info.hasArrow = 14, true;
		UIDropDownMenu_AddButton(info, level);

		info.hasArrow, info.text, info.isTitle = false, DRF_L["M_Configure"], true;
		UIDropDownMenu_AddButton(info, level);
		info = UIDropDownMenu_CreateInfo();
		info.checked, info.notCheckable = false, true;

		info.func = DRF_menuOptions_OnClick;
		info.text, info.arg1 = DRF_L["Options"], 200;
		UIDropDownMenu_AddButton(info, level);

	elseif ( menuList >= 0 and menuList <= 4 ) then

		-- Language Handling
		local lgender;
		if ( menuList == 1 or menuList == 4 ) then lgender = "F"; else lgender = "M"; end

		-- Background - choosing "male" or "female" racelists based on last known gender selection
		if ( menuList == 2 ) then
			if DRF_LastGender == 3 then lgender = "F"; else lgender = "M"; end
		end

		info.notCheckable, info.func, info.arg2 = true, DRF_menu1_OnClick, menuList;

		info.text, info.isTitle = DRF_L["M_Alliance"], true;
		UIDropDownMenu_AddButton(info, level);
		info = UIDropDownMenu_CreateInfo();
		info.notCheckable, info.func, info.arg2 = true, DRF_menu1_OnClick, menuList;

		info.text, info.arg1 = DRF_L["Human"..lgender], 1;
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = DRF_L["Dwarf"..lgender], 3;
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = DRF_L["NightElf"..lgender], 4;
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = DRF_L["Gnome"..lgender], 7;
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = DRF_L["Draenei"..lgender], 11;
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = DRF_L["Worgen"..lgender], 22;
		UIDropDownMenu_AddButton(info, level);

		info.text, info.isTitle = DRF_L["M_Horde"], true;
		UIDropDownMenu_AddButton(info, level);
		info = UIDropDownMenu_CreateInfo();
		info.notCheckable, info.func, info.arg2 = true, DRF_menu1_OnClick, menuList;

		info.text, info.arg1 = DRF_L["Orc"..lgender], 2;
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = DRF_L["Undead"..lgender], 5;
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = DRF_L["Tauren"..lgender], 6;
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = DRF_L["Troll"..lgender], 8;
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = DRF_L["Goblin"..lgender], 9;
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = DRF_L["BloodElf"..lgender], 10;
		UIDropDownMenu_AddButton(info, level);

		info.text, info.isTitle = DRF_L["M_Neutral"], true;
		UIDropDownMenu_AddButton(info, level);
		info = UIDropDownMenu_CreateInfo();
		info.notCheckable, info.func, info.arg2 = true, DRF_menu1_OnClick, menuList;

		info.text, info.arg1 = DRF_L["Pandaren"..lgender], 24;
		UIDropDownMenu_AddButton(info, level);

		if ( menuList == 2 ) then
			info.text, info.isTitle = DRF_L["M_Other"], true;
			UIDropDownMenu_AddButton(info, level);
			info = UIDropDownMenu_CreateInfo();
			info.notCheckable, info.func, info.arg2 = true, DRF_menu1_OnClick, menuList;

			info.text, info.arg1 = DRF_L["None"], 0;
			UIDropDownMenu_AddButton(info, level);
		end

	elseif ( menuList == 14 ) then
		info.notCheckable, info.func, info.arg2 = true, DRF_menu2_OnClick, menuList;
		info.text, info.arg1 = DRF_L["Head"], GetInventorySlotInfo("HeadSlot");
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = DRF_L["Shoulder"], GetInventorySlotInfo("ShoulderSlot");
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = DRF_L["Back"], GetInventorySlotInfo("BackSlot");
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = DRF_L["Chest"], GetInventorySlotInfo("ChestSlot");
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = DRF_L["Shirt"], GetInventorySlotInfo("ShirtSlot");
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = DRF_L["Tabard"], GetInventorySlotInfo("TabardSlot");
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = DRF_L["Wrist"], GetInventorySlotInfo("WristSlot");
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = DRF_L["Hands"], GetInventorySlotInfo("HandsSlot");
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = DRF_L["Waist"], GetInventorySlotInfo("WaistSlot");
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = DRF_L["Legs"], GetInventorySlotInfo("LegsSlot");
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = DRF_L["Feet"], GetInventorySlotInfo("FeetSlot");
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = DRF_L["MainHand"], GetInventorySlotInfo("MainHandSlot");
		UIDropDownMenu_AddButton(info, level);
		info.text, info.arg1 = DRF_L["OffHand"], GetInventorySlotInfo("SecondaryHandSlot");
		UIDropDownMenu_AddButton(info, level);
	end
end, "MENU");

DressUpFrameResetButton:SetScript("OnClick",function(self,event,arg1)
	local race, fileName = UnitRace("player");

	if ( DRF_DebugMode == false ) then
		DressUpModel:SetUnit("player");
		DRF_LastGender = UnitSex("player");
	end
	DressUpModel:Dress();
	if ( DRF_DebugMode == false ) then
		DressUpModel:SetPortraitZoom(0.8);
		Model_Reset(DressUpModel);
	end

	SetDressUpBackground(DressUpFrame, fileName);
	PlaySound("gsTitleOptionOK");
end);


DRF_button3:SetScript("OnClick",function(self,event,arg1)
	ToggleDropDownMenu(1, nil, DRF_menu1, "cursor", 3, -3);
end);