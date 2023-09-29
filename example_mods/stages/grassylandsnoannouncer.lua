function onCreate()
    precacheImage('black')
	makeLuaSprite('sky','bfdisky',-550, -250)
	addLuaSprite('sky', false)
	scaleObject('sky', 1.6, 1.6);

        makeLuaSprite('ground','bfdiground',-550, -150)
	addLuaSprite('ground', false)
	scaleObject('ground', 1.6, 1.6);
	
	--[[makeLuaSprite('stage','bottle',-750,-500)
	addLuaSprite('stage', true)]]
	

	--addLuaSprite("GF", true)
    --setGraphicSize("boyfriend", 400, 400)
    --setGraphicSize("dad", 700, 700)
	
    makeLuaSprite('black','black',-550, -250)
    setProperty('black.visible', false);  	
    addLuaSprite('black', false)
    scaleObject('black', 10, 10);
end

function onCreatePost()
    setGraphicSize("bg", 1920*1.5, 1050*1.5)
    --setGraphicSize("dad", 550/2, 550)
end