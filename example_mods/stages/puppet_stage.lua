function onCreate()

        makeLuaSprite('ground','PuppetryStage',-1050, -900)
	addLuaSprite('ground', false)
        scaleObject('ground', 2, 2);

        makeLuaSprite('event','apple_falls',-650, -356)
        setProperty('event.visible', false); 
        setScrollFactor('event', 0, 0); 	
        addLuaSprite('event', true)
	
	--[[makeLuaSprite('stage','bottle',-750,-500)
	addLuaSprite('stage', true)]]
	

	--addLuaSprite("GF", true)
    --setGraphicSize("boyfriend", 400, 400)
    --setGraphicSize("dad", 700, 700)
	
end

function onCreatePost()
    setGraphicSize("event", 1920*1.5, 1050*1.5)
    --setGraphicSize("dad", 550/2, 550)
end