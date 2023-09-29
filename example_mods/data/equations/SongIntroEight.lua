--easy script configs
IntroTextSize = 25	--Size of the text for the Now Playing thing.
IntroSubTextSize = 30 --size of the text for the Song Name.
IntroComTextSize = 20 --size of the text for the Composed by.
IntroTagColor = '707070'--Color of the tag at the end of the box.
IntroTagWidth = 15	--Width of the box's tag thingy.
--easy script configs

--actual script
function onCreate()
	--the tag at the end of the box
	makeLuaSprite('JukeBoxxeeeyTagy', 'empty', -305-IntroTagWidth, 15+70)
	makeGraphic('JukeBoxxeeeyTagy', 300+IntroTagWidth, 100, IntroTagColor)
	setObjectCamera('JukeBoxxeeeyTagy', 'other')
	addLuaSprite('JukeBoxxeeeyTagy', true)

	--the box
	makeLuaSprite('JukeBoxxeeey', 'empty', -305-IntroTagWidth, 15+70)
	makeGraphic('JukeBoxxeeey', 300, 100, '000000')
	setObjectCamera('JukeBoxxeeey', 'other')
	addLuaSprite('JukeBoxxeeey', true)
	
	--the text for the "Now Playing" bit
	makeLuaText('JukeBoxxeeeyText', 'Now Playing:', 300, -305-IntroTagWidth, 30+70)
	setTextAlignment('JukeBoxxeeeyText', 'left')
	setObjectCamera('JukeBoxxeeeyText', 'other')
	setTextSize('JukeBoxxeeeyText', IntroTextSize)
	addLuaText('JukeBoxxeeeyText')
	
	--text for the song name
	makeLuaText('JukeBoxxeeeySubText', "Eight's Section", 300, -305-IntroTagWidth, 60+70)
	setTextAlignment('JukeBoxxeeeySubText', 'left')
	setObjectCamera('JukeBoxxeeeySubText', 'other')
	setTextSize('JukeBoxxeeeySubText', IntroSubTextSize)
	addLuaText('JukeBoxxeeeySubText')

	makeLuaText('JukeBoxxeeeyComText', 'Composed By: srDoret', 300, -305-IntroTagWidth, 90+70)
	setTextAlignment('JukeBoxxeeeyComText', 'left')
	setObjectCamera('JukeBoxxeeeyComText', 'other')
	setTextSize('JukeBoxxeeeyComText', IntroComTextSize)
	addLuaText('JukeBoxxeeeyComText')
end


--motion functions
function onBeatHit()

	if curBeat == 608 then
	-- Inst and Vocals start playing, songPosition = 0
	doTweenX('MoveInOne', 'JukeBoxxeeeyTagy', 0, 1, 'CircInOut')
	doTweenX('MoveInTwo', 'JukeBoxxeeey', 0, 1, 'CircInOut')
	doTweenX('MoveInThree', 'JukeBoxxeeeyText', 0, 1, 'CircInOut')
	doTweenX('MoveInFour', 'JukeBoxxeeeySubText', 0, 1, 'CircInOut')
	doTweenX('MoveInFive', 'JukeBoxxeeeyComText', 0, 1, 'CircInOut')
	
	runTimer('JukeBoxxeeeyWait', 3, 1)
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'JukeBoxxeeeyWait' then
		doTweenX('MoveOutOne', 'JukeBoxxeeeyTagy', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutTwo', 'JukeBoxxeeey', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutThree', 'JukeBoxxeeeyText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFour', 'JukeBoxxeeeySubText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFive', 'JukeBoxxeeeyComText', -450, 1.5, 'CircInOut')
	end
end

