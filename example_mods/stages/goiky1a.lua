function onCreate()
	makeLuaSprite('sk', '1a/skie', -900, -69)
	scaleObject('sk', 0.8, 0.8)
	
	makeLuaSprite('gr', '1a/Grass', -875, 524)
	scaleObject('gr', 0.8, 0.8)
	
	makeLuaSprite('cl', '1a/clod', 850, 154)
	scaleObject('cl', 0.8, 0.8)
    setScrollFactor('cl', 0.6, 0.6)

	makeLuaSprite('fb', '1a/Flashb', 0, 0)
	setObjectCamera('fb', 'other')
	setProperty('fb.visible', false);

	addLuaSprite('sk', false)
	addLuaSprite('gr', false)
	addLuaSprite('cl', false)
	addLuaSprite('fb', true)
	
	setObjectOrder('dadGroup', getObjectOrder('boyfriendGroup') + 1)
	
	close(true);
end