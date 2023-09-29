function onCreate()
	setProperty('defaultCamZoom',  0.5)
	
        makeLuaSprite('bg','87_bg',-1550, -1100)
	addLuaSprite('bg', false)
        scaleObject('bg', 1.1, 1.1)
	
	--[[makeLuaSprite('stage','bottle',-750,-500)
	addLuaSprite('stage', true)]]
	

	--addLuaSprite("GF", true)
    --setGraphicSize("boyfriend", 400, 400)
    --setGraphicSize("dad", 700, 700)
	
end