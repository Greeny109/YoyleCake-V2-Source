--easy script configs
IntroTextSize = 25	--Size of the text for the Now Playing thing.
IntroSubTextSize = 30 --size of the text for the Song Name.
IntroComTextSize = 20 --size of the text for the Composed by.
IntroTagColor = '04a9c9'--Color of the tag at the end of the box.
IntroTagWidth = 15	--Width of the box's tag thingy.
--easy script configs

--actual script
function onCreate()
	--the tag at the end of the box
	makeLuaSprite('JukeBoxxeyTagy', 'empty', -305-IntroTagWidth, 15+70)
	makeGraphic('JukeBoxxeyTagy', 300+IntroTagWidth, 100, IntroTagColor)
	setObjectCamera('JukeBoxxeyTagy', 'other')
	addLuaSprite('JukeBoxxeyTagy', true)

	--the box
	makeLuaSprite('JukeBoxxey', 'empty', -305-IntroTagWidth, 15+70)
	makeGraphic('JukeBoxxey', 300, 100, '000000')
	setObjectCamera('JukeBoxxey', 'other')
	addLuaSprite('JukeBoxxey', true)
	
	--the text for the "Now Playing" bit
	makeLuaText('JukeBoxxeyText', 'Now Playing:', 300, -305-IntroTagWidth, 30+70)
	setTextAlignment('JukeBoxxeyText', 'left')
	setObjectCamera('JukeBoxxeyText', 'other')
	setTextSize('JukeBoxxeyText', IntroTextSize)
	addLuaText('JukeBoxxeyText')
	
	--text for the song name
	makeLuaText('JukeBoxxeySubText', "Six's Section", 300, -305-IntroTagWidth, 60+70)
	setTextAlignment('JukeBoxxeySubText', 'left')
	setObjectCamera('JukeBoxxeySubText', 'other')
	setTextSize('JukeBoxxeySubText', IntroSubTextSize)
	addLuaText('JukeBoxxeySubText')

	makeLuaText('JukeBoxxeyComText', 'Composed By: Caster', 300, -305-IntroTagWidth, 90+70)
	setTextAlignment('JukeBoxxeyComText', 'left')
	setObjectCamera('JukeBoxxeyComText', 'other')
	setTextSize('JukeBoxxeyComText', IntroComTextSize)
	addLuaText('JukeBoxxeyComText')
end


--motion functions
function onBeatHit()

	if curBeat == 236 then
	-- Inst and Vocals start playing, songPosition = 0
	doTweenX('MoveInOne', 'JukeBoxxeyTagy', 0, 1, 'CircInOut')
	doTweenX('MoveInTwo', 'JukeBoxxey', 0, 1, 'CircInOut')
	doTweenX('MoveInThree', 'JukeBoxxeyText', 0, 1, 'CircInOut')
	doTweenX('MoveInFour', 'JukeBoxxeySubText', 0, 1, 'CircInOut')
	doTweenX('MoveInFive', 'JukeBoxxeyComText', 0, 1, 'CircInOut')
	
	runTimer('JukeBoxxeyWait', 3, 1)
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'JukeBoxxeyWait' then
		doTweenX('MoveOutOne', 'JukeBoxxeyTagy', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutTwo', 'JukeBoxxey', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutThree', 'JukeBoxxeyText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFour', 'JukeBoxxeySubText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFive', 'JukeBoxxeyComText', -450, 1.5, 'CircInOut')
	end
end

