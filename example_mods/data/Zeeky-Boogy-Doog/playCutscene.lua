function onStartCountdown()
	if not allowEnd and isStoryMode then
		startVideo('cutscene1');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end