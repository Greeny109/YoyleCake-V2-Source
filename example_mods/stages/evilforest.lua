function onCreate()
	
	makeLuaSprite('beg','EvilForestGround',-550, -150);
	addLuaSprite('beg', false);
    scaleObject('beg', 0.75, 0.75); 

    makeLuaSprite('gee','EvilForestTees',-550, -150)
	addLuaSprite('gee', false)
    scaleObject('gee', 0.65, 0.65);
    
    makeLuaSprite('ge','EvilForestTees',-550, -150)
	addLuaSprite('ge', false)
    scaleObject('ge', 0.75, 0.75); 

    makeLuaSprite('g','EvilForestTees',-550, -150)
	addLuaSprite('g', false)
    scaleObject('g', 0.85, 0.85);  

    makeLuaSprite('shade','BlackShader',-550, -150);
	addLuaSprite('shade', true);
    scaleObject('shade', 1, 1); 

        makeLuaSprite('jumpscare','IMG_6628',100, 560)
	setProperty('jumpscare.visible', false);                 
        addLuaSprite('jumpscare', true)
        scaleObject('jumpscare', 0.7, 0.8);      
	
	--[[makeLuaSprite('stage','bottle',-750,-500)
	addLuaSprite('stage', true)]]
	

	--addLuaSprite("GF", true)
    --setGraphicSize("boyfriend", 400, 400)
    --setGraphicSize("dad", 700, 700)


        makeLuaSprite('black','black',-550, -250)
        setProperty('black.visible', false);  	
        addLuaSprite('black', true)
        scaleObject('black', 10, 10);


      makeAnimatedLuaSprite('static', 'static', -300, -325);
      setProperty('static.visible', false);      
      setProperty('static.antialiasing', false)
      addAnimationByPrefix('static', 'my weewee itches', 'static', 30, false);
      playAnim('static', 'my weewee itches', true);
      scaleObject('static', 8, 8);      
      addLuaSprite('static', true)
	
end

function onCreatePost()
    setGraphicSize("bg", 1920*1.5, 1050*1.5)
    --setGraphicSize("dad", 550/2, 550)
end