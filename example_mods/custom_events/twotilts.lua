local angleshit = 1;
local anglevar = 1;
local intensity = -2
local intensity1 = 0.5
local intensity2 = 3
local enabled = false

function onEvent(name, value1, value2)
	if name == 'twotilts' then
        enabled = true
    doTweenAngle('tilt', 'camGame', angleshit*intensity, stepCrochet*0.005, 'expoOut')
		doTweenAngle('turn', 'camHUD', angleshit*intensity, stepCrochet*0.005, 'expoOut')
end
end