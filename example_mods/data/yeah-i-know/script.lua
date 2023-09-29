function onCreate()
    addCharacterToList('1aicy1-dead', 'dad');
end

function onBeatHit()
    	-- CHARACTER
        if curBeat >= 128 then
        setPropertyFromClass('GameOverSubstate', 'characterName', '1aicy-dead');
	
	--SOUNDS
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'game_over'); --file goes inside sounds/ folder
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'night-mote'); --file goes inside music/ folder
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --file goes inside music/ folder
end
end