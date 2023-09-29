
function onEvent(name,value1,value2)	
	if name == "barrelRoll" then
		doTweenAngle("hudTweenAngle", "camGame", value1, value2, "expoIn")
		doTweenZoom("asser", "camGame", 3, value2, "expoIn")
		--cameraFlash('camHUD', "ffffff", value2*2,true)
	end
end

--coded by dangerbites (he is hot!!!)