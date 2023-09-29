function onCreate()

        setProperty('defaultCamZoom',  0.5)
        makeLuaSprite('bg','orager_stage',-950, -550)
	addLuaSprite('bg', false)
        scaleObject('bg', 0.7, 0.7);

makeAnimatedLuaSprite('olive', 'olive', -100, 375);
addAnimationByPrefix('olive', 'poopy', 'poopy', 15, false);
addLuaSprite('olive', false)
	scaleObject('olive', 0.35, 0.35);

makeAnimatedLuaSprite('kfc', 'kfc_guy', 600, 300);
addAnimationByPrefix('kfc', 'shitty', 'shitty', 15, false);
addLuaSprite('kfc', false)
	scaleObject('kfc', 0.4, 0.4);

makeAnimatedLuaSprite('me', 'me_with_object_assets', 1300, 200);
addAnimationByPrefix('me', 'crappy', 'crappy', 15, false);
addLuaSprite('me', false)
	scaleObject('me', 0.35, 0.35);
	
	--[[makeLuaSprite('stage','bottle',-750,-500)
	addLuaSprite('stage', true)]]
	

	--addLuaSprite("GF", true)
    --setGraphicSize("boyfriend", 400, 400)
    --setGraphicSize("dad", 700, 700)
	
end

function onBeatHit()
	-- triggered 2 times per section
	
	if curBeat % 1 == 0 then
		playAnim('olive', 'poopy', false)
                playAnim('me', 'crappy', false)
		end

		if curBeat % 2 == 0 then
			playAnim('kfc', 'shitty', true)
			end
	end	