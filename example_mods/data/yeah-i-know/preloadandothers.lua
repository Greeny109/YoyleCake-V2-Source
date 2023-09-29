function onCreate()
	addCharacterToList('1amatch', 'dad')
	addCharacterToList('1apencil', 'boyfriend')
	addCharacterToList('1aflower1', 'dad')
	addCharacterToList('1aicy1', 'boyfriend')
	addCharacterToList('DEVInvis', 'dad')
	precacheImage('images/1a/Flashb')
end

function onStepHit()
	if curStep % 120 == 0 then
		doTweenAlpha('HUDFI', 'camHUD', 1, 0.25, 'sineIn')
	end
	if curStep % 512 == 0 then
		setProperty('fb.visible', true)
	end
	if curStep % 768 == 0 then
		setProperty('fb.visible', false)
	end
	if curStep % 1024 == 0 then
		setProperty('fb.visible', false)
		setProperty('camHUD.alpha', 0);
		setProperty('camGame.alpha', 0);
	end
end