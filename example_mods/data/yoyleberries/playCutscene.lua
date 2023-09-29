function onStartCountdown()
	if not allowEnd and isStoryMode then
		startVideo('cutscene3');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end