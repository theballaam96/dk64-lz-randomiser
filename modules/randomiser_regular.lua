require "modules.mapAndExitNames";

regular_map_table = {
	0x0400,
	0x0600,
	0x0701,
	0x0702,
	0x0705,
	0x0708,
	0x070E,
	0x070F,
	0x0C00,
	0x0D00,
	0x0E00,
	0x7001,
	0x1300,
	0x2203,
	0x1500,
	0x1600,
	0x1700,
	0x1800,
	0x1A00,
	0x1A03,
	0x1A10,
	0x1B00,
	0x1D00,
	0x1E00,
	0x1E01,
	0x1E02,
	0x1E03,
	0x1E04,
	0x1E05,
	0x1E06,
	0x1E07,
	0x1E08,
	0x1E09,
	0x1E0A,
	0x1E0B,
	0x1E13,
	0x1E15,
	0x1F00,
	0x2100,
	0x2202,
	0x2204,
	0x2205,
	0x2206,
	0x2208,
	0x2209,
	0x220A,
	0x220B,
	0x2400,
	0x2500,
	0x2600,
	0x2601,
	0x2602,
	0x2603,
	0x2604,
	0x2605,
	0x2606,
	0x2607,
	0x2611,
	0x2613,
	0x2700,
	0x2900,
	0x2B00,
	0x2B01,
	0x2B02,
	0x2C00,
	0x2D00,
	0x2E00,
	0x2E01,
	0x2F00,
	0x2F01,
	0x3000,
	0x3001,
	0x3002,
	0x3003,
	0x3004,
	0x3005,
	0x3006,
	0x3007,
	0x3008,
	0x3009,
	0x300A,
	0x300B,
	0x300C,
	0x300D,
	0x300E,
	0x300F,
	0x3010,
	0x3017,
	0x3100,
	0x3300,
	0x3400,
	0x3600,
	0x3700,
	0x3800,
	0x3900,
	0x3A00,
	0x3B00,
	0x3C00,
	0x3D00,
	0x3D01,
	0x3E00,
	0x3E01,
	0x3E02,
	0x3E03,
	0x3F00,
	0x4000,
	0x4001,
	0x4002,
	0x4003,
	0x4004,
	0x4600,
	0x4700,
	0x4800,
	0x4801,
	0x4802,
	0x4803,
	0x4804,
	0x4805,
	0x4806,
	0x480E,
	0x480F,
	0x4810,
	0x4811,
	0x4812,
	0x4813,
	0x4814,
	0x481E,
	0x5200,
	0x5400,
	0x5500,
	0x5600,
	0x5700,
	0x5701,
	0x5702,
	0x5704,
	0x5705,
	0x5707,
	0x5708,
	0x5709,
	0x570C,
	0x570D,
	0x570E,
	0x5710,
	0x5714,
	0x5800,
	0x5801,
	0x5900,
	0x5A00,
	0x5B00,
	0x5C00,
	0x5D00,
	0x5E00,
	0x5F00,
	0x6200,
	0x6400,
	0x6900,
	0x6A00,
	0x6C00,
	0x6E00,
	0x7000,
	0x7100,
	0x7101,
	0x7102,
	0x7200,
	0x7201,
	0x9700,
	0x9702,
	0x9704,
	0xA300,
	0xA400,
	0xA600,
	0xA700,
	0xA800,
	0xA900,
	0xA901,
	0xAD00,
	0xAD01,
	0xAE00,
	0xAE01,
	0xAF00,
	0xAF01,
	0xB200,
	0xB201,
	0xB300,
	0xB700,
	0xB703,
	0xB704,
	0xB900,
	0xBA00,
	0xBB00,
	0xBC00,
	0xBD00,
	0xC100,
	0xC101,
	0xC200,
	0xC201,
	0xC300,
	0xC800,
	0x570F,
	0x570B,
	0x1A08,
};

inaccessible_map_table_DK = {
	0x0400,
	0x0600,
	0x0701,
	0x0C00,
	0x0E00,
	0x1000,
	0x1500,
	0x1600,
	0x1700,
	0x1800,
	0x1B00,
	0x1F00,
	0x2100,
	0x2B00,
	0x2B01,
	0x2B02,
	0x2C00,
	0x2D00,
	0x2E01,
	0x2F00,
	0x2F01,
	0x3005,
	0x3007,
	0x3300,
	0x3400,
	0x3700,
	0x3800,
	0x3D01,
	0x3E00,
	0x3E02,
	0x3E03,
	0x3F00,
	0x4600,
	0x4700,
	0x5200,
	0x5400,
	0x5500,
	0x5714,
	0x5801,
	0x5A00,
	0x5C00,
	0x5D00,
	0x5E00,
	0x5F00,
	0x6200,
	0x6400,
	0x6C00,
	0x7100,
	0x7102,
	0x7201, --special case: library back door
	0xA600,
	0xA700,
	0xA800,
	0xB300,
	0xB900,
	0xBD00,
	0xC800,
};

inaccessible_map_table_Diddy = {
	0x0C00,
	0x0D00,
	0x0E00,
	0x1300,
	0x1400,
	0x1600,
	0x1700,
	0x1800,
	0x1B00,
	0x1D00,
	0x1F00,
	0x2100,
	0x2500,
	0x2700,
	0x2900,
	0x2B01,
	0x2B02,
	0x2C00,
	0x2D00,
	0x2E00,
	0x2E01,
	0x2F00,
	0x2F01,
	0x3005,
	0x3007,
	0x3400,
	0x3600,
	0x3700,
	0x3B00,
	0x3D01,
	0x3E00,
	0x3E02,
	0x3E03,
	0x3F00,
	0x4600,
	0x4700,
	0x5200,
	0x5400,
	0x5500,
	0x5600,
	0x5701,
	0x570D,
	0x5714,
	0x5801,
	0x5900,
	0x5A00,
	0x5B00,
	0x5D00,
	0x5E00,
	0x5F00,
	0x6200,
	0x6A00,
	0x6C00,
	0x6E00,
	0x7100,
	0x7102,
	0x7200,
	0x7201, --special case: library back door
	0xA600,
	0xA700,
	0xA800,
	0xB300,
	0xB900,
	0xBA00,
	0xBB00,
	0xBC00,
	0xBD00,
};

inaccessible_map_table_Lanky = {
	0x0400,
	0x0600,
	0x0C00,
	0x0E00,
	0x1300,
	0x1500,
	0x1600,
	0x1800,
	0x1B00,
	0x1D00,
	0x1F00,
	0x2100,
	0x2500,
	0x2700,
	0x2900,
	0x2B00,
	0x2B01,
	0x2C00,
	0x2D00,
	0x2E00,
	0x2E01,
	0x2F00,
	0x3005,
	0x3007,
	0x3300,
	0x3400,
	0x3600,
	0x3700,
	0x3800,
	0x3B00,
	0x3D01,
	0x3E00,
	0x3E02,
	0x3E03,
	0x4700,
	0x5400,
	0x5600,
	0x5701,
	0x570D,
	0x5801,
	0x5900,
	0x5A00,
	0x5B00,
	0x5C00,
	0x5D00,
	0x5F00,
	0x6400,
	0x6A00,
	0x6E00,
	0x7000,
	0x7100,
	0x7102,
	0x7200,
	0x7201, --special case: library back door
	0xA600,
	0xA700,
	0xB300,
	0xB900,
	0xBA00,
	0xBB00,
	0xBC00,
	0xBD00,
	0xC800,
};

inaccessible_map_table_Tiny = {
	0x0400,
	0x0600,
	0x1300,
	0x1500,
	0x1700,
	0x1800,
	0x1D00,
	0x1F00,
	0x2100,
	0x2500,
	0x2700,
	0x2900,
	0x2B00,
	0x2B01,
	0x2B02,
	0x2E00,
	0x2F01,
	0x3005,
	0x3300,
	0x3600,
	0x3700,
	0x3800,
	0x3B00,
	0x3E00,
	0x3F00,
	0x4600,
	0x4700,
	0x5200,
	0x5500,
	0x5600,
	0x5701,
	0x570D,
	0x5714,
	0x5900,
	0x5A00,
	0x5B00,
	0x5C00,
	0x5E00,
	0x5F00,
	0x6200,
	0x6400,
	0x6A00,
	0x6E00,
	0x7000,
	0x7100,
	0x7200,
	0x7201, --special case: library back door
	0xA600,
	0xA800,
	0xBA00,
	0xBB00,
	0xBC00,
	0xC800,
};

inaccessible_map_table_Chunky = {
	0x0400,
	0x0600,
	0x0701,
	0x0C00,
	0x0D00,
	0x0E00,
	0x1300,
	0x1400,
	0x1500,
	0x1600,
	0x1700,
	0x1B00,
	0x1D00,
	0x2500,
	0x2700,
	0x2900,
	0x2B00,
	0x2B02,
	0x2C00,
	0x2D00,
	0x2E00,
	0x2E01,
	0x2F00,
	0x2F01,
	0x3007,
	0x3300,
	0x3400,
	0x3600,
	0x3800,
	0x3B00,
	0x3D01,
	0x3E02,
	0x3E03,
	0x3F00,
	0x4600,
	0x5200,
	0x5400,
	0x5500,
	0x5600,
	0x5701,
	0x570D,
	0x5714,
	0x5801,
	0x5900,
	0x5B00,
	0x5C00,
	0x5D00,
	0x5E00,
	0x6200,
	0x6400,
	0x6A00,
	0x6C00,
	0x6E00,
	0x7102,
	0x7200,
	0x7201, --special case: library back door
	0xA700,
	0xA800,
	0xB300,
	0xB900,
	0xBA00,
	0xBB00,
	0xBC00,
	0xBD00,
	0xC800,
};

--covers edge cases where a kong can enter a lz, but relies on another kong to open it
also_requires_kong_map_table = {
	[0x0D00] = 2, 	--Painting room
	[0x1300] = 2,	--DK 5DT
	[0x1700] = 2,	--Lanky 5DT
	[0x1600] = 2,	--Tiny 5DT
	[0x1800] = 2,	--Chunky 5DT
	[0x0E00] = 2,	--Aztec Beetle Race
	[0x1400] = 1,	--Llama Temple, in case we revert "llama always free" decision
	[0x2400] = 1, 	--Crusher Room
	[0x3100] = 1,	--Lighthouse
	[0x3900] = 2,	--Winch Room
	[0x4600] = 3, 	--Lanky Dark Room, in case we count other kongs entering as "in logic"
	[0x3E03] = 5, 	--Tiny hole to rear mill room
	[0x3007] = 5, 	--Tiny hole to leave rear mill room
	[0x5600] = 2, 	--DK 5DI
	[0x5500] = 2,	--Lanky 5DI
	[0x5400] = 2,	--Tiny 5DI
	[0x5F00] = 2,	--Chunky 5DI
	[0xA400] = 1,	--Castle Tree
	[0x5800] = 2,	--Ballroom
	[0x6900] = 3,	--Top Tower
};

--covers edge cases where a lz is only open after a different map is completed
also_requires_reached_map_table = {
	--Commented out since "llama always free" setting exists
	--[0x1400] = 41,	--Llama Temple, aztec bblast must also have been reached
	[0x2400] = 29, 	--Crusher Room, power shed must also have been reached
	[0x2700] = 54, 	--Seal Race, galleon bblast must also have been reached
	[0x1F00] = 49,	--Seasick Ship, lighthouse must also have been reached
	[0xA400] = 187,	--Castle Tree, castle bblast must also have been reached
};

--Key is map ID, value is list of kong IDs that need access
tagless_map_table = {
	{4, {2}},
	{6, {2}},
	{12, {4}},
	{13, {3}},
	{14, {4}},
	{16, {2,3,4,5}},
	{19, {1}},
	{21, {2}},
	{22, {4}},
	{23, {3}},
	{24, {5}},
	{27, {4}},
	{29, {1}},
	{31, {5}},
	{33, {5}},
	{36, {1,3}},
	{37, {1}},
	{39, {1}},
	{41, {1}},
	{43, {2}, 0x2B00},
	{43, {5}, 0x2B01},
	{43, {3}, 0x2B02},
	{44, {4}},
	{45, {4}},
	{46, {1}, 0x2E00},
	{46, {4}, 0x2E01},
	{47, {4}, 0x2F00},
	{47, {3}, 0x2F01},
	{49, {1}},
	{51, {2}},
	{52, {4}},
	{54, {1}},
	{55, {5}},
	{56, {2}},
	{57, {2}},
	{58, {3}},
	{59, {1}},
	{60, {4}},
	{62, {4,5}},
	{63, {3}},
	{70, {3}},
	{71, {5}},
	{82, {3}},
	{84, {4}},
	{85, {3}},
	{86, {1}},
	{88, {2,4}},
	{89, {1}},
	{90, {5}},
	{91, {1}},
	{92, {2}},
	{93, {4}},
	{94, {3}},
	{95, {5}},
	{98, {3}},
	{100, {2}},
	{105, {3}},
	{106, {1}},
	{108, {3,4}},
	{110, {1}},
	{112, {1,2,5}},
	{113, {5}, 0x7100},
	{113, {4}, 0x7101},
	{114, {1}},
	{164, {1,5}},
	{166, {5}},
	{167, {4}},
	{168, {3}},
	{179, {4}},
	{185, {4}},
	{186, {1}},
	{187, {1}},
	{188, {1}},
	{189, {4}}
};

--Table gives origin maps for any given exit in the rando pool
lz_origin_map_table = {
	[0x0400] = {7},
	[0x0600] = {4,6},
	[0x0701] = {12},
	[0x0702] = {4},
	[0x0705] = {13},
	[0x0707] = {37},
	[0x0708] = {33},
	[0x070E] = {6},
	[0x070F] = {169,7},
	[0x0C00] = {7},
	[0x0D00] = {7},
	[0x0E00] = {38,14},
	[0x1000] = {38},
	[0x1300] = {38},
	[0x1400] = {38},
	[0x2203] = {173},
	[0x1500] = {38},
	[0x1600] = {38},
	[0x1700] = {38},
	[0x1800] = {38},
	[0x1A00] = {175,26},
	[0x1A03] = {29},
	[0x1A08] = {36},
	[0x1A0F] = {110},
	[0x1A10] = {27},
	[0x1B00] = {26,27},
	[0x1D00] = {26},
	[0x1E00] = {174,30},
	[0x1E04] = {44},
	[0x1E05] = {45},
	[0x1E0A] = {49},
	[0x1E0B] = {31},
	[0x1E10] = {54},
	[0x1E13] = {39},
	[0x1E15] = {179},
	[0x1F00] = {30},
	[0x2100] = {7,33},
	[0x2202] = {169},
	[0x2204] = {175},
	[0x2205] = {174},
	[0x2206] = {178},
	[0x2208] = {189},
	[0x2209] = {195},
	[0x220A] = {194},
	[0x220B] = {193},
	[0x2400] = {26},
	[0x2500] = {7},
	[0x2600] = {173,38},
	[0x2601] = {16},
	[0x2602] = {20},
	[0x2603] = {22},
	[0x2604] = {24},
	[0x2605] = {19},
	[0x2606] = {21},
	[0x2607] = {23},
	[0x260B] = {41},
	[0x2611] = {14},
	[0x2613] = {173},
	[0x2700] = {30,39},
	[0x2900] = {38},
	[0x2B00] = {30},
	[0x2B01] = {30},
	[0x2B02] = {30},
	[0x2C00] = {30},
	[0x2D00] = {30},
	[0x2E00] = {30},
	[0x2E01] = {30},
	[0x2F00] = {30},
	[0x2F01] = {30},
	[0x3000] = {178,48},
	[0x3001] = {58},
	[0x3002] = {57},
	[0x3003] = {56},
	[0x3004] = {59},
	[0x3005] = {62},
	[0x3006] = {61},
	[0x3007] = {62},
	[0x3008] = {64},
	[0x3009] = {64},
	[0x300A] = {64},
	[0x300B] = {64},
	[0x300C] = {64},
	[0x300D] = {71},
	[0x300E] = {63},
	[0x300F] = {70},
	[0x3010] = {55},
	[0x3017] = {52},
	[0x301A] = {188},
	[0x3100] = {30},
	[0x3300] = {30},
	[0x3400] = {48},
	[0x3600] = {30},
	[0x3700] = {48,55},
	[0x3800] = {48},
	[0x3900] = {48,57},
	[0x3A00] = {48},
	[0x3B00] = {48},
	[0x3C00] = {62},
	[0x3D00] = {48},
	[0x3D01] = {62},
	[0x3E00] = {48},
	[0x3E01] = {60},
	[0x3E02] = {61},
	[0x3E03] = {48},
	[0x3F00] = {48},
	[0x4000] = {48},
	[0x4001] = {48},
	[0x4002] = {48},
	[0x4003] = {48},
	[0x4004] = {48},
	[0x4600] = {48},
	[0x4700] = {48},
	[0x4800] = {194,72},
	[0x4801] = {100},
	[0x4802] = {86},
	[0x4803] = {85},
	[0x4804] = {95},
	[0x4805] = {84},
	[0x4806] = {82},
	[0x480E] = {91},
	[0x480F] = {90},
	[0x4810] = {93},
	[0x4811] = {92},
	[0x4812] = {200},
	[0x4813] = {89},
	[0x4814] = {94},
	[0x481C] = {186},
	[0x481E] = {98},
	[0x5200] = {72,82},
	[0x5400] = {72,84},
	[0x5500] = {72}, --check respawn
	[0x5600] = {72,86},
	[0x5700] = {193,87},
	[0x5701] = {164},
	[0x5702] = {151},
	[0x5704] = {183},
	[0x5705] = {151},
	[0x5708] = {168},
	[0x5709] = {166},
	[0x570B] = {88},
	[0x570C] = {114},
	[0x570D] = {114},
	[0x570E] = {105},
	[0x570F] = {164},
	[0x5710] = {167},
	[0x5711] = {187},
	[0x5714] = {168},
	[0x5800] = {87},
	[0x5900] = {72},
	[0x5A00] = {72,90},
	[0x5B00] = {72,91},
	[0x5C00] = {72}, --check respawn
	[0x5D00] = {72,93},
	[0x5E00] = {72},
	[0x5F00] = {72},
	[0x6200] = {72},
	[0x6400] = {72},
	[0x6900] = {87},
	[0x6A00] = {112,106},
	[0x6C00] = {183,108},
	[0x6E00] = {26},
	[0x7000] = {183},
	[0x7001] = {106},
	[0x7100] = {87},
	[0x7102] = {88},
	[0x7200] = {87},
	[0x9700] = {87},
	[0x9702] = {87},
	[0x9704] = {163},
	[0xA300] = {151},
	[0xA400] = {87},
	[0xA600] = {87},
	[0xA700] = {87},
	[0xA800] = {87},
	[0xA900] = {34},
	[0xA901] = {7,4,12,13,33},
	[0xAD00] = {34},
	[0xAD01] = {38,16,19,20,21,22,23,24},
	[0xAE00] = {34},
	[0xAE01] = {30,31,43,44,45,46,47,49,51,179},
	[0xAF00] = {34},
	[0xAF01] = {26,29,36},
	[0xB200] = {34},
	[0xB201] = {48,52,56,57,58,59,60,61,62,63,64,70,71},
	[0xB300] = {30},
	[0xB700] = {87},
	[0xB704] = {108},
	[0xBA00] = {72},
	[0xBB00] = {87},
	[0xBC00] = {48},
	[0xBD00] = {34},
	[0xC100] = {34},
	[0xC101] = {87,88,105,108,112,113,114,151,163,164,166,167,168,183},
	[0xC200] = {34},
	[0xC201] = {72,84,85,86,89,90,91,92,93,94,95,98,100,200},
	[0xC300] = {34},
	[0xC800] = {72},
};

--For special cases where origin is exit-specific
lz_origin_exceptions_table = {
	--5 door ship rooms
	[0x1E01] = {0x2B00},
	[0x1E02] = {0x2B01},
	[0x1E03] = {0x2B02},
	[0x1E06] = {0x2E01},
	[0x1E07] = {0x2E00},
	--2 door ship
	[0x1E08] = {0x2F00},
	[0x1E09] = {0x2F01},
	--Museum
	[0x5707] = {0x7100},
	[0x5801] = {0x7101, 0x7102},
	[0xB900] = {0x7101, 0x7102, 0xB900},
	[0x7101] = {0xB900},
	--Library Back door
	[0x7201] = {0x570D},
	--Crypt (DK, Diddy, Chunky)
	[0xB703] = {0x7000},
};

boss_map_table = {
	[1] = 8, -- Army 1
	[2] = 197, -- Dog 1
	[3] = 154, -- MJ
	[4] = 111, -- Puff
	[5] = 83, -- Dog 2
	[6] = 196, -- Army 2
	[7] = 199, -- KKO
};

tns_parent_maps_table = {
	[1] = {0x7}, -- Japes (Japes Main Map)
	[2] = {0x26}, -- Aztec (Aztec Main, 
	[3] = {0x1A}, -- Factory
	[4] = {0x1E}, -- Galleon
	[5] = {0x30}, -- Fungi
	[6] = {0x48}, -- Caves
	[7] = {0x57, 0x97, 0xB7}, -- Castle
};

k_rool_maps_table = {
	[1] = {0xCB,5,{25,4}};
	[2] = {0xCC,4,{3,3}};
	[3] = {0xCD,7,{6,6}};
	[4] = {0xCE,4,{20,4}};
	[5] = {0xCF,5,{4,4}};
};

boss_door_kong_permits = {
	[1] = {1, 2, 3, 4, 5}, -- Army Dillo 1
	[2] = {1, 2, 3, 4, 5}, -- Dogadon 1
	[3] = {1, 2, 4, 5}, -- Mad Jack
	[4] = {2, 3, 4, 5}, -- Pufftoss
	[5] = {5}, -- Dogadon 2
	[6] = {1, 2, 3, 5}, -- Army Dillo 2
	[7] = {1, 2, 3, 4, 5}, -- King Kut Out
};

boss_door_range = { -- Normal amount is 1680
	[1] = ((500 * settings.gameLengths) - 250), -- Min
	[2] = (250 + (500 * settings.gameLengths)), -- Max
};

bblast_maps = {
	[1] = 0x25, -- Japes
	[2] = 0x29, -- Aztec
	[3] = 0x6E, -- Factory
	[4] = 0x36, -- Galleon
	[5] = 0xBC, -- Fungi
	[6] = 0xBA, -- Caves
	[7] = 0xBB, -- Castle
};

key_take_occurred = 0;
key_give_occurred = 0;

function keySwap()
	transition_speed_value = mainmemory.readfloat(Mem.transition_speed[version], true);
	zipProg = mainmemory.readbyte(Mem.zipper_progress[version]);
	current_dmap = mainmemory.read_u32_be(Mem.dmap[version]);
	if current_dmap ~= 97 then -- Not K-Lumsy
		if transition_speed_value < 0 then
			if zipProg < 3 and key_take_occurred == 0 then
				for i = 1, 8 do
					if checkFlag(keys[i][2][1],keys[i][2][2]) then
						keys[i][1] = 1;
						clearFlag(keys[i][2][1], keys[i][2][2]);
						--print("Set array for key "..i.." to 1");
					else
						--keys[i][1] = 0;
						--print("Set array for key "..i.." to 0");
					end
				end
				key_take_occurred = 1;
				--print("Taken Keys");
			elseif zipProg > 30 and zipProg < 40 and key_give_occurred == 0 and current_dmap ~= 42 then
				for i = 1, 8 do
					if keys[i][1] == 1 then
						setFlag(keys[i][2][1], keys[i][2][2]);
					end
				end
				key_give_occurred = 1;
				--print("Returned Keys");
			end
		end
	end
	if transition_speed_value > 0 and zipProg < 3 then
		key_take_occurred = 0;
		key_give_occurred = 0;
		for i = 1, 7 do
			clearFlag(keys[i][3][1], keys[i][3][2]);
		end
		--print("Reset key swap bits");
	end
end

function reprintRMTable()
	RMTcounter = 0;
	for i = 1, 262 do
		if regular_map_table[i] ~= nil then
			RMTcounter = RMTcounter + 1;
			print("["..RMTcounter.."] = "..toHexString(regular_map_table[i],4)..",");
		end
	end
end

function generateAssortment()
	temporary_regular_map_assortment = {};
	regular_map_assortment = {};
	regular_seedSetting = seedAsNumber * 1000;
	for i = 1, #regular_map_table do
		temporary_regular_map_assortment[i] = i;
	end
	math.randomseed(regular_seedSetting);
	for i = 1, #regular_map_table do
		selected_temp_value = chooseRandomIndex(temporary_regular_map_assortment);
		regular_map_assortment[i] = temporary_regular_map_assortment[selected_temp_value];
		table.remove(temporary_regular_map_assortment, selected_temp_value);
		--print("RMS: Entry "..i..", selected random value "..selected_temp_value);
	end
end

function generateAssortmentWithLogic()
	file = io.open("logicDebug.txt", "w+")
	file:write("~~~~~~~~~~~~~", "\n");
	file:write("Seed: "..seedAsNumber, "\n");
	file:write("START generateAssortmentWithLogic", "\n");
	local regular_seedSetting = seedAsNumber * 1000;
	math.randomseed(regular_seedSetting);
	
	local isValid = false;
	repeat
		regular_map_assortment = {};
		inverted_map_assortment = {};
		
		origins_remaining = {};
		destinations_remaining = {};
		for key, value in pairs(regular_map_table) do
			origins_remaining[key] = value
			destinations_remaining[key] = value;
		end
		
		tagless_maps_done = {};

		--Handle tag-less maps first
		for i = 1, #tagless_map_table do
			local dest_map = tagless_map_table[i][1];
			local kong_array = tagless_map_table[i][2];
			local special_case_lz = tagless_map_table[i][3];
			
			if special_case_lz ~= nil then
				handle_tagless_map(dest_map, kong_array, special_case_lz);
			else
				handle_tagless_map(dest_map, kong_array);
			end
			file:write("\n");
		end
		
		file:write("Finished assigning all tag-less maps!\n\n");
		
		--Fill out rest of randomization
		for i = 1, #regular_map_table do
			if inverted_map_assortment[i] == nil then
				local selected_temp_value = chooseRandomIndex(origins_remaining);
				local origin_lz = origins_remaining[selected_temp_value];
				local origin_ref = getLzReference(origin_lz);
				
				if origin_ref == nil then
					print("Error! No origins remaining!");
				end
				
				inverted_map_assortment[i] = origin_ref;
				table.remove(origins_remaining, selected_temp_value);
			end
		end
		regular_map_assortment = table_invert(inverted_map_assortment);
		
		file:write("Finished assigning all remaining maps!\n\n");
		
		--validate nothing went wrong		
		local reachabilityPassed = validateReachability();
		if #inverted_map_assortment == #regular_map_assortment and reachabilityPassed then
			isValid = true;
		end
	until(isValid)
	file:close();
end

function handle_tagless_map(dest_map,kong_array,special_case_lz)
	local is_done = nil;
	if special_case_lz ~= nil then
		is_done = tagless_maps_done[special_case_lz];
		file:write("handling lz: "..getFullName(special_case_lz), "\n");
	else
		is_done = tagless_maps_done[dest_map];
		file:write("handling map: "..getMapName(dest_map), "\n");
	end
	
	--if this map isn't done yet
	if is_done == nil then
		--Choose one of its exits as destination
		local possibleExits = {};
		
		if special_case_lz ~= nil then
			--In special cases, use the specified lz
			file:write("special case! can only use "..getFullName(special_case_lz), "\n");
			for i = 1, #destinations_remaining do
				if special_case_lz == destinations_remaining[i] then
					table.insert(possibleExits, special_case_lz);
				end
			end
		else
			--otherwise, use any lz from the specified map
			for i = 1, #destinations_remaining do
				local lz = destinations_remaining[i];
				if dest_map == math.floor(lz / 256) then
					table.insert(possibleExits, lz);
				end
			end
		end
		if #possibleExits == 0 then
			file:write("No possible exit left for map "..dest_map.." go choose another origin!", "\n");
			return false;
		end
		
		local dest_lz = possibleExits[chooseRandomIndex(possibleExits)];
		local dest_ref = getLzReference(dest_lz);
		local dest_exit = dest_lz - (dest_map * 256);
		file:write("chosen dest: "..getFullName(dest_lz), "\n");
		file:write("kong array:");
		for key,val in ipairs(kong_array) do
			file:write(val);
			file:write(",");
		end
		file:write("\n");
		
		--Remove chosen destination so it won't be selected again
		local dest_key = nil;
		for key,val in ipairs(destinations_remaining) do
			if val == dest_lz then
				dest_key = key;
			end
		end
		table.remove(destinations_remaining, dest_key);
		file:write("Removed destination "..getFullName(dest_lz), "\n");
		
		local origin_lz = nil;
		local origin_map = nil;
		local origin_ref = nil;
		
		local no_repeat = true;
		repeat
			no_repeat = true;
			--step c) choose origin from remaining accessible locations
			origin_lz = chooseAccessibleOrigin(kong_array, origins_remaining)
			origin_map = math.floor(origin_lz / 256);
			origin_ref = getLzReference(origin_lz);
			
			local origin_exit = origin_lz - (origin_map * 256);
			file:write("chosen origin: "..getFullName(origin_lz), "\n");
			
			--Remove chosen origin so it won't be selected again
			local origin_key = nil;
			for key,val in ipairs(origins_remaining) do
				if val == origin_lz then
					origin_key = key;
				end
			end
			table.remove(origins_remaining, origin_key);
			file:write("Removed origin "..getFullName(origin_lz), "\n");
			
			--step d) If map leading to origin_lz is tag-less, prepare to repeat for new map
			local maps_to_origin = lz_origin_map_table[origin_lz];
			local map_to_origin = nil;
			local lz_to_origin = nil;
			
			if maps_to_origin ~= nil  then
				map_to_origin = maps_to_origin[chooseRandomIndex(maps_to_origin)];
			else
				maps_to_origin = lz_origin_exceptions_table[origin_lz]
				if maps_to_origin ~= nil  then
					lz_to_origin = maps_to_origin[chooseRandomIndex(maps_to_origin)];
					map_to_origin = math.floor(lz_to_origin / 256);
				end
			end
			
			if map_to_origin ~= nil then
				file:write("Checking map to origin: "..getMapName(map_to_origin), "\n");
				
				local tag_reached = true;
				for i = 1, #tagless_map_table do
					if tagless_map_table[i][1] == map_to_origin then
						tag_reached = false;
						local new_kong_array = unionOfSets(kong_array, tagless_map_table[i][2]);
						no_repeat = handle_tagless_map(map_to_origin, new_kong_array, lz_to_origin);
						break;
					end
				end
				if tag_reached then
					file:write("Tag barrel reached!\n");
				end
			else
				file:write("no map to origin exists for "..origin_lz, "\n");
			end
			
			if no_repeat == false then 
				--Since we have to try a different origin, we must add back the selected origin to origins_remaining
				table.insert(origins_remaining, origin_key, origin_lz);
				file:write("doesn't work, re-adding origin "..getFullName(origin_lz), "\n");
				file:write("trying new origin...", "\n")
			end
		until(no_repeat)
		
		--Assign the chosen origin to the destination
		if inverted_map_assortment[dest_ref] ~= nil then
			file:write("Error! An assignment is being overwritten.\n");
			file:write("for destination:"..getFullName(regular_map_table[dest_ref]), "\n");
			file:write("Previous assignment: "..getFullName(regular_map_table[inverted_map_assortment[dest_ref]]), "\n");
			file:write("New assignment: "..getFullName(regular_map_table[origin_ref]), "\n");
		end
		
		inverted_map_assortment[dest_ref] = origin_ref;
		
		if special_case_lz ~= nil then
			tagless_maps_done[special_case_lz] = true;
			file:write("Marked LZ "..getFullName(special_case_lz).." as done.\n");
		else
			tagless_maps_done[dest_map] = true;
			file:write("Marked "..getMapName(dest_map).." as done.\n");
		end
		
		return true;
	else
		file:write("this map was already handled, we cannot re-assign it.\n");
		return false;
	end
end

function chooseAccessibleOrigin(kong_array, origins_remaining)
	local accessible_exits = {};
	for key, value in pairs(origins_remaining) do
		accessible_exits[key] = value
	end
	
	--subtract inaccessible maps for each required kong in kong_array
	if isValInTable(1, kong_array) then
		accessible_exits = differenceOfSets(accessible_exits, inaccessible_map_table_DK);
	end
	if isValInTable(2, kong_array) then
		accessible_exits = differenceOfSets(accessible_exits, inaccessible_map_table_Diddy);
	end
	if isValInTable(3, kong_array) then
		accessible_exits = differenceOfSets(accessible_exits, inaccessible_map_table_Lanky);
	end
	if isValInTable(4, kong_array) then
		accessible_exits = differenceOfSets(accessible_exits, inaccessible_map_table_Tiny);
	end
	if isValInTable(5, kong_array) then
		accessible_exits = differenceOfSets(accessible_exits, inaccessible_map_table_Chunky);
	end
	
	return accessible_exits[chooseRandomIndex(accessible_exits)];
end

function chooseRandomIndex(tbl)
	local random_index = randomBetween(1,#tbl);
	return random_index;
end

function getLzReference(lz)
	local reference = nil;
	for i = 1, #regular_map_table do
		if regular_map_table[i] == lz then
			reference = i;
		end
	end
	return reference;
end

function table_invert(t)
   local s={}
   for k,v in pairs(t) do
	 s[v]=k
   end
   return s
end

function isValInTable(v, tbl)
	for key,val in ipairs(tbl) do if val==v then return true end end
end

function differenceOfSets(setA,setB)
	local ret = {}
	for key,val in ipairs(setA) do
		if not isValInTable(val,setB) then table.insert(ret, val) end
	end
	return ret
end

function unionOfSets(setA,setB)
	local ret = {}
	for key,val in ipairs(setA) do
		table.insert(ret, val);
	end
	for key,val in ipairs(setB) do
		if not isValInTable(val,setA) then table.insert(ret, val) end
	end
	return ret
end

function validateReachability()
	file:write("Starting validateReachability\n");
	--Since all tag-less maps were set to be reachable from tag-full maps
	--we can simply validate all tag-full maps are reachable from the start
	--excluding helm lobby/helm because they are vanilla
	maps_reached = {};
	maps_reached_by_kongs = {};
	
	kongs_free = {1};
	if settings.all_kongs == 1 then
		file:write("Starting with all kongs unlocked\n");
		kongs_free = {1,2,3,4,5};
	end
	
	--start by exploring enter japes lobby
	exploreAllPaths(0xA900);
	
	local passed, unreachedmap = allTagfullMapsReached();
	if passed then
		file:write("\nReachability validation passed!\n");
		print("Reachability validation passed!");
		return true;
	else
		file:write("\nReachability validation failed! Could not reach "..getMapName(unreachedmap),"\n");
		print("Reachability validation failed! Could not reach "..getMapName(unreachedmap));
		return false;
	end
end

function exploreAllPaths(origin_lz)
	file:write("Exploring "..getFullName(origin_lz),"\n");
	local dest_lz = getRandomizedExit(origin_lz);
	local dest_map = math.floor(dest_lz / 256);
	file:write("Took me to "..getFullName(dest_lz),"\n");
	
	--mark kongs as freed
	if dest_map == 7 and isValInTable(1, kongs_free) then
		if not isValInTable(2, kongs_free) then
			table.insert(kongs_free, 2);
			file:write("Diddy freed!\n");
		end
	end
	if dest_map == 16 and isValInTable(2, kongs_free) then
		if not isValInTable(4, kongs_free) then
			table.insert(kongs_free, 4);
			file:write("Tiny freed!\n");
		end
	end
	if dest_map == 20 and isValInTable(1, kongs_free) then
		if not isValInTable(3, kongs_free) then
			table.insert(kongs_free, 3);
			file:write("Lanky freed!\n");
		end
	end
	if dest_map == 26 and isValInTable(3, kongs_free) then
		--exit car race doesn't free chunky
		if dest_lz ~= '0x1A10' and not isValInTable(5, kongs_free) then
			table.insert(kongs_free, 5);
			file:write("Chunky freed!\n");
		end
	end
	
	--if map was reached already, return
	--else, mark as reached
	if maps_reached[dest_map] == true then
		if #maps_reached_by_kongs[dest_map] == #kongs_free then
			file:write("Already reached with same kongs, trying next place...\n");
			return;
		else
			file:write("Already reached, but we have more kongs now!\n");
			maps_reached_by_kongs[dest_map] = {};
			for k,v in ipairs(kongs_free) do
				maps_reached_by_kongs[dest_map][k] = v;
			end
		end
	else
		file:write("Marking "..getMapName(dest_map).." as reached!\n");
		maps_reached[dest_map] = true;
		maps_reached_by_kongs[dest_map] = {};
		for k,v in ipairs(kongs_free) do
			maps_reached_by_kongs[dest_map][k] = v;
		end
	end
	
	--make list of all lzs this map/lz can lead to
	local reachable_lzs = {};
	
	--special case for isles, assume no lobbies are reachable
	if dest_map ~= 34 then
		for key,val in pairs(lz_origin_exceptions_table) do
			if isValInTable(dest_lz, val) then
				file:write("Adding reachable lz from exceptions: "..getFullName(key), "\n");
				table.insert(reachable_lzs, key);
			end
		end
		for key,val in pairs(lz_origin_map_table) do
			if isValInTable(dest_map, val) then
				file:write("Adding reachable lz: "..getFullName(key), "\n");
				table.insert(reachable_lzs, key)
			end
		end
	end
	
	file:write("There are "..#reachable_lzs.." reachable lzs to explore\n");
	
	--iterate over reachable_lzs
	local stop_repeat = false;
	repeat
		local prev_num_kongs_free = #kongs_free;
		
		for i = 1, #reachable_lzs do
			--if any free kongs can use this lz, explore it
			local lz = reachable_lzs[i];
			
			local needs_kong = also_requires_kong_map_table[lz];
			local needs_map = also_requires_reached_map_table[lz];
			
			if needs_kong ~= nil and not isValInTable(needs_kong, kongs_free) then
				file:write("I don't have the kong needed to open "..getFullName(lz),"\n");
			elseif needs_map ~= nil and maps_reached[needs_map] ~= true then
				file:write("I haven't reached needed map to open "..getFullName(lz),"\n");
			else
				local dk_can = isValInTable(1,kongs_free);
				local diddy_can = isValInTable(2,kongs_free);
				local lanky_can = isValInTable(3,kongs_free);
				local tiny_can = isValInTable(4,kongs_free);
				local chunky_can = isValInTable(5,kongs_free);
				
				if isValInTable(lz,inaccessible_map_table_DK) then
					dk_can = false;
				end
				if isValInTable(lz,inaccessible_map_table_Diddy) then
					diddy_can = false;
				end
				if isValInTable(lz,inaccessible_map_table_Lanky) then
					lanky_can = false;
				end
				if isValInTable(lz,inaccessible_map_table_Tiny) then
					tiny_can = false;
				end
				if isValInTable(lz,inaccessible_map_table_Chunky) then
					chunky_can = false;
				end
				
				if dk_can or diddy_can or lanky_can or tiny_can or chunky_can then
					exploreAllPaths(lz);
				else
					file:write("I don't have the kong needed to access "..getFullName(lz),"\n");
				end
			end
		end
		--if # of freed kongs hasn't changed, there's no use repeating
		if prev_num_kongs_free == #kongs_free then
			file:write("No progress left to be made here, stop repeating\n");
			stop_repeat = true;
		end
	until(stop_repeat)
end

function allTagfullMapsReached()
	if not maps_reached[7] then
		return false,7;
	end
	if not maps_reached[20] then
		return false,20;
	end
	if not maps_reached[26] then
		return false,26;
	end
	if not maps_reached[30] then
		return false,30;
	end
	if not maps_reached[38] then
		return false,38;
	end
	if not maps_reached[48] then
		return false,48
	end
	if not maps_reached[61] then
		return false,61;
	end
	if not maps_reached[64] then
		return false,64;
	end
	if not maps_reached[72] then
		return false,72;
	end
	if not maps_reached[87] then
		return false,87;
	end
	if not maps_reached[151] then
		return false,151;
	end
	if not maps_reached[163] then
		return false,163;
	end
	if not maps_reached[169] then
		return false,169;
	end
	if not maps_reached[173] then
		return false,173;
	end
	if not maps_reached[174] then
		return false,174;
	end
	if not maps_reached[175] then
		return false,175;
	end
	if not maps_reached[178] then
		return false,178;
	end
	if not maps_reached[183] then
		return false,183;
	end
	if not maps_reached[193] then
		return false,193;
	end
	if not maps_reached[194] then
		return false,194;
	end
	if not maps_reached[195] then
		return false,195;
	end
	return true;
end

function getRandomizedExit(exit_in)
	local reference = getLzReference(exit_in);
	if reference == nil then
		return exit_in;
	else
		value_to_lookup = regular_map_assortment[reference];
		exit_out = regular_map_table[value_to_lookup];
		return exit_out;
	end
end

function generateBossAssortment()
	temporary_boss_map_assortment = {};
	boss_map_assortment = {};
	boss_seedSetting = seedAsNumber * 10;
	for i = 1, #boss_map_table do
		temporary_boss_map_assortment[i] = i;
	end
	math.randomseed(boss_seedSetting);
	for i = 1, #boss_map_table do
		selected_temp_value = chooseRandomIndex(temporary_boss_map_assortment);
		boss_map_assortment[i] = temporary_boss_map_assortment[selected_temp_value];
		table.remove(temporary_boss_map_assortment, selected_temp_value);
	end
end

function generateBossDoorAssortment()
	boss_door_assortment = {};
	boss_door_seedSetting = seedAsNumber + 5;
	math.randomseed(boss_seedSetting);
	for i = 1, #boss_door_kong_permits do
		selected_temp_value = randomBetween(1,#boss_door_kong_permits[i]);
		boss_door_assortment[i] = boss_door_kong_permits[i][selected_temp_value];
	end
end

function validateData(value)
	for i = 1, #regular_map_assortment do
		if regular_map_assortment[i] == value then
			print(i)
		end
	end
end

function testRegularMapAssortment()
	temp_table = {};
	for i = 1, #regular_map_table do
		temp_table[i] = i;
	end
	temp_removal_table = {};
	temp_removal_counter = 0;
	for i = 1, #regular_map_table do
		for j = 1, #regular_map_table do
			if regular_map_assortment[i] == j then
				temp_removal_counter = temp_removal_counter + 1;
				temp_removal_table[temp_removal_counter] = j;
			end
		end
	end
	for i = temp_removal_counter, 1, -1 do
		table.remove(temp_table, i);
	end
	if #temp_table > 0 then
		for i = 1, #temp_table do
			print("Table Entry "..temp_table[i].." missing from regular map assortment");
		end
	end
end

level_tns_inputs = {
	[1] = 397, -- Japes
	[2] = 281, -- Aztec
	[3] = 345, -- Factory
	[4] = 353, -- Galleon
	[5] = 322, -- Fungi
	[6] = 322, -- Caves
	[7] = 350, -- Castle
};

tns_hard_cap = 350;
tns_ratios = {3,5,6};

function generateCaps()
	level_tns_caps = {};
	for i = 1, #level_tns_inputs do
		update_cap = level_tns_inputs[i] * (tns_ratios[settings.gameLengths] / 7);
		update_cap = math.floor(update_cap / 5);
		level_tns_caps[i] = update_cap * 5;
	end
	
	for i = 1, #level_tns_caps do
		if level_tns_caps[i] > tns_hard_cap then
			level_tns_caps[i] = tns_hard_cap;
		end
	end
end

function generateTnSNumberAssortment()
	generateCaps();
	tns_number_assortment = {};
	for i = 1, 7 do
		tns_number_assortment[i] = 0;
	end
	tns_priority = {};
	tns_temp_priority = {};
	for i = 1, 7 do
		tns_temp_priority[i] = i;
	end
	tns_number_seedSetting = seedAsNumber + 120;
	math.randomseed(tns_number_seedSetting);
	for i = 1, 7 do
		selected_value = chooseRandomIndex(tns_temp_priority);
		selected_value2 = tns_temp_priority[selected_value];
		tns_priority[i] = selected_value2;
	end
	tns_probability_array = {};
	tns_array_counter = 0;
	for i = 1, 7 do
		for j = 1, tns_priority[i] do
			tns_array_counter = tns_array_counter + 1;
			tns_probability_array[tns_array_counter] = i;
		end
	end
	tns_total_temp = randomBetween(boss_door_range[1],boss_door_range[2]);
	tns_total = tns_total_temp - (tns_total_temp % 5);
	tns_running_total = tns_total;
	for i = 1, (tns_total / 5) do
		selected_level_value = chooseRandomIndex(tns_probability_array);
		selected_level = tns_probability_array[selected_level_value];
		tns_number_assortment[selected_level] = tns_number_assortment[selected_level] + 5;
		tns_running_total = tns_running_total - 5;
		list_to_remove = {};
		removal_count_tns = 0;
		for k = 1, 7 do
			if tns_number_assortment[k] == level_tns_caps[k] then -- Compare assortment to caps
				for j = 1, #tns_probability_array do
					if tns_probability_array[j] == k then
						removal_count_tns = removal_count_tns + 1;
						list_to_remove[removal_count_tns] = j;
					end
				end
			end
		end
		if #list_to_remove > 0 then
			for j = #list_to_remove, 1, -1 do
				table.remove(tns_probability_array, list_to_remove[j]);
			end
		end
	end
end

k_rool_fight_lengths = {2,3,5};

function generateKRoolOrder(fightLength)
	temporary_k_rool_table = {};
	k_rool_assortment = {};
	k_rool_seedSetting = seedAsNumber * 10000;
	for i = 1, 4 do
		temporary_k_rool_table[i] = i;
	end
	math.randomseed(k_rool_seedSetting);
	for i = 1, (fightLength - 1) do
		selected_temp_value = chooseRandomIndex(temporary_k_rool_table);
		k_rool_assortment[i] = temporary_k_rool_table[selected_temp_value];
		table.remove(temporary_k_rool_table, selected_temp_value);
	end
	k_rool_assortment[fightLength] = 5; -- Always ends on Chunky Phase
end

function generateBLockerAssortment()
	b_locker_assortment = {};
	b_locker_assortment[8] = 100 / (2 ^ (3 - settings.gameLengths));
	b_locker_seedSetting = seedAsNumber + 801;
	math.randomseed(b_locker_seedSetting);
	for i = 1, 7 do
		b_locker_assortment[i] = randomBetween(1,b_locker_assortment[8] - 1);
	end
end

function generateBBlastAssortment()
	bblast_map_assortment = {};
	bblast_seedSetting = seedAsNumber + 12;
	math.randomseed(bblast_seedSetting);
	for i = 1, #bblast_maps do
		possible_bblasts = {};
		bblast_poss_counter = 0;
		for j = 1, #bblast_maps do
			has_given = 0;
			if #bblast_map_assortment > 0 then
				for k = 1, #bblast_map_assortment do
					if j == bblast_map_assortment[k] then
						has_given = 1;
					end
				end
			end
			if i ~= j then
				if has_given == 0 then
					bblast_poss_counter = bblast_poss_counter + 1;
					possible_bblasts[bblast_poss_counter] = j;
				end
			end
		end
		selected_temp_value = randomBetween(1, #possible_bblasts);
		bblast_map_assortment[i] = possible_bblasts[selected_temp_value];
	end
end

function setAssortments()
	selected_kr_length = k_rool_fight_lengths[settings.gameLengths];
	generateAssortmentWithLogic();
	generateBossAssortment();
	generateKRoolOrder(selected_kr_length);
	generateBossDoorAssortment();
	generateTnSNumberAssortment();
	generateBLockerAssortment();
	getKRoolInput();
	generateBBlastAssortment();
end

function getBossDestination(parent_map)
	reference = nil;
	for i = 1, #tns_parent_maps_table do
		for j = 1, #tns_parent_maps_table[i] do
			if tns_parent_maps_table[i][j] == parent_map then
				reference = i;
			end
		end
	end
	if reference == nil then
		return destmap;
	else
		value_to_lookup = boss_map_assortment[reference];
		new_dmap_code = boss_map_table[value_to_lookup];
		return new_dmap_code;
	end
end

function getKRoolInput()
	k_rool_input = {};
	k_rool_input[1] = k_rool_maps_table[1][1];
	for i = 2, #k_rool_assortment do
		k_rool_input[i] = k_rool_maps_table[k_rool_assortment[i-1] + 1][1];
	end
end

function getKRoolDestination(destmap)
	reference = nil;
	for i = 1, #k_rool_input do
		if k_rool_input[i] == destmap then
			reference = i;
		end
	end
	if reference == nil then
		return destmap;
	else
		new_dmap_code = k_rool_maps_table[k_rool_assortment[reference]][1];
		return new_dmap_code;
	end
end

function getBBlastDestination(inputmap)
	reference = nil;
	for i = 1, #bblast_map_assortment do
		if bblast_maps[i] == inputmap then
			reference = i;
		end
	end
	if reference == nil then
		return inputmap;
	else
		new_dmap_code = bblast_maps[bblast_map_assortment[reference]];
		return new_dmap_code;
	end
end

function setTnSDoorStuff()
	for i = 0, 6 do
		mainmemory.write_u16_be(Mem.tnsdoor_header[version] + (2 * i), tns_number_assortment[i + 1]);
	end
	for i = 0, 7 do
		mainmemory.write_u16_be(Mem.tnsdoor_header[version] + 0x10 + (2 * i), b_locker_assortment[i + 1]);
	end
	for i = 1, 7 do
		boss_assigned = boss_map_assortment[i]; -- check the value of the boss assigned to it
		kong_assigned = boss_door_assortment[boss_assigned];-- Use that value as a lookup for the kong used
		mainmemory.writebyte(Mem.tnsdoor_header[version] + 0x30 + (i - 1), kong_assigned - 1); -- Set that value of kong
	end
end

level_index_flags = {
	[0] = {0x38,5}, -- Japes
	[1] = {0x38,6}, -- Aztec
	[2] = {0x38,7}, -- Factory
	[3] = {0x39,0}, -- Galleon
	[4] = {0x39,1}, -- Fungi
	[5] = {0x39,2}, -- Caves
	[6] = {0x39,3}, -- Castle
	[7] = {0xFFFF,0}, -- Isles
	[8] = {0x39,4}, -- Helm
};

function checkMap(map_value)
	levelIndex = mainmemory.readbyte(Mem.level_index_mapping[version] + map_value);
	dmapType = mapType(current_dmap);
	if level_index_flags[levelIndex][1] ~= 0xFFFF then -- Not Isles
		if not checkFlag(level_index_flags[levelIndex][1], level_index_flags[levelIndex][2]) then
			setFlag(level_index_flags[levelIndex][1], level_index_flags[levelIndex][2]);
		end
	end
end

event.onframestart(keySwap, "Swaps keys out (prevents T&S Portal disappear/allows refight)");