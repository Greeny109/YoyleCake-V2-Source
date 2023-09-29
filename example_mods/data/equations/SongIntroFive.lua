--easy script configs
IntroTextSize = 25	--Size of the text for the Now Playing thing.
IntroSubTextSize = 30 --size of the text for the Song Name.
IntroComTextSize = 20 --size of the text for the Composed by.
IntroTagColor = '9820a8'--Color of the tag at the end of the box.
IntroTagWidth = 15	--Width of the box's tag thingy.
--easy script configs

--actual script
function onCreate()
	--the tag at the end of the box
	makeLuaSprite('JukeBoxxeeeeyTagy', 'empty', -305-IntroTagWidth, 15+70)
	makeGraphic('JukeBoxxeeeeyTagy', 300+IntroTagWidth, 100, IntroTagColor)
	setObjectCamera('JukeBoxxeeeeyTagy', 'other')
	addLuaSprite('JukeBoxxeeeeyTagy', true)

	--the box
	makeLuaSprite('JukeBoxxeeeey', 'empty', -305-IntroTagWidth, 15+70)
	makeGraphic('JukeBoxxeeeey', 300, 100, '000000')
	setObjectCamera('JukeBoxxeeeey', 'other')
	addLuaSprite('JukeBoxxeeeey', true)
	
	--the text for the "Now Playing" bit
	makeLuaText('JukeBoxxeeeeyText', 'Now Playing:', 300, -305-IntroTagWidth, 30+70)
	setTextAlignment('JukeBoxxeeeeyText', 'left')
	setObjectCamera('JukeBoxxeeeeyText', 'other')
	setTextSize('JukeBoxxeeeeyText', IntroTextSize)
	addLuaText('JukeBoxxeeeeyText')
	
	--text for the song name
	makeLuaText('JukeBoxxeeeeySubText', "Five's Section", 300, -305-IntroTagWidth, 60+70)
	setTextAlignment('JukeBoxxeeeeySubText', 'left')
	setObjectCamera('JukeBoxxeeeeySubText', 'other')
	setTextSize('JukeBoxxeeeeySubText', IntroSubTextSize)
	addLuaText('JukeBoxxeeeeySubText')

	makeLuaText('JukeBoxxeeeeyComText', 'Composed By: CrispyNugget', 300, -305-IntroTagWidth, 90+70)
	setTextAlignment('JukeBoxxeeeeyComText', 'left')
	setObjectCamera('JukeBoxxeeeeyComText', 'other')
	setTextSize('JukeBoxxeeeeyComText', IntroComTextSize)
	addLuaText('JukeBoxxeeeeyComText')
end


--motion functions
function onBeatHit()

	if curBeat == 768 then
	-- Inst and Vocals start playing, songPosition = 0
	doTweenX('MoveInOne', 'JukeBoxxeeeeyTagy', 0, 1, 'CircInOut')
	doTweenX('MoveInTwo', 'JukeBoxxeeeey', 0, 1, 'CircInOut')
	doTweenX('MoveInThree', 'JukeBoxxeeeeyText', 0, 1, 'CircInOut')
	doTweenX('MoveInFour', 'JukeBoxxeeeeySubText', 0, 1, 'CircInOut')
	doTweenX('MoveInFive', 'JukeBoxxeeeeyComText', 0, 1, 'CircInOut')
	
	runTimer('JukeBoxxeeeeyWait', 3, 1)
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'JukeBoxxeeeeyWait' then
		doTweenX('MoveOutOne', 'JukeBoxxeeeeyTagy', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutTwo', 'JukeBoxxeeeey', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutThree', 'JukeBoxxeeeeyText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFour', 'JukeBoxxeeeeySubText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFive', 'JukeBoxxeeeeyComText', -450, 1.5, 'CircInOut')
	end
end

