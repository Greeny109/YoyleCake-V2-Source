local allowEnd = false
function onEndSong()
	if  not allowEnd then --Block the first countdown
		startVideo('ONE_End_Cutscene');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end