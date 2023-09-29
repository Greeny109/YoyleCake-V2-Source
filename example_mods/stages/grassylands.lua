function onCreate()

        makeLuaSprite('bg','bfbg',-550, -150)
	addLuaSprite('bg', false)
	
	--[[makeLuaSprite('stage','bottle',-750,-500)
	addLuaSprite('stage', true)]]
	

	--addLuaSprite("GF", true)
    --setGraphicSize("boyfriend", 400, 400)
    --setGraphicSize("dad", 700, 700)
	
	makeAnimatedLuaSprite('announcer', 'announcer', 650, 555);
	setProperty('announcer.antialiasing', false)
	addAnimationByPrefix('announcer', 'announcer speaky speaky', 'announcer', 30, false);
	objectPlayAnimation('announcer', 'announcer speaky speaky', true);
	addLuaSprite('announcer', false)
        scaleObject('announcer', 0.235, 0.235);

		makeLuaSprite('black','black',-550, -250)
		setProperty('black.visible', false);  	
		addLuaSprite('black', true)
		scaleObject('black', 10, 10);

end

function onCreatePost()
    setGraphicSize("bg", 1920*1.5, 1050*1.5)
    --setGraphicSize("dad", 550/2, 550)
end
function onBeatHit()
	-- triggered 4 times per section
	
	if curBeat % 2 == 0 then
		objectPlayAnimation('announcer', 'announcer speaky speaky', true)
		end
	end	