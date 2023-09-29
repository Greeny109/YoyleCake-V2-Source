function onCreate()
	
        setProperty('defaultCamZoom',  0.3)
	makeLuaSprite('bg','house_bg',-1850, -1135)
	addLuaSprite('bg', false)
        scaleObject('bg', 2, 2);

		makeAnimatedLuaSprite('waffle', 'characters/WatchingWaffle', -1200, -270);
addAnimationByPrefix('waffle', 'Waffle Watching', 'Waffle Watching', 24, false);
addLuaSprite('waffle', false)

function onCountdownTick()
	playAnim('waffle', 'Waffle Watching', false);
end

function onStepHit()
	if curStep % 4 == 0 then
		playAnim('waffle', 'Waffle Watching', false);
end
	
	--[[makeLuaSprite('stage','bottle',-750,-500)
	addLuaSprite('stage', true)]]
	

	--addLuaSprite("GF", true)
    --setGraphicSize("boyfriend", 400, 400)
    --setGraphicSize("dad", 700, 700)
	
end
end