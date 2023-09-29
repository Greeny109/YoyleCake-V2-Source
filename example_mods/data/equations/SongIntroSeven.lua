--easy script configs
IntroTextSize = 25	--Size of the text for the Now Playing thing.
IntroSubTextSize = 30 --size of the text for the Song Name.
IntroComTextSize = 20 --size of the text for the Composed by.
IntroTagColor = '404040'--Color of the tag at the end of the box.
IntroTagWidth = 15	--Width of the box's tag thingy.
--easy script configs

--actual script
function onCreate()
	--the tag at the end of the box
	makeLuaSprite('JukeBoxxeeyTagy', 'empty', -305-IntroTagWidth, 15+70)
	makeGraphic('JukeBoxxeeyTagy', 300+IntroTagWidth, 100, IntroTagColor)
	setObjectCamera('JukeBoxxeeyTagy', 'other')
	addLuaSprite('JukeBoxxeeyTagy', true)

	--the box
	makeLuaSprite('JukeBoxxeey', 'empty', -305-IntroTagWidth, 15+70)
	makeGraphic('JukeBoxxeey', 300, 100, '000000')
	setObjectCamera('JukeBoxxeey', 'other')
	addLuaSprite('JukeBoxxeey', true)
	
	--the text for the "Now Playing" bit
	makeLuaText('JukeBoxxeeyText', 'Now Playing:', 300, -305-IntroTagWidth, 30+70)
	setTextAlignment('JukeBoxxeeyText', 'left')
	setObjectCamera('JukeBoxxeeyText', 'other')
	setTextSize('JukeBoxxeeyText', IntroTextSize)
	addLuaText('JukeBoxxeeyText')
	
	--text for the song name
	makeLuaText('JukeBoxxeeySubText', "Seven's Section", 300, -305-IntroTagWidth, 60+70)
	setTextAlignment('JukeBoxxeeySubText', 'left')
	setObjectCamera('JukeBoxxeeySubText', 'other')
	setTextSize('JukeBoxxeeySubText', IntroSubTextSize)
	addLuaText('JukeBoxxeeySubText')

	makeLuaText('JukeBoxxeeyComText', 'Composed By: TheGabiM', 300, -305-IntroTagWidth, 90+70)
	setTextAlignment('JukeBoxxeeyComText', 'left')
	setObjectCamera('JukeBoxxeeyComText', 'other')
	setTextSize('JukeBoxxeeyComText', IntroComTextSize)
	addLuaText('JukeBoxxeeyComText')
end


--motion functions
function onBeatHit()

	if curBeat == 448 then
	-- Inst and Vocals start playing, songPosition = 0
	doTweenX('MoveInOne', 'JukeBoxxeeyTagy', 0, 1, 'CircInOut')
	doTweenX('MoveInTwo', 'JukeBoxxeey', 0, 1, 'CircInOut')
	doTweenX('MoveInThree', 'JukeBoxxeeyText', 0, 1, 'CircInOut')
	doTweenX('MoveInFour', 'JukeBoxxeeySubText', 0, 1, 'CircInOut')
	doTweenX('MoveInFive', 'JukeBoxxeeyComText', 0, 1, 'CircInOut')
	
	runTimer('JukeBoxxeeyWait', 3, 1)
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'JukeBoxxeeyWait' then
		doTweenX('MoveOutOne', 'JukeBoxxeeyTagy', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutTwo', 'JukeBoxxeey', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutThree', 'JukeBoxxeeyText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFour', 'JukeBoxxeeySubText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFive', 'JukeBoxxeeyComText', -450, 1.5, 'CircInOut')
	end
end

