function onCreate()
	
	makeLuaSprite('bg','sotp_bg',-550, -150)
	addLuaSprite('bg', false)

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
    setGraphicSize("bg", 1920*1.5, 1050*1.5)
    --setGraphicSize("dad", 550/2, 550)
end