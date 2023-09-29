function onCountdownTick(swagCounter)

if swagCounter == 1 then  -- Ready

makeLuaSprite('ready', 'readyOG', screenWidth / 1.7 - 389, screenHeight / 1.8 - 155);

setObjectCamera('ready','other');

scaleObject('ready', 0.85, 0.85);

doTweenAlpha('elpepe', 'ready', 0, crochet / 1000, 'cubeInOut');

setProperty('countdownReady.visible', false);

addLuaSprite('ready', true);

end

if swagCounter == 2 then -- Set

makeLuaSprite('set', 'setOG', screenWidth / 1.7 - 389, screenHeight / 1.8 - 155);

setObjectCamera('set','other');

scaleObject('set', 0.85, 0.85);

doTweenAlpha('elpepe', 'set', 0, crochet / 1000, 'cubeInOut');

setProperty('countdownSet.visible', false);

addLuaSprite('set', true);

end

if swagCounter == 3 then -- GO

makeLuaSprite('GO', 'goOG', screenWidth / 2 - 289, screenHeight / 1.8 - 215);

setObjectCamera('GO','other');

scaleObject('GO', 1, 1);

doTweenAlpha('elpepe', 'GO', 0, crochet / 1000, 'cubeInOut');

setProperty('countdownGo.visible', false);

addLuaSprite('GO', true);

end

end