function onCreate()
	setPropertyFromClass('flixel.FlxG','sound.music.volume',0)
    triggerEvent('Camera Switch', '0.1', 'off')
	setProperty('skipCountdown',true)
	setProperty('vocals.time',0)
end

function onCreatePost()
	setProperty('vocals.volume',0)
	setProperty('vocals.time',0)
end

function onSongStart()
	setProperty('vocals.volume',1)
	setProperty('vocals.time',0)
	setPropertyFromClass('flixel.FlxG','sound.music.volume',1)
end