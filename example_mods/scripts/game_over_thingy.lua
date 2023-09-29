function onCreate()
	-- CHARACTER
	setPropertyFromClass('GameOverSubstate', 'characterName', 'mtn-dew-dead');
	
	--SOUNDS
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'game_over'); --file goes inside sounds/ folder
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'night-mote'); --file goes inside music/ folder
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --file goes inside music/ folder
end