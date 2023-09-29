--Credits:

--Original Game; Where the vanilla HUD comes from: https://ninja-muffin24.itch.io/funkin - https://www.newgrounds.com/portal/view/770371
--Script that this one is based on: https://gamebanana.com/mods/385666
--@Stilic#5989 - Combo text script: https://cdn.discordapp.com/attachments/922851578996744252/974003348158185523/noteComboPack.zip)
--@BombasticTom#0646 - Another Vanilla HUD where I stole the prototype text/watermark: https://cdn.discordapp.com/attachments/922851578996744252/1000868382821863465/Vanilla_UI.zip

--[[ Default Preferences:
    prototypeText = false
    windowNamevanilla = false
    vanillaHealthcolors = true
    NotimeBar = true
    ComboText = false
    vanillaScore = true
	noBOTPLAYtext = true
--]]

--preferences; set to true if yes, set to false if no
prototypeText = false -- if you want the prototype game watermark, like the "leaked" builds. 
windowNamevanilla = true -- if you want the window name to be the same as vanilla (basically removes ": Psych Engine" from the window name).
vanillaHealthcolors = true -- if you want the health colors to be the same as vanilla (red to dad, aka the one on the left; green to bf, aka the on the right).
NotimeBar = true -- removes psych engine's song time bar.
ComboText = false -- shows "COMBO" aside to the song's combo numbers when you get a combo streak of 10.
vanillaScore = true -- makes the Score part of the HUD like vanilla (removes "Misses" and "Accuracy", moves and makes "Score" a bit smaller).
noBOTPLAYtext = true -- removes the "BOTPLAY" watermark when botplay is enabled.

function onCreatePost()
	local downscroll = getPropertyFromClass("ClientPrefs", "downScroll")
	
        if NotimeBar then
		setProperty('timeBarBG.visible', false)
		setProperty('timeBar.visible', false)
		setProperty('timeTxt.visible', false)
end
	        
	    if windowNamevanilla then
		setPropertyFromClass('lime.app.Application', 'current.window.title', "Friday Night Funkin'")
end

        if prototypeText then
	makeLuaText('proto', 'v0.3.0 (163ea06) PROTOTYPE', 300, 0, 0)
	setProperty('proto.x', screenWidth - getProperty('proto.width'))
	setProperty('proto.y', screenHeight - getProperty('proto.height'))
        setTextSize('proto', 16)
        setTextAlignment('proto', 'right')
        setObjectOrder('proto', getObjectOrder('score'))
        setTextBorder("proto", 1.75, '000000')
        if not getPropertyFromClass('ClientPrefs', 'hideHud') then addLuaText('proto') end
	end

function onUpdatePost()

        if vanillaHealthcolors then
		setHealthBarColors('ff0000', '5DED2A') 
end
                if vanillaScore then     
                setTextSize('scoreTxt', 16.5)
                setProperty('scoreTxt.x', 159)
                setProperty('scoreTxt.y', downscroll and 106 or 670)
				setTextBorder('scoreTxt', 1.5, '000000')
                if hits < 1 then
                setProperty('scoreTxt.text','Score: 0',0,0,0)
		elseif misses < 1 then
		setProperty('scoreTxt.text','Score: '..score)
		else
		setProperty('scoreTxt.text','Score: '..score)
end
end
end
end
				
function onUpdatePost(elapsed)
	for i = 0, getProperty('grpNoteSplashes.length')-1 do
		setPropertyFromGroup('grpNoteSplashes', i, 'offset.x', -30)
		setPropertyFromGroup('grpNoteSplashes', i, 'offset.y', -30)
		setPropertyFromGroup('grpNoteSplashes', i, 'alpha', 0.6)
	end
end

--icons

function onBeatHit()
	scaleObject('iconP1', 1.1, 1.1)
	doTweenX('iconP1', 'iconP1.scale', 1, crochet/1000, 'circOut')
	doTweenY('iconP1-2', 'iconP1.scale', 1, crochet/1000, 'circOut')
	
	scaleObject('iconP2', 1.1, 1.1)
	doTweenX('iconP2', 'iconP2.scale', 1, crochet/1000, 'circOut')
	doTweenY('iconP2-2', 'iconP2.scale', 1, crochet/1000, 'circOut')
end

function onUpdate(elasped)

iconOffset = 26
healthBarX = getProperty('healthBar.x')
healthBarW = getProperty('healthBar.width')
healthBarP = getProperty('healthBar.percent')

setGraphicSize('iconP1',math.lerp(150,getProperty('iconP1.width'), 0.50))
setProperty('iconP1.x', healthBarX + (healthBarW * (math.remapToRange(healthBarP, 0, 100, 100, 0) * 0.01) - iconOffset));

setGraphicSize('iconP2',math.lerp(150,getProperty('iconP1.width'), 0.50))
setProperty('iconP2.x', healthBarX + (healthBarW * (math.remapToRange(healthBarP, 0, 100, 100, 0) * 0.01) - iconOffset));

updateHitbox('iconP1')
updateHitbox('iconP2')
end

-- code for making the combo text show up stolen from @Stilic#5989
function string.starts(str, start)
    return string.sub(str, 1, string.len(start)) == start
end
function string.split(str, sep)
    if sep == nil then sep = "%s" end
    local t = {}
    for str in string.gmatch(str, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end

local count = 0

if ComboText then
function goodNoteHit(id, direction, noteType, isSustainNote)
    if not hideHud and not isSustainNote and getProperty('combo') > 9 then
        count = count + 1

        -- lot of vars but shut up i know we need these
        local tag = 'combo' .. count
        local offset = getPropertyFromClass('ClientPrefs', 'comboOffset')

        local pixel = getPropertyFromClass('PlayState', 'isPixelStage')
        local pixelShitPart1 = ''
        local pixelShitPart2 = ''
        local scaleShit = 0.7
        local antialiasing = getPropertyFromClass('ClientPrefs',
                                                  'globalAntialiasing')
        if pixel then
            pixelShitPart1 = 'pixelUI/'
            pixelShitPart2 = '-pixel'
            scaleShit = getPropertyFromClass('PlayState', 'daPixelZoom') * 0.85
            antialiasing = false
        end

        -- pixel style is great too
        makeLuaSprite(tag, pixelShitPart1 .. 'combo' .. pixelShitPart2, 0, 0)
        scaleObject(tag, scaleShit, scaleShit)
        updateHitbox(tag)

        -- i wanted to put that after ratio var but psych don't let me do that
        screenCenter(tag, 'y')

        -- my brain told me to fix the offsets as fast as i can
        local ox = screenWidth * 0.35 + getProperty(tag .. '.width') / 4.1
        local oy = getProperty(tag .. '.y') + getProperty(tag .. '.height') /
                       1.45
        if pixel then
            ox = ox + 3
            oy = oy + 10
        else
            ox = ox - 14
            oy = oy / 1.2
        end
        setProperty(tag .. '.x', ox + offset[1])
        setProperty(tag .. '.y', oy - offset[2])

        -- box2d based??? dik
        setProperty(tag .. '.acceleration.y', 600)
        setProperty(tag .. '.velocity.y', getProperty(tag .. '.velocity.y') -
                        150 + math.random(1, 10))

        setProperty(tag .. '.antialiasing', antialiasing)
        setObjectCamera(tag, 'hud')
        addLuaSprite(tag)
        setObjectOrder(tag, getObjectOrder('strumLineNotes') - 1)

        -- fuck psych doesn't support startDelay so i use a timer instead
        runTimer(tag .. ',timer', crochet * 0.001)
    end
end

function onTimerCompleted(tag)
    if string.starts(tag, 'combo') then
        -- funni split moment
        local leObj = string.split(tag, ',')[1]
        doTweenAlpha(leObj .. ',tween', leObj, 0, 0.2, 'linear')
    end
end

function onTweenCompleted(tag)
    if string.starts(tag, 'combo') then
        removeLuaSprite(string.split(tag, ',')[1])
    end
end
end

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end
