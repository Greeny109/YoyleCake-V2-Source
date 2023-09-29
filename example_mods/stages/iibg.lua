function onCreate()
	
	makeLuaSprite('bg','ii_bg',-550, -330)
	addLuaSprite('bg', false)
	setProperty('bg.visible', true);  	

	makeLuaSprite('bg_dark','ii_bg_dark',-550, -330)
	setProperty('bg_dark.visible', false);  	
	addLuaSprite('bg_dark', false)

	makeLuaSprite('spotlight1','spotlight1',-550, -330)
        setProperty('spotlight1.visible', false);  	
        addLuaSprite('spotlight1', true)

		makeLuaSprite('spotlight2','spotlight2',-550, -330)
        setProperty('spotlight2.visible', false);  	
        addLuaSprite('spotlight2', true)

		makeLuaSprite('spotlight3','spotlight3',-550, -330)
        setProperty('spotlight3.visible', false);  	
        addLuaSprite('spotlight3', true)

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
	setGraphicSize("bg_dark", 1920*1.5, 1050*1.5)
	setGraphicSize("spotlight1", 1920*1.5, 1050*1.5)
	setGraphicSize("spotlight2", 1920*1.5, 1050*1.5)
	setGraphicSize("spotlight3", 1920*1.5, 1050*1.5)
    --setGraphicSize("dad", 550/2, 550)
end