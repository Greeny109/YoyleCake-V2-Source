--easy script configs
IntroTextSize = 25	--Size of the text for the Now Playing thing.
IntroSubTextSize = 30 --size of the text for the Song Name.
IntroComTextSize = 20 --size of the text for the Composed by.
IntroTagColor = 'ffae00'--Color of the tag at the end of the box.
IntroTagWidth = 15	--Width of the box's tag thingy.
--easy script configs

--actual script
function onCreate()
	--the tag at the end of the box
	makeLuaSprite('JukeBoxxeeeeeeyTagy', 'empty', -305-IntroTagWidth, 15+70)
	makeGraphic('JukeBoxxeeeeeeyTagy', 300+IntroTagWidth, 120, IntroTagColor)
	setObjectCamera('JukeBoxxeeeeeeyTagy', 'other')
	addLuaSprite('JukeBoxxeeeeeeyTagy', true)

	--the box
	makeLuaSprite('JukeBoxxeeeeeey', 'empty', -305-IntroTagWidth, 15+70)
	makeGraphic('JukeBoxxeeeeeey', 300, 120, '000000')
	setObjectCamera('JukeBoxxeeeeeey', 'other')
	addLuaSprite('JukeBoxxeeeeeey', true)
	
	--the text for the "Now Playing" bit
	makeLuaText('JukeBoxxeeeeeeyText', 'Now Playing:', 300, -305-IntroTagWidth, 30+70)
	setTextAlignment('JukeBoxxeeeeeeyText', 'left')
	setObjectCamera('JukeBoxxeeeeeeyText', 'other')
	setTextSize('JukeBoxxeeeeeeyText', IntroTextSize)
	addLuaText('JukeBoxxeeeeeeyText')
	
	--text for the song name
	makeLuaText('JukeBoxxeeeeeeySubText', "Ten's Section", 300, -305-IntroTagWidth, 60+70)
	setTextAlignment('JukeBoxxeeeeeeySubText', 'left')
	setObjectCamera('JukeBoxxeeeeeeySubText', 'other')
	setTextSize('JukeBoxxeeeeeeySubText', IntroSubTextSize)
	addLuaText('JukeBoxxeeeeeeySubText')

	makeLuaText('JukeBoxxeeeeeeyComText', 'Composed By: Greeny109 and LukaSpatula', 300, -305-IntroTagWidth, 90+70)
	setTextAlignment('JukeBoxxeeeeeeyComText', 'left')
	setObjectCamera('JukeBoxxeeeeeeyComText', 'other')
	setTextSize('JukeBoxxeeeeeeyComText', IntroComTextSize)
	addLuaText('JukeBoxxeeeeeeyComText')
end


--motion functions
function onBeatHit()

	if curBeat == 1380 then
	-- Inst and Vocals start playing, songPosition = 0
	doTweenX('MoveInOne', 'JukeBoxxeeeeeeyTagy', 0, 1, 'CircInOut')
	doTweenX('MoveInTwo', 'JukeBoxxeeeeeey', 0, 1, 'CircInOut')
	doTweenX('MoveInThree', 'JukeBoxxeeeeeeyText', 0, 1, 'CircInOut')
	doTweenX('MoveInFour', 'JukeBoxxeeeeeeySubText', 0, 1, 'CircInOut')
	doTweenX('MoveInFive', 'JukeBoxxeeeeeeyComText', 0, 1, 'CircInOut')
	
	runTimer('JukeBoxxeeeeeeyWait', 3, 1)
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'JukeBoxxeeeeeeyWait' then
		doTweenX('MoveOutOne', 'JukeBoxxeeeeeeyTagy', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutTwo', 'JukeBoxxeeeeeey', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutThree', 'JukeBoxxeeeeeeyText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFour', 'JukeBoxxeeeeeeySubText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFive', 'JukeBoxxeeeeeeyComText', -450, 1.5, 'CircInOut')
	end
end

