function onCreate()
	setProperty('skipCountdown', true)
	setProperty('camHUD.alpha', 0);
end

function onStepHit()
	if getProperty('curBeat') >= 30 then
			doTweenAlpha('HUDFI', 'camHUD', 1, 0.25, 'sineIn')
	end
end