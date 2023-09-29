function onCreate()
	-- CHARACTER
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead-ONE');
	
	--SOUNDS
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'game_over_ONE'); --file goes inside sounds/ folder
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'go-ONE'); --file goes inside music/ folder
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --file goes inside music/ folder
end