Mem = {
	kong_base = {0x7FC950, 0x7FC890, 0x7FCDE0},
	rng = {0x746A40, 0x7411A0, 0x746300},
	dmap = {0x7444E4, 0x73EC34, 0x743DA4},
	mode = {0x755318, 0x74FB98, 0x7553D8},
	transition_speed = {0x7FD88C, 0x7FD7CC, 0x7FDD1C},
	cmap = {0x76A0A8, 0x764BC8, 0x76A298},
	dexit = {0x7444E8, 0x73EC38, 0x743DA8},
	cs = {0x7476F4, 0x741E54, 0x746FB4},
	cs_active = {0x7444EC, 0x73EC3C, 0x743DAC},
	zipper_progress = {0x7ECC60, 0x7ECBA0, 0x7ECE50},
	frame_lag = {0x76AF10, 0x765A30, 0x76B100},
	frame_real = {0x7F0560, 0x7F0480, 0x7F09D0},
	cutscene_timer = {0x7476F0, 0x741E50, 0x746FB0},
	pmap = {0x76A172, 0x764C92, 0x76A362},
	actor_count = {0x7FC3F0, 0x7FC310, 0x7FC860},
	pointer_list = {0x7FBFF0, 0x7FBF10, 0x7FC460},
	map_state = {0x76A0B1, 0x764BD1, 0x76A2A1},
	krool_round = {0x750AD4, 0x74B224, 0x7503B4},
	level_index_mapping = {0x7445E0, 0x73ED30, 0x743EA0},
	eeprom_copy_base = {0x7ECEA8, 0x7ECDC8, 0x7ED318},
	eeprom_file_mapping = {0x7EDEA8, 0x7EDDC8, 0x7EE318},
	file = {0x7467C8, 0x740F18, 0x746088},
	story_skip = {0x74452C,0x73EC7C,0x743DEC},
	enemy_respawn_object = {0x7FDC8C, 0x7FDBCC, 0x7FE11C},
	num_enemies = {0x7FDC88, 0x7FDBC8, 0x7FE118},
	obj_model2_timer = {0x76A064, 0x764B84, 0x76A254},
	cexit = {0x76A0AC, 0x764BCC, 0x76A29C},
	pexit = {0x76A174, 0x764C94, 0x76A364},
	music = {0x7458DD, nil, nil},
	insubmap = {0x76A160, nil, nil},
	tnsdoor_header = {0x7446C0, nil, nil},
	player_pointer = {0x7FBB4C, 0x7FBA6C, 0x7FBFBC},
	insubmap_b = {0x7F5A6B, nil, nil},
	cutscene_type = {0x7476FC, 0x741E5C, 0x746FBC},
	cutscene_type_map = {0x7F5B10, 0x7F5A30, 0x7F5F80},
	cutscene_type_kong = {0x7F5BF0, 0x7F5B10, 0x7F6060},
	loading_zone_transition_type = {0x76AEE0, 0x765A00, 0x76B0D0},
	oranges = {0x7FCC44, nil, nil},
	cutscene_fade_active = {0x75533B, 0x74FBBB, 0x7553FB},
	cutscene_fade_value = {0x75533E, 0x74FBBE, 0x7553FE},
	loading_zone_array_size = {0x7FDCB0, 0x7FDBF0, 0x7FE140},
	loading_zone_array = {0x7FDCB4, 0x7FDBF4, 0x7FE144},
	character = {0x74E77C, 0x748EDC, 0x74E05C},
	arcade_round = {0x04A76C,nil,nil},
	prev_map = {0x76AEF3,nil,nil},
	temp_flag_start = {0x7FDCE0,nil,nil},
	arcade_win_condition = {0x04BE4D,nil,nil},
	obj_model2_array_pointer = {0x7F6000, 0x7F5F20, 0x7F6470},
	obj_model2_array_count = {0x7F6004, 0x7F5F24, 0x7F6474},
};

-------------------------------
-- SOME SCRIPTHAWK FUNCTIONS --
-------------------------------

function getVersion()
	romHash = gameinfo.getromhash();
	if romHash == "F96AF883845308106600D84E0618C1A066DC6676" then
		return 2;
	elseif romHash == "F0AD2B2BBF04D574ED7AFBB1BB6A4F0511DCD87D" then
		return 3;
	elseif romHash == "CF806FF2603640A748FCA5026DED28802F1F4A50" then
		return 1;
	else
		print("The ROM you are using does not work for this script");
		return 4;
	end
end

RDRAMBase = 0x80000000;
RDRAMSize = 0x800000; 
RAMBase = RDRAMBase;
RAMSize = RDRAMSize;

function isRDRAM(value)
	return type(value) == "number" and value >= 0 and value < RDRAMSize;
end

function isPointer(value)
		return type(value) == "number" and value >= RDRAMBase and value < RDRAMBase + RDRAMSize;
end

function dereferencePointer(address)
	if type(address) == "number" and address >= 0 and address < (RDRAMSize - 4) then
		address = mainmemory.read_u32_be(address);
		if isPointer(address) then
			return address - RDRAMBase;
		end
	end
end

version = getVersion();
check_bit = bit.check;
clear_bit = bit.clear;
set_bit = bit.set;

function getFileIndex()
	return mainmemory.readbyte(Mem.file[version]);
end

local eeprom_slot_size = 0x1AC;

function getCurrentEEPROMSlot()
	local fileIndex = getFileIndex();
	for i = 0, 3 do
		local EEPROMMap = mainmemory.readbyte(Mem.eeprom_file_mapping[version] + i);
		if EEPROMMap == fileIndex then
			return i;
		end
	end
	return 0; -- Default
end

function getFlagBlockAddress()
	return Mem.eeprom_copy_base[version] + getCurrentEEPROMSlot() * eeprom_slot_size;
end

function clearFlag(byte, bit)
	local flags = getFlagBlockAddress();
	if type(byte) == "number" and type(bit) == "number" and bit >= 0 and bit < 8 then
		local currentValue = mainmemory.readbyte(flags + byte);
		mainmemory.writebyte(flags + byte, clear_bit(currentValue, bit));
	end
end

function setFlag(byte, bit)
	local flags = getFlagBlockAddress();
	if type(byte) == "number" and type(bit) == "number" and bit >= 0 and bit < 8 then
		local currentValue = mainmemory.readbyte(flags + byte);
		mainmemory.writebyte(flags + byte, set_bit(currentValue, bit));
	end
end

function checkFlag(byte, bit)
	if type(byte) == "string" then
		local flag = getFlagByName(byte);
		if type(flag) == "table" then
			byte = flag.byte;
			bit = flag.bit;
		end
	end
	if type(byte) == "number" and type(bit) == "number" and bit >= 0 and bit < 8 then
		local flags = getFlagBlockAddress();
		local currentValue = mainmemory.readbyte(flags + byte);
		if check_bit(currentValue, bit) then
			return true;
		else
			return false;
		end
	else
	end
	return false;
end

function setTempFlag(tempByte,tempBit)
	temp_start = Mem.temp_flag_start[version]
	temp_flag_value = mainmemory.readbyte(temp_start + tempByte);
	temp_flag_value = bit.set(temp_flag_value,tempBit);
	mainmemory.writebyte(temp_start + tempByte, temp_flag_value);
end

function isLoading()
	return mainmemory.read_u32_be(Mem.obj_model2_timer[version]) == 0;
end

function getPlayerObject() -- TODO: Cache this
	if isLoading() then
		return;
	end
	return dereferencePointer(Mem.player_pointer[version]);
end

client.pause();

function getActorPointers(actor_value)
	pointers = {};
	count = 0;
	object_m1_count = math.min(255, mainmemory.read_u16_be(Mem.actor_count[version])); -- Actor Count
	for object_no = 0, object_m1_count do
		local pointer = dereferencePointer(Mem.pointer_list[version] + (object_no * 4));
		if isRDRAM(pointer) then
			actor_type = mainmemory.read_u32_be(pointer + 0x58);
			if actor_type == actor_value then
				count = count + 1;
				pointers[count] = pointer;
			end
		end
	end
	return pointers
end

string.lpad = function(str, len, char)
	if type(str) ~= "str" then
		str = tostring(str);
	end
	if char == nil then char = ' ' end
	return string.rep(char, len - #str)..str;
end

function toHexString(value, desiredLength, prefix)
	value = string.format("%X", value or 0);
	value = string.lpad(value, desiredLength or string.len(value), '0');
	return (prefix or "0x")..value;
end

function getLoadingZoneArray()
	return dereferencePointer(Mem.loading_zone_array[version]);
end

loading_zone_size = 0x3A;

function getLZPointers()
	lz_pointers = {};
	loadingZoneArray = getLoadingZoneArray();
	if isRDRAM(loadingZoneArray) then
		arraySize = mainmemory.read_u16_be(Mem.loading_zone_array_size[version]);
		for i = 0, arraySize - 1 do
			table.insert(lz_pointers, loadingZoneArray + (i * loading_zone_size));
		end
	end
end

dev_mode = 0;

function toggleDevMode()
	dev_mode = 1 - dev_mode;
	if dev_mode == 1 then
		print("Developer Mode: On");
	else
		print("Developer Mode: Off");
	end
end

function devPrint(text)
	if dev_mode == 1 then
		print(text);
	end
end

regular_maps = {4,6,7,12,13,14,16,17,19,20,21,22,23,24,26,27,29,30,31,33,34,36,37,38,39,41,43,44,45,46,47,48,49,51,52,54,55,56,57,58,59,60,61,62,63,64,70,71,72,82,84,85,86,87,88,89,90,91,92,93,94,95,97,98,100,105,106,108,110,112,113,114,151,163,164,166,167,168,169,170,171,173,174,175,176,178,179,183,185,186,187,188,189,193,194,195,200};
global_maps = {1,5,15,25,42};
boss_maps = {8,83,111,154,196,197,199};
special_minigame_maps = {2,9};
bonus_maps = {3,10,18,32,35,50,65,66,67,68,69,74,75,77,78,79,96,99,101,102,103,104,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,165,201,202,209,210,211,212};
crown_maps = {53,73,155,156,157,158,159,160,161,162};
training_barrels = {177,180,181,182};
k_rool = {203,204,205,206,207};

function getEnemyPointerFromIds(enemyIdTable)
	local enemyRespawnObject = dereferencePointer(Mem.enemy_respawn_object[version]);
	local enemySlotSize = 0x48;
	inputTable = enemyIdTable;
	enemyIdPointerList = {};
	enemyId_count = 0;
	if isRDRAM(enemyRespawnObject) then
		local numberOfEnemies = mainmemory.read_u16_be(Mem.num_enemies[version]);
		for j = 1, #inputTable do
			for i = 1, numberOfEnemies do
				slotBase = enemyRespawnObject + (i - 1) * enemySlotSize;
				if mainmemory.readbyte(slotBase) == inputTable[j] then
					enemyId_count = enemyId_count + 1;
					enemyIdPointerList[enemyId_count] = slotBase;
				end
			end
		end
	end
	return enemyIdPointerList;
end

function getObjectModel2Array()
	return dereferencePointer(Mem.obj_model2_array_pointer[version]);
end

function getOM2Type(objectModel2Base)
	local model2ID = mainmemory.read_u16_be(objectModel2Base + 0x84);
	return model2ID
end

function getOM2PointersFromId(OM2Type)
	om2Pointers = {};
	om2_counter = 0;
	local objModel2Array = getObjectModel2Array();
	if isRDRAM(objModel2Array) then
		local numSlots = mainmemory.read_u32_be(Mem.obj_model2_array_count[version]);
		for i = 1, numSlots do
			local base = objModel2Array + (i - 1) * 0x90;
			if getOM2Type(base) == OM2Type then
				om2_counter = om2_counter + 1;
				om2Pointers[om2_counter] = base;
			end
		end
	end
	return om2Pointers;
end

function mapType(mapNumber)
	for i = 1, #regular_maps do
		if mapNumber == regular_maps[i] then
			return "regular_maps";
		end
	end
	for i = 1, #global_maps do
		if mapNumber == global_maps[i] then
			return "global_maps";
		end
	end
	for i = 1, #boss_maps do
		if mapNumber == boss_maps[i] then
			return "boss_maps";
		end
	end
	for i = 1, #special_minigame_maps do
		if mapNumber == special_minigame_maps[i] then
			return "special_minigame_maps";
		end
	end
	for i = 1, #bonus_maps do
		if mapNumber == bonus_maps[i] then
			return "bonus_maps";
		end
	end
	for i = 1, #crown_maps do
		if mapNumber == crown_maps[i] then
			return "crown_maps";
		end
	end
	for i = 1, #training_barrels do
		if mapNumber == training_barrels[i] then
			return "training_barrels";
		end
	end
	for i = 1, #k_rool do
		if mapNumber == k_rool[i] then
			return "k_rool";
		end
	end
	return "Unassigned";
end

newFileFlags = {
	[1] = {0x2F,2}, -- TG Squawks CS
	[2] = {0x2F,7}, -- TG Barrels Spawned
	[3] = {0x30,2}, -- Dive Barrel
	[4] = {0x30,3}, -- Vine Barrel
	[5] = {0x30,4}, -- Orange Barrel
	[6] = {0x30,5}, -- Barrel Barrel
	[7] = {0x30,1}, -- DK Free
	[8] = {0x30,7}, -- All Training Barrels CS
	[9] = {0x37,3}, -- Japes Open
	[10] = {0xB,7}, -- Aztec FT CS
	[11] = {0xC,0}, -- Aztec Tiny Tiny Temple FT CS
	[12] = {0xC,1}, -- Aztec Lanky Tiny Temple FT CS
	[13] = {0xC,2}, -- Aztec Diddy Tiny Temple FT CS
	[14] = {0xC,3}, -- Aztec Chunky Tiny Temple FT CS
	[15] = {0xC,4}, -- Aztec DK 5DT FT CS
	[16] = {0xC,5}, -- Aztec Diddy 5DT FT CS
	[17] = {0xC,6}, -- Aztec Lanky 5DT FT CS
	[18] = {0xC,7}, -- Aztec Tiny 5DT FT CS
	[19] = {0xD,0}, -- Aztec Chunky 5DT FT CS
	[20] = {0xD,1}, -- Aztec DK Llama Temple FT CS
	[21] = {0xD,2}, -- Aztec Lanky Llama Temple FT CS
	[22] = {0xD,3}, -- Aztec Tiny Llama Temple FT CS
	[23] = {0x22,5}, -- Caves RR FT CS
	[24] = {0x23,2}, -- Caves FT CS
	[25] = {0x2C,3}, -- Bananaport FTT
	[26] = {0x2C,6}, -- Crown FTT
	[27] = {0x2C,7}, -- T&S FTT (1)
	[28] = {0x2D,0}, -- MMonkey FTT
	[29] = {0x2D,1}, -- HChunky FTT
	[30] = {0x2D,2}, -- OSprint FTT
	[31] = {0x2D,3}, -- SKong FTT
	[32] = {0x2D,4}, -- R Coin FTT
	[33] = {0x2D,5}, -- Rambi FTT
	[34] = {0x2D,6}, -- Enguarde FTT
	[35] = {0x2D,7}, -- Diddy FTT
	[36] = {0x2E,0}, -- Lanky FTT
	[37] = {0x2E,1}, -- Tiny FTT
	[38] = {0x2E,2}, -- Chunky FTT
	[39] = {0x2E,3}, -- FT Orange Collection FTT
	[40] = {0x2E,4}, -- Snide's FTT
	[41] = {0x2F,0}, -- Wrinkly FTT
	[42] = {0x2F,6}, -- B Locker FTT
	[43] = {0x31,0}, -- T&S FTT (2)
	[44] = {0x31,3}, -- FT Ammo/CB/Bunch Collection FTT
	[45] = {0x31,4}, -- FT Coin Collection FTT
	[46] = {0x60,7}, -- Funky FTT
	[47] = {0x61,0}, -- Snide FTT
	[48] = {0x61,1}, -- Cranky FTT
	[49] = {0x61,2}, -- Candy FTT
	[50] = {0x61,3}, -- Japes FTT
	[51] = {0x61,4}, -- Factory FTT
	[52] = {0x61,5}, -- Galleon FTT
	[53] = {0x61,6}, -- Fungi FTT
	[54] = {0x61,7}, -- Caves FTT
	[55] = {0x62,0}, -- Castle FTT
	[56] = {0x62,1}, -- T&S FTT (3)
	[57] = {0x62,2}, -- Helm FTT
	[58] = {0x62,3}, -- Aztec FTT
	[59] = {0x3,3}, -- Japes Start FT CS
	[60] = {0x5,2}, -- Diddy Help Me FT CS
	[61] = {0x5,4}, -- Mountain FT CS
	[62] = {0x6,2}, -- Llama FT CS
	[63] = {0x25,4}, -- Kill Kosha
	[64] = {0x25,3}, -- Kosha Cutscene
	[65] = {0x13,3}, -- Galleon Coconut Gate
	[66] = {0x14,1}, -- Galleon Peanut Gate
	[67] = {0xB,4}, -- Llama Cutscene
	[68] = {0xB,5}, -- Lanky Help Me
	[69] = {0xB,6}, -- Tiny Help Me
	[70] = {0x11,4}, -- Chunky Help Me/Factory FT CS
	[71] = {0x18,2}, -- Galleon FT CS
	[72] = {0x20,1}, -- Fungi FT CS
	[73] = {0x2B,5}, -- Castle FT CS
	[74] = {0x30,0}, -- Simian Slam Given from Cranky
	[75] = {0xD,5}, -- Factory Hatch
	[76] = {0x2C,4}, -- BBlast CS in Japes
};

function checkNewFile()
	current_cmap = mainmemory.read_u32_be(Mem.cmap[version]);
	cutsceneValue = mainmemory.read_u16_be(Mem.cs[version]);
	cutsceneActive = mainmemory.readbyte(Mem.cs_active[version]);
	current_dmap = mainmemory.read_u32_be(Mem.dmap[version]);
	zipProg = mainmemory.readbyte(Mem.zipper_progress[version]);
	if current_cmap == 80 and cutsceneActive == 6 and cutsceneValue == 19 and zipProg < 37 then -- Entering New File
		if settings.randomiser_regular == 1 then
			setTnSDoorStuff();
		end
		if current_dmap == 176 then -- New File
			mainmemory.write_u32_be(Mem.dmap[version],0x22);
			mainmemory.write_u32_be(Mem.dexit[version],0);
			for i = 1, #newFileFlags do
				setFlag(newFileFlags[i][1],newFileFlags[i][2]);
			end
			for i = 0, 4 do
				selected_kong_header = Mem.kong_base[version] + (i * 0x5E);
				mainmemory.writebyte(selected_kong_header + 1, 1); -- Slam
			end
			if settings.all_moves == 1 then
				giveMoves();
			end
			if settings.all_kongs == 1 then
				getAllKongs();
			end
			mainmemory.write_u16_be(Mem.oranges[version],20); -- Gives 20 oranges
		elseif current_dmap == 0x22 then -- Old File
			-- If something needs to be set here
		end
	end
end

event.onframeend(checkNewFile, "Checks for new file creation");

----------------
-- FORM STUFF --
----------------

lzrForm = {
	warnings = false, -- Useful for debugging but annoying for end users, so default to false
	smooth_moving_angle = true,
	UI = {
		form_controls = {},
		form_padding = 8,
		form_width = 10,
		form_height = 22,
		label_offset = 5,
		dropdown_offset = 1,
		long_label_width = 140,
		button_height = 23,
	},
	bufferWidth = client.bufferwidth(),
	bufferHeight = client.bufferheight(),
};

function round(num, idp)
	return tonumber(string.format("%." .. (idp or 0) .. "f", num));
end

seedValue = {};

for i = 1, 5 do
	seedValue[i] = 0;
end

function getSeedString()
	seedAsNumber = 0;
	for i = 1, 5 do
		if seedValue[i] < 0 then
			seedValue[i] = 9;
		elseif seedValue[i] > 9 then
			seedValue[i] = 0;
		end
		seedAsNumber = seedAsNumber + ((10 ^ (5 - i)) * seedValue[i]);
	end
	seedAsString = seedValue[1];
	for i = 2, 5 do
		seedAsString = seedAsString.."    "..seedValue[i];
	end
	seedString = "Seed:   "..seedAsString;
end

getSeedString();

function increase10000()
	seedValue[1] = seedValue[1] + 1;
	realTime();
	forms.settext(lzrForm.UI.form_controls["Settings Check Label"], "SETTINGS NOT SET YET");
end

function increase1000()
	seedValue[2] = seedValue[2] + 1;
	realTime();
	forms.settext(lzrForm.UI.form_controls["Settings Check Label"], "SETTINGS NOT SET YET");
end

function increase100()
	seedValue[3] = seedValue[3] + 1;
	realTime();
	forms.settext(lzrForm.UI.form_controls["Settings Check Label"], "SETTINGS NOT SET YET");
end

function increase10()
	seedValue[4] = seedValue[4] + 1;
	realTime();
	forms.settext(lzrForm.UI.form_controls["Settings Check Label"], "SETTINGS NOT SET YET");
end

function increase1()
	seedValue[5] = seedValue[5] + 1;
	realTime();
	forms.settext(lzrForm.UI.form_controls["Settings Check Label"], "SETTINGS NOT SET YET");
end

function decrease10000()
	seedValue[1] = seedValue[1] - 1;
	realTime();
	forms.settext(lzrForm.UI.form_controls["Settings Check Label"], "SETTINGS NOT SET YET");
end

function decrease1000()
	seedValue[2] = seedValue[2] - 1;
	realTime();
	forms.settext(lzrForm.UI.form_controls["Settings Check Label"], "SETTINGS NOT SET YET");
end

function decrease100()
	seedValue[3] = seedValue[3] - 1;
	realTime();
	forms.settext(lzrForm.UI.form_controls["Settings Check Label"], "SETTINGS NOT SET YET");
end

function decrease10()
	seedValue[4] = seedValue[4] - 1;
	realTime();
	forms.settext(lzrForm.UI.form_controls["Settings Check Label"], "SETTINGS NOT SET YET");
end

function decrease1()
	seedValue[5] = seedValue[5] - 1;
	realTime();
	forms.settext(lzrForm.UI.form_controls["Settings Check Label"], "SETTINGS NOT SET YET");
end

settings = {
	randomiser = 0,
	all_moves = 0,
	no_cutscenes = 0,
	all_kongs = 0,
	using_jabos = 0,
	random_kasplats = 0,
	randomiser_barrel = 0,
	gameLengths = 1,
};

keys_short = {3, 8};
keys_med = {3, 6, 7, 8};
keys_long = {1,2,3,4,5,6,7,8};

function confirmSettings()
	print("Settings Confirmed");
	print("Seed: "..seedAsNumber);
	lengthString = forms.getproperty(lzrForm.UI.form_controls["Length Dropdown"], "SelectedItem");
	settings.gameLengths = 1;
	for i = 1, #gameLengths do
		if gameLengths[i] == lengthString then
			settings.gameLengths = i;
		end
	end
	if settings.gameLengths < 3 then
		require "modules.finalHelmDoors"
	end
	print("Game Length: "..gameLengths[settings.gameLengths]);
	if forms.ischecked(lzrForm.UI.form_controls["All Moves Checkbox"]) then
		settings.all_moves = 1;
		require "modules.allMoves"
		print("All Moves On");
		if settings.gameLengths == 1 then
			keys_required_to_open_krool = keys_short;
		elseif settings.gameLengths == 2 then
			keys_required_to_open_krool = keys_med;
		elseif settings.gameLengths == 3 then
			keys_required_to_open_krool = keys_long;
		end
	else
		settings.all_moves = 0;
	end
	if forms.ischecked(lzrForm.UI.form_controls["All Kongs Checkbox"]) then
		settings.all_kongs = 1;
		require "modules.allKongs"
		print("All Kongs On");
	else
		settings.all_kongs = 0;
	end
	if forms.ischecked(lzrForm.UI.form_controls["Randomiser Checkbox"]) then
		settings.randomiser = 1;
		require "modules.randomiser_regular"
		print("Randomiser On");
		setAssortments();
		setTnSDoorStuff();
	else
		settings.randomizer = 0;
	end
	if forms.ischecked(lzrForm.UI.form_controls["Barrel Randomiser Checkbox"]) then
		settings.randomiser_barrel = 1;
		require "modules.randomiser_barrel"
		print("Barrel Randomiser On");
		generateBonusAssortmentWithLogic();
	else
		settings.randomizer_barrel = 0;
	end
	if settings.randomiser_barrel == 1 or settings.randomiser == 1 then
		require "modules.replaceLZCode"
	end
	
	settings.no_cutscenes = 1;
	require "modules.reducedCutscenes"
	require "modules.klapsAndBeavers"
		
	if forms.ischecked(lzrForm.UI.form_controls["Jabos Checkbox"]) then
		settings.using_jabos = 1;
		print("Using Jabos On");
	else
		settings.using_jabos = 0;
	end
	if forms.ischecked(lzrForm.UI.form_controls["Kasplat Checkbox"]) then
		settings.random_kasplats = 1;
		require "modules.randomKasplats"
		print("Random Kasplats On");
		generateKasplatAssortment();
	else
		settings.random_kasplats = 0;
	end
	if settings.using_jabos == 0 then
		client.reboot_core();
	end
	WriteSettings();
	Spoiler();
	client.unpause();
	forms.settext(lzrForm.UI.form_controls["Settings Check Label"], "");
	forms.destroy(lzrForm.UI.options_form);
end

function setSeed(value)
	seedAsNumber = value;
	if seedAsNumber > 99999 then
		seedAsNumber = 99999;
	end
	seedTotal = 0;
	for i = 1, 5 do
		seedValue[i] = math.floor((seedAsNumber - seedTotal) / (10 ^ (5 - i)));
		seedTotal = seedTotal + (seedValue[i] * (10 ^ (5 - i)));
	end
end

function randomBetween(min_rand,max_rand)
	rand_diff = max_rand - min_rand + 1;
	rand_numb = (min_rand - 1) + math.ceil(math.random() * rand_diff);
	if rand_numb < (min_rand + 1) then
		rand_numb = min_rand;
	elseif rand_numb > max_rand then
		rand_numb = max_rand;
	end
	return rand_numb;
end

require 'settings';
setSeed(previousSettings.seed);

boss_fight_names = {
	[1] = "Army Dillo I",
	[2] = "Dogadon I",
	[3] = "Mad Jack",
	[4] = "Puftoss",
	[5] = "Dogadon II",
	[6] = "Army Dillo II",
	[7] = "King Kut Out",
};

kongNames = {
	[1] = "DK",
	[2] = "Diddy",
	[3] = "Lanky",
	[4] = "Tiny",
	[5] = "Chunky",
};

levels = {
	[0] = "JAPES",
	[1] = "AZTEC",
	[2] = "FACTORY",
	[3] = "GALLEON",
	[4] = "FUNGI",
	[5] = "CAVES",
	[6] = "CASTLE",
	[7] = "DK ISLES",
	[8] = "HELM",
};

levelsLower = {
	[0] = "Japes",
	[1] = "Aztec",
	[2] = "Factory",
	[3] = "Galleon",
	[4] = "Fungi",
	[5] = "Caves",
	[6] = "Castle",
	[7] = "DK Isles",
	[8] = "Helm",
};

lobbies = {
	[0] = 169, -- Japes
	[1] = 173, -- Aztec
	[2] = 175, -- Factory
	[3] = 174, -- Galleon
	[4] = 178, -- Fungi
	[5] = 194, -- Caves
	[6] = 193, -- Castle
	[7] = 217, -- Isles (Value doesn't exist, so gets unused. Value is set to prevent exception error)
	[8] = 170, -- Helm
};

keys = {
	-- [key] = {obtained, {keyFlagByte, keyFlagBit}, {tnsFlagByte, tnsFlagBit}, {turnedFlagByte, turnedFlagBit}}
	[1] = {0, {0x3,2}, {0x5,6}, {0x37,4}},
	[2] = {0, {0x9,2}, {0xD,4}, {0x37,5}},
	[3] = {0, {0x11,2}, {0x13,0}, {0x37,6}},
	[4] = {0, {0x15,0}, {0x19,3}, {0x37,7}},
	[5] = {0, {0x1D,4}, {0x20,2}, {0x38,0}},
	[6] = {0, {0x24,4}, {0x25,6}, {0x38,1}},
	[7] = {0, {0x27,5}, {0x2C,0}, {0x38,2}},
	[8] = {0, {0x2F,4}, {0xFFFF,0}, {0x38,3}}, -- Dummy Flag used for T&S clear
};

if settings.gameLengths == 1 then
	keys_required_to_open_krool = keys_short;
elseif settings.gameLengths == 2 then
	keys_required_to_open_krool = keys_med;
elseif settings.gameLengths == 3 then
	keys_required_to_open_krool = keys_long;
end

function checkKeys()
	keys_counter = 0;
	for i = 1, #keys_required_to_open_krool do
		key_req = keys_required_to_open_krool[i];
		if checkFlag(keys[key_req][4][1], keys[key_req][4][2]) then
			keys_counter = keys_counter + 1;
		end
	end
	if keys_counter == #keys_required_to_open_krool then
		return true;
	else
		return false;
	end
end

function changeKRoolLoadingZone()
	obj_model2_timer_value = mainmemory.read_u32_be(Mem.obj_model2_timer[version]);
	current_cmap = mainmemory.read_u32_be(Mem.cmap[version]);
	player = getPlayerObject();
	if isRDRAM(player) then
		player_chunk = mainmemory.read_u16_be(player + 0x12C);
		willAttemptToChange = false;
		if player_chunk == 0 and current_cmap == 0x22 then
			willAttemptToChange = true;
		end
		if obj_model2_timer_value == 30 and current_cmap == 0x22 then
			willAttemptToChange = true;
		end
		if willAttemptToChange then
			getLZPointers();
			if #lz_pointers > 0 then
				for i = 1, #lz_pointers do
					lz_dmap = mainmemory.read_u16_be(lz_pointers[i] + 0x12);
					if lz_dmap == 0xCB and not checkKeys() then -- DK phase LZ
						mainmemory.writebyte(lz_pointers[i] + 0x39, 0);
					elseif lz_dmap == 0xCB and checkKeys() then
						mainmemory.writebyte(lz_pointers[i] + 0x39, 1);
					end
				end
			end
		end
	end
end

function changeKRoolVisibility() -- Not working rn, WIP
	obj_model2_timer_value = mainmemory.read_u32_be(Mem.obj_model2_timer[version]);
	current_cmap = mainmemory.read_u32_be(Mem.cmap[version]);
	if current_cmap == 0x22 and obj_model2_timer_value == 1 and checkKeys() then
		krool_ship_pointers = getOM2PointersFromId(0x2A3);
		krool_ship_pointer = krool_ship_pointers[1];
		krool_behav_pointer = dereferencePointer(krool_ship_pointer + 0x7C);
		mainmemory.writebyte(krool_behav_pointer + 0x60,0);
	end
end

function fixArcade()
	current_dmap = mainmemory.read_u32_be(Mem.dmap[version]);
	current_cmap = mainmemory.read_u32_be(Mem.cmap[version]);
	validArcade = false;
	if current_cmap == 2 or current_cmap == 0x1A or current_cmap == 0x50 then
		if current_dmap == 2 then
			validArcade = true;
		end
	end
	if settings.gameLengths < 3 and validArcade  then
		arcadeGBflag = checkFlag(0x10,2);
		if not arcadeGBflag and current_dmap == 2 then
			mainmemory.writebyte(Mem.arcade_round[version],1);
			arcade_win_bool = mainmemory.readbyte(Mem.arcade_win_condition[version]);
			if arcade_win_bool == 1 and current_cmap == 2 then
				setTempFlag(0xB2,0); -- Make GB Spawn
			end
		end
	end
end

function eventCycle()
	changeKRoolLoadingZone();
	fixArcade();
end

event.onframestart(eventCycle, "The event cycle for various functions");

function Spoiler()
	print("Writing spoiler to file...");
	file = io.open("spoiler.txt", "w+")
	file:write("~~~~~~~~~~~~~", "\n");
	file:write("SEED SPOILERS", "\n");
	file:write("Seed Number: "..seedAsNumber, "\n");
	file:write("Seed Length: "..gameLengths[settings.gameLengths], "\n");
	file:write("\n");
	if settings.randomiser == 1 then
		file:write("REGULAR MAP ASSORTMENT", "\n");
		for i = 1, #regular_map_assortment do
			lz_in = regular_map_table[i];
			lz_out = regular_map_table[regular_map_assortment[i]];
			--print(i);
			file:write("\n");
			file:write("LZ to: "..getFullName(lz_in), "\n");
			file:write("Goes to: "..getFullName(lz_out), "\n");
		end
		file:write("\n");
		file:write("BOSS MAP ASSORTMENT", "\n");
		for i = 1, #boss_map_assortment do
			lz_map_in = boss_map_table[i];
			lz_map_out = boss_map_table[boss_map_assortment[i]];
			file:write("\n");
			file:write("LZ to: "..getMapName(lz_map_in), "\n");
			file:write("Goes to: "..getMapName(lz_map_out), "\n");
		end
		file:write("\n");
		file:write("T&S DOOR ASSORTMENT", "\n");
		for i = 1, #tns_number_assortment do
			file:write("\n");
			file:write(levelsLower[i - 1]..": "..tns_number_assortment[i], "\n");
		end
		file:write("\n");
		file:write("BOSS FIGHT KONG ASSORTMENT", "\n");
		for i = 1, #boss_door_assortment do
			file:write("\n");
			file:write(boss_fight_names[i]..": "..kongNames[boss_door_assortment[i]], "\n");
		end
		file:write("\n");
		file:write("B. LOCKER ASSORTMENT", "\n");
		for i = 1, #b_locker_assortment do
			file:write("\n");
			if i < 8 then
				file:write(levelsLower[i - 1]..": "..b_locker_assortment[i], "\n");
			else
				file:write(levelsLower[i]..": "..b_locker_assortment[i], "\n");
			end
		end
		file:write("\n");
		file:write("K ROOL PHASE ORDER", "\n");
		for i = 1, #k_rool_assortment do
			file:write("\n");
			file:write("Phase "..i..": "..kongNames[k_rool_assortment[i]].." Phase", "\n");
		end
	end
	if settings.randomiser_barrel == 1 then
		file:write("\n");
		file:write("BONUS MAP ASSORTMENT", "\n");
		for i = 1, #bonus_map_assortment do
			if bonus_map_assortment[i] ~= nil then
				lz_map_in = bonus_map_table[i][1];
				lz_map_out = bonus_map_table[bonus_map_assortment[i]][1];
				file:write("\n");
				file:write("LZ to: "..getMapName(lz_map_in), "\n");
				file:write("Goes to: "..getMapName(lz_map_out), "\n");
			end
		end
	end
	if settings.random_kasplats == 1 then
		file:write("\n");
		file:write("KASPLAT LOCATIONS", "\n");
		for i = 0, 7 do
			file:write("\n");
			file:write(levels[i], "\n");
			for j = 1, 5 do
				value_to_check = kasplat_assortment[i][j];
				file:write(kongs[j]..": "..KasplatLocations[i][value_to_check][4], "\n");
			end
		end
	end
	file:close();
	print("Saved spoiler log to spoiler.txt!");
end

function WriteSettings()
	print("Writing settings to file...");
	file = io.open("settings.lua", "w+")
	file:write("previousSettings = {", "\n");
	file:write("randomiser = ", settings.randomiser, ",", "\n");
	file:write("randomiser_barrel = ", settings.randomiser_barrel, ",", "\n");
	file:write("all_moves = ", settings.all_moves, ",", "\n");
	file:write("no_cutscenes = ", settings.no_cutscenes, ",", "\n");
	file:write("all_kongs = ", settings.all_kongs, ",", "\n");
	file:write("using_jabos = ", settings.using_jabos, ",", "\n");
	file:write("random_kasplats = ", settings.random_kasplats, ",", "\n");
	file:write("seed = ", seedAsNumber, ",", "\n");
	file:write("gameLengths = ", settings.gameLengths, ",", "\n");
	file:write("};", "\n");
	file:close();
	print("Saved settings to settings.lua!");
end

random_seedSetting = os.time()
random_seedSetting = random_seedSetting % 100000;
math.randomseed(random_seedSetting);

function randomiseSeedValue()
	seedAsNumber = randomBetween(0,99999);
	setSeed(seedAsNumber);
	realTime();
	forms.settext(lzrForm.UI.form_controls["Settings Check Label"], "SETTINGS NOT SET YET");
end

function lzrForm.UI.row(row_num)
	return round(lzrForm.UI.form_padding + lzrForm.UI.button_height * row_num, 0);
end

function lzrForm.UI.col(col_num)
	return lzrForm.UI.row(col_num);
end

if type(form_width) == "number" then
	lzrForm.UI.form_height = form_width;
end
if type(form_height) == "number" then
	lzrForm.UI.form_height = form_height;
end	

lzrForm.UI.options_form = forms.newform(lzrForm.UI.col(lzrForm.UI.form_width), lzrForm.UI.row(lzrForm.UI.form_height), "Donkey Kong 64 Loading Zone Randomiser");

function lzrForm.UI.checkbox(col, row, tag, caption, default)
	lzrForm.UI.form_controls[tag] = forms.checkbox(lzrForm.UI.options_form, caption, lzrForm.UI.col(col) + lzrForm.UI.dropdown_offset, lzrForm.UI.row(row) + lzrForm.UI.dropdown_offset);
	forms.setproperty(lzrForm.UI.form_controls[tag], "Height", 22);
	if default then
		forms.setproperty(lzrForm.UI.form_controls[tag], "Checked", true);
	end
end

gameLengths = {
	[1] = "Short",
	[2] = "Standard",
	[3] = "Long",
};

gameLengthsAlphabetical = {
	[1] = "Long",
	[2] = "Short",
	[3] = "Standard",
};

lzrForm.UI.form_controls["Title Label 1"] = forms.label(lzrForm.UI.options_form, "DONKEY KONG 64", lzrForm.UI.col(1) + 10, lzrForm.UI.row(0) + lzrForm.UI.label_offset, 410, 24);
lzrForm.UI.form_controls["Title Label 2"] = forms.label(lzrForm.UI.options_form, "LOADING ZONE RANDOMISER", lzrForm.UI.col(0), lzrForm.UI.row(1) + lzrForm.UI.label_offset, 410, 24);
lzrForm.UI.form_controls["Title Label 3"] = forms.label(lzrForm.UI.options_form, "SETTINGS", lzrForm.UI.col(2) + 10, lzrForm.UI.row(2) + lzrForm.UI.label_offset, 410, 24);

lzrForm.UI.form_controls["Randomiser Label"] = forms.label(lzrForm.UI.options_form, "Loading Zone Randomiser:", lzrForm.UI.col(0), lzrForm.UI.row(4) - 5 + lzrForm.UI.label_offset, 180, 24);
lzrForm.UI.form_controls["Randomiser Checkbox"] = forms.checkbox(lzrForm.UI.options_form, "", lzrForm.UI.col(8) + lzrForm.UI.dropdown_offset, lzrForm.UI.row(4) + lzrForm.UI.dropdown_offset);

lzrForm.UI.form_controls["Barrel Randomiser Label"] = forms.label(lzrForm.UI.options_form, "Barrel Randomiser:", lzrForm.UI.col(0), lzrForm.UI.row(5) - 5 + lzrForm.UI.label_offset, 180, 24);
lzrForm.UI.form_controls["Barrel Randomiser Checkbox"] = forms.checkbox(lzrForm.UI.options_form, "", lzrForm.UI.col(8) + lzrForm.UI.dropdown_offset, lzrForm.UI.row(5) + lzrForm.UI.dropdown_offset);

lzrForm.UI.form_controls["All Moves Label"] = forms.label(lzrForm.UI.options_form, "Give All Moves:", lzrForm.UI.col(0), lzrForm.UI.row(6) - 5 + lzrForm.UI.label_offset, 180, 24);
lzrForm.UI.form_controls["All Moves Checkbox"] = forms.checkbox(lzrForm.UI.options_form, "", lzrForm.UI.col(8) + lzrForm.UI.dropdown_offset, lzrForm.UI.row(6) + lzrForm.UI.dropdown_offset);

lzrForm.UI.form_controls["All Kongs Label"] = forms.label(lzrForm.UI.options_form, "Unlock All Kongs:", lzrForm.UI.col(0), lzrForm.UI.row(7) - 5 + lzrForm.UI.label_offset, 180, 24);
lzrForm.UI.form_controls["All Kongs Checkbox"] = forms.checkbox(lzrForm.UI.options_form, "", lzrForm.UI.col(8) + lzrForm.UI.dropdown_offset, lzrForm.UI.row(7) + lzrForm.UI.dropdown_offset);

lzrForm.UI.form_controls["Jabos Label"] = forms.label(lzrForm.UI.options_form, "I am using Jabo 1.6.1:", lzrForm.UI.col(0), lzrForm.UI.row(8) - 5 + lzrForm.UI.label_offset, 180, 24);
lzrForm.UI.form_controls["Jabos Checkbox"] = forms.checkbox(lzrForm.UI.options_form, "", lzrForm.UI.col(8) + lzrForm.UI.dropdown_offset, lzrForm.UI.row(8) + lzrForm.UI.dropdown_offset);

lzrForm.UI.form_controls["Kasplat Label"] = forms.label(lzrForm.UI.options_form, "Random Kasplat Locations:", lzrForm.UI.col(0), lzrForm.UI.row(9) - 5 + lzrForm.UI.label_offset, 180, 24);
lzrForm.UI.form_controls["Kasplat Checkbox"] = forms.checkbox(lzrForm.UI.options_form, "", lzrForm.UI.col(8) + lzrForm.UI.dropdown_offset, lzrForm.UI.row(9) + lzrForm.UI.dropdown_offset);

lzrForm.UI.form_controls["Length Label"] = forms.label(lzrForm.UI.options_form, "Length:", lzrForm.UI.col(0), lzrForm.UI.row(10) + lzrForm.UI.label_offset, 60, 24);
lzrForm.UI.form_controls["Length Dropdown"] = forms.dropdown(lzrForm.UI.options_form, gameLengths, lzrForm.UI.col(3) + lzrForm.UI.dropdown_offset, lzrForm.UI.row(10) + lzrForm.UI.dropdown_offset + 5, lzrForm.UI.col(5) + 8, lzrForm.UI.button_height);

seed_form_height = 13;
seed_form_offset = 0.5;

seedVal1 = seedValue[1];
seedVal2 = seedValue[2];
seedVal3 = seedValue[3];
seedVal4 = seedValue[4];
seedVal5 = seedValue[5];

lzrForm.UI.form_controls["Increase 10000"] = forms.button(lzrForm.UI.options_form, "+", increase10000, lzrForm.UI.col(seed_form_offset + 2), lzrForm.UI.row(seed_form_height), lzrForm.UI.button_height, lzrForm.UI.button_height);
lzrForm.UI.form_controls["Increase 1000"] = forms.button(lzrForm.UI.options_form, "+", increase1000, lzrForm.UI.col(seed_form_offset + 3), lzrForm.UI.row(seed_form_height), lzrForm.UI.button_height, lzrForm.UI.button_height);
lzrForm.UI.form_controls["Increase 100"] = forms.button(lzrForm.UI.options_form, "+", increase100, lzrForm.UI.col(seed_form_offset + 4), lzrForm.UI.row(seed_form_height), lzrForm.UI.button_height, lzrForm.UI.button_height);
lzrForm.UI.form_controls["Increase 10"] = forms.button(lzrForm.UI.options_form, "+", increase10, lzrForm.UI.col(seed_form_offset + 5), lzrForm.UI.row(seed_form_height), lzrForm.UI.button_height, lzrForm.UI.button_height);
lzrForm.UI.form_controls["Increase 1"] = forms.button(lzrForm.UI.options_form, "+", increase1, lzrForm.UI.col(seed_form_offset + 6), lzrForm.UI.row(seed_form_height), lzrForm.UI.button_height, lzrForm.UI.button_height);

lzrForm.UI.form_controls["Seed Label 0"] = forms.label(lzrForm.UI.options_form, "Seed:", lzrForm.UI.col(seed_form_offset), lzrForm.UI.row(seed_form_height + 1) + lzrForm.UI.label_offset, 50, 24);
lzrForm.UI.form_controls["Seed Label 1"] = forms.label(lzrForm.UI.options_form, seedVal1, lzrForm.UI.col(seed_form_offset + 2.2), lzrForm.UI.row(seed_form_height + 1) + lzrForm.UI.label_offset, 24, 24);
lzrForm.UI.form_controls["Seed Label 2"] = forms.label(lzrForm.UI.options_form, seedVal2, lzrForm.UI.col(seed_form_offset + 3.2), lzrForm.UI.row(seed_form_height + 1) + lzrForm.UI.label_offset, 24, 24);
lzrForm.UI.form_controls["Seed Label 3"] = forms.label(lzrForm.UI.options_form, seedVal3, lzrForm.UI.col(seed_form_offset + 4.2), lzrForm.UI.row(seed_form_height + 1) + lzrForm.UI.label_offset, 24, 24);
lzrForm.UI.form_controls["Seed Label 4"] = forms.label(lzrForm.UI.options_form, seedVal4, lzrForm.UI.col(seed_form_offset + 5.2), lzrForm.UI.row(seed_form_height + 1) + lzrForm.UI.label_offset, 24, 24);
lzrForm.UI.form_controls["Seed Label 5"] = forms.label(lzrForm.UI.options_form, seedVal5, lzrForm.UI.col(seed_form_offset + 6.2), lzrForm.UI.row(seed_form_height + 1) + lzrForm.UI.label_offset, 24, 24);

lzrForm.UI.form_controls["Decrease 10000"] = forms.button(lzrForm.UI.options_form, "-", decrease10000, lzrForm.UI.col(seed_form_offset + 2), lzrForm.UI.row(seed_form_height + 2) + 5, lzrForm.UI.button_height, lzrForm.UI.button_height);
lzrForm.UI.form_controls["Decrease 1000"] = forms.button(lzrForm.UI.options_form, "-", decrease1000, lzrForm.UI.col(seed_form_offset + 3), lzrForm.UI.row(seed_form_height + 2) + 5, lzrForm.UI.button_height, lzrForm.UI.button_height);
lzrForm.UI.form_controls["Decrease 100"] = forms.button(lzrForm.UI.options_form, "-", decrease100, lzrForm.UI.col(seed_form_offset + 4), lzrForm.UI.row(seed_form_height + 2) + 5, lzrForm.UI.button_height, lzrForm.UI.button_height);
lzrForm.UI.form_controls["Decrease 10"] = forms.button(lzrForm.UI.options_form, "-", decrease10, lzrForm.UI.col(seed_form_offset + 5), lzrForm.UI.row(seed_form_height + 2) + 5, lzrForm.UI.button_height, lzrForm.UI.button_height);
lzrForm.UI.form_controls["Decrease 1"] = forms.button(lzrForm.UI.options_form, "-", decrease1, lzrForm.UI.col(seed_form_offset + 6), lzrForm.UI.row(seed_form_height + 2) + 5, lzrForm.UI.button_height, lzrForm.UI.button_height);

lzrForm.UI.form_controls["Randomise Seed"] = forms.button(lzrForm.UI.options_form, "Randomise Seed", randomiseSeedValue, lzrForm.UI.col(seed_form_offset + 2), lzrForm.UI.row(seed_form_height + 3) + 5, lzrForm.UI.button_height * 5, lzrForm.UI.button_height);

lzrForm.UI.form_controls["Settings Check Label"] = forms.label(lzrForm.UI.options_form, "SETTINGS NOT SET YET", lzrForm.UI.col(0.5), lzrForm.UI.row(seed_form_height + 4) + lzrForm.UI.label_offset, 180, 24);

lzrForm.UI.form_controls["Confirm Settings Button"] = forms.button(lzrForm.UI.options_form, "Confirm Settings", confirmSettings, lzrForm.UI.col(0.6), lzrForm.UI.row(seed_form_height + 5) + 5, 7 * lzrForm.UI.button_height, lzrForm.UI.button_height);

if previousSettings.randomiser == 1 then
	forms.setproperty(lzrForm.UI.form_controls["Randomiser Checkbox"], "Checked", true);
end
if previousSettings.randomiser_barrel == 1 then
	forms.setproperty(lzrForm.UI.form_controls["Barrel Randomiser Checkbox"], "Checked", true);
end
if previousSettings.all_moves == 1 then
	forms.setproperty(lzrForm.UI.form_controls["All Moves Checkbox"], "Checked", true);
end
if previousSettings.all_kongs == 1 then
	forms.setproperty(lzrForm.UI.form_controls["All Kongs Checkbox"], "Checked", true);
end
if previousSettings.using_jabos == 1 then
	forms.setproperty(lzrForm.UI.form_controls["Jabos Checkbox"], "Checked", true);
end
if previousSettings.random_kasplats == 1 then
	forms.setproperty(lzrForm.UI.form_controls["Kasplat Checkbox"], "Checked", true);
end

forms.setproperty(lzrForm.UI.form_controls["Length Dropdown"], "SelectedItem", gameLengths[previousSettings.gameLengths]);

function lzrForm.UI.updateReadouts()
	getSeedString();
	seedVal1 = seedValue[1];
	seedVal2 = seedValue[2];
	seedVal3 = seedValue[3];
	seedVal4 = seedValue[4];
	seedVal5 = seedValue[5];
	forms.settext(lzrForm.UI.form_controls["Seed Label 1"], seedVal1);
	forms.settext(lzrForm.UI.form_controls["Seed Label 2"], seedVal2);
	forms.settext(lzrForm.UI.form_controls["Seed Label 3"], seedVal3);
	forms.settext(lzrForm.UI.form_controls["Seed Label 4"], seedVal4);
	forms.settext(lzrForm.UI.form_controls["Seed Label 5"], seedVal5);
end

function realTime()
	lzrForm.UI.updateReadouts();
end
realTime();

while true do
	if client.ispaused() then
		lzrForm.UI.updateReadouts();
	end
	if not client.ispaused() then
		lzrForm.UI.updateReadouts();
	end
	emu.yield();
	emu.frameadvance();
end