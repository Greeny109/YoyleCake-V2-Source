
function onCreate()

	makeLuaSprite('bg','tpot_bg',-550, -150)
addLuaSprite('bg', false)

--[[makeLuaSprite('stage','bottle',-750,-500)
addLuaSprite('stage', true)]]
makeLuaSprite('coolBG', 'two1', -100, 235)
--addLuaSprite('coolBG', false)
setScrollFactor('coolBG', 1, 1)

--addLuaSprite("GF", true)
--setGraphicSize("boyfriend", 400, 400)
--setGraphicSize("dad", 700, 700)
makeAnimatedLuaSprite('cake', 'twoAssets/cake', 0, 335);
addAnimationByPrefix('cake', 'cake idle', 'cake idle', 18, false);
addLuaSprite('cake', false)
	scaleObject('cake', 0.75, 0.75);

makeAnimatedLuaSprite('eraser', 'twoAssets/eraser', 680, 370);
addAnimationByPrefix('eraser', 'eraser idle', 'eraser idle', 18, false);
addLuaSprite('eraser', false)
	scaleObject('eraser', 0.75, 0.75);

makeAnimatedLuaSprite('donutty', 'twoAssets/donutty', 1000, 320);
addAnimationByPrefix('donutty', 'donutty idle', 'donutty idle', 18, false);
addLuaSprite('donutty', false)
	scaleObject('donutty', 0.75, 0.75);

makeAnimatedLuaSprite('barfy', 'twoAssets/barfy', 1400, 320);
addAnimationByPrefix('barfy', 'barfy Idle', 'barfy Idle', 18, false);
addLuaSprite('barfy', false)
	scaleObject('barfy', 0.75, 0.75);

makeAnimatedLuaSprite('bommy', 'twoAssets/bommy', -500, 335);
addAnimationByPrefix('bommy', 'bommy idle', 'bommy idle', 18, false);
addLuaSprite('bommy', false)
	scaleObject('bommy', 0.75, 0.75);

--[[makeAnimatedLuaSprite('crowd', 'tpot_crowd', -100, 25);
setProperty('crowd.antialiasing', false)
addAnimationByPrefix('crowd', 'bop', 'bop', 12, false);
addLuaSprite('crowd', false)]]



makeLuaSprite('coolBGback', 'two2', -400, 230)
addLuaSprite('coolBGback', true)
setScrollFactor('coolBGback', 0.9, 0.9)
end

function onCreatePost()
setGraphicSize("bg", 1920*1.5, 1050*1.5)
setGraphicSize("coolBG", 2152*1, 663*1)
setGraphicSize("coolBGback", 6562/2.5, 1869/2)
--doTweenAlpha('quemiho', 'coolBGback', 0.7, 3, 'expoOut')
--setGraphicSize("dad", 550/2, 550)
end

--[[function onBeatHit()
-- triggered 4 times per section

if curBeat % 2 == 0 then
	end
end	
end]]
function onCountdownTick()
	playAnim('cake', 'cake idle', false);
	playAnim('eraser', 'eraser idle', false);
	playAnim('donutty', 'donutty idle', false);
	playAnim('barfy', 'barfy Idle', false);
	playAnim('bommy', 'bommy idle', false);
end

function onStepHit()
if curStep % 4 == 0 and curBeat >= 64 then
	doTweenY('bfScaleTweenX', 'coolBGback', 250, 0.002, 'expoOut') 
	--doTweenY('twopot', 'coolBG', 275, 0.002, 'expoOut') 

	doTweenY('twopot1', 'cake', 335+10, 0.002, 'expoOut') 
	doTweenY('twopot2', 'eraser', 370+10, 0.002, 'expoOut') 
	doTweenY('twopot3', 'donutty', 320+10, 0.002, 'expoOut') 
	doTweenY('twopot4', 'barfy', 320+10, 0.002, 'expoOut') 
	doTweenY('twopot5', 'bommy', 335+10, 0.002, 'expoOut') 



end
--debugPrint(curBeat)

if curStep % 4 == 0 then
	playAnim('cake', 'cake idle', false);
	playAnim('eraser', 'eraser idle', false);
	playAnim('donutty', 'donutty idle', false);
	playAnim('barfy', 'barfy Idle', false);
	playAnim('bommy', 'bommy idle', false);
end	
end

function onTweenCompleted(tag) 
if tag == "bfScaleTweenX" then
	doTweenY('haha', 'coolBGback', 200, (stepCrochet*0.002)*1.5, 'expoOut') 
	--doTweenY('twopot', 'coolBG', 265, 1, 'expoOut')
	doTweenY('twopot6', 'cake', 335, (stepCrochet*0.002)*1.5, 'expoOut') 
	doTweenY('twopot7', 'eraser', 370, (stepCrochet*0.002)*1.5, 'expoOut') 
	doTweenY('twopot8', 'donutty', 320, (stepCrochet*0.002)*1.5, 'expoOut') 
	doTweenY('twopot9', 'barfy', 320, (stepCrochet*0.002)*1.5, 'expoOut') 
	doTweenY('twopot0', 'bommy', 335, (stepCrochet*0.002)*1.5, 'expoOut') 
end
end
