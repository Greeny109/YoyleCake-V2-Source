function onCreate()
	-- CHARACTER
	setPropertyFromClass('GameOverSubstate', 'characterName', 'mtniideath');
	
	--SOUNDS
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'game_over_ii'); --file goes inside sounds/ folder
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'night-mote'); --file goes inside music/ folder
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --file goes inside music/ folder
end