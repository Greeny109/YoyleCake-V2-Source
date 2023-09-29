function onCreate()
    addCharacterToList('snatch', 'boyfriend')
    addCharacterToList('mtndew_six', 'boyfriend')
    addCharacterToList('mtn-dew-bfb', 'boyfriend')
    addCharacterToList('four-run', 'gf')
    addCharacterToList('x-gf-alt', 'gf')
    addCharacterToList('four-gf-alt', 'gf')
    addCharacterToList('four-alt', 'dad')
    addCharacterToList('x-alt', 'dad')
    addCharacterToList('six', 'dad')
    addCharacterToList('seven', 'dad')
    addCharacterToList('eight', 'dad')
    addCharacterToList('nine', 'gf')
    addCharacterToList('nine-dialogue', 'gf')
    addCharacterToList('five', 'dad')
    addCharacterToList('five-dialogue', 'dad')
    addCharacterToList('ten', 'dad')
precacheImage('mtn_dew_six_part')
precacheImage('snatch')
precacheImage('equations_six')
precacheImage('equations_bg')
precacheImage('four_alt')
precacheImage('four_gf')
precacheImage('x-gf-alt')
precacheImage('x_alt')
precacheImage('Four-Running')
precacheImage('six')
addCharacterToList('mtn-dew-bfb', 'boyfriend')
addCharacterToList('seven', 'dad')
addCharacterToList('seven', 'dad')
precacheImage('equations_bg_3')
precacheImage('mtn_dew')
precacheImage('five')
precacheImage('five-dialogue')
precacheImage('seven')
precacheImage('sixbg')
precacheImage('sevenbg')
precacheImage('eightbg')
precacheImage('ninebg')
precacheImage('forubg')
precacheImage('eight')
precacheImage('nine')
precacheImage('nine-speaks-wow')
precacheImage('ten')
precacheImage('Xbg')
precacheImage('NOTE_assets')
precacheImage('background_numbers_sprites')
end



function onBeatHit()
if curBeat == 236 then
    triggerEvent('Change Character', 'dad', 'six')
    triggerEvent('Change Character', 'BF', 'mtndew_six')
    triggerEvent('Change Character', 'GF', 'four-run')
    doTweenX('gaming', 'gf', -350, 58.15, 'linear')
    doTweenX('okaybyebyeeeeeeeeeeeeeeee', 'snatch', -9999999999999999999999999999999, 0.00001, 'linear')  

	makeAnimatedLuaSprite('bg','equations_six',-850, -360)
	addAnimationByPrefix('bg', 'equations_six', 'its moving aaa', 18, true)
    addLuaSprite('bg', false)
scaleObject('bg', 1.7, 1.7);
end

if curBeat == 400 then
    doTweenX('bye', 'gf', 1500, 1.3, 'linear') 
end


if curBeat == 435 then
    doTweenX('seeya', 'bg', 999999999, 0.3, 'linear') 
end


if curBeat == 440 then
    triggerEvent('Change Character', 'dad', 'seven')
    triggerEvent('Change Character', 'BF', 'mtn-dew-bfb')
    triggerEvent('Change Character', 'GF', 'air')

    makeLuaSprite('beg','equations_bg_3',-1850, -2360)
    addLuaSprite('beg', false)
scaleObject('beg', 2, 2);

makeAnimatedLuaSprite('ten','background_numbers_sprites',-70, 280)
addAnimationByPrefix('ten', 'background_numbers_sprites', 'shake', 18, false)

makeLuaSprite('sevenbg','sevenbg',90, 280)
addLuaSprite('sevenbg', false)
scaleObject('sevenbg', 0.35, 0.35);

    makeLuaSprite('eightbg','eightbg',-75, 280)
addLuaSprite('eightbg', false)
scaleObject('eightbg', 0.35, 0.35);

makeLuaSprite('sixbg','sixbg', 690, 400)
addLuaSprite('sixbg', false)
scaleObject('sixbg', 0.55, 0.55);

makeLuaSprite('fivebg','fivebg', 790, 310)
addLuaSprite('fivebg', false)
scaleObject('fivebg', 0.34, 0.34);

    makeLuaSprite('fourbg','forubg',-560, 370)
addLuaSprite('fourbg', true)
scaleObject('fourbg', 0.65, 0.65);

    makeLuaSprite('ninebg','ninebg',888777878, 280)
scaleObject('ninebg', 0.35, 0.35);
addLuaSprite('ninebg', false)

makeLuaSprite('Xbg','Xbg',780, 400)
addLuaSprite('Xbg', true)
scaleObject('Xbg', 0.65, 0.65);

end

if curBeat == 440 then
    doTweenX('itisseven', 'sevenbg', -40000, 0.00001, 'linear') 
     doTweenX('itiseight', 'eightbg',130, 0.00001, 'linear')
 end

if curBeat == 608 then
   doTweenX('itisseven', 'sevenbg', 80, 0.00001, 'linear') 
    doTweenX('itiseight', 'eightbg', -3000, 0.00001, 'linear')
scaleObject('ten', 0.95, 0.95);
end

if curBeat == 768 then
doTweenX('itiseight', 'eightbg', 130, 0.00001, 'linear')
doTweenX('itissix', 'sixbg', 990, 0.00001, 'linear')
   doTweenX('itisseven', 'sevenbg', 350, 0.00001, 'linear') 
      doTweenX('itisfive', 'fivebg', 30000, 0.00001, 'linear') 

end
if curBeat == 992 then
    doTweenX('goodbye', 'gf', 3000, 0.00001, 'linear') 
end
if curBeat == 993 then
    doTweenX('hello', 'gf', 1900, 1, 'circInOut') 
end
if curBeat == 1374 then
doTweenX('itiseight', 'eightbg', 1333333335, 0.00001, 'linear')
doTweenX('itissix', 'sixbg', 43333333333300, 0.00001, 'linear')
   doTweenX('itisseven', 'sevenbg', 33333333330, 0.00001, 'linear') 
      doTweenX('itisfive', 'fivebg', 33333333333390, 0.00001, 'linear') 
      doTweenX('itisnine', 'ninebg', 853333333333330, 0.00001, 'linear') 
      addLuaSprite('ten', false)
end

      if curBeat == 1372 then
doTweenX('itiseight', 'eightbg', -75, 0.00001, 'linear')
doTweenX('itissix', 'sixbg', 1400, 0.00001, 'linear')
   doTweenX('itisseven', 'sevenbg', 90, 0.00001, 'linear') 
      doTweenX('itisfive', 'fivebg', 490, 0.00001, 'linear') 
      doTweenX('itisnine', 'ninebg', 850, 0.00001, 'linear') 
end

if curBeat == 1380 then
    doTweenX('zoom', 'ten', -9999, 0.00001, 'linear')
    doTweenX('itiseight', 'eightbg', -75, 0.00001, 'linear')
    doTweenX('itissix', 'sixbg', 1400, 0.00001, 'linear')
       doTweenX('itisseven', 'sevenbg', 90, 0.00001, 'linear') 
          doTweenX('itisfive', 'fivebg', 490, 0.00001, 'linear') 
          doTweenX('itisnine', 'ninebg', 850, 0.00001, 'linear') 
end

if curBeat == 1644 then
    doTweenX('whoosh', 'Xbg', -99999, 0.00001, 'linear')
    doTweenX('wapoosh', 'fourbg', -99999, 0.00001, 'linear')
end

function onStepHit()

    --debugPrint(curBeat)

    if curStep == 932 then
        makeLuaSprite('snatch','snatch',120, 110)
addLuaSprite('snatch', true)
        doTweenX('weeeee', 'snatch', -2430, 0.4, 'quintInOut') 
    end
    if curStep == 1597 then
        triggerEvent('Play Animation', 'line', 'GF')
    end
end

function onUpdatePost()
    if curBeat == 396 then
        setProperty('showRating', false);
        setProperty('showComboNum', false);
    end
        if curBeat == 400 then
            setProperty('showRating', true);
            setProperty('showComboNum', true);
        end
    end
end