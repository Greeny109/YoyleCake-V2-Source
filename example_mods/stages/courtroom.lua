function onCreate()
	makeLuaSprite('bg','courtroomstage',-500, -200);
	addLuaSprite('bg', false);	
	scaleObject('bg', 1.8, 1.8)

	makeLuaSprite('desk','courtroomdesk',-500, -180);
	addLuaSprite('desk', false);	
	scaleObject('desk', 1.8, 1.8)
	--[[makeLuaSprite('stage','bottle',-750,-500)
	addLuaSprite('stage', true)]]
	

	--addLuaSprite("GF", true)
    --setGraphicSize("boyfriend", 400, 400)
    --setGraphicSize("dad", 700, 700)


	
end