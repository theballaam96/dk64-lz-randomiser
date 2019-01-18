# Donkey Kong 64 Loading Zone Randomizer
A loading zone randomizer lua script for Donkey Kong 64.
Intended for BizHawk.

## Installation and usage
- Step 1: Open the [BizHawk emulator](https://github.com/TASVideos/BizHawk/releases/)
- Step 2: Open any valid DK64 ROM (The 'Not For Resale' version of this game is not supported)
- Step 3: Open the Lua Console (Tools > Lua Console)
- Step 4: Open the Loading Zone Randomiser (Script > Open Script > lzr.lua)
- Step 5: Select the settings you want to use and determine your seed
- Step 6: Click confirm and enjoy the oncoming madness!

## Features
- Randomisation of regular loading zones
	- For example: Trying to enter the loading zone to DK Isles from Aztec Lobby will take you to the Winch Room in Fungi Forest (Seed #801).
	- Some maps are excluded from this randomisation (Snide's, Cranky's, Candy's, Funky's, Troff 'n' Scoff)
- Randomisation of Bonus Barrels
	- For Example: Trying to enter the bonus barrel near Arcade in Frantic Factory (Which would take you to Stash Snatch) might take you to Mad Maze Maul
	- This also includes the unused bonus barrels
- Cutscenes are reduced
	- You will be taken to the main menu right after the Nintendo Logo, skipping the DK Rap, Rareware & N64 Logo and DK TV
	- Snide's contraption cutscenes are reduced to just the initial pulley cutscene
	- Snide's GB Drops are just limited to one "Oh Banana", even if you are turning in 2+ BPs for a kong
	- K Rool phases immediately start at the "In the red corner" cutscene
- Option to acquire all moves in the game from the start
	- Cuts out some coin collection, completely optional

## BizHawk Setup Guide
- Download and install BizHawk & the pre-requisites
	- Any version between (inclusive) 1.12.0 and 1.13.1 is recommended for DK64 due to it's inclusion of the Dynarec Core Type & Jabo's Video Plugin
	- To alter your plugins/settings, open any N64 ROM, click N64 (Top bar), and then click plugins.
	- What settings you change depends on your PC's performance.
	
- High Performance settings
	- Core Type: Dynarec
		- Other core types have bugs with chunks not appearing visually
	- Rsp Plugin: Hle
	- Active Video Plugin: Jabo 1.6.1
		- This will cause some issues with objects and transparency (eg. Golden Bananas, Coloured Bananas, Warp Pads), however these are just visual
		- However, this is good for low-performance PCs
	- Video Resolution: 320x240
	
- Aesthetic Settings
	- Core Type: Dynarec
	- Rsp Plugin: Hle
	- Active Video Plugin: GlideN64
		- If you get some graphical glitching (parts of kong textures appearing way too bright, reboot the core (Ctrl + R) to fix
		- This will act as a console reset, so don't reboot core if your progress
	- Video Resolution: 800x600
		- This is a decent compromise between good visual quality and good performance
		- If your PC can handle it, feel free to increase
		
- Controller Mapping
	- Go to Config > Controllers
	- All button mappings: Use the first page (Player 1, Normal Controls)
	- Analogue Stick mapping: Use the 3rd page (Player 1, Analog Controls)
		- This allows you to go in all directions, not just the 8 ordinal/cardinal points.
	
## Assistance Credit and contributors:
- [theballaam96](https://www.youtube.com/c/theballaam96srl)
- [2dos](http://www.twitch.tv/2dos)
- [Mittenz](http://twitch.tv/mittenzsrl)
- [Isotarge](http://twitter.com/isotarge) & [ScriptHawk](https://github.com/Isotarge/ScriptHawk)
- [EmoArbiter](http://twitch.tv/emoarbiter)
- [Obiyo](https://www.twitch.tv/obiyosrl)
- [Bismuth](https://www.youtube.com/c/Bismuth9)
- [Znernicus](https://www.twitch.tv/znernicus)
- [KaptainKohl](https://www.twitch.tv/kaptainkohl)
- [Connor75](https://www.twitch.tv/connor75)
- [GloriousLiar](https://www.twitch.tv/gloriousliar)
