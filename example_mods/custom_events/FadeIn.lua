function onEvent(n,v1,v2)


	if n == 'FadeIn' then

	   makeLuaSprite('fade', '', 0, 0);
        makeGraphic('fade',1280,720,'000000')
	      addLuaSprite('fade', true);
	      setLuaSpriteScrollFactor('fade',0,0)
	      setProperty('fade.scale.x',2)
	      setProperty('fade.scale.y',2)
	      setObjectCamera('fade', 'other')
		setProperty('fade.alpha',1)
		doTweenAlpha('flTw','fade',0,v1,v2)
	end



end