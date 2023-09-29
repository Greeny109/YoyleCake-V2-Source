function onCreate()
	
        setProperty('defaultCamZoom',  0.3)
	makeLuaSprite('bg','house_bg',-1850, -1135)
	addLuaSprite('bg', false)
        scaleObject('bg', 2, 2);

		makeAnimatedLuaSprite('tune', 'characters/TuneWatching', -1200, -100);
addAnimationByPrefix('tune', 'Tune Watching', 'Tune Watching', 24, false);
addLuaSprite('tune', false)
scaleObject('tune', 1.1, 1.1);

function onCountdownTick()
	playAnim('tune', 'Tune Watching', false);
end

function onStepHit()
	if curStep % 4 == 0 then
		playAnim('tune', 'Tune Watching', false);
end
	
	--[[makeLuaSprite('stage','bottle',-750,-500)
	addLuaSprite('stage', true)]]
	

	--addLuaSprite("GF", true)
    --setGraphicSize("boyfriend", 400, 400)
    --setGraphicSize("dad", 700, 700)
	
end
end