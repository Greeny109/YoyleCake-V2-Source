function onCreate()
	-- CHARACTER
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead');
	
	--SOUNDS
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --file goes inside sounds/ folder
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --file goes inside music/ folder
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEndOG'); --file goes inside music/ folder
end