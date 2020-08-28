if settings.gameLengths < 3 then	
	fileFlagsCount = #newFileFlags;
	newFileFlags[fileFlagsCount + 1] = {0x60,3}; -- Coin Door
	newFileFlags[fileFlagsCount + 2] = {0x10,4}; -- Nintendo Coin (Failsafe)
	newFileFlags[fileFlagsCount + 3] = {0x2F,3}; -- Rareware Coin (Failsafe)
end

if settings.gameLengths < 2 then
	fileFlagsCount = #newFileFlags;
	newFileFlags[fileFlagsCount + 1] = {0x60,4}; -- Crown Door
end