function onCreate()

        makeLuaSprite('sky','bfdisky',-550, -250)
	addLuaSprite('sky', false)
	scaleObject('sky', 1.6, 1.6);

        makeLuaSprite('ground','bfdiground',-550, -150)
	addLuaSprite('ground', false)
	scaleObject('ground', 1.6, 1.6);
	
        makeLuaSprite('wall','thewall',100, -100)
	addLuaSprite('wall', false)
        scaleObject('wall', 3.4, 3);
	
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