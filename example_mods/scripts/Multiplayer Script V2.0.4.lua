--Script by Super_Hugo on GameBanana
--Enjoy!

---------------------------------------------OPTIONS---------------------------------------------

---------------General Config---------------
playable = false		--change this to false if you want to play normally without multiplayer (or just move the script to another folder lol)

--change the P2 keys here (needs to be in this order: left, down, up, right)	- example: 	keys = {'D', 'F', 'J', 'K'}
keys = {
	'd',
	'f',
	'j',
	'k'
}

inputType = 'psych'		--the input that P2 will use (psych/kade)

lessMemoryUsage = false		--disables ratings, note splashes and score for less memory usage and less lag drops
noModchart = false		--set it to true if you can't see the opponent notes in a song (else make it false for modcharts to work)



---------------Strum Config---------------
changeScroll = false		--if enabled you can change the scroll type of each player with the next variables

downScrollP1 = false
downScrollP2 = true
--[I recommend enabling Hide HUD in the game configuration so the healthbar doesn't obstruct the arrows]

disableMiddleScroll = true		--disables middlescroll if it was enabled (to make it more fair to P2)



---------------Health Config---------------
cannotDieP1 = true
cannotDieP2 = true

showResultsOnGameOver = true		--if enabled when P1 or P2 dies a screen with the results will show up, else it will be a normal game over

--drain
doHealthDrainP1 = true		--P1 health drain
doHealthDrainP2 = true		--P2 health drain (disable if song already has opponent health drain)

doMissDrainP1 = true		--if P1 health gets lower when a note is missed
doMissDrainP2 = true		--if P2 health gets lower when a note is missed

separatedHealthBars = false		--if enabled each player will have its own health bar (warning: also separates health, so if song has health drain it will only affect P1)



---------------P2 Rating Config---------------
showCombo = false
showComboNum = true
showRating = true

showMS = false		--shows your note hit timing like in Kade Engine

comboOffset = {-300, -250, -300, -250}		--order is {ratingX, ratingY, numX, numY}		(the combo sprite uses numX and numY)



---------------Other Config---------------
doEndScreen = true		--if true adds a screen at the end of the song that shows the score for each player
doHitsounds = true		--hitsounds for P2 (only if you have hitsounds enabled in your settings)
doNoteSplashes = true

botPlayKey = 'SIX'		--key to toggle botplay mid-song for P2 (nil for no toggle)
controlsP1Key = 'FIVE'		--key shortcut for the P1 controls menu

botplayPlayerIndicator = true		--if true adds a 'P1' or 'P2' text before the botplay text for each player



---------------Experimental---------------

--(dont use these in songs with mechanics or it can break)

mustPressSwap = false		--swaps the notes between P1 and P2 (also changes the characters if differentCharactersMode is false)
differentCharactersMode = false		--if true lets you change the P1 and P2 characters (use with noModchart in true to change the note strum positions)


--change these to the characters you want to play as with differentCharactersMode enabled (boyfriend, dad or gf)
swapCharacterP1 = 'dad'
swapCharacterP2 = 'boyfriend'

--EXAMPLES
--[[

if you want the P2 to play as boyfriend and P1 to play as opponent do this:

mustPressSwap = true
differentCharactersMode = true

swapCharacterP1 = 'dad'
swapCharacterP2 = 'boyfriend'

--

or if you want the P1 to play as girlfriend:

mustPressSwap = false
differentCharactersMode = true

swapCharacterP1 = 'girlfriend'
swapCharacterP2 = 'dad'

--]]




------------------------------dont change anything from this point on------------------------------

--score and stuff for player 2
scoreP2 = 0
comboP2 = 0
totalNotesHitP2 = 0
totalPlayedP2 = 0
hitsP2 = 0
songMissesP2 = 0
ratingsP2 = {sicks = 0, goods = 0, bads = 0, shits = 0}
healthP2 = 1

local ratingsData = {}

local ratingPercentP2 = 1
local ratingNameP2 = '?'
local ratingFCP2 = ''

cpuControlled = false

defaultCharacter = 'dad'

if differentCharactersMode then
	defaultCharacter = swapCharacterP2
	
elseif mustPressSwap then
	defaultCharacter = 'boyfriend'
	swapCharacterP1 = 'dad'
end

if lessMemoryUsage then
	showResultsOnGameOver = false
	showCombo = false
	showComboNum = false
	showRating = false
	showMS = false
	separatedHealthBars = false
	doEndScreen = false
	doHitsounds = false
	doNoteSplashes = false
	botplayPlayerIndicator = false
end

--other variables
local makeChanges = false
local songSplashSkin = nil
local ratingCount = 0
local gfSinging = false
local gfSingingP1 = false
local hitsP1 = 0
local noteMissesP2 = 0

inEndScreen = false
local endScreenType = 0

local endContinue = false
local continueTxtSine = 0
local botplayTxtSine = 0

local orMiddleScroll = nil
onGameOverP2 = false


function onCreate()

	runHaxeCode([[
		//start some variables
		game.setOnLuas("multiplayer", ]]..tostring(playable)..[[);
		game.setOnLuas("botplayP2", false);
		
		game.setOnLuas("scoreP2", 0);
		game.setOnLuas("missesP2", 0);
		game.setOnLuas("noteMissesP2", 0);
		game.setOnLuas("comboP2", 0);
		game.setOnLuas("hitsP2", 0);
		
		game.setOnLuas("sicksP2", 0);
		game.setOnLuas("goodsP2", 0);
		game.setOnLuas("badsP2", 0);
		game.setOnLuas("shitsP2", 0);
		
		game.setOnLuas("onGameOverP2", false);
	]])
	
	if tonumber(_G["playbackRate"]) == nil or not (type(_G["playbackRate"]) == 'number') then
		_G["playbackRate"] = 1
	end

	addHaxeLibrary('FlxMath', 'flixel.math')
	addHaxeLibrary('Math')
	addHaxeLibrary('Std')
	
	addHaxeLibrary('AttachedSprite')
	addHaxeLibrary('FlxBar', 'flixel.ui')
	addHaxeLibrary('FlxObject', 'flixel')
	
	addHaxeLibrary('GameOverSubstate')

	if playable then
	
		orMiddleScroll = getPropertyFromClass('ClientPrefs', 'middleScroll')
		if disableMiddleScroll then
			setPropertyFromClass('ClientPrefs', 'middleScroll', false)
		end
		
	end
	
end


function onDestroy()

	if playable then
	
		if not (orMiddleScroll == nil) then
			setPropertyFromClass('ClientPrefs', 'middleScroll', orMiddleScroll)
		end
		
	end
	
end
	
	
function onCreatePost()

	if playable then
	
		if separatedHealthBars then
		
			--false = upscroll, true = downscroll
			local scrollP1 = getPropertyFromClass('ClientPrefs', 'downScroll')
			local scrollP2 = getPropertyFromClass('ClientPrefs', 'downScroll')
			
			if changeScroll then
				scrollP1 = downScrollP1
				scrollP2 = downScrollP2
			end

			local temp1 = 'healthP1'
			local temp2 = 'healthP2'
			
			if mustPressSwap then
				temp1 = 'healthP2'
				temp2 = 'healthP1'
			end

			runHaxeCode([[
				//i have to use objects instead of variables because i have no idea how FlxBar works
				healthP1 = new FlxObject(1, 0, 0, 0);
				healthP2 = new FlxObject(1, 0, 0, 0);
				
				//player 1 bar
				healthBarP1BG = new AttachedSprite('healthBar');
				healthBarP1BG.y = FlxG.height * 0.89;
				healthBarP1BG.scale.x = 0.5;
				healthBarP1BG.visible = !ClientPrefs.hideHud;
				healthBarP1BG.cameras = [game.camHUD];
				healthBarP1BG.xAdd = -4;
				healthBarP1BG.yAdd = -4;
				game.insert(game.members.indexOf(game.healthBarBG), healthBarP1BG);
				game.add(healthBarP1BG);
				if(]]..tostring(scrollP1)..[[) healthBarP1BG.y = 0.11 * FlxG.height;
				
				healthBarP1BG.updateHitbox();
				healthBarP1BG.x = FlxG.width / 2 + healthBarP1BG.width / 2;

				healthBarP1 = new FlxBar(healthBarP1BG.x - 6, healthBarP1BG.y + 4, null, Std.int(healthBarP1BG.width - 6), Std.int(healthBarP1BG.height - 8), ]]..temp1..[[, 'x', 0, 2);
				healthBarP1.cameras = [game.camHUD];
				healthBarP1.visible = !ClientPrefs.hideHud;
				healthBarP1.alpha = ClientPrefs.healthBarAlpha;
				healthBarP1.flipX = true;
				game.insert(game.members.indexOf(game.healthBar), healthBarP1);
				
				healthBarP1BG.sprTracker = healthBarP1;
				
				healthBarP1.createFilledBar(0xFF000000, 0xFF]]..healthBarColor('boyfriend')..[[);
				healthBarP1.updateBar();
				
				//player 2 bar
				healthBarP2BG = new AttachedSprite('healthBar');
				healthBarP2BG.y = FlxG.height * 0.89;
				healthBarP2BG.scale.x = 0.5;
				healthBarP2BG.visible = !ClientPrefs.hideHud;
				healthBarP2BG.cameras = [game.camHUD];
				healthBarP2BG.xAdd = -4;
				healthBarP2BG.yAdd = -4;
				game.insert(game.members.indexOf(game.healthBarBG), healthBarP2BG);
				if(]]..tostring(scrollP2)..[[) healthBarP2BG.y = 0.11 * FlxG.height;
				
				healthBarP2BG.updateHitbox();
				healthBarP2BG.x = FlxG.width / 2 - healthBarP2BG.width - healthBarP2BG.width / 2;
				
				healthBarP2 = new FlxBar(healthBarP2BG.x, healthBarP2BG.y + 4, null, Std.int(healthBarP2BG.width - 6), Std.int(healthBarP2BG.height - 8), ]]..temp2..[[, 'x', 0, 2);
				healthBarP2.cameras = [game.camHUD];
				healthBarP2.visible = !ClientPrefs.hideHud;
				healthBarP2.alpha = ClientPrefs.healthBarAlpha;
				game.insert(game.members.indexOf(game.healthBar), healthBarP2);
				
				healthBarP2BG.sprTracker = healthBarP2;
				
				healthBarP2.createFilledBar(0xFF000000, 0xFF]]..healthBarColor('dad')..[[);
				healthBarP2.updateBar();
				
				game.healthBar.percent = 50;

				game.healthBar.visible = false;
				game.healthBar.active = false;
				game.healthBar.exists = false;
				game.healthBarBG.visible = false;
				game.healthBarBG.active = false;
				game.healthBarBG.exists = false;
			]])
		end

		--get the song note splashes because it doesn't let me use SONG.splashSkin for some reason
		songSplashSkin = getPropertyFromGroup('unspawnNotes', 0, 'noteSplashTexture')

		if songSplashSkin == nil or songSplashSkin == 'noteSplashTexture' then 
			songSplashSkin = 'noteSplashes'
		end
		
		
		 if not (lessMemoryUsage) then
		
			--make opponent scoreTxt
			makeLuaText('scoreTxtP2', '', 0, 0, 0)
			setObjectCamera('scoreTxtP2', 'camHUD')
			setProperty('scoreTxtP2.borderSize', 1.25)
			setTextSize('scoreTxtP2', 20)
			setTextAlignment('scoreTxtP2', 'center')
			setProperty('scoreTxtP2.visible', playable and not (getPropertyFromClass('ClientPrefs', 'hideHud')))
			addLuaText('scoreTxtP2', true)

			if getPropertyFromClass('ClientPrefs', 'downScroll') then
				setProperty('scoreTxtP2.y', 650)
			end
			
			setTextString('scoreTxtP2', 'Score: '..scoreP2..' | Misses: '..songMissesP2..' | Rating: '..ratingNameP2)
			
			screenCenter('scoreTxtP2', 'x')
			
			
			--P2 botplay text
			if not (isLoreEngine) then
				makeLuaText('botplayTxtP2', 'BOTPLAY', 0, 0, getProperty('healthBarBG.y') - 55)
				setObjectCamera('botplayTxtP2', 'camHUD')
				setProperty('botplayTxtP2.borderSize', 1.25)
				setTextSize('botplayTxtP2', 32)
				setTextAlignment('botplayTxtP2', 'center')
				updateHitbox('botplayTxtP2')
				addLuaText('botplayTxtP2', true)
			end
		
		end
		
		if changeScroll then
		
			for i = 0, getProperty('playerStrums.length')-1 do
			
				if downScrollP1 then
					setPropertyFromGroup('playerStrums', i, 'y', screenHeight - 150)
				else
					setPropertyFromGroup('playerStrums', i, 'y', 50)
				end
				
				setPropertyFromGroup('playerStrums', i, 'downScroll', downScrollP1)
				
				runHaxeCode([[
					game.setOnLuas('defaultPlayerStrumY' + ]]..i..[[, game.playerStrums.members[]]..i..[[].y);
				]])
				
			end
			
			for i = 0, getProperty('opponentStrums.length')-1 do
				
				if downScrollP2 then
					setPropertyFromGroup('opponentStrums', i, 'y', screenHeight - 150)
				else
					setPropertyFromGroup('opponentStrums', i, 'y', 50)
				end
				
				setPropertyFromGroup('opponentStrums', i, 'downScroll', downScrollP2)
				
				runHaxeCode([[
					game.setOnLuas('defaultOpponentStrumY' + ]]..i..[[, game.opponentStrums.members[]]..i..[[].y);
				]])

			end
		
		end
	
	end

end


function onEvent(tag)

	--update healthbar colors
	if tag == 'Change Character' then
		runHaxeCode([[
			healthBarP1.createFilledBar(0xFF000000, 0xFF]]..healthBarColor('boyfriend')..[[);
			healthBarP1.updateBar();
			healthBarP2.createFilledBar(0xFF000000, 0xFF]]..healthBarColor('dad')..[[);
			healthBarP2.updateBar();
		]])
	end

end


function onUpdate(elapsed)
	
	if playable then

		runHaxeCode([[
			game.setOnLuas("botplayP2", ]]..tostring(cpuControlled)..[[);
			
			game.setOnLuas("scoreP2", ]]..scoreP2..[[);
			game.setOnLuas("missesP2", ]]..songMissesP2..[[);
			game.setOnLuas("noteMissesP2", ]]..noteMissesP2..[[);
			game.setOnLuas("comboP2", ]]..comboP2..[[);
			game.setOnLuas("hitsP2", ]]..hitsP2..[[);
			
			game.setOnLuas("sicksP2", ]]..ratingsP2.sicks..[[);
			game.setOnLuas("goodsP2", ]]..ratingsP2.goods..[[);
			game.setOnLuas("badsP2", ]]..ratingsP2.bads..[[);
			game.setOnLuas("shitsP2", ]]..ratingsP2.shits..[[);
			
			game.setOnLuas("onGameOverP2", ]]..tostring(onGameOverP2)..[[);
		]])
	
		--debug botplay key
		if not (botPlayKey == nil or botPlayKey == '') then
		
			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.'..botPlayKey:upper()) then
			
				if playable then
					cpuControlled = not cpuControlled
				end
				
				makeChanges = true
				
			end
		
		end

		--input
		if not (cpuControlled) and not (getProperty('inCutscene')) then
			keyShit()
			keyHoldShit()
		end

		--health limits
		if cannotDieP1 and getProperty('health') < 0 then setProperty('health', 0) end
		if cannotDieP2 and healthP2 < 0 then healthP2 = 0 end
		if healthP2 > 2 then healthP2 = 2 end

		if not (cannotDieP2) then
		
			if healthP2 <= 0 or (not (separatedHealthBars) and getProperty('health') > 2) then
			
				if showResultsOnGameOver then
			
					if not (inEndScreen) then
						endScreenType = 1
						startEndScreen()
					end
				
				else
				
					if not (onGameOverP2) then
					
						onGameOverP2 = true
						
						runHaxeCode([[
							game.boyfriend.stunned = true;
							PlayState.deathCounter++;

							game.paused = true;

							game.vocals.stop();
							FlxG.sound.music.stop();

							game.persistentUpdate = false;
							game.persistentDraw = false;
							
							for (tween in game.modchartTweens) {
								tween.active = true;
							}
							for (timer in game.modchartTimers) {
								timer.active = true;
							}
							
							game.openSubState(new GameOverSubstate(game.dad.getScreenPosition().x - game.dad.positionArray[0], game.dad.getScreenPosition().y - game.dad.positionArray[1], game.camFollowPos.x, game.camFollowPos.y));
							game.isDead = true;
						]])

					end
					
				end
				
			end
		
		end

		if isCharacter(defaultCharacter) then
			animThingP2(elapsed)
		end
		
		if isCharacter(swapCharacterP1) and (mustPressSwap or differentCharactersMode) then
			animThingP1(elapsed)
		end
	
	end

end


--normal notes
function keyShit()

	for i = 1, #keys do
	
		if not (i > getProperty('opponentStrums.length')) then
		
			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.'..keys[i]:upper()) then
				strumPlayAnim(i - 1, 'pressed', true, -1)
				onKeyPressP2(i - 1)
			end
			
			if getPropertyFromClass('flixel.FlxG', 'keys.justReleased.'..keys[i]:upper()) then
				strumPlayAnim(i - 1, 'static', true, 0)
			end
		
		end
		
	end
			
end


function keyHoldShit()

	for i = 1, #keys do
	
		if not (i > getProperty('opponentStrums.length')) then
	
			if getPropertyFromClass('flixel.FlxG', 'keys.pressed.'..keys[i]:upper()) then
				runHaxeCode([[
					var key = ]]..(i - 1)..[[;
					
					game.notes.forEachAlive(function(daNote)
					{
						if (daNote.isSustainNote && !daNote.mustPress && daNote.canBeHit && !daNote.tooLate && !daNote.hitByOpponent && !daNote.blockHit)
						{
							if (daNote.noteData == key)
								game.callOnLuas('goodNoteHitP2', [game.notes.members.indexOf(daNote), daNote.noteData, daNote.noteType, daNote.isSustainNote], true);
						}
					});
				]])
			end
		
		end
			
	end

end


--more set note stuff
function onSpawnNote(id)

	if playable then

		if not (getPropertyFromGroup('notes', id, 'mustPress')) then
		
			if getPropertyFromGroup('notes', id, 'ignoreNote') or getPropertyFromGroup('notes', id, 'hitCausesMiss') then
				setPropertyFromGroup('notes', id, 'rating', 'ignore')
			end
			
		end

		--set note stuff for mustPressSwap
		if mustPressSwap then
		
			setPropertyFromGroup('notes', id, 'mustPress', not getPropertyFromGroup('notes', id, 'mustPress'))
			
			if not (separatedHealthBars) then
				setPropertyFromGroup('notes', id, 'hitHealth', -getPropertyFromGroup('notes', id, 'hitHealth'))
				setPropertyFromGroup('notes', id, 'missHealth', -getPropertyFromGroup('notes', id, 'missHealth'))
			end
			
		end

		--swapped characters
		if differentCharactersMode or mustPressSwap then
			
			if getPropertyFromGroup('notes', id, 'mustPress') then
				setPropertyFromGroup('notes', id, 'inEditor', getPropertyFromGroup('notes', id, 'noAnimation'))
				setPropertyFromGroup('notes', id, 'noAnimation', true)
				setPropertyFromGroup('notes', id, 'noMissAnimation', true)
			end
			
		end
		
		--health
		if not (getPropertyFromGroup('notes', i, 'mustPress')) then
		
			--just in case
			if not (doHealthDrainP2) then
				setPropertyFromGroup('notes', id, 'hitHealth', 0)
			end
			
			if not (doMissDrainP2) then
				setPropertyFromGroup('notes', id, 'missHealth', 0)
			end
			
			setPropertyFromGroup('notes', id, 'ignoreNote', true)

		else
		
			if not (doHealthDrainP1) then
				setPropertyFromGroup('notes', id, 'hitHealth', 0)
			end
			
			if not (doMissDrainP1) then
				setPropertyFromGroup('notes', id, 'missHealth', 0)
			end
			
			setPropertyFromGroup('notes', id, 'rating', '')
			
		end
		
		if noModchart then
			--setPropertyFromGroup('notes', id, 'copyX', false)
			setPropertyFromGroup('notes', id, 'copyAlpha', false)
		end
		
		if getPropertyFromGroup('notes', id, 'isSustainNote') and changeScroll then
		
			if mustPressSwap then
			
				if (getPropertyFromGroup('notes', id, 'mustPress') and downScrollP2) or (not (getPropertyFromGroup('notes', id, 'mustPress')) and downScrollP1) then
					setPropertyFromGroup('notes', id, 'flipY', true)
				else
					setPropertyFromGroup('notes', id, 'flipY', false)
				end
			
			else
		
				if (getPropertyFromGroup('notes', id, 'mustPress') and downScrollP1) or (not (getPropertyFromGroup('notes', id, 'mustPress')) and downScrollP2) then
					setPropertyFromGroup('notes', id, 'flipY', true)
				else
					setPropertyFromGroup('notes', id, 'flipY', false)
				end
			
			end
		
		end

	end
	
end


-------------------set stuff for player 2-------------------
function onUpdatePost(elapsed)

	if playable then
	
		if separatedHealthBars then

			runHaxeCode([[
				//set health variables
				healthP1.x = game.health;
				healthP2.x = ]]..tostring(tonumber(healthP2))..[[;
				
				healthBarP1.alpha = game.healthBar.alpha;
				healthBarP2.alpha = game.healthBar.alpha;
				healthBarP1BG.alpha = game.healthBarBG.alpha;
				healthBarP2BG.alpha = game.healthBarBG.alpha;
				
				var iconOffset = 26;

				game.iconP1.x = healthBarP1.x + (healthBarP1.width * (FlxMath.remapToRange(healthBarP1.percent, 0, 100, 100, 0) * 0.01)) - iconOffset * 2.5;
				game.iconP2.x = healthBarP2.x + healthBarP2.width - (healthBarP2.width * (FlxMath.remapToRange(healthBarP2.percent, 0, 100, 100, 0) * 0.01)) - iconOffset * 2.5;

				game.iconP1.y = healthBarP1.y - 75;
				game.iconP2.y = healthBarP2.y - 75;
				
				if (healthBarP1.percent < 20)
					game.iconP1.animation.curAnim.curFrame = 1;
				else
					game.iconP1.animation.curAnim.curFrame = 0;

				if (healthBarP2.percent < 20)
					game.iconP2.animation.curAnim.curFrame = 1;
				else
					game.iconP2.animation.curAnim.curFrame = 0;
			]])
			
		end
	
		if not (lessMemoryUsage) then
		
			scoreTxtStuff()
			
			if not (isLoreEngine) then
				botplayTextStuff(elapsed)
			end
			
		end
	
		--change strum positions with the character
		if noModchart then
		
			for i = 0, 3 do
			
				--much better i guess
				local x1 = _G['defaultPlayerStrumX'..i]
				local x2 = _G['defaultOpponentStrumX'..i]
				local y1 = _G['defaultPlayerStrumY'..i]
				local y2 = _G['defaultOpponentStrumY'..i]
				
				local scrollP1 = getPropertyFromClass('ClientPrefs', 'downScroll')
				local scrollP2 = getPropertyFromClass('ClientPrefs', 'downScroll')
				
				if changeScroll then
				
					scrollP1 = downScrollP1
					scrollP2 = downScrollP2
					
					if mustPressSwap then
						scrollP1 = downScrollP2
						scrollP2 = downScrollP1
					end
					
				end

				if mustPressSwap then
				
					if not (swapCharacterP2 == 'dad') or not (differentCharactersMode) then
						x2 = _G['defaultPlayerStrumX'..i]
						y2 = _G['defaultPlayerStrumY'..i]
					end
					
					if not (swapCharacterP1 == 'boyfriend') or not (differentCharactersMode) then
						x1 = _G['defaultOpponentStrumX'..i]
						y1 = _G['defaultOpponentStrumY'..i]
					end
					
				end

				if differentCharactersMode then
					
					--dad strum position (P1)
					if swapCharacterP1 == 'dad' or (swapCharacterP1 == 'gf' and swapCharacterP2 == 'boyfriend') then
						x1 = _G['defaultOpponentStrumX'..i]
						y1 = _G['defaultOpponentStrumY'..i]
					end

					--boyfriend strum position (P2)
					if swapCharacterP2 == 'boyfriend' or (swapCharacterP2 == 'gf' and not (swapCharacterP1 == 'boyfriend')) then
						x2 = _G['defaultPlayerStrumX'..i]
						y2 = _G['defaultPlayerStrumY'..i]
					end
					
					--middlescroll (only when both characters are gf) (P1 and P2)
					if swapCharacterP1 == 'gf' and swapCharacterP2 == 'gf' then
						x1 = ((screenWidth / 2) - (getPropertyFromClass('Note', 'swagWidth') * 2)) + (i * (getPropertyFromClass('Note', 'swagWidth')))
						x2 = ((screenWidth / 2) - (getPropertyFromClass('Note', 'swagWidth') * 2)) + (i * (getPropertyFromClass('Note', 'swagWidth')))
					end

				end

				setPropertyFromGroup('playerStrums', i, 'x', x1)
				setPropertyFromGroup('playerStrums', i, 'y', y1)
				setPropertyFromGroup('opponentStrums', i, 'x', x2)
				setPropertyFromGroup('opponentStrums', i, 'y', y2)

				setPropertyFromGroup('playerStrums', i, 'alpha', 1)
				setPropertyFromGroup('playerStrums', i, 'visible', true)
				setPropertyFromGroup('playerStrums', i, 'direction', 90)
				setPropertyFromGroup('playerStrums', i, 'downScroll', scrollP1)
				
				setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
				setPropertyFromGroup('opponentStrums', i, 'visible', true)
				setPropertyFromGroup('opponentStrums', i, 'direction', 90)
				setPropertyFromGroup('opponentStrums', i, 'downScroll', scrollP2)
				
			end
		
		end
	
		--note stuff
		for i = 0, getProperty('notes.length')-1 do

			--opponent note stuff
			if not (getPropertyFromGroup('notes', i, 'mustPress')) then
			
				--check if the note is too late or it can be hit
				if not (cpuControlled) then
				
					if getPropertyFromGroup('notes', i, 'strumTime') > getPropertyFromClass('Conductor', 'songPosition') - (getPropertyFromClass('Conductor', 'safeZoneOffset') * getPropertyFromGroup('notes', i, 'lateHitMult'))
						and getPropertyFromGroup('notes', i, 'strumTime') < getPropertyFromClass('Conductor', 'songPosition') + (getPropertyFromClass('Conductor', 'safeZoneOffset') * getPropertyFromGroup('notes', i, 'earlyHitMult')) then
							setPropertyFromGroup('notes', i, 'canBeHit', true)
					else
						setPropertyFromGroup('notes', i, 'canBeHit', false)
					end
					
					if getPropertyFromGroup('notes', i, 'strumTime') < getPropertyFromClass('Conductor', 'songPosition') - getPropertyFromClass('Conductor', 'safeZoneOffset') and not (getPropertyFromGroup('notes', i, 'hitByOpponent')) then
						setPropertyFromGroup('notes', i, 'tooLate', true)
					end

				else
				
					if getPropertyFromGroup('notes', i, 'isSustainNote') then
				
						if getPropertyFromGroup('notes', i, 'strumTime') <= getPropertyFromClass('Conductor', 'songPosition') + (getPropertyFromClass('Conductor', 'safeZoneOffset') * getPropertyFromGroup('notes', i, 'earlyHitMult')) then
							setPropertyFromGroup('notes', i, 'canBeHit', true)
						end
					
					else
					
						if getPropertyFromGroup('notes', i, 'strumTime') <= getPropertyFromClass('Conductor', 'songPosition') then
							setPropertyFromGroup('notes', i, 'canBeHit', true)
						end
					
					end
					
				end
				
				
				--P2 botplay input
				if cpuControlled and not (getProperty('endingSong')) then

					if getPropertyFromGroup('notes', i, 'canBeHit') and not (getPropertyFromGroup('notes', i, 'rating') == 'ignore') and not (getPropertyFromGroup('notes', i, 'hitByOpponent')) then
			
						if not (getPropertyFromGroup('notes', i, 'isSustainNote')) then
							setPropertyFromGroup('notes', i, 'strumTime', getPropertyFromClass('Conductor', 'songPosition')) --make bot hit notes perfectly
						end
						
						--for hitting extra keys that are out of reach
						if getPropertyFromGroup('notes', i, 'noteData') > getProperty('opponentStrums.length') then
							setPropertyFromGroup('notes', i, 'noteData', getPropertyFromGroup('notes', i, 'noteData') % getProperty('opponentStrums.length'))
						end
						
						runHaxeCode([[
							var note = game.notes.members[]]..i..[[];
							game.callOnLuas('goodNoteHitP2', []]..i..[[, note.noteData, note.noteType, note.isSustainNote], true);
						]])

					end

				end


				--note missed
				if getPropertyFromClass('Conductor', 'songPosition') > (getProperty('noteKillOffset') - 15) + getPropertyFromGroup('notes', i, 'strumTime') then
				
					setPropertyFromGroup('notes', i, 'strumTime', getPropertyFromClass('Conductor', 'songPosition'))

					if not (cpuControlled) and not (getPropertyFromGroup('notes', i, 'rating') == 'ignore') and not (getProperty('endingSong')) 
					and (getPropertyFromGroup('notes', i, 'tooLate') or not (getPropertyFromGroup('notes', i, 'hitByOpponent'))) then
						--debugPrint('note missed: ', i)
						noteMissP2(i)
					end
					
					setPropertyFromGroup('notes', i, 'active', false)
					setPropertyFromGroup('notes', i, 'visible', false)

					removeFromGroup('notes', i)
					
				end

			end
			
		end
		
		--end screen stuff
		if inEndScreen then
		
			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') then
			
				endContinue = true
				
				if endScreenType == 0 then
					endSong()
				else
					restartSong()
				end
				
			end
			
			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ESCAPE') and not (endScreenType == 0) then
				exitSong()
			end
			
			continueTxtSine = continueTxtSine + (180 * elapsed)
			setProperty('continueTxt.alpha', 1 - math.sin((math.pi * continueTxtSine) / 180))
			
			setProperty('camZooming', false)
			setProperty('camZoomingMult', 0)
			setProperty('camZoomingDecay', 0)

		end
		
		if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.'..controlsP1Key:upper()) then
			openSubstate('options.ControlsSubState')
		end
		
		
	--this is unused but it could be used in something
	elseif makeChanges then
	
		setProperty('scoreTxtP2.visible', false)
		
		for i = 0, getProperty('notes.length')-1 do
		
			if not (getPropertyFromGroup('notes', i, 'mustPress')) then

				if getPropertyFromGroup('notes', i, 'ignoreNote') and not (getPropertyFromGroup('notes', i, 'rating') == 'ignore') then 
					setPropertyFromGroup('notes', i, 'ignoreNote', false)
				end
				
			end
			
		end
		
		makeChanges = false
	
	end
	
end


-------------------inputs-------------------
function onKeyPressP2(key)

	if inputType:lower() == 'kade' then
		runHaxeCode([[
			var key = ]]..key..[[;
			
			if (game.startedCountdown && !game.paused && key > -1)
			{
				if(game.generatedMusic && !game.endingSong)
				{
					var closestNotes = [];
					
					game.notes.forEachAlive(function(daNote)
					{
						if (daNote.canBeHit && !daNote.mustPress && !daNote.hitByOpponent && !daNote.isSustainNote && !daNote.blockHit)
							closestNotes.push(daNote);
					});
					
					closestNotes.sort((a, b) -> Std.int(a.strumTime - b.strumTime));
					
					var dataNotes = [];
					for (i in closestNotes)
					{
						if (i.noteData == key && !i.isSustainNote)
						{
							dataNotes.push(i);
						}
					}
							
					if (dataNotes.length != 0)
					{
						var coolNote = null;

						for (i in dataNotes)
						{
							coolNote = i;
							break;
						}

						if (dataNotes.length > 1)
						{
							for (i in 0...dataNotes.length)
							{
								if (i == 0) continue;

								var note = dataNotes[i];

								if (!note.isSustainNote && ((note.strumTime - coolNote.strumTime) < 2) && note.noteData == key)
								{
									note.kill();
									game.notes.remove(note, true);
									note.destroy();
								}
							}
						}
						game.callOnLuas('goodNoteHitP2', [game.notes.members.indexOf(coolNote), coolNote.noteData, coolNote.noteType, coolNote.isSustainNote], true);
					}
					else
					{
						game.callOnLuas('onGhostTapP2', [key], true);
						if (!ClientPrefs.ghostTapping) {
							game.callOnLuas('noteMissPressP2', [key], true);
						}
					}
				}
			}
		]])
	else
		runHaxeCode([[
			var key = ]]..key..[[;
			
			if (game.startedCountdown && !game.paused && key > -1)
			{
				if(game.generatedMusic && !game.endingSong)
				{
					var pressNotes = [];
					var notesStopped = false;

					var sortedNotesList = [];
					game.notes.forEachAlive(function(daNote)
					{
						if (daNote.canBeHit && !daNote.mustPress && !daNote.tooLate && !daNote.hitByOpponent && !daNote.isSustainNote && !daNote.blockHit)
						{
							if(daNote.noteData == key)
							{
								sortedNotesList.push(daNote);
							}
						}
					});
					sortedNotesList.sort(game.sortHitNotes);

					if (sortedNotesList.length > 0) 
					{
						for (epicNote in sortedNotesList)
						{
							for (doubleNote in pressNotes) 
							{
								if (Math.abs(doubleNote.strumTime - epicNote.strumTime) < 1) 
								{
									doubleNote.kill();
									game.notes.remove(doubleNote, true);
									doubleNote.destroy();
								} 
								else 
									notesStopped = true;
							}

							if (!notesStopped) 
							{
								game.callOnLuas('goodNoteHitP2', [game.notes.members.indexOf(epicNote), epicNote.noteData, epicNote.noteType, epicNote.isSustainNote], true);
								pressNotes.push(epicNote);
							}
						}
					}
					else
					{
						game.callOnLuas('onGhostTapP2', [key], true);
						if (!ClientPrefs.ghostTapping) 
							game.callOnLuas('noteMissPressP2', [key], true);
					}
				}
			}
		]])
	end
	
	callOnLuas('onKeyPressP2', {key}, true, false, {scriptName})
	
end


-------------------when note hit-------------------
function goodNoteHitP2(id, noteData, noteType, isSustainNote)

	if not (getPropertyFromGroup('notes', id, 'hitByOpponent')) then
	
		if cpuControlled and (getPropertyFromGroup('notes', id, 'rating') == 'ignore' or getPropertyFromGroup('notes', id, 'hitCausesMiss')) then return end

		--camera zoom thingy
		if not (formatToSongPath(getPropertyFromClass('PlayState', 'SONG.song')) == 'tutorial') and not (mustPressSwap) then
			setProperty('camZooming', true)
		end

		--notes that makes you miss
		if getPropertyFromGroup('notes', id, 'hitCausesMiss') then

			--make a splash even when not sick rating
			if not (getPropertyFromGroup('notes', id, 'noteSplashDisabled')) and not (isSustainNote) and doNoteSplashes then
				spawnNoteSplash(id)
			end

			if not (getPropertyFromGroup('notes', id, 'noMissAnimation')) then

				if noteType == 'Hurt Note' then
				
					playAnim(defaultCharacter, 'hurt', true)
					
					if isCharacter(defaultCharacter) then 
						setProperty(defaultCharacter..'.specialAnim', true)
					end
					
				end
				
			end

			setPropertyFromGroup('notes', id, 'hitByOpponent', true)
			
			noteMissP2(id)
			
			if not (isSustainNote) then
				removeFromGroup('notes', id)
			else
				setPropertyFromGroup('notes', id, 'ignoreNote', false)
			end
				
			return
			
		end
		
		--score
		if not (isSustainNote) then
		
			--hitsounds
			if isLoreEngine then
			
				if not (getPropertyFromClass('ClientPrefs', 'hitSounds') == 'OFF') and not (getPropertyFromGroup('notes', id, 'hitsoundDisabled')) and doHitsounds then
					playSound('hitsounds/'..getPropertyFromClass('ClientPrefs', 'hitSounds'):lower(), 1)
				end

			else

				if getPropertyFromClass('ClientPrefs', 'hitsoundVolume') > 0 and not (getPropertyFromGroup('notes', id, 'hitsoundDisabled')) and doHitsounds then
					playSound('hitsound', getPropertyFromClass('ClientPrefs', 'hitsoundVolume'))
				end

			end
		
			comboP2 = comboP2 + 1
			if comboP2 > 9999 then combo = 9999 end
			
			--I thought the memory issues were from the input but I guess I was wrong
			if not (lessMemoryUsage) then
				popUpScore(id)
			else
				scoreP2 = scoreP2 + 350
				hitsP2 = hitsP2 + 1
			end
			
		end
		
		--health drain
		if doHealthDrainP2 then
		
			if separatedHealthBars then
				healthP2 = healthP2 + getPropertyFromGroup('notes', id, 'hitHealth') * getProperty('healthGain')
			else
			
				if getProperty('health') > getPropertyFromGroup('notes', id, 'hitHealth') * getProperty('healthGain') then
					setProperty('health', getProperty('health') - getPropertyFromGroup('notes', id, 'hitHealth') * getProperty('healthGain'))
				end
				
			end
		
		end

		--animations and stuff
		if not (getPropertyFromGroup('notes', id, 'noAnimation')) then

			local animToPlay = ''

			--for Psych Engine with extra keys
			if not (getPropertyFromClass('MainMenuState', 'extraKeysVersion') == nil or getPropertyFromClass('MainMenuState', 'extraKeysVersion') == 'extraKeysVersion') then
			
				addHaxeLibrary('Note')
				
				animToPlay = runHaxeCode([[
					var animToPlay = 'sing' + Note.keysShit.get(PlayState.mania).get('anims')[]]..noteData..[[];
					return animToPlay;
				]])
				
				if animToPlay == nil then animToPlay = '' end
				
			else
				animToPlay = getProperty('singAnimations')[noteData + 1]
			end
			
			local animSuffix = getPropertyFromGroup('notes', id, 'animSuffix')
			if noteType == 'Alt Animation' or altAnim then animSuffix = '-alt' end
			
			if getPropertyFromGroup('notes', id, 'gfNote') then
			
				if not (getProperty('gf') == nil) then
				
					playAnim('gf', animToPlay..animSuffix, true)
					
					--if no animation with alt anims, play normal animation
					if not (animSuffix == '') and not (getProperty('gf.animation.curAnim.name') == animToPlay..animSuffix) then
						playAnim('gf', animToPlay, true)
					end
				
					setProperty('gf.holdTimer', 0)
					
					gfSinging = true
					
				end
				
			else
			
				playAnim(defaultCharacter, animToPlay..animSuffix, true)
				
				--if no animation with alt anims, play normal animation
				if not (animSuffix == '') and not (getProperty(defaultCharacter..'.animation.curAnim.name') == animToPlay..animSuffix) then
					playAnim(defaultCharacter, animToPlay, true)
				end
				
				if isCharacter(defaultCharacter) then 
					setProperty(defaultCharacter..'.holdTimer', 0)
				end

				gfSinging = false
				
			end
			
			if noteType == 'Hey!' then
			
				playAnim(defaultCharacter, 'hey', true)
				
				if isCharacter(defaultCharacter) then
					setProperty(defaultCharacter..'.specialAnim', true)
					setProperty(defaultCharacter..'.heyTimer', 0.6)
				end
				
				if not (getProperty('gf') == nil) then
					playAnim('gf', 'cheer', true)
					setProperty('gf.specialAnim', true)
					setProperty('gf.heyTimer', 0.6)
				end
				
			end
		
		end
		
		--strum animations
		local time = 0

		if isSustainNote then
		
			if cpuControlled then
				time = time + 0.15
			end
		
			--if not (string.find(getPropertyFromGroup('notes', id, 'animation.curAnim.name'), 'end')) then
				strumPlayAnim(noteData % getProperty('opponentStrums.length'), 'confirm', true, time)
			--end
			
		else
		
			if cpuControlled then
				time = 0.15
			end
			
			strumPlayAnim(noteData % getProperty('opponentStrums.length'), 'confirm', true, time)
			
		end
		

		setPropertyFromGroup('notes', id, 'hitByOpponent', true)
		setProperty('vocals.volume', 1)
		
		--debugPrint('note hit: ', id)
		
		--for other scripts
		if mustPressSwap then
			callOnLuas('goodNoteHit', {id, noteData, noteType, isSustainNote}, true, false, {scriptName})
		else
			callOnLuas('opponentNoteHit', {id, noteData, noteType, isSustainNote}, true, false, {scriptName})
		end
		
		--remove note
		if not (isSustainNote) then
			removeFromGroup('notes', id)
		else
			setPropertyFromGroup('notes', id, 'ignoreNote', false)
		end
		
	end
	
end


-------------------when note missed-------------------
function noteMissP2(id)

	--if (getPropertyFromGroup('notes', id, 'isSustainNote') and string.find(getPropertyFromGroup('notes', id, 'animation.curAnim.name'), 'end')) then return end

	--remove dupe notes
	runHaxeCode([[
		var daNote = game.notes.members[]]..id..[[];
	
		game.notes.forEachAlive(function(note) {
			if (daNote != note && !daNote.mustPress && daNote.noteData == note.noteData && daNote.isSustainNote == note.isSustainNote && Math.abs(daNote.strumTime - note.strumTime) < 1) {
				note.kill();
				game.notes.remove(note, true);
				note.destroy();
			}
		});
	]])

	--set some stuff
	comboP2 = 0

	--health
	if doMissDrainP2 then
	
		if separatedHealthBars then
			healthP2 = healthP2 - (getPropertyFromGroup('notes', id, 'missHealth') * getProperty('healthLoss'))
		else
			setProperty('health', getProperty('health') + (getPropertyFromGroup('notes', id, 'missHealth') * getProperty('healthLoss')))
		end
		
	end
	
	if getProperty('instakillOnMiss') then
	
		if separatedHealthBars then
			healthP2 = 0
		else
			setProperty('health', 2)
		end
		
	end
	
	songMissesP2 = songMissesP2 + 1
	noteMissesP2 = noteMissesP2 + 1
	
	setProperty('vocals.volume', 0)
	
	if not (getProperty('practiceMode')) then scoreP2 = scoreP2 - 10 end
	totalPlayedP2 = totalPlayedP2 + 1
	if not (lessMemoryUsage) then RecalculateRating(true) end
	
	
	--anims
	local char = defaultCharacter
	if getPropertyFromGroup('notes', id, 'gfNote') then
		char = 'gf'
	end
	
	local animSuffix = getPropertyFromGroup('notes', id, 'animSuffix')
	
	if getPropertyFromGroup('notes', id, 'noteType') == 'Alt Animation' or altAnim then 
		animSuffix = '-alt' 
	end

	if not (getPropertyFromGroup('notes', id, 'noMissAnimation')) then
	
		if not (isCharacter(char)) or getProperty(char..'.hasMissAnimations') then
		
			local animToPlay = ''
		
			--for Psych Engine with extra keys
			if not (getPropertyFromClass('MainMenuState', 'extraKeysVersion') == nil or getPropertyFromClass('MainMenuState', 'extraKeysVersion') == 'extraKeysVersion') then
			
				addHaxeLibrary('Note')
				
				animToPlay = runHaxeCode([[
					var animToPlay = 'sing' + Note.keysShit.get(PlayState.mania).get('anims')[]]..getPropertyFromGroup('notes', id, 'noteData')..[[] + 'miss';
					return animToPlay;
				]])
				
				if animToPlay == nil then animToPlay = '' end
				
			else
				animToPlay = getProperty('singAnimations')[getPropertyFromGroup('notes', id, 'noteData') + 1]..'miss'
			end
	
			playAnim(char, animToPlay..animSuffix, true)
			
			--if no animation with alt anims, play normal animation
			if not (animSuffix == '') and not (getProperty(char..'.animation.curAnim.name') == animToPlay..animSuffix) then
				playAnim(char, animToPlay, true)
			end
			
			setProperty(char..'.specialAnim', true)
		
		end
		
	end
	
	if mustPressSwap then
		callOnLuas('noteMiss', {id, getPropertyFromGroup('notes', id, 'noteData'), getPropertyFromGroup('notes', id, 'noteType'), getPropertyFromGroup('notes', id, 'isSustainNote')}, true, false, {scriptName})
	end
	
	callOnLuas('noteMissP2', {id, getPropertyFromGroup('notes', id, 'noteData'), getPropertyFromGroup('notes', id, 'noteType'), getPropertyFromGroup('notes', id, 'isSustainNote')}, true, false, {scriptName})
	
end


-------------------when no ghost tapping-------------------
function noteMissPressP2(direction)

	if getPropertyFromClass('ClientPrefs', 'ghostTapping') then return end

	--health
	if doMissDrainP2 then
	
		if separatedHealthBars then
			healthP2 = healthP2 - (0.05 * getProperty('healthLoss'))
		else
			setProperty('health', getProperty('health') + (0.05 * getProperty('healthLoss')))
		end
	
	end
	
	setProperty('vocals.volume', 0)
	
	if getProperty('instakillOnMiss') then

		if separatedHealthBars then
			healthP2 = 0
		else
			setProperty('health', 2)
		end
		
	end
	
	comboP2 = 0
	
	if not (getProperty('practiceMode')) then scoreP2 = scoreP2 - 10 end
	if not (getProperty('endingSong')) then songMissesP2 = songMissesP2 + 1 end
	totalPlayedP2 = totalPlayedP2 + 1
	if not (lessMemoryUsage) then RecalculateRating(true) end
	
	playSound('missnote'..getRandomInt(1, 3), getRandomFloat(0.1, 0.2))
	
	if not (isCharacter(defaultCharacter)) or getProperty(defaultCharacter..'.hasMissAnimations') then
	
		local animToPlay = ''
		
		--for Psych Engine with extra keys
		if not (getPropertyFromClass('MainMenuState', 'extraKeysVersion') == nil or getPropertyFromClass('MainMenuState', 'extraKeysVersion') == 'extraKeysVersion') then
		
			addHaxeLibrary('Note')
			
			animToPlay = runHaxeCode([[
				var animToPlay = 'sing' + Note.keysShit.get(PlayState.mania).get('anims')[]]..direction..[[] + 'miss';
				return animToPlay;
			]])
			
			if animToPlay == nil then animToPlay = '' end
			
		else
			animToPlay = getProperty('singAnimations')[direction + 1]..'miss'
		end
		
		playAnim(defaultCharacter, animToPlay, true)
		setProperty(defaultCharacter..'.specialAnim', true)
	end

	if mustPressSwap then
		callOnLuas('noteMissPress', {direction}, true, false)
	end

end


--note splashes
function spawnNoteSplash(id)

	local noteData = getPropertyFromGroup('notes', id, 'noteData')
	local x = getPropertyFromGroup('opponentStrums', noteData, 'x')
	local y = getPropertyFromGroup('opponentStrums', noteData, 'y')

	runHaxeCode([[
		game.spawnNoteSplash(]]..x..[[, ]]..y..[[, game.notes.members[]]..id..[[].noteData, game.notes.members[]]..id..[[])
	]])
	
end


-------------------ratings and combo-------------------
function popUpScore(id)
	
	local noteDiff = math.abs(getPropertyFromGroup('notes', id, 'strumTime') - getPropertyFromClass('Conductor', 'songPosition') + getPropertyFromClass('ClientPrefs', 'ratingOffset'))
	
	ratingsData = {}
	
	--add the original rating data stuff to the variable in this file (it doesn't let me do ratingsData = getProperty('ratingsData') so I need to use this instead)
	for i = 1, getProperty('ratingsData.length') do
	
		ratingsData[i] = {}
		
		ratingsData[i].name = getProperty('ratingsData['..(i - 1)..'].name')
		
		if not (getProperty('ratingsData['..(i - 1)..'].image') == nil) then
			ratingsData[i].image = getProperty('ratingsData['..(i - 1)..'].image')
		else
			ratingsData[i].image = getProperty('ratingsData['..(i - 1)..'].name')
		end
		
		if not (getProperty('ratingsData['..(i - 1)..'].counter') == nil) then
			ratingsData[i].counter = getProperty('ratingsData['..(i - 1)..'].counter')
		else
			ratingsData[i].counter = getProperty('ratingsData['..(i - 1)..'].name')..'s'
		end

		ratingsData[i].ratingMod = getProperty('ratingsData['..(i - 1)..'].ratingMod')
		ratingsData[i].score = getProperty('ratingsData['..(i - 1)..'].score')
		ratingsData[i].noteSplash = getProperty('ratingsData['..(i - 1)..'].noteSplash')
		ratingsData[i].hitWindow = getProperty('ratingsData['..(i - 1)..'].hitWindow')
		
	end

	if tonumber(playbackRate) == nil or not (type(playbackRate) == 'number') then playbackRate = 1 end
	local daRating = judgeNote(noteDiff / playbackRate)

	--add rating and stuff
	for i = 1, #ratingsData do
	
		if daRating == ratingsData[i].name then
		
			if not (getPropertyFromGroup('notes', id, 'ratingDisabled')) then
			
				if ratingsP2[ratingsData[i].counter] == nil then
					ratingsP2[ratingsData[i].counter] = 0
				end
				
				ratingsP2[ratingsData[i].counter] = ratingsP2[ratingsData[i].counter] + 1 --add 1 to rating variable (for example sicks = sicks + 1)
				
			end
			
			totalNotesHitP2 = totalNotesHitP2 + ratingsData[i].ratingMod
			
			--note rating
			setPropertyFromGroup('notes', id, 'rating', ratingsData[i].name)
			setPropertyFromGroup('notes', id, 'ratingMod', ratingsData[i].ratingMod)

			if not (getProperty('practiceMode')) then
				scoreP2 = scoreP2 + ratingsData[i].score
			end

			--splash
			if ratingsData[i].noteSplash and doNoteSplashes and not (getPropertyFromGroup('notes', id, 'noteSplashDisabled')) then
				spawnNoteSplash(id)
			end
				
			ratingComboStuff(ratingsData[i].name, noteDiff, ratingsData[i].image)
			
		end
	
	end
	
	if not (getProperty('practiceMode')) and not (getPropertyFromGroup('notes', id, 'ratingDisabled')) then
		hitsP2 = hitsP2 + 1
		totalPlayedP2 = totalPlayedP2 + 1
		RecalculateRating(false)
	end

end


--combo and rating sprites
function ratingComboStuff(rating, diff, ratingImg)

	if not (showCombo) and not (showComboNum) and not (showRating) then return end
	if ratingImg == nil then ratingImg = rating end

	makeLuaText('coolText', comboP2, 0, 0, 0)
	setTextSize('coolText', 32)
	screenCenter('coolText')
	setProperty('coolText.x', screenWidth * 0.35)

	local pixelShitPart1 = ""
	local pixelShitPart2 = ''

	if getPropertyFromClass('PlayState', 'isPixelStage') then
		pixelShitPart1 = 'pixelUI/'
		pixelShitPart2 = '-pixel'
	end

	local sprName = 'rating'..ratingCount
	local comboName = 'combo'..ratingCount
	

	--rating
	makeLuaSprite(sprName, pixelShitPart1..ratingImg..pixelShitPart2)
	setObjectCamera(sprName, 'camHUD')
	screenCenter(sprName)
	setProperty(sprName..'.x', getProperty('coolText.x') - 40)
	setProperty(sprName..'.y', getProperty(sprName..'.y') - 60)
	setProperty(sprName..'.acceleration.y', 550 * playbackRate * playbackRate)
	setProperty(sprName..'.velocity.y', getProperty(sprName..'.velocity.y') - getRandomInt(140, 175) * playbackRate)
	setProperty(sprName..'.velocity.x', getProperty(sprName..'.velocity.x') - getRandomInt(0, 10) * playbackRate)
	setProperty(sprName..'.visible', not getPropertyFromClass('ClientPrefs', 'hideHud') and showRating)
	setProperty(sprName..'.x', getProperty(sprName..'.x') + comboOffset[1])
	setProperty(sprName..'.y', getProperty(sprName..'.y') - comboOffset[2])
	
	setObjectOrder(sprName, getObjectOrder('strumLineNotes'))
		
	if showRating then
		addLuaSprite(sprName, false)
	else
		setProperty(sprName..'.alpha', 0)
	end
	
	
	--combo
	makeLuaSprite(comboName, pixelShitPart1..'combo'..pixelShitPart2)
	setObjectCamera(comboName, 'camHUD')
	screenCenter(comboName)
	setProperty(comboName..'.x', getProperty('coolText.x'))
	setProperty(comboName..'.acceleration.y', getRandomInt(200, 300) * playbackRate * playbackRate)
	setProperty(comboName..'.velocity.y', getProperty(comboName..'.velocity.y') - getRandomInt(140, 160) * playbackRate)
	setProperty(comboName..'.visible', not getPropertyFromClass('ClientPrefs', 'hideHud') and showCombo)
	setProperty(comboName..'.x', getProperty(comboName..'.x') + comboOffset[1])
	setProperty(comboName..'.y', getProperty(comboName..'.y') - comboOffset[2])
	setProperty(comboName..'.y', getProperty(comboName..'.y') + 60)
	setProperty(comboName..'.velocity.x', getProperty(comboName..'.velocity.x') + getRandomInt(1, 10) * playbackRate)
	
	setObjectOrder(comboName, getObjectOrder('strumLineNotes'))
	
	if showCombo then
		
		if comboP2 >= 10 then
			addLuaSprite(comboName, false)
		else
			setProperty(comboName..'.alpha', 0)
		end
		
	end


	if not getPropertyFromClass('PlayState', 'isPixelStage') then
		scaleObject(sprName, 0.7, 0.7)
		setProperty(sprName..'.antialiasing', getPropertyFromClass('ClientPrefs', 'globalAntialiasing'))
		scaleObject(comboName, 0.7, 0.7)
		setProperty(comboName..'.antialiasing', getPropertyFromClass('ClientPrefs', 'globalAntialiasing'))
	else
		scaleObject(sprName, 6 * 0.85, 6 * 0.85)
		setProperty(sprName..'.antialiasing', false)
		scaleObject(comboName, 6 * 0.85, 6 * 0.85)
		setProperty(comboName..'.antialiasing', false)
	end

	updateHitbox(comboName)
	updateHitbox(sprName)
	
	
	--ms timing from kade engine
	if showMS then
	
		local msTiming = math.floor(diff)
	
		makeLuaText('currentTimingShown', '0ms', 0, 0, 0)
		setObjectCamera('currentTimingShown', 'camHUD')
		setProperty('currentTimingShown.borderSize', 1)
		setTextSize('currentTimingShown', 20)
		setTextString('currentTimingShown', msTiming..'ms')
		setProperty('currentTimingShown.visible', not getPropertyFromClass('ClientPrefs', 'hideHud') and showMS)
		addLuaText('currentTimingShown', true)

		
		local color = 'FFFFFF'

		--ms text colors (if you have a different rating add a color here)
		if rating == 'marv' then
			color = 'FFFF00'
		end
		
		if rating == 'sick' then
			color = '00FFFF'
		end
		
		if rating == 'good' then
			color = '00FF00'
		end
		
		if rating == 'bad' or rating == 'shit' then
			color = 'FF0000'
		end
		
		setProperty('currentTimingShown.color', getColorFromHex(color))
		

		screenCenter('currentTimingShown')
		setProperty('currentTimingShown.x', getProperty(comboName..'.x') + 100)
		setProperty('currentTimingShown.y', getProperty(sprName..'.y') + 100)
		
		--these don't even work with texts but anyway
		setProperty('currentTimingShown.acceleration.y', 600 * playbackRate * playbackRate)
		setProperty('currentTimingShown.velocity.y', getProperty('currentTimingShown.velocity.y') - 150 * playbackRate)
		setProperty('currentTimingShown.velocity.x', getProperty('currentTimingShown.velocity.x') + getProperty(comboName..'.velocity.x'))
		
		updateHitbox('currentTimingShown')
	
	end
	
	
	--combo numbers
	local separatedScore = {}
	
	if comboP2 >= 1000 then
		separatedScore[#separatedScore + 1] = math.floor(comboP2 / 1000) % 10
	end
	separatedScore[#separatedScore + 1] = math.floor(comboP2 / 100) % 10
	separatedScore[#separatedScore + 1] = math.floor(comboP2 / 10) % 10
	separatedScore[#separatedScore + 1] = comboP2 % 10


	local daLoop = 0
	local xThing = 0
	for i = 1, #separatedScore do
	
		local comboNumName = i..'num'..ratingCount
		
		makeLuaSprite(comboNumName, pixelShitPart1..'num'..separatedScore[i]..pixelShitPart2)
		setObjectCamera(comboNumName, 'camHUD')
		screenCenter(comboNumName)
		setProperty(comboNumName..'.x', getProperty('coolText.x') + (43 * daLoop) - 90)
		setProperty(comboNumName..'.y', getProperty(comboNumName..'.y') + 80)
		
		setProperty(comboNumName..'.x', getProperty(comboNumName..'.x') + comboOffset[3])
		setProperty(comboNumName..'.y', getProperty(comboNumName..'.y') - comboOffset[4])

		if not getPropertyFromClass('PlayState', 'isPixelStage') then
			setProperty(comboNumName..'.antialiasing', getPropertyFromClass('ClientPrefs', 'globalAntialiasing'))
			scaleObject(comboNumName, 0.5, 0.5)
		else
			setProperty(comboNumName..'.antialiasing', false)
			scaleObject(comboNumName, 6, 6)
		end
		updateHitbox(comboNumName)

		setProperty(comboNumName..'.acceleration.y', getRandomInt(200, 300) * playbackRate * playbackRate)
		setProperty(comboNumName..'.velocity.y', getProperty(comboNumName..'.velocity.y') - getRandomInt(140, 160) * playbackRate)
		setProperty(comboNumName..'.velocity.x', getRandomInt(-5, 5) * playbackRate)
		setProperty(comboNumName..'.visible', not getPropertyFromClass('ClientPrefs', 'hideHud'))
		
		setObjectOrder(comboNumName, getObjectOrder('strumLineNotes'))

		--if comboP2 >= 10 or comboP2 == 0 then
		if showComboNum then
			addLuaSprite(comboNumName, false)
		else
			setProperty(comboNumName..'.alpha', 0)
		end
		
		daLoop = daLoop + 1
		if getProperty(comboNumName..'.x') > xThing then xThing = getProperty(comboNumName..'.x') end
		
	end
	setProperty(comboName..'.x', xThing + 50)

	runTimer(sprName, crochet * 0.001 / playbackRate, 1)
	runTimer(comboName, crochet * 0.001 / playbackRate, 1)
	runTimer('num'..ratingCount, crochet * 0.002 / playbackRate, 1)
	if showMS then runTimer('currentTimingShown', crochet * 0.001 / playbackRate, 1) end
	
	ratingCount = ratingCount + 1
	
	if ratingCount > 100 then
		ratingCount = 0
	end

end


-------------------timers and tweens-------------------
function onTimerCompleted(tag)

	if string.find(tag, 'rating') or string.find(tag, 'combo') or tag == 'currentTimingShown' then
		doTweenAlpha(tag, tag, 0, 0.2 / playbackRate)
	end
	
	if string.find(tag, 'num') then
		doTweenAlpha('1'..tag, '1'..tag, 0, 0.2 / playbackRate)
		doTweenAlpha('2'..tag, '2'..tag, 0, 0.2 / playbackRate)
		doTweenAlpha('3'..tag, '3'..tag, 0, 0.2 / playbackRate)
		doTweenAlpha('4'..tag, '4'..tag, 0, 0.2 / playbackRate)
	end
	
end


function onTweenCompleted(tag)

	if string.find(tag, 'rating') or string.find(tag, 'combo') or tag == 'currentTimingShown' then
		removeLuaSprite(tag, true)
	end
	
	if string.find(tag, 'num') then
		removeLuaSprite('1'..tag, true)
		removeLuaSprite('2'..tag, true)
		removeLuaSprite('3'..tag, true)
		removeLuaSprite('4'..tag, true)
	end
	
end


--note judgement
function judgeNote(diff)

	for i = 1, #ratingsData-1 do

		if diff <= ratingsData[i].hitWindow then
			return ratingsData[i].name
		end
	
	end
	
	return ratingsData[#ratingsData].name
	
end


--change scoreTxt stuff
function RecalculateRating(badHit)

	local ratingStuff = getPropertyFromClass('PlayState', 'ratingStuff') --for same ratings as player 1

	if totalPlayedP2 < 1 then
		ratingNameP2 = '?'
	else

		--Rating Percent
		ratingPercentP2 = math.min(1, math.max(0, totalNotesHitP2 / totalPlayedP2))
		
		--Rating Name
		if ratingPercentP2 >= 1 then
			ratingNameP2 = ratingStuff[#ratingStuff][1] --last string
		else
		
			for i = 1, #ratingStuff do
			
				if ratingPercentP2 < ratingStuff[i][2] then
					ratingNameP2 = ratingStuff[i][1]
					break
				end
				
			end
			
		end
		
		ratingFCP2 = ''
		if ratingsP2.sicks > 0 then ratingFCP2 = 'SFC' end
		if ratingsP2.goods > 0 then ratingFCP2 = 'GFC' end
		if ratingsP2.bads > 0 or ratingsP2.shits > 0 then ratingFCP2 = 'FC' end
		if songMissesP2 > 0 and songMissesP2 < 10 then ratingFCP2 = 'SDCB'
		elseif songMissesP2 >= 10 then ratingFCP2 = 'Clear' end
		
	end

	updateScore(badHit)
	
end


--update scoreTxt text (you can change the score and such here)
function updateScore(miss)

	if ratingNameP2 == '?' then
		setProperty('scoreTxtP2.text', 'Score: '..scoreP2..' | Misses: '..songMissesP2..' | Rating: '..ratingNameP2)
	else
		setProperty('scoreTxtP2.text', 'Score: '..scoreP2..' | Misses: '..songMissesP2..' | Rating: '..ratingNameP2..' ('..floorDecimal(ratingPercentP2 * 100, 2)..'%) - '..ratingFCP2)
	end

	if getPropertyFromClass('ClientPrefs', 'scoreZoom') and not (miss) and not (cpuControlled) then

		setProperty('scoreTxtP2.scale.x', 1.075)
		setProperty('scoreTxtP2.scale.y', 1.075)
		
		doTweenX('scoreTxtP2scaleX', 'scoreTxtP2.scale', 1, 0.2)
		doTweenY('scoreTxtP2scaleY', 'scoreTxtP2.scale', 1, 0.2)
		
	end

end


-------------------end screen-------------------
if playable then

	function onEndSong()
	
		if doEndScreen and not (endContinue) and not (getPropertyFromClass('PlayState', 'isStoryMode')) then
			startEndScreen()
			return Function_Stop
		end
	
		return Function_Continue
		
	end

	function startEndScreen()

		inEndScreen = true
		setProperty('inCutscene', true)
		setProperty('canPause', false)
		setProperty('canReset', false)
		
		setProperty('camHUD.visible', false)
		
		setProperty('vocals.volume', 0)
		playMusic(formatToSongPath(getPropertyFromClass('ClientPrefs', 'pauseMusic')), 1, true)
		
		
		--make sprites
		makeLuaSprite('endBG', '', 0, 0)
		makeGraphic('endBG', screenWidth, screenHeight, '000000')
		setProperty('endBG.alpha', 0.6)
		setObjectCamera('endBG', 'camOther')
		addLuaSprite('endBG', true)

		makeLuaText('endTxt', '', 0, 0, 150)
		setObjectCamera('endTxt', 'camOther')
		setTextSize('endTxt', 25)
		addLuaText('endTxt', true)
		
		if endScreenType == 0 then
			makeLuaText('continueTxt', 'PRESS ENTER TO CONTINUE', 0, 0, screenHeight - 100)
			
		else
			local txt = [[
			PRESS ENTER TO RESTART
			
			PRESS ESCAPE TO EXIT
			]]
			makeLuaText('continueTxt', txt, 0, 0, screenHeight - 150)
		end
		
		setObjectCamera('continueTxt', 'camOther')
		setTextSize('continueTxt', 40)
		addLuaText('continueTxt', true)
		
		if endScreenType == 1 then
			makeLuaText('songNameTxt', 'PLAYER 2 GAMEOVER!', 0, 0, 60)
		elseif endScreenType == 2 then
			makeLuaText('songNameTxt', 'PLAYER 1 GAMEOVER!', 0, 0, 60)
		else
			makeLuaText('songNameTxt', (songName..' - '..difficultyName):upper(), 0, 0, 60)
		end
		
		setObjectCamera('songNameTxt', 'camOther')
		setTextSize('songNameTxt', 35)
		addLuaText('songNameTxt', true)
		

		--texts
		local scoreTxtP2 = 'Score: '..scoreP2..' | Misses: '..songMissesP2..' | Rating: '..ratingNameP2
		
		if not (ratingNameP2 == '?') then
			scoreTxtP2 = 'Score: '..scoreP2..' | Misses: '..songMissesP2..' | Rating: '..ratingNameP2..' ('..floorDecimal(ratingPercentP2 * 100, 2)..'%) - '..ratingFCP2
		end
		
		setTextString('endTxt', [[
		
		PLAYER 1:
		
		]]..getProperty('scoreTxt.text')..' | Notes hit: '..hitsP1..[[
		
		
		
		
		PLAYER 2:
		
		]]..scoreTxtP2..' | Notes hit: '..hitsP2..[[
		
		
		
		
		
		]])
		
		if endScreenType == 0 then
		setTextString('endTxt', getTextString('endTxt')..[[
		TOTAL NOTES P1: ]]..(hitsP1 + getProperty('songMisses'))..[[
		
		
		
		TOTAL NOTES P2: ]]..(hitsP2 + noteMissesP2)..[[
		
		]])
		end

		screenCenter('endTxt', 'x')
		screenCenter('continueTxt', 'x')
		screenCenter('songNameTxt', 'x')

	end

end


-------------------player 1 swapped functions-------------------
if playable then

	if differentCharactersMode or mustPressSwap then

		function goodNoteHit(id, noteData, noteType, isSustainNote)
		
			--camera zoom thingy
			if mustPressSwap and not (formatToSongPath(getPropertyFromClass('PlayState', 'SONG.song')) == 'tutorial') then
				setProperty('camZooming', true)
			end

			local char = 'dad'
				
			if differentCharactersMode then
				char = swapCharacterP1
			end

			if not (getPropertyFromGroup('notes', id, 'inEditor')) then
			
				local animToPlay = ''
		
				--for Psych Engine with extra keys
				if not (getPropertyFromClass('MainMenuState', 'extraKeysVersion') == nil or getPropertyFromClass('MainMenuState', 'extraKeysVersion') == 'extraKeysVersion') then
				
					addHaxeLibrary('Note')
					
					animToPlay = runHaxeCode([[
						var animToPlay = 'sing' + Note.keysShit.get(PlayState.mania).get('anims')[]]..noteData..[[];	
						return animToPlay;
					]])
					
					if animToPlay == nil then animToPlay = '' end

				else
					animToPlay = getProperty('singAnimations')[noteData + 1]
				end

				local animSuffix = getPropertyFromGroup('notes', id, 'animSuffix')
				if noteType == 'Alt Animation' or altAnim then animSuffix = '-alt' end
					
				if getPropertyFromGroup('notes', id, 'gfNote') then
					
					if not (getProperty('gf') == nil) then
						
						playAnim('gf', animToPlay..animSuffix, true)
							
						--if no animation with alt anims, play normal animation
						if not (animSuffix == '') and not (getProperty('gf.animation.curAnim.name') == animToPlay..animSuffix) then
							playAnim('gf', animToPlay, true)
						end
						
						setProperty('gf.holdTimer', 0)
						
						gfSingingP1 = true
							
					end
						
				else
					
					playAnim(char, animToPlay..animSuffix, true)
					
					--if no animation with alt anims, play normal animation
					if not (animSuffix == '') and not (getProperty(char..'.animation.curAnim.name') == animToPlay..animSuffix) then
						playAnim(char, animToPlay, true)
					end
					
					if isCharacter(char) then 
						setProperty(char..'.holdTimer', 0)
					end
					
					gfSingingP1 = false
					
				end
				
				if getPropertyFromGroup('notes', id, 'noteType') == 'Hey!' then
				
					playAnim(char, 'hey', true)
					
					if isCharacter(char) then
						setProperty(char..'.specialAnim', true)
						setProperty(char..'.heyTimer', 0.6)
					end
					
					if not (getProperty('gf') == nil) then
						playAnim('gf', 'cheer', true)
						setProperty('gf.specialAnim', true)
						setProperty('gf.heyTimer', 0.6)
					end
					
				end
			
			end
			
			if not (isSustainNote) then
				hitsP1 = hitsP1 + 1
			end
			
			if not (separatedHealthBars) and getProperty('health') >= 2 then
				setProperty('health', 2)
			end
			
			if mustPressSwap then
				callOnLuas('opponentNoteHit', {id, noteData, noteType, isSustainNote}, true, false, {scriptName})
			end

		end
		
		
		function noteMiss(id, noteData, noteType, isSustainNote)
		
			local char = 'dad'
				
			if differentCharactersMode then
				char = swapCharacterP1
			end
				
			if getPropertyFromGroup('notes', id, 'gfNote') then
				char = 'gf'
			end
			
			local animSuffix = getPropertyFromGroup('notes', id, 'animSuffix')
			
			if noteType == 'Alt Animation' or altAnim then animSuffix = '-alt' end

			if not (isCharacter(char)) or getProperty(char..'.hasMissAnimations') then
			
				playAnim(char, getProperty('singAnimations')[noteData + 1]..'miss'..animSuffix, true)
				
				--if no animation with alt anims, play normal animation
				if not (animSuffix == '') and not (getProperty(char..'.animation.curAnim.name') == getProperty('singAnimations')[noteData + 1]..'miss'..animSuffix) then
					playAnim(char, getProperty('singAnimations')[noteData + 1]..'miss', true)
				end
				
				setProperty(char..'.specialAnim', true)
				
			end
			
			if getProperty('instakillOnMiss') then
				setProperty('health', 0)
			end

		end
		
	else

		function goodNoteHit(id, noteData, noteType, isSustainNote)
		
			if not (isSustainNote) then
				hitsP1 = hitsP1 + 1
			end
			
			if not (separatedHealthBars) and getProperty('health') >= 2 then
				setProperty('health', 2)
			end
			
		end
		
		--make P1 notes 'kill' the P1 if you have instakillOnMiss and cannotDieP1
		function noteMiss()
			
			if getProperty('instakillOnMiss') then
				setProperty('health', 0)
			end
			
		end

	end

end


--gameover for P1
function onGameOver()

	if playable then
	
		if cannotDieP1 then
		
			if getProperty('health') < 0 then
				setProperty('health', 0)
			end
			
			return Function_Stop
			
		else
		
			if showResultsOnGameOver then
			
				if not (inEndScreen) then
					endScreenType = 2
					startEndScreen()
				end
				
				return Function_Stop
				
			end
		
		end

	end
	
end


function animThingP2(elapsed)
	
	--debugPrint(getProperty(defaultCharacter..'.holdTimer'))
	
	--keys
	local controlHoldArray = {}
	
	for i = 1, #keys do
		controlHoldArray[i] = getPropertyFromClass('flixel.FlxG', 'keys.pressed.'..keys[i])
	end


	--ignore all of this if gf is singing or botplay is on
	if cpuControlled or gfSinging then
	
		for i = 1, #controlHoldArray do
			controlHoldArray[i] = false
		end
		
	end
	
	
	--animation stuff
	local thing = getPropertyFromClass('Conductor', 'stepCrochet') * 0.0011 * getProperty(defaultCharacter..'.singDuration')
	
	if table.contains(controlHoldArray, true) then
	
		if getProperty(defaultCharacter..'.holdTimer') > thing - 0.03 then
			setProperty(defaultCharacter..'.holdTimer', thing - 0.03)
		end
		
	end
	
end


function animThingP1(elapsed)

	local controlHoldArray = {
		keyPressed('left'),
		keyPressed('down'),
		keyPressed('up'),
		keyPressed('right')
	}
	
	if getProperty('cpuControlled') or gfSingingP1 then
	
		for i = 1, #controlHoldArray do
			controlHoldArray[i] = false
		end
		
	end

	local thing = getPropertyFromClass('Conductor', 'stepCrochet') * 0.0011 * getProperty(swapCharacterP1..'.singDuration')
	
	if table.contains(controlHoldArray, true) then
	
		if getProperty(swapCharacterP1..'.holdTimer') > thing - 0.03 then
			setProperty(swapCharacterP1..'.holdTimer', thing - 0.03)
		end
		
	end
	
end


function scoreTxtStuff()

	if not (getTextFont('scoreTxt') == 'VCR OSD Mono' or getTextFont('scoreTxt') == 'Pixel Arial 11 Bold')
	and not (getTextFont('scoreTxtP2') == getTextFont('scoreTxt')) then
		setProperty('scoreTxtP2.font', getTextFont('scoreTxt'))
	else
	
		if getTextFont('scoreTxt') == 'VCR OSD Mono' and not (getTextFont('scoreTxtP2') == 'VCR OSD Mono') then
			setTextFont('scoreTxtP2', 'vcr.ttf')
		end
		
		if getTextFont('scoreTxt') == 'Pixel Arial 11 Bold' and not (getTextFont('scoreTxtP2') == 'Pixel Arial 11 Bold') then
			setTextFont('scoreTxtP2', 'pixel.otf')
		end
	
	end
	
	if not (getTextSize('scoreTxtP2') == getTextSize('scoreTxt')) then
		setTextSize('scoreTxtP2', getTextSize('scoreTxt'))
	end
	
	setProperty('scoreTxtP2.visible', getProperty('scoreTxt.visible'))
	setProperty('scoreTxtP2.alpha', getProperty('scoreTxt.alpha'))
	setProperty('scoreTxtP2.color', getProperty('scoreTxt.color'))
	screenCenter('scoreTxtP2', 'x')
	
end


function botplayTextStuff(elapsed)

	if not (cpuControlled) then
		setProperty('botplayTxtP2.visible', false)
	else
		setProperty('botplayTxtP2.visible', true)
	end
	

	if not (getProperty('botplayTxt.visible')) then
		setProperty('botplaySine', getProperty('botplaySine') + (180 * elapsed))
		setProperty('botplayTxt.alpha', 1 - math.sin((math.pi * getProperty('botplaySine')) / 180))
	end

	setProperty('botplayTxtP2.alpha', getProperty('botplayTxt.alpha'))

	screenCenter('botplayTxt', 'x')
	screenCenter('botplayTxtP2', 'x')

	if separatedHealthBars then

		if mustPressSwap then
		
			runHaxeCode([[
				game.botplayTxt.x -= healthBarP2BG.width;
				game.botplayTxt.y = healthBarP2.y - 55;
				
				game.getLuaObject('botplayTxtP2').x += healthBarP1BG.width;
				game.getLuaObject('botplayTxtP2').y = healthBarP1.y - 55;
			]])
			
		else
		
			runHaxeCode([[
				game.botplayTxt.x += healthBarP1BG.width;
				game.botplayTxt.y = healthBarP1.y - 55;
				
				game.getLuaObject('botplayTxtP2').x -= healthBarP2BG.width;
				game.getLuaObject('botplayTxtP2').y = healthBarP2.y - 55;
			]])
		
		end
		
	else

		if mustPressSwap then
			setProperty('botplayTxt.x', getProperty('botplayTxt.x') - getProperty('healthBarBG.width') / 3)
			setProperty('botplayTxtP2.x', getProperty('botplayTxtP2.x') + getProperty('healthBarBG.width') / 3)
		else
			setProperty('botplayTxt.x', getProperty('botplayTxt.x') + getProperty('healthBarBG.width') / 3)
			setProperty('botplayTxtP2.x', getProperty('botplayTxtP2.x') - getProperty('healthBarBG.width') / 3)
		end

		setProperty('botplayTxt.y', getProperty('healthBarBG.y') - 55)
		setProperty('botplayTxtP2.y', getProperty('healthBarBG.y') - 55)
	
	end
	
	
	if botplayPlayerIndicator then
	
		local text = ''
			
		if string.find(getTextString('botplayTxt'), 'P1 ') then
			text = string.gsub(getTextString('botplayTxt'), 'P1 ', '')
		else
			text = getTextString('botplayTxt')
		end
			
		setTextString('botplayTxt', 'P1 '..text)

		
		if not (getTextString('botplayTxtP2') == getTextString('botplayTxt')) then
			setTextString('botplayTxtP2', 'P2 '..text)
		end
		
	else
	
		if not (getTextString('botplayTxtP2') == getTextString('botplayTxt')) then
			setTextString('botplayTxtP2', getTextString('botplayTxt'))
		end
		
	end
	
	
	if not (getTextFont('botplayTxt') == 'VCR OSD Mono' or getTextFont('botplayTxt') == 'Pixel Arial 11 Bold')
	and not (getTextFont('botplayTxtP2') == getTextFont('botplayTxt')) then
		setProperty('botplayTxtP2.font', getTextFont('botplayTxt'))
	else
	
		if getTextFont('botplayTxt') == 'VCR OSD Mono' and not (getTextFont('botplayTxtP2') == 'VCR OSD Mono') then
			setTextFont('botplayTxtP2', 'vcr.ttf')
		end
		
		if getTextFont('botplayTxt') == 'Pixel Arial 11 Bold' and not (getTextFont('botplayTxtP2') == 'Pixel Arial 11 Bold') then
			setTextFont('botplayTxtP2', 'pixel.otf')
		end
	
	end
	
	
	setProperty('botplayTxtP2.scale.x', getProperty('botplayTxt.scale.x'))
	setProperty('botplayTxtP2.scale.y', getProperty('botplayTxt.scale.y'))
	setProperty('botplayTxtP2.color', getProperty('botplayTxt.color'))
	setProperty('botplayTxtP2.borderSize', getProperty('botplayTxt.borderSize'))
	--setTextSize('botplayTxtP2', getTextSize('botplayTxt'))
	
end


-------------------other useful functions-------------------

--strum
function strumPlayAnim(id, anim, forced, resetTime)

	if resetTime == nil then resetTime = 0 end
	if forced == nil then forced = false end
	
	--resets the animation
	if forced then
		setPropertyFromGroup('strumLineNotes', id, 'animation.name', nil)
	end
	
	setPropertyFromGroup('strumLineNotes', id, 'animation.name', anim) --play animation
	setPropertyFromGroup('strumLineNotes', id, 'resetAnim', resetTime)
	
	--center offsets and origins
	setPropertyFromGroup('strumLineNotes', id, 'origin.x', getPropertyFromGroup('strumLineNotes', id, 'frameWidth') / 2)
	setPropertyFromGroup('strumLineNotes', id, 'origin.y', getPropertyFromGroup('strumLineNotes', id, 'frameHeight') / 2)
	setPropertyFromGroup('strumLineNotes', id, 'offset.x', (getPropertyFromGroup('strumLineNotes', id, 'frameWidth') - getPropertyFromGroup('strumLineNotes', id, 'width')) / 2)
	setPropertyFromGroup('strumLineNotes', id, 'offset.y', (getPropertyFromGroup('strumLineNotes', id, 'frameHeight') - getPropertyFromGroup('strumLineNotes', id, 'height')) / 2)

end


function isCharacter(char)

	if char == 'boyfriend' or char == 'dad' or char == 'gf' then
		return true
	end
	
	return false

end


--unused
function dance(char)

	if not (getProperty(char..'.specialAnim')) then

		--make character dance
		if isCharacter(char) and getProperty(char..'.danceIdle') then
		
			setProperty(char..'.danced', not getProperty(char..'.danced'))
			
			if getProperty(char..'.danced') then
				playAnim(char, 'danceRight'..getProperty(char..'.idleSuffix'), true)
			else
				playAnim(char, 'danceLeft'..getProperty(char..'.idleSuffix'), true)
			end
			
		else
			playAnim(char, 'idle'..getProperty(char..'.idleSuffix'), true)
		end
		
		--debugPrint('dance '..char)
	
	end

end


--taken from source code (Highscore.floorDecimal)
function floorDecimal(value, decimals)

	if decimals < 1 then
		return math.floor(value)
	end

	local tempMult = 1
	for i = 0, decimals-1 do
		tempMult = tempMult * 10
	end
	local newValue = math.floor(value * tempMult)
	return newValue / tempMult
	
end


--really useful
function table.contains(table, val)

	for i = 1, #table do

		if table[i] == val then
			return true
		end

	end
	return false

end


--for the tutorial camera zoom in
function formatToSongPath(path)

	local invalidChars = {'~', '&', '\\', ';', ':', '<', '>', '#'}
	local hideChars = {'.', ',', "'", '"', '%', '?', '!'}

	for i = 1, #invalidChars do
	
		if not (string.find(path, invalidChars[i], 1, true) == nil) then
			path = string.gsub(path, invalidChars[i], '-')
		end
	
	end

	for i = 1, #hideChars do
	
		if not (string.find(path, hideChars[i], 1, true) == nil) then
			path = string.gsub(path, hideChars[i], '')
		end
	
	end

	if string.find(path, ' ') then
		path = string.gsub(path, ' ', '-')
	end

	return path:lower()
	
end


--taken from https://www.codegrepper.com/code-examples/lua/rgb+to+hex+lua
function rgbToHex(r, g, b)
	return string.format("%02x%02x%02x", math.floor(r), math.floor(g), math.floor(b))
end


--gets the character health color
function healthBarColor(char)
    return rgbToHex(getProperty(char..'.healthColorArray[0]'), getProperty(char..'.healthColorArray[1]'), getProperty(char..'.healthColorArray[2]'))
end


--unused but could be useful
function getKeyFromID(key)

	if key > -1 and not (key == nil) then
		return keys[key + 1]
	end
	
	return -1

end


--substate stuff
local inSubstate = false

function openSubstate(state)

	inSubstate = true

	runHaxeCode([[
		game.persistentUpdate = false;
		game.persistentDraw = true;
		game.paused = true;
		
		var music = Paths.formatToSongPath(ClientPrefs.pauseMusic);

		substateMusic = FlxG.sound.play(Paths.music(music), 0.7);
		substateMusic.onComplete = function() {
			substateMusic = FlxG.sound.play(Paths.music(music), 0.7);
		}

		FlxCamera.defaultCameras = [game.camOther];

		game.openSubState(new ]]..state..[[(0, 0));
	]])

end


function onResume()

	if inSubstate then
	
		debugPrint('Restart the song to save changes.')
		
		inSubstate = false

		runHaxeCode([[
			substateMusic.stop();
			FlxCamera.defaultCameras = [game.camGame];
		]])
		
		--restartSong(false)
		
	end

end