function onStartCountdown()
	if not allowEnd and isStoryMode then
		startVideo('BatterCutscene');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end