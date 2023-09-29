function onCreate()

        makeLuaSprite('bg','dgrassylands',-550, -150)
	addLuaSprite('bg', false)
	
	--[[makeLuaSprite('stage','bottle',-750,-500)
	addLuaSprite('stage', true)]]
	

	--addLuaSprite("GF", true)
    --setGraphicSize("boyfriend", 400, 400)
    --setGraphicSize("dad", 700, 700)
	
	makeAnimatedLuaSprite('cheese', 'Cheese Orb', 300, 325);
	setProperty('cheese.antialiasing', false)
	addAnimationByPrefix('cheese', 'Floaty', 'Floaty', 24, true);
	playAnim('cheese', 'Floaty0', true);
	addLuaSprite('cheese', false)
	scaleObject('cheese', 0.45, 0.45)
end

function onCreatePost()
    setGraphicSize("bg", 1920*1.5, 1050*1.5)
    --setGraphicSize("dad", 550/2, 550)
end