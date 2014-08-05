﻿--
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

DRF_Version = GetAddOnMetadata("DressingRoomFunctions","Version");

DRF_L = {};
DRF = {};
DRF.config = {}; DRF.change = {}; DRF.text = {};
DRF_Locale = GetLocale();


-- Hey, this is a template. Copy me and modify me for your language!
-- *** [[[ ENGLISH ]]] ***
--if ( DRF_Locale == "enUS" or DRF_Locale == "enGB" ) then
	-- *** Words
	DRF_L["Undress"] = "Undress";
	DRF_L["Target"] = "Target";
	DRF_L["Male"] = "Male";
	DRF_L["Female"] = "Female";
	DRF_L["Background"] = "Background";
	DRF_L["Remove"] = "Remove";
	DRF_L["Options"] = "Options";
	DRF_L["None"] = "None";

	-- *** Menu Options - these use special punctuation
	DRF_L["ButtonMore"] = "...";
	DRF_L["M_Gender"] = "- Gender -";
	DRF_L["M_Other"] = "- Other -";
	DRF_L["M_Unequip"] = "- Unequip -";
	DRF_L["M_Configure"] = "- Configure -";
	DRF_L["M_Alliance"] = "- Alliance -";
	DRF_L["M_Horde"] = "- Horde -";
	DRF_L["M_Neutral"] = "- Neutral -";

	-- /drf help command - will probably leave as-is but putting it here just in case
	DRF_L["C_Help"] = "help";

	-- *** Config Options
	DRF.config.s1 = "AutoUndress";
	DRF.config.s2 = "Conservative";
	DRF.config.s3 = "UndressTarget";
	DRF.change.s1 = "Auto Undress ";
	DRF.change.s2 = "Conservative Mode ";
	DRF.change.s3 = "Undress Target ";
	DRF.text.s1 = "Undress self on open";
	DRF.text.s2 = "Use conservative 'undress'";
	DRF.text.s3 = "Undress on Target Change";

	-- *** Race List - Masculine
	DRF_L["HumanM"] = "Human";
	DRF_L["DwarfM"] = "Dwarf";
	DRF_L["NightElfM"] = "Night Elf";
	DRF_L["GnomeM"] = "Gnome";
	DRF_L["DraeneiM"] = "Draenei";
	DRF_L["WorgenM"] = "Worgen";

	DRF_L["OrcM"] = "Orc";
	DRF_L["UndeadM"] = "Undead";
	DRF_L["TaurenM"] = "Tauren";
	DRF_L["TrollM"] = "Troll";
	DRF_L["GoblinM"] = "Goblin";
	DRF_L["BloodElfM"] = "Blood Elf";

	DRF_L["PandarenM"] = "Pandaren";

	-- *** Race List - Feminine
	DRF_L["HumanF"] = "Human";
	DRF_L["DwarfF"] = "Dwarf";
	DRF_L["NightElfF"] = "Night Elf";
	DRF_L["GnomeF"] = "Gnome";
	DRF_L["DraeneiF"] = "Draenei";
	DRF_L["WorgenF"] = "Worgen";

	DRF_L["OrcF"] = "Orc";
	DRF_L["UndeadF"] = "Undead";
	DRF_L["TaurenF"] = "Tauren";
	DRF_L["TrollF"] = "Troll";
	DRF_L["GoblinF"] = "Goblin";
	DRF_L["BloodElfF"] = "Blood Elf";

	DRF_L["PandarenF"] = "Pandaren";

	-- *** Item Slots
	DRF_L["Head"] = "Head";
	DRF_L["Shoulder"] = "Shoulder";
	DRF_L["Back"] = "Back";
	DRF_L["Chest"] = "Chest";
	DRF_L["Shirt"] = "Shirt";
	DRF_L["Tabard"] = "Tabard";
	DRF_L["Wrist"] = "Wrist";
	DRF_L["Hands"] = "Hands";
	DRF_L["Waist"] = "Waist";
	DRF_L["Legs"] = "Legs";
	DRF_L["Feet"] = "Feet";
	DRF_L["MainHand"] = "Main Hand";
	DRF_L["OffHand"] = "Off-Hand";

	-- *** System Messages
	DRF_L["BadUpdate"] = "You have not properly updated your add-ons. Please restart the game - Dressing Room Functions will not work until you do.";
	DRF_L["S_DRF"] = "|cffffff90DRF:|r ";
	DRF_L["S_Enabled"] = "|cff00ff00enabled|r";
	DRF_L["S_Disabled"] = "|cffff0000disabled|r";
	DRF_L["S_Cancel"] = "Canceled Options Change";
	DRF_L["S_Help"] = "/drf help - Shows this help";
	DRF_L["S_Help1"] = "/drf "..DRF.config.s1.." [on/off] - "..DRF.text.s1;
	DRF_L["S_Help2"] = "/drf "..DRF.config.s2.." [on/off] - "..DRF.text.s2;
	DRF_L["S_Help3"] = "/drf "..DRF.config.s3.." [on/off] - "..DRF.text.s3;
	DRF_L["S_OptionsFrame"] = "Opening Options Frame.";
	DRF_L["S_BadCommand"] = "Unrecognized command. Type /drf help for a list of options.";

	DRF_L["O_Panel"] = "Dressing Room Functions";
	DRF_L["O_DRF"] = "Dressing Room Functions "..DRF_Version.." by Allikitten (Allicilea of US-MoonGuard)";
--end


-- *** [[[ CHINESE ]]] ***
if ( DRF_Locale == "zhCN" or DRF_Locale == "zhTW" or DRF_Locale == "enCN" or DRF_Locale == "enTW" ) then

	-- *** Words
	DRF_L["Undress"] = "脱衣服";
	DRF_L["Target"] = "目标";
	DRF_L["Male"] = "男性";
	DRF_L["Female"] = "女";
	DRF_L["Background"] = "背景";
	DRF_L["Remove"] = "删除设备";
	DRF_L["Options"] = "选项";
	DRF_L["None"] = "无";

	-- *** Menu Options - these use special punctuation
	DRF_L["ButtonMore"] = "...";
	DRF_L["M_Gender"] = "- 性别 -";
	DRF_L["M_Other"] = "- 其他 -";
	DRF_L["M_Unequip"] = "- 删除设备 -";
	DRF_L["M_Configure"] = "- 配置 -";
	DRF_L["M_Alliance"] = "- 联盟 -";
	DRF_L["M_Horde"] = "- 部落 -";
	DRF_L["M_Neutral"] = "- 中性 -";

	-- /drf help command - will probably leave as-is but putting it here just in case
	DRF_L["C_Help"] = "help";

	-- *** Config Options
	DRF.config.s1 = "AutoUndress";
	DRF.config.s2 = "Conservative";
	DRF.config.s3 = "UndressTarget";
	DRF.change.s1 = "自动脱衣服自拍 ";
	DRF.change.s2 = "保守脱衣服 ";
	DRF.change.s3 = "脱衣服的目标开关 ";
	DRF.text.s1 = "打开时自动脱衣服";
	DRF.text.s2 = "采用保守的衣服脱衣服";
	DRF.text.s3 = "脱衣服的目标，当我切换目标";

	-- *** Race List - Masculine
	DRF_L["HumanM"] = "人类";
	DRF_L["DwarfM"] = "矮人";
	DRF_L["NightElfM"] = "暗夜精灵";
	DRF_L["GnomeM"] = "侏儒";
	DRF_L["DraeneiM"] = "德莱尼";
	DRF_L["WorgenM"] = "狼人";

	DRF_L["OrcM"] = "兽人";
	DRF_L["UndeadM"] = "亡灵";
	DRF_L["TaurenM"] = "牛头人";
	DRF_L["TrollM"] = "巨魔";
	DRF_L["GoblinM"] = "地精";
	DRF_L["BloodElfM"] = "血精灵";

	DRF_L["PandarenM"] = "熊猫人";

	-- *** Race List - Feminine
	DRF_L["HumanF"] = "人类";
	DRF_L["DwarfF"] = "矮人";
	DRF_L["NightElfF"] = "暗夜精灵";
	DRF_L["GnomeF"] = "侏儒";
	DRF_L["DraeneiF"] = "德莱尼";
	DRF_L["WorgenF"] = "狼人";

	DRF_L["OrcF"] = "兽人";
	DRF_L["UndeadF"] = "亡灵";
	DRF_L["TaurenF"] = "牛头人";
	DRF_L["TrollF"] = "巨魔";
	DRF_L["GoblinF"] = "地精";
	DRF_L["BloodElfF"] = "血精灵";

	DRF_L["PandarenF"] = "熊猫人";

	-- *** Item Slots
	DRF_L["Head"] = "头盔";
	DRF_L["Shoulder"] = "肩垫";
	DRF_L["Back"] = "披肩";
	DRF_L["Chest"] = "胸部护甲";
	DRF_L["Shirt"] = "衬衫";
	DRF_L["Tabard"] = "战袍";
	DRF_L["Wrist"] = "护腕";
	DRF_L["Hands"] = "手套";
	DRF_L["Waist"] = "腰带";
	DRF_L["Legs"] = "腿部护甲";
	DRF_L["Feet"] = "靴子";
	DRF_L["MainHand"] = "主手";
	DRF_L["OffHand"] = "副手";

	-- *** System Messages
	DRF_L["BadUpdate"] = "插件不能正确更新。请重新启动游戏。更衣室功能将无法正常工作，直到你做。";
	DRF_L["S_DRF"] = "|cffffff90DRF:|r ";
	DRF_L["S_Enabled"] = "|cff00ff00启用|r";
	DRF_L["S_Disabled"] = "|cffff0000残|r";
	DRF_L["S_Cancel"] = "取消变更";
	DRF_L["S_Help"] = "/drf help - 显示此帮助消息";
	DRF_L["S_Help1"] = "/drf "..DRF.config.s1.." [on/off] - "..DRF.text.s1;
	DRF_L["S_Help2"] = "/drf "..DRF.config.s2.." [on/off] - "..DRF.text.s2;
	DRF_L["S_Help3"] = "/drf "..DRF.config.s3.." [on/off] - "..DRF.text.s3;
	DRF_L["S_OptionsFrame"] = "打开配置";
	DRF_L["S_BadCommand"] = "无法识别的命令。输入/drf help的选项列表。";

	DRF_L["O_Panel"] = "更衣室功能";
	DRF_L["O_DRF"] = "更衣室功能"..DRF_Version.."由Allikitten- 翻译由谷歌";
end


-- *** [[[ ITALIAN ]]] ***
if ( DRF_Locale == "itIT" ) then
	-- *** Words
	DRF_L["Undress"] = "Spogliarsi";
	DRF_L["Target"] = "Obiettivo";
	DRF_L["Male"] = "Maschio";
	DRF_L["Female"] = "Femminile";
	DRF_L["Background"] = "Sfondo";
	DRF_L["Remove"] = "Togliere";
	DRF_L["Options"] = "Opzioni";
	DRF_L["None"] = "Nessuno";

	-- *** Menu Options - these use special punctuation
	DRF_L["ButtonMore"] = "...";
	DRF_L["M_Gender"] = "- Genere -";
	DRF_L["M_Other"] = "- Altro -";
	DRF_L["M_Unequip"] = "- Togliere -";
	DRF_L["M_Configure"] = "- Configurare -";
	DRF_L["M_Alliance"] = "- Alleanza -";
	DRF_L["M_Horde"] = "- Orda -";
	DRF_L["M_Neutral"] = "- Neutrale -";

	-- /drf help command - will probably leave as-is but putting it here just in case
	DRF_L["C_Help"] = "help";

	-- *** Config Options
	DRF.config.s1 = "AutoUndress";
	DRF.config.s2 = "Conservative";
	DRF.config.s3 = "UndressTarget";
	DRF.change.s1 = "Svestizione Automatico ";
	DRF.change.s2 = "Modalità conservatore ";
	DRF.change.s3 = "Spogliati di destinazione ";
	DRF.text.s1 = "Spogliarsi me sulla finestra aperta";
	DRF.text.s2 = "Utilizzare il metodo spogliarsi conservativo";
	DRF.text.s3 = "Spogliarsi interruttore di destinazione";

	-- *** Race List - Masculine
	DRF_L["HumanM"] = "Umano";
	DRF_L["DwarfM"] = "Nano";
	DRF_L["NightElfM"] = "Elfo della Notte";
	DRF_L["GnomeM"] = "Gnomo";
	DRF_L["DraeneiM"] = "Draenei";
	DRF_L["WorgenM"] = "Worgen";

	DRF_L["OrcM"] = "Orco";
	DRF_L["UndeadM"] = "Non Morto";
	DRF_L["TaurenM"] = "Tauren";
	DRF_L["TrollM"] = "Troll";
	DRF_L["GoblinM"] = "Goblin";
	DRF_L["BloodElfM"] = "Elfo del Sangue";

	DRF_L["PandarenM"] = "Pandaren";

	-- *** Race List - Feminine
	DRF_L["HumanF"] = "Umana";
	DRF_L["DwarfF"] = "Nana";
	DRF_L["NightElfF"] = "Elfa della Notte";
	DRF_L["GnomeF"] = "Gnoma";
	DRF_L["DraeneiF"] = "Draenei";
	DRF_L["WorgenF"] = "Worgen";

	DRF_L["OrcF"] = "Orchessa";
	DRF_L["UndeadF"] = "Non Morta";
	DRF_L["TaurenF"] = "Tauren";
	DRF_L["TrollF"] = "Troll";
	DRF_L["GoblinF"] = "Goblin";
	DRF_L["BloodElfF"] = "Elfa del Sangue";

	DRF_L["PandarenF"] = "Pandaren";

	-- *** Item Slots
	DRF_L["Head"] = "Testa";
	DRF_L["Shoulder"] = "Spalle";
	DRF_L["Back"] = "Schiena";
	DRF_L["Chest"] = "Torso";
	DRF_L["Shirt"] = "Camicia";
	DRF_L["Tabard"] = "Insegna";
	DRF_L["Wrist"] = "Polsi";
	DRF_L["Hands"] = "Mani";
	DRF_L["Waist"] = "Fianchi";
	DRF_L["Legs"] = "Gambe";
	DRF_L["Feet"] = "Piedi";
	DRF_L["MainHand"] = "Mano Primaria";
	DRF_L["OffHand"] = "Mano Secondaria";

	-- *** System Messages
	DRF_L["BadUpdate"] = "Non hai correttamente aggiornato il tuo addon. Si prega di riavviare il gioco - Spogliatoi Funzioni Camera non funzionerà fino a che fare.";
	DRF_L["S_DRF"] = "|cffffff90DRF:|r ";
	DRF_L["S_Enabled"] = "|cff00ff00abilitato|r";
	DRF_L["S_Disabled"] = "|cffff0000disabile|r";
	DRF_L["S_Cancel"] = "Cambiato nulla";
	DRF_L["S_Help"] = "/drf help - Mostra questo messaggio di aiuto";
	DRF_L["S_Help1"] = "/drf "..DRF.config.s1.." [on/off] - "..DRF.text.s1;
	DRF_L["S_Help2"] = "/drf "..DRF.config.s2.." [on/off] - "..DRF.text.s2;
	DRF_L["S_Help3"] = "/drf "..DRF.config.s3.." [on/off] - "..DRF.text.s3;
	DRF_L["S_OptionsFrame"] = "Pannello di configurazione di apertura.";
	DRF_L["S_BadCommand"] = "Comando non riconosciuto. Digitare /drf help per un elenco di opzioni.";

	DRF_L["O_Panel"] = "Funzioni Spogliatoio";
	DRF_L["O_DRF"] = "Funzioni spogliatoio "..DRF_Version.." da Allikitten (Allicilea di US-MoonGuard) - Tradotto da Google";
end


-- *** [[[ KOREAN ]]] ***
if ( DRF_Locale == "koKR" ) then

	-- *** Words
	DRF_L["Undress"] = "평복";
	DRF_L["Target"] = "목표";
	DRF_L["Male"] = "남성";
	DRF_L["Female"] = "여성";
	DRF_L["Background"] = "배경";
	DRF_L["Remove"] = "장비를 제거";
	DRF_L["Options"] = "옵션";
	DRF_L["None"] = "없음";

	-- *** Menu Options - these use special punctuation
	DRF_L["ButtonMore"] = "...";
	DRF_L["M_Gender"] = "- 성 -";
	DRF_L["M_Other"] = "- 다른 -";
	DRF_L["M_Unequip"] = "- 장비를 제거 -";
	DRF_L["M_Configure"] = "- 구성 -";
	DRF_L["M_Alliance"] = "- 동맹 -";
	DRF_L["M_Horde"] = "- 유목민의 떼 -";
	DRF_L["M_Neutral"] = "- 중립국 -";

	-- /drf help command - will probably leave as-is but putting it here just in case
	DRF_L["C_Help"] = "help";

	-- *** Config Options
	DRF.config.s1 = "AutoUndress";
	DRF.config.s2 = "Conservative";
	DRF.config.s3 = "UndressTarget";
	DRF.change.s1 = "자동 알몸 ";
	DRF.change.s2 = "보수적 인 옷을 벗고 ";
	DRF.change.s3 = "알몸 대상 ";
	DRF.text.s1 = "나의 창을 열 때 자동으로 저 옷을 벗고";
	DRF.text.s2 = "대신에 완전한 알몸의 보수적 인 복장";
	DRF.text.s3 = "내가 목표를 전환 할 때 내 목표를 옷을 벗고";

	-- *** Race List - Masculine
	DRF_L["HumanM"] = "인간";
	DRF_L["DwarfM"] = "드워프";
	DRF_L["NightElfM"] = "나이트 엘프";
	DRF_L["GnomeM"] = "노움";
	DRF_L["DraeneiM"] = "드레나이";
	DRF_L["WorgenM"] = "늑대인간";

	DRF_L["OrcM"] = "오크";
	DRF_L["UndeadM"] = "언데드";
	DRF_L["TaurenM"] = "타우렌";
	DRF_L["TrollM"] = "트롤";
	DRF_L["GoblinM"] = "고블린";
	DRF_L["BloodElfM"] = "블러드 엘프";

	DRF_L["PandarenM"] = "판다렌";

	-- *** Race List - Feminine
	DRF_L["HumanF"] = "인간";
	DRF_L["DwarfF"] = "드워프";
	DRF_L["NightElfF"] = "나이트 엘프";
	DRF_L["GnomeF"] = "노움";
	DRF_L["DraeneiF"] = "드레나이";
	DRF_L["WorgenF"] = "늑대인간";

	DRF_L["OrcF"] = "오크";
	DRF_L["UndeadF"] = "언데드";
	DRF_L["TaurenF"] = "타우렌";
	DRF_L["TrollF"] = "트롤";
	DRF_L["GoblinF"] = "고블린";
	DRF_L["BloodElfF"] = "블러드 엘프";

	DRF_L["PandarenF"] = "판다렌";

	-- *** Item Slots
	DRF_L["Head"] = "헬멧";
	DRF_L["Shoulder"] = "어깨";
	DRF_L["Back"] = "케이프";
	DRF_L["Chest"] = "가슴 보호구";
	DRF_L["Shirt"] = "셔츠";
	DRF_L["Tabard"] = "문장이 든 겉옷";
	DRF_L["Wrist"] = "팔 보호구";
	DRF_L["Hands"] = "장갑";
	DRF_L["Waist"] = "벨트";
	DRF_L["Legs"] = "다리 갑옷";
	DRF_L["Feet"] = "부츠";
	DRF_L["MainHand"] = "차 손";
	DRF_L["OffHand"] = "핸드 오프";

	-- *** System Messages
	DRF_L["BadUpdate"] = "제대로 애드온을 업데이트하지 마십시오. 게임을 다시 시작하십시오 - 당신이 할 때까지 작동하지 않습니다 鑴 객실 특징 드레싱.";
	DRF_L["S_DRF"] = "|cffffff90DRF:|r ";
	DRF_L["S_Enabled"] = "|cff00ff00사용|r";
	DRF_L["S_Disabled"] = "|cffff0000장애인|r";
	DRF_L["S_Cancel"] = "취소 변경";
	DRF_L["S_Help"] = "/drf help - 이 도움말 메시지를 표시";
	DRF_L["S_Help1"] = "/drf "..DRF.config.s1.." [on/off] - "..DRF.text.s1;
	DRF_L["S_Help2"] = "/drf "..DRF.config.s2.." [on/off] - "..DRF.text.s2;
	DRF_L["S_Help3"] = "/drf "..DRF.config.s3.." [on/off] - "..DRF.text.s3;
	DRF_L["S_OptionsFrame"] = "구성 패널의 오프닝.";
	DRF_L["S_BadCommand"] = "명령을 인식 할 수 없습니다. 옵션 목록 /drf help 입력합니다.";

	DRF_L["O_Panel"] = "更衣室功能";
	DRF_L["O_DRF"] = "드레싱 룸은 구글 번역 Allikitten로 "..DRF_Version.." 프레임";
end


-- *** [[[ RUSSIAN ]]] ***
if ( DRF_Locale == "ruRU" ) then
	-- *** Words
	DRF_L["Undress"] = "раздеваться";
	DRF_L["Target"] = "цель";
	DRF_L["Male"] = "мужской";
	DRF_L["Female"] = "женский";
	DRF_L["Background"] = "задник";
	DRF_L["Remove"] = "Удалить оборудование";
	DRF_L["Options"] = "опции";
	DRF_L["None"] = "Ни один";

	-- *** Menu Options - these use special punctuation
	DRF_L["ButtonMore"] = "...";
	DRF_L["M_Gender"] = "- пол -";
	DRF_L["M_Other"] = "- другой -";
	DRF_L["M_Unequip"] = "- изъятия -";
	DRF_L["M_Configure"] = "- конфигурировать -";
	DRF_L["M_Alliance"] = "- альянс -";
	DRF_L["M_Horde"] = "- орда -";
	DRF_L["M_Neutral"] = "- нейтральный -";

	-- /drf help command - will probably leave as-is but putting it here just in case
	DRF_L["C_Help"] = "help";

	-- *** Config Options
	DRF.config.s1 = "AutoUndress";
	DRF.config.s2 = "Conservative";
	DRF.config.s3 = "UndressTarget";
	DRF.change.s1 = "Автоматически Раздевайтесь ";
	DRF.change.s2 = "Консервативная Раздевайтесь ";
	DRF.change.s3 = "Раздевайтесь Целевая ";
	DRF.text.s1 = "Раздень меня, когда открывается моя гардеробная";
	DRF.text.s2 = "Используйте консервативный наряд для раздевания вместо купальнике";
	DRF.text.s3 = "Раздевайтесь цель при переключении гардеробная цели";

	-- *** Race List - Masculine
	DRF_L["HumanM"] = "Человек";
	DRF_L["DwarfM"] = "Дворф";
	DRF_L["NightElfM"] = "Ночной эльф";
	DRF_L["GnomeM"] = "Гном";
	DRF_L["DraeneiM"] = "Дреней";
	DRF_L["WorgenM"] = "Ворген";

	DRF_L["OrcM"] = "Орк";
	DRF_L["UndeadM"] = "Нежить";
	DRF_L["TaurenM"] = "Таурен";
	DRF_L["TrollM"] = "Тролль";
	DRF_L["GoblinM"] = "Гоблин";
	DRF_L["BloodElfM"] = "Эльф крови";

	DRF_L["PandarenM"] = "Пандарен";

	-- *** Race List - Feminine
	DRF_L["HumanF"] = "Человек";
	DRF_L["DwarfF"] = "Дворф";
	DRF_L["NightElfF"] = "Ночная эльфийка";
	DRF_L["GnomeF"] = "Гном";
	DRF_L["DraeneiF"] = "Дреней";
	DRF_L["WorgenF"] = "Ворген";

	DRF_L["OrcF"] = "Орк";
	DRF_L["UndeadF"] = "Нежить";
	DRF_L["TaurenF"] = "Таурен";
	DRF_L["TrollF"] = "Тролль";
	DRF_L["GoblinF"] = "Гоблин";
	DRF_L["BloodElfF"] = "Эльфийка крови";

	DRF_L["PandarenF"] = "Пандарен";

	-- *** Item Slots
	DRF_L["Head"] = "шлем";
	DRF_L["Shoulder"] = "наплечные";
	DRF_L["Back"] = "мыс";
	DRF_L["Chest"] = "нагрудник";
	DRF_L["Shirt"] = "рубашка";
	DRF_L["Tabard"] = "камзол герольда";
	DRF_L["Wrist"] = "Наручи";
	DRF_L["Hands"] = "перчатки";
	DRF_L["Waist"] = "ремень";
	DRF_L["Legs"] = "леггинсы";
	DRF_L["Feet"] = "ботинки";
	DRF_L["MainHand"] = "Первичная рук";
	DRF_L["OffHand"] = "Левая рука";

	-- *** System Messages
	DRF_L["BadUpdate"] = "У вас нет правильно обновили аддоны. Пожалуйста, перезапустите игру - Туалетная Функции номер не будет работать, пока вы делаете.";
	DRF_L["S_DRF"] = "|cffffff90DRF:|r ";
	DRF_L["S_Enabled"] = "|cff00ff00включен|r";
	DRF_L["S_Disabled"] = "|cffff0000инвалид|r";
	DRF_L["S_Cancel"] = "Отменен изменение варианты";
	DRF_L["S_Help"] = "/drf help - Показывает эту помощь";
	DRF_L["S_Help1"] = "/drf "..DRF.config.s1.." [on/off] - "..DRF.text.s1;
	DRF_L["S_Help2"] = "/drf "..DRF.config.s2.." [on/off] - "..DRF.text.s2;
	DRF_L["S_Help3"] = "/drf "..DRF.config.s3.." [on/off] - "..DRF.text.s3;
	DRF_L["S_OptionsFrame"] = "Открытие панели Конфигурация";
	DRF_L["S_BadCommand"] = "Непонятная команда. Введите /drf help для списка опций.";

	DRF_L["O_Panel"] = "Функции Гардеробная";
	DRF_L["O_DRF"] = "Функции Гардеробная "..DRF_Version.." по Allikitten - перевод Google";
end


-- *** [[[ SPANISH ]]] ***
if ( DRF_Locale == "esES" or DRF_Locale == "esMX" ) then
	-- *** Words
	DRF_L["Undress"] = "Desvestirse";
	DRF_L["Target"] = "Objetivo";
	DRF_L["Male"] = "Masculino";
	DRF_L["Female"] = "Femenino";
	DRF_L["Background"] = "Fondo";
	DRF_L["Remove"] = "Retire";
	DRF_L["Options"] = "Opciones";
	DRF_L["None"] = "Ninguno";

	-- *** Menu Options - these use special punctuation
	DRF_L["ButtonMore"] = "...";
	DRF_L["M_Gender"] = "- Género -";
	DRF_L["M_Other"] = "- Otro -";
	DRF_L["M_Unequip"] = "- Desequipamiento -";
	DRF_L["M_Configure"] = "- Configure -";
	DRF_L["M_Alliance"] = "- Alianza -";
	DRF_L["M_Horde"] = "- Horda -";
	DRF_L["M_Neutral"] = "- Neutral -";

	-- /drf help command - will probably leave as-is but putting it here just in case
	DRF_L["C_Help"] = "help";

	-- *** Config Options
	DRF.config.s1 = "AutoUndress";
	DRF.config.s2 = "Conservative";
	DRF.config.s3 = "UndressTarget";
	DRF.change.s1 = "Automáticamente Desvestirse ";
	DRF.change.s2 = "Desvestirse Conservador ";
	DRF.change.s3 = "Desvestirse Objetivo ";
	DRF.text.s1 = "Desnudar a mí mismo al abrir mi camerino";
	DRF.text.s2 = "Utilice traje conservador para desnudarse en lugar de traje de baño";
	DRF.text.s3 = "Desvestirse Objetivo cuando pongo metas vestidor";

	-- *** Race List - Masculine
	DRF_L["HumanM"] = "Humano";
	DRF_L["DwarfM"] = "Enano";
	DRF_L["NightElfM"] = "Elfo de la noche";
	DRF_L["GnomeM"] = "Gnomo";
	DRF_L["DraeneiM"] = "Draenei";
	DRF_L["WorgenM"] = "Huargen";

	DRF_L["OrcM"] = "Orco";
	DRF_L["UndeadM"] = "No-muerto";
	DRF_L["TaurenM"] = "Tauren";
	DRF_L["TrollM"] = "Trol";
	DRF_L["GoblinM"] = "Goblin";
	DRF_L["BloodElfM"] = "Elfo de sangre";

	DRF_L["PandarenM"] = "Pandaren";

	-- *** Race List - Feminine
	DRF_L["HumanF"] = "Humana";
	DRF_L["DwarfF"] = "Enana";
	DRF_L["NightElfF"] = "Elfa de la noche";
	DRF_L["GnomeF"] = "Gnoma";
	DRF_L["DraeneiF"] = "Draenei";
	DRF_L["WorgenF"] = "Huargen";

	DRF_L["OrcF"] = "Orco";
	DRF_L["UndeadF"] = "No-muerta";
	DRF_L["TaurenF"] = "Tauren";
	DRF_L["TrollF"] = "Trol";
	DRF_L["GoblinF"] = "Goblin";
	DRF_L["BloodElfF"] = "Elfa de sangre";

	DRF_L["PandarenF"] = "Pandaren";

	-- *** Item Slots
	DRF_L["Head"] = "Cabeza";
	DRF_L["Shoulder"] = "Hombros";
	DRF_L["Back"] = "Espalda";
	DRF_L["Chest"] = "Pecho";
	DRF_L["Shirt"] = "Camisa";
	DRF_L["Tabard"] = "Tabardo";
	DRF_L["Wrist"] = "Muñecas";
	DRF_L["Hands"] = "Manos";
	DRF_L["Waist"] = "Cintura";
	DRF_L["Legs"] = "Piernas";
	DRF_L["Feet"] = "Pies";
	DRF_L["MainHand"] = "Mano derecha";
	DRF_L["OffHand"] = "Mano izquierda";

	-- *** System Messages
	DRF_L["BadUpdate"] = "Usted no ha actualizado correctamente sus addons. Por favor, reinicie el juego - Vestir Funciones de habitación no funcionarán hasta que lo haga.";
	DRF_L["S_DRF"] = "|cffffff90DRF:|r ";
	DRF_L["S_Enabled"] = "|cff00ff00habilitado|r";
	DRF_L["S_Disabled"] = "|cffff0000discapacitado|r";
	DRF_L["S_Cancel"] = "Cancelado modificación Opciones";
	DRF_L["S_Help"] = "/drf help - Muestra esta ayuda";
	DRF_L["S_Help1"] = "/drf "..DRF.config.s1.." [on/off] - "..DRF.text.s1;
	DRF_L["S_Help2"] = "/drf "..DRF.config.s2.." [on/off] - "..DRF.text.s2;
	DRF_L["S_Help3"] = "/drf "..DRF.config.s3.." [on/off] - "..DRF.text.s3;
	DRF_L["S_OptionsFrame"] = "Panel de configuración de apertura.";
	DRF_L["S_BadCommand"] = "Comando no reconocido. Escriba /drf help para una lista de opciones.";

	DRF_L["O_Panel"] = "Funciones Vestidor";
	DRF_L["O_DRF"] = "Funciones Vestidor "..DRF_Version.." por Allikitten - Traducción de Google";
end


-- *** [[[ GERMAN ]]] ***
if ( DRF_Locale == "deDE" ) then
	-- *** Words
	DRF_L["Undress"] = "Entkleiden";
	DRF_L["Target"] = "Ziel";
	DRF_L["Male"] = "Männlich";
	DRF_L["Female"] = "Weiblich";
	DRF_L["Background"] = "Hintergrund";
	DRF_L["Remove"] = "Geräte entfernen";
	DRF_L["Options"] = "Optionen";
	DRF_L["None"] = "Keiner";

	-- *** Menu Options - these use special punctuation
	DRF_L["ButtonMore"] = "...";
	DRF_L["M_Gender"] = "- Geschlect -";
	DRF_L["M_Other"] = "- Andere -";
	DRF_L["M_Unequip"] = "- Ausklinken -";
	DRF_L["M_Configure"] = "- Konfigurieren -";
	DRF_L["M_Alliance"] = "- Allianz -";
	DRF_L["M_Horde"] = "- Horde -";
	DRF_L["M_Neutral"] = "- Neutral -";

	-- /drf help command - will probably leave as-is but putting it here just in case
	DRF_L["C_Help"] = "help";

	-- *** Config Options
	DRF.config.s1 = "AutoUndress";
	DRF.config.s2 = "Conservative";
	DRF.config.s3 = "UndressTarget";
	DRF.change.s1 = "Automatisch Entkleiden ";
	DRF.change.s2 = "Konservative Entkleiden ";
	DRF.change.s3 = "Entkleiden Ziel ";
	DRF.text.s1 = "Entkleiden much, wenn meine Garderobe geöffnet";
	DRF.text.s2 = "Verwenden konservatiaven Outfit für statt Badeanzug auszuziehen";
	DRF.text.s3 = "Entkleiden Ziel, wenn ich wechseln Ankleideraum Ziele";

	-- *** Race List - Masculine
	DRF_L["HumanM"] = "Mensch";
	DRF_L["DwarfM"] = "Zwerg";
	DRF_L["NightElfM"] = "Nachtelf";
	DRF_L["GnomeM"] = "Gnom";
	DRF_L["DraeneiM"] = "Draenei";
	DRF_L["WorgenM"] = "Worgen";

	DRF_L["OrcM"] = "Orc";
	DRF_L["UndeadM"] = "Untoter";
	DRF_L["TaurenM"] = "Tauren";
	DRF_L["TrollM"] = "Troll";
	DRF_L["GoblinM"] = "Goblin";
	DRF_L["BloodElfM"] = "Blutelf";

	DRF_L["PandarenM"] = "Pandaren";

	-- *** Race List - Feminine
	DRF_L["HumanF"] = "Mensch";
	DRF_L["DwarfF"] = "Zwerg";
	DRF_L["NightElfF"] = "Nachtelfe";
	DRF_L["GnomeF"] = "Gnom";
	DRF_L["DraeneiF"] = "Draenei";
	DRF_L["WorgenF"] = "Worgen";

	DRF_L["OrcF"] = "Orc";
	DRF_L["UndeadF"] = "Untote";
	DRF_L["TaurenF"] = "Tauren";
	DRF_L["TrollF"] = "Troll";
	DRF_L["GoblinF"] = "Goblin";
	DRF_L["BloodElfF"] = "Blutelfe";

	DRF_L["PandarenF"] = "Pandaren";

	-- *** Item Slots
	DRF_L["Head"] = "Kopf";
	DRF_L["Shoulder"] = "Schulter";
	DRF_L["Back"] = "Rücken";
	DRF_L["Chest"] = "Brust";
	DRF_L["Shirt"] = "Hemd";
	DRF_L["Tabard"] = "Wappenrock";
	DRF_L["Wrist"] = "Handgelenk";
	DRF_L["Hands"] = "Hände";
	DRF_L["Waist"] = "Taille";
	DRF_L["Legs"] = "Beine";
	DRF_L["Feet"] = "Füße";
	DRF_L["MainHand"] = "Waffenhand";
	DRF_L["OffHand"] = "Schildhand";

	-- *** System Messages
	DRF_L["BadUpdate"] = "Sie haben nicht korrekt aktualisiert Addons. Bitte das Spiel neu starten - Ankleidezimmer Funktionen werden nicht funktionieren bis Sie tun.";
	DRF_L["S_DRF"] = "|cffffff90DRF:|r ";
	DRF_L["S_Enabled"] = "|cff00ff00aktiviert|r";
	DRF_L["S_Disabled"] = "|cffff0000behindert|r";
	DRF_L["S_Cancel"] = "Abgebrochen Optionen ändern";
	DRF_L["S_Help"] = "/drf help - Zeigt diese Hilfe";
	DRF_L["S_Help1"] = "/drf "..DRF.config.s1.." [on/off] - "..DRF.text.s1;
	DRF_L["S_Help2"] = "/drf "..DRF.config.s2.." [on/off] - "..DRF.text.s2;
	DRF_L["S_Help3"] = "/drf "..DRF.config.s3.." [on/off] - "..DRF.text.s3;
	DRF_L["S_OptionsFrame"] = "Öffnungs Optionen Panel ";
	DRF_L["S_BadCommand"] = "Unbekannter Befehl. Geben /drf help für eine Liste von Optionen.";

	DRF_L["O_Panel"] = "Ankleidezimmer Funktionen";
	DRF_L["O_DRF"] = "Ankleidezimmer Funktionen "..DRF_Version.." von Allikitten - Übersetzt von Google";
end


-- *** [[[ FRENCH ]]] ***
if ( DRF_Locale == "frFR" ) then
	-- *** Words
	DRF_L["Undress"] = "Se Déshabiller";
	DRF_L["Target"] = "Cible";
	DRF_L["Male"] = "Homme";
	DRF_L["Female"] = "Femme";
	DRF_L["Background"] = "Toile de Fond";
	DRF_L["Remove"] = "Retirer L'Équipement";
	DRF_L["Options"] = "Options de";
	DRF_L["None"] = "Aucun";

	-- *** Menu Options - these use special punctuation
	DRF_L["ButtonMore"] = "...";
	DRF_L["M_Gender"] = "- Sexe -";
	DRF_L["M_Other"] = "- Autre -";
	DRF_L["M_Unequip"] = "- Déséquipement -";
	DRF_L["M_Configure"] = "- Configurez -";
	DRF_L["M_Alliance"] = "- Alliance -";
	DRF_L["M_Horde"] = "- Horde -";
	DRF_L["M_Neutral"] = "- Neutre -";

	-- /drf help command - will probably leave as-is but putting it here just in case
	DRF_L["C_Help"] = "help";

	-- *** Config Options
	DRF.config.s1 = "AutoUndress";
	DRF.config.s2 = "Conservative";
	DRF.config.s3 = "UndressTarget";
	DRF.change.s1 = "Automatiquement Déshabillez ";
	DRF.change.s2 = "Déshabillez conservateur ";
	DRF.change.s3 = "Déshabillez cible ";
	DRF.text.s1 = "Me déshabiller quand mon dressing est ouvert";
	DRF.text.s2 = "Utilisez tenue conservatrice pour se déshabiller au lieu de maillot de bain";
	DRF.text.s3 = "Cible se déshabiller quand je passe objectifs de dressing";

	-- *** Race List - Masculine
	DRF_L["HumanM"] = "Humain";
	DRF_L["DwarfM"] = "Nain";
	DRF_L["NightElfM"] = "Elfe de la nuit";
	DRF_L["GnomeM"] = "Gnome";
	DRF_L["DraeneiM"] = "Draeneï";
	DRF_L["WorgenM"] = "Worgen";

	DRF_L["OrcM"] = "Orc";
	DRF_L["UndeadM"] = "Mort-vivant";
	DRF_L["TaurenM"] = "Tauren";
	DRF_L["TrollM"] = "Troll";
	DRF_L["GoblinM"] = "Gobelin";
	DRF_L["BloodElfM"] = "Elfe de sang";

	DRF_L["PandarenM"] = "Pandaren";

	-- *** Race List - Feminine
	DRF_L["HumanF"] = "Humaine";
	DRF_L["DwarfF"] = "Naine";
	DRF_L["NightElfF"] = "Elfe de la nuit";
	DRF_L["GnomeF"] = "Gnome";
	DRF_L["DraeneiF"] = "Draeneï";
	DRF_L["WorgenF"] = "Worgen";

	DRF_L["OrcF"] = "Orque";
	DRF_L["UndeadF"] = "Morte-vivante";
	DRF_L["TaurenF"] = "Taurène";
	DRF_L["TrollF"] = "Trollesse";
	DRF_L["GoblinF"] = "Gobeline";
	DRF_L["BloodElfF"] = "Elfe de sang";

	DRF_L["PandarenF"] = "Pandarène";

	-- *** Item Slots
	DRF_L["Head"] = "Tête";
	DRF_L["Shoulder"] = "Épaules";
	DRF_L["Back"] = "Dos";
	DRF_L["Chest"] = "Torse";
	DRF_L["Shirt"] = "Chemise";
	DRF_L["Tabard"] = "Tabard";
	DRF_L["Wrist"] = "Poignets";
	DRF_L["Hands"] = "Mains";
	DRF_L["Waist"] = "Taille";
	DRF_L["Legs"] = "Jambes";
	DRF_L["Feet"] = "Pieds";
	DRF_L["MainHand"] = "Main droite";
	DRF_L["OffHand"] = "Main gauche";

	-- *** System Messages
	DRF_L["BadUpdate"] = "Vous n'avez pas mis à jour correctement vos addons. S'il vous plaît redémarrer le jeu - Dressing Fonctions de la chambre ne fonctionnera pas jusqu'à ce que vous faites. ";
	DRF_L["S_DRF"] = "|cffffff90DRF:|r ";
	DRF_L["S_Enabled"] = "|cff00ff00permis|r";
	DRF_L["S_Disabled"] = "|cffff0000handicapés|r";
	DRF_L["S_Cancel"] = "Des options annulées changement";
	DRF_L["S_Help"] = "/drf help - Affiche cette aide";
	DRF_L["S_Help1"] = "/drf "..DRF.config.s1.." [on/off] - "..DRF.text.s1;
	DRF_L["S_Help2"] = "/drf "..DRF.config.s2.." [on/off] - "..DRF.text.s2;
	DRF_L["S_Help3"] = "/drf "..DRF.config.s3.." [on/off] - "..DRF.text.s3;
	DRF_L["S_OptionsFrame"] = "Ouvrant le Panneau de configuration.";
	DRF_L["S_BadCommand"] = "Commande non reconnue. Tapez /drf help pour une liste d'options.";

	DRF_L["O_Panel"] = "Fonctions Dressing Room";
	DRF_L["O_DRF"] = "Fonctions Dressing Room "..DRF_Version.." par Allikitten - Traduit par Google";
end


-- *** [[[ PORTUGESE ]]] ***
if ( DRF_Locale == "ptPT" or DRF_Locale == "ptBR" ) then
	-- *** Words
	DRF_L["Undress"] = "Despir";
	DRF_L["Target"] = "Alvo";
	DRF_L["Male"] = "Masculino";
	DRF_L["Female"] = "Femenino";
	DRF_L["Background"] = "Contexto";
	DRF_L["Remove"] = "Remover";
	DRF_L["Options"] = "Opções";
	DRF_L["None"] = "Nenhum";

	-- *** Menu Options - these use special punctuation
	DRF_L["ButtonMore"] = "...";
	DRF_L["M_Gender"] = "- Sexo -";
	DRF_L["M_Other"] = "- Outro -";
	DRF_L["M_Unequip"] = "- Desquipar -";
	DRF_L["M_Configure"] = "- Configurar -";
	DRF_L["M_Alliance"] = "- Aliança -";
	DRF_L["M_Horde"] = "- Horda -";
	DRF_L["M_Neutral"] = "- Neutro -";

	-- /drf help command - will probably leave as-is but putting it here just in case
	DRF_L["C_Help"] = "help";

	-- *** Config Options
	DRF.config.s1 = "AutoUndress";
	DRF.config.s2 = "Conservative";
	DRF.config.s3 = "UndressTarget";
	DRF.change.s1 = "Automaticamente Despir ";
	DRF.change.s2 = "Despir Conservador ";
	DRF.change.s3 = "Despir-Alvo ";
	DRF.text.s1 = "Desnudar a mí mismo al abrir mi camerino";
	DRF.text.s2 = "Utilice traje conservador para desnudarse en lugar de traje de baño";
	DRF.text.s3 = "Desvestirse Objetivo cuando pongo metas vestidor";

	-- *** Race List - Masculine
	DRF_L["HumanM"] = "Humano";
	DRF_L["DwarfM"] = "Anão";
	DRF_L["NightElfM"] = "Elfo Noturno";
	DRF_L["GnomeM"] = "Gnomo";
	DRF_L["DraeneiM"] = "Draenei";
	DRF_L["WorgenM"] = "Worgen";

	DRF_L["OrcM"] = "Orc";
	DRF_L["UndeadM"] = "Morto-vivo";
	DRF_L["TaurenM"] = "Tauren";
	DRF_L["TrollM"] = "Troll";
	DRF_L["GoblinM"] = "Goblin";
	DRF_L["BloodElfM"] = "Elfo Sangrento";

	DRF_L["PandarenM"] = "Pandaren";

	-- *** Race List - Feminine
	DRF_L["HumanF"] = "Humana";
	DRF_L["DwarfF"] = "Anã";
	DRF_L["NightElfF"] = "Elfa Noturna";
	DRF_L["GnomeF"] = "Gnomida";
	DRF_L["DraeneiF"] = "Draeneia";
	DRF_L["WorgenF"] = "Worgenin";

	DRF_L["OrcF"] = "Orquisa";
	DRF_L["UndeadF"] = "Morta-viva";
	DRF_L["TaurenF"] = "Taurena";
	DRF_L["TrollF"] = "Trolesa";
	DRF_L["GoblinF"] = "Goblina";
	DRF_L["BloodElfF"] = "Elfa Sangrenta";

	DRF_L["PandarenF"] = "Pandarena";

	-- *** Item Slots
	DRF_L["Head"] = "Cabeça";
	DRF_L["Shoulder"] = "Ombros";
	DRF_L["Back"] = "Costas";
	DRF_L["Chest"] = "Torso";
	DRF_L["Shirt"] = "Camisa";
	DRF_L["Tabard"] = "Tabardo";
	DRF_L["Wrist"] = "Pulsos";
	DRF_L["Hands"] = "Mãos";
	DRF_L["Waist"] = "Cintura";
	DRF_L["Legs"] = "Pernas";
	DRF_L["Feet"] = "Pés";
	DRF_L["MainHand"] = "Mão principal";
	DRF_L["OffHand"] = "Mão secundária";

	-- *** System Messages
	DRF_L["BadUpdate"] = "Você não atualizado corretamente seus addons. Por favor, reinicie o jogo - Vestir Funções do quarto não funcionará até que você faz.";
	DRF_L["S_DRF"] = "|cffffff90DRF:|r ";
	DRF_L["S_Enabled"] = "|cff00ff00ativado|r";
	DRF_L["S_Disabled"] = "|cffff0000inválido|r";
	DRF_L["S_Cancel"] = "Cancelado mudança opções";
	DRF_L["S_Help"] = "/drf help - Mostra esta ajuda";
	DRF_L["S_Help1"] = "/drf "..DRF.config.s1.." [on/off] - "..DRF.text.s1;
	DRF_L["S_Help2"] = "/drf "..DRF.config.s2.." [on/off] - "..DRF.text.s2;
	DRF_L["S_Help3"] = "/drf "..DRF.config.s3.." [on/off] - "..DRF.text.s3;
	DRF_L["S_OptionsFrame"] = "Abertura Painel de Configuração.";
	DRF_L["S_BadCommand"] = "Comando não reconhecido. Digite /drf help para uma lista de opções.";

	DRF_L["O_Panel"] = "Funções Sala de Vestir";
	DRF_L["O_DRF"] = "Funções Sala de Vestir "..DRF_Version.." por Allikitten - Traduzido pelo Google";	
end

