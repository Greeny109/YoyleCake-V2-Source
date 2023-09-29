function onCreate()
	
	makeLuaSprite('sky','fbf_sky',-550, -650)
	addLuaSprite('sky', false)

        makeLuaSprite('ground','fbf_grass',-550, 650)
	addLuaSprite('ground', false)

        makeLuaSprite('event','die',-550, -250)
        setProperty('event.visible', false);  	
        addLuaSprite('event', false)

        makeLuaSprite('black','black',-550, -250)
        setProperty('black.visible', false);  	
        addLuaSprite('black', true)
        scaleObject('black', 10, 10);
	
	--[[makeLuaSprite('stage','bottle',-750,-500)
	addLuaSprite('stage', true)]]
	

	--addLuaSprite("GF", true)
    --setGraphicSize("boyfriend", 400, 400)
    --setGraphicSize("dad", 700, 700)
	
end

function onCreatePost()
    setGraphicSize("sky", 1920*1.5, 1050*1.5)
    setGraphicSize("ground", 1920*1.5, 1050*1.5)
    setGraphicSize("event", 1920*1.5, 1050*1.5)
    --setGraphicSize("dad", 550/2, 550)
end