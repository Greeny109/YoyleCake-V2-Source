function onCreate()
	
        setProperty('defaultCamZoom',  0.3)
	makeLuaSprite('bg','lego_bg',-1850, -1960)
	addLuaSprite('bg', false)
        scaleObject('bg', 2, 2);
	
	--[[makeLuaSprite('stage','bottle',-750,-500)
	addLuaSprite('stage', true)]]
	

	--addLuaSprite("GF", true)
    --setGraphicSize("boyfriend", 400, 400)
    --setGraphicSize("dad", 700, 700)
	
end