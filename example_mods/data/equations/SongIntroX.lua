--easy script configs
IntroTextSize = 25	--Size of the text for the Now Playing thing.
IntroSubTextSize = 30 --size of the text for the Song Name.
IntroComTextSize = 20 --size of the text for the Composed by.
IntroTagColor = 'FFFF00'--Color of the tag at the end of the box.
IntroTagWidth = 15	--Width of the box's tag thingy.
--easy script configs

--actual script
function onCreate()
	--the tag at the end of the box
	makeLuaSprite('JukeBoxxyTagy', 'empty', -305-IntroTagWidth, 15+70)
	makeGraphic('JukeBoxxyTagy', 300+IntroTagWidth, 100, IntroTagColor)
	setObjectCamera('JukeBoxxyTagy', 'other')
	addLuaSprite('JukeBoxxyTagy', true)

	--the box
	makeLuaSprite('JukeBoxxy', 'empty', -305-IntroTagWidth, 15+70)
	makeGraphic('JukeBoxxy', 300, 100, '000000')
	setObjectCamera('JukeBoxxy', 'other')
	addLuaSprite('JukeBoxxy', true)
	
	--the text for the "Now Playing" bit
	makeLuaText('JukeBoxxyText', 'Now Playing:', 300, -305-IntroTagWidth, 30+70)
	setTextAlignment('JukeBoxxyText', 'left')
	setObjectCamera('JukeBoxxyText', 'other')
	setTextSize('JukeBoxxyText', IntroTextSize)
	addLuaText('JukeBoxxyText')
	
	--text for the song name
	makeLuaText('JukeBoxxySubText', "X's Section", 300, -305-IntroTagWidth, 60+70)
	setTextAlignment('JukeBoxxySubText', 'left')
	setObjectCamera('JukeBoxxySubText', 'other')
	setTextSize('JukeBoxxySubText', IntroSubTextSize)
	addLuaText('JukeBoxxySubText')

	makeLuaText('JukeBoxxyComText', 'Composed By: srDoret', 300, -305-IntroTagWidth, 90+70)
	setTextAlignment('JukeBoxxyComText', 'left')
	setObjectCamera('JukeBoxxyComText', 'other')
	setTextSize('JukeBoxxyComText', IntroComTextSize)
	addLuaText('JukeBoxxyComText')
end


--motion functions
function onBeatHit()

	if curBeat == 136 then
	-- Inst and Vocals start playing, songPosition = 0
	doTweenX('MoveInOne', 'JukeBoxxyTagy', 0, 1, 'CircInOut')
	doTweenX('MoveInTwo', 'JukeBoxxy', 0, 1, 'CircInOut')
	doTweenX('MoveInThree', 'JukeBoxxyText', 0, 1, 'CircInOut')
	doTweenX('MoveInFour', 'JukeBoxxySubText', 0, 1, 'CircInOut')
	doTweenX('MoveInFive', 'JukeBoxxyComText', 0, 1, 'CircInOut')
	
	runTimer('JukeBoxxyWait', 3, 1)
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'JukeBoxxyWait' then
		doTweenX('MoveOutOne', 'JukeBoxxyTagy', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutTwo', 'JukeBoxxy', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutThree', 'JukeBoxxyText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFour', 'JukeBoxxySubText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFive', 'JukeBoxxyComText', -450, 1.5, 'CircInOut')
	end
end

