local shouldDo = false

function onStepHit()
	if shouldDo == "true" then
		if curStep % 4 == 0 then
			doTweenY('rrr', 'camHUD', -22, stepCrochet*0.002, 'circOut')
			doTweenY('rtr', 'camGame.scroll', 12, stepCrochet*0.002, 'sineIn')
			doTweenZoom("ass", "camGame", 0.7, stepCrochet*0.002, "expoOut")
		end
		if curStep % 4 == 2 then
			doTweenY('rir', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
			doTweenY('ryr', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
			doTweenZoom("asser", "camGame", 1.3, 0, "expoOut")
		end
	end
end

function onEvent(name,value1,value2)	
	if name == "BeatBopNotes" then
		shouldDo = value1
	end
end