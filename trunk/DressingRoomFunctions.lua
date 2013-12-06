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

local function SetDressUpBackground(frame, fileName)
	local texture = DressUpTexturePath(fileName);
	
	if ( frame.BGTopLeft ) then
		frame.BGTopLeft:SetTexture(texture..1);
	end
	if ( frame.BGTopRight ) then
		frame.BGTopRight:SetTexture(texture..2);
	end
	if ( frame.BGBottomLeft ) then
		frame.BGBottomLeft:SetTexture(texture..3);
	end
	if ( frame.BGBottomRight ) then
		frame.BGBottomRight:SetTexture(texture..4);
	end
end

function DressUpItemLink(link)
	if ( not link or not IsDressableItem(link) ) then
		return false;
	end
	if ( SideDressUpFrame.parentFrame and SideDressUpFrame.parentFrame:IsShown() ) then
		if ( not SideDressUpFrame:IsShown() or SideDressUpFrame.mode ~= "player" ) then
			SideDressUpFrame.mode = "player";
			SideDressUpFrame.ResetButton:Show();

			local race, fileName = UnitRace("player");
			SetDressUpBackground(SideDressUpFrame, fileName);

			ShowUIPanel(SideDressUpFrame);
			SideDressUpModel:SetUnit("player");

			-- We'll worry more about this later. For now, we're just
			-- copying a function. (Oh my god, UGH, the humanity!)
			if ( DRF_Global["AutoUndress"] ) then
				SideDressUpModel:Undress();
				if ( DRF_Global["Conservative"] ) then
					SideDressUpModel:TryOn(6833);
					SideDressUpModel:TryOn(6835);
					SideDressUpModel:TryOn(55726);
				end

			end
		end
		SideDressUpModel:TryOn(link);
	else
		if ( not DressUpFrame:IsShown() or DressUpFrame.mode ~= "player") then
			DressUpFrame.mode = "player";
			DressUpFrame.ResetButton:Show();

			local race, fileName = UnitRace("player");
			SetDressUpBackground(DressUpFrame, fileName);

			ShowUIPanel(DressUpFrame);
			DressUpModel:SetUnit("player");
			if ( DRF_Global["AutoUndress"] ) then
				DRF_DoUndress(1);
			end
		end
		DressUpModel:TryOn(link);
	end
	return true;
end

function OpenDressingRoom()
	-- I admit, this is hacky, unwieldy, and probably a bit of a stupid way to do
	-- this, but I think it's better than some of the other ways I could've done
	-- it.
	DressUpItemLink(27978);
end

-- /dr command to open dressing room. That's all it does!
SLASH_OPENDR1, SLASH_OPENDR2 = '/dressingroom', '/dr';
function SlashCmdList.OPENDR(msg, editBox)
	OpenDressingRoom();
end

