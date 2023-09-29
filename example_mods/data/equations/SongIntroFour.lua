--easy script configs
IntroTextSize = 25	--Size of the text for the Now Playing thing.
IntroSubTextSize = 30 --size of the text for the Song Name.
IntroComTextSize = 20 --size of the text for the Composed by.
IntroTagColor = '0094FF'--Color of the tag at the end of the box.
IntroTagWidth = 15	--Width of the box's tag thingy.
--easy script configs

--actual script
function onCreate()
	--the tag at the end of the box
	makeLuaSprite('JukeBoxyTagy', 'empty', -305-IntroTagWidth, 15+70)
	makeGraphic('JukeBoxyTagy', 300+IntroTagWidth, 100, IntroTagColor)
	setObjectCamera('JukeBoxyTagy', 'other')
	addLuaSprite('JukeBoxyTagy', true)

	--the box
	makeLuaSprite('JukeBoxy', 'empty', -305-IntroTagWidth, 15+70)
	makeGraphic('JukeBoxy', 300, 100, '000000')
	setObjectCamera('JukeBoxy', 'other')
	addLuaSprite('JukeBoxy', true)
	
	--the text for the "Now Playing" bit
	makeLuaText('JukeBoxyText', 'Now Playing:', 300, -305-IntroTagWidth, 30+70)
	setTextAlignment('JukeBoxyText', 'left')
	setObjectCamera('JukeBoxyText', 'other')
	setTextSize('JukeBoxyText', IntroTextSize)
	addLuaText('JukeBoxyText')
	
	--text for the song name
	makeLuaText('JukeBoxySubText', "Four's Section", 300, -305-IntroTagWidth, 60+70)
	setTextAlignment('JukeBoxySubText', 'left')
	setObjectCamera('JukeBoxySubText', 'other')
	setTextSize('JukeBoxySubText', IntroSubTextSize)
	addLuaText('JukeBoxySubText')

	makeLuaText('JukeBoxyComText', 'Composed By: TheGabiM', 300, -305-IntroTagWidth, 90+70)
	setTextAlignment('JukeBoxyComText', 'left')
	setObjectCamera('JukeBoxyComText', 'other')
	setTextSize('JukeBoxyComText', IntroComTextSize)
	addLuaText('JukeBoxyComText')
end


--motion functions
function onBeatHit()

	if curBeat == 12 then
	-- Inst and Vocals start playing, songPosition = 0
	doTweenX('MoveInOne', 'JukeBoxyTagy', 0, 1, 'CircInOut')
	doTweenX('MoveInTwo', 'JukeBoxy', 0, 1, 'CircInOut')
	doTweenX('MoveInThree', 'JukeBoxyText', 0, 1, 'CircInOut')
	doTweenX('MoveInFour', 'JukeBoxySubText', 0, 1, 'CircInOut')
	doTweenX('MoveInFive', 'JukeBoxyComText', 0, 1, 'CircInOut')
	
	runTimer('JukeBoxyWait', 3, 1)
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'JukeBoxyWait' then
		doTweenX('MoveOutOne', 'JukeBoxyTagy', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutTwo', 'JukeBoxy', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutThree', 'JukeBoxyText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFour', 'JukeBoxySubText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFive', 'JukeBoxyComText', -450, 1.5, 'CircInOut')
	end
end

