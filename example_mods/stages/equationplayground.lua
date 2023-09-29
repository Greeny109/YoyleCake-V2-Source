function onCreate()
	
	makeLuaSprite('bg','equations_bg',-1350, -250)
	addLuaSprite('bg', false)
        scaleObject('bg', 3.1, 3.1)
	
	--[[makeLuaSprite('stage','bottle',-750,-500)
	addLuaSprite('stage', true)]]
	

	--addLuaSprite("GF", true)
    --setGraphicSize("boyfriend", 400, 400)
    --setGraphicSize("dad", 700, 700)

makeLuaSprite('black','black',-550, -250)
setProperty('black.visible', false);  	
addLuaSprite('black', true)
scaleObject('black', 10, 10);
end

function onCreatePost()
    --setGraphicSize("dad", 550/2, 550)
end