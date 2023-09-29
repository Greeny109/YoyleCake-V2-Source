--easy script configs
IntroTextSize = 25	--Size of the text for the Now Playing thing.
IntroSubTextSize = 30 --size of the text for the Song Name.
IntroComTextSize = 20 --size of the text for the Composed by.
IntroTagColor = 'dedede'--Color of the tag at the end of the box.
IntroTagWidth = 15	--Width of the box's tag thingy.
--easy script configs

--actual script
function onCreate()
	--the tag at the end of the box
	makeLuaSprite('JukeBoxxeeeeeyTagy', 'empty', -305-IntroTagWidth, 15+70)
	makeGraphic('JukeBoxxeeeeeyTagy', 300+IntroTagWidth, 100, IntroTagColor)
	setObjectCamera('JukeBoxxeeeeeyTagy', 'other')
	addLuaSprite('JukeBoxxeeeeeyTagy', true)

	--the box
	makeLuaSprite('JukeBoxxeeeeey', 'empty', -305-IntroTagWidth, 15+70)
	makeGraphic('JukeBoxxeeeeey', 300, 100, '000000')
	setObjectCamera('JukeBoxxeeeeey', 'other')
	addLuaSprite('JukeBoxxeeeeey', true)
	
	--the text for the "Now Playing" bit
	makeLuaText('JukeBoxxeeeeeyText', 'Now Playing:', 300, -305-IntroTagWidth, 30+70)
	setTextAlignment('JukeBoxxeeeeeyText', 'left')
	setObjectCamera('JukeBoxxeeeeeyText', 'other')
	setTextSize('JukeBoxxeeeeeyText', IntroTextSize)
	addLuaText('JukeBoxxeeeeeyText')
	
	--text for the song name
	makeLuaText('JukeBoxxeeeeeySubText', "Nine's Section", 300, -305-IntroTagWidth, 60+70)
	setTextAlignment('JukeBoxxeeeeeySubText', 'left')
	setObjectCamera('JukeBoxxeeeeeySubText', 'other')
	setTextSize('JukeBoxxeeeeeySubText', IntroSubTextSize)
	addLuaText('JukeBoxxeeeeeySubText')

	makeLuaText('JukeBoxxeeeeeyComText', 'Composed By: DangerBites', 300, -305-IntroTagWidth, 90+70)
	setTextAlignment('JukeBoxxeeeeeyComText', 'left')
	setObjectCamera('JukeBoxxeeeeeyComText', 'other')
	setTextSize('JukeBoxxeeeeeyComText', IntroComTextSize)
	addLuaText('JukeBoxxeeeeeyComText')
end


--motion functions
function onBeatHit()

	if curBeat == 988 then
	-- Inst and Vocals start playing, songPosition = 0
	doTweenX('MoveInOne', 'JukeBoxxeeeeeyTagy', 0, 1, 'CircInOut')
	doTweenX('MoveInTwo', 'JukeBoxxeeeeey', 0, 1, 'CircInOut')
	doTweenX('MoveInThree', 'JukeBoxxeeeeeyText', 0, 1, 'CircInOut')
	doTweenX('MoveInFour', 'JukeBoxxeeeeeySubText', 0, 1, 'CircInOut')
	doTweenX('MoveInFive', 'JukeBoxxeeeeeyComText', 0, 1, 'CircInOut')
	
	runTimer('JukeBoxxeeeeeyWait', 3, 1)
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'JukeBoxxeeeeeyWait' then
		doTweenX('MoveOutOne', 'JukeBoxxeeeeeyTagy', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutTwo', 'JukeBoxxeeeeey', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutThree', 'JukeBoxxeeeeeyText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFour', 'JukeBoxxeeeeeySubText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFive', 'JukeBoxxeeeeeyComText', -450, 1.5, 'CircInOut')
	end
end

