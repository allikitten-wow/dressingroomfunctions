DRF_CoreVersion = "v1.2";
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

-- _raceList is the content-reference table for the background list.
local _raceList = { };
for x, name in ipairs(_backgroundList) do
	_raceList[name] = x;
end

DRF_Version = GetAddOnMetadata("DressingRoomFunctions","Version");
DRF_DebugMode = false;

function DRF_ImproperUpdate()
	local s_message = "You have not properly updated your add-ons. Please restart the game - Dressing Room Functions will not work until you do.";
	message(s_message);
	DEFAULT_CHAT_FRAME:AddMessage(s_message);
end

if not ( DRF_Version == DRF_CoreVersion ) then
	DRF_ImproperUpdate();
	return;
end

local function DressUpTexturePath(raceFileName)
	-- HACK
	if ( not raceFileName ) then
		raceFileName = "Orc";
	end
	-- END HACK

	return "Interface\\DressUpFrame\\DressUpBackground-"..raceFileName;
end

local function SetDressUpBackground()
	local race, fileName = UnitRace("player");
	local texture = DressUpTexturePath(fileName);
	DressUpBackgroundTopLeft:SetTexture(texture..1);
	DressUpBackgroundTopRight:SetTexture(texture..2);
	DressUpBackgroundBotLeft:SetTexture(texture..3);
	DressUpBackgroundBotRight:SetTexture(texture..4);
end

function DressUpItemLink(link)
	if ( not link or not IsDressableItem(link) ) then
		return;
	end
	if ( not DressUpFrame:IsShown() ) then
		ShowUIPanel(DressUpFrame);
		SetDressUpBackground();
		DressUpModel:SetUnit("player");
		if ( DRF_Global["AutoUndress"] ) then
			DRF_DoUndress(1);
		end
	end
	DressUpModel:TryOn(link);
end

