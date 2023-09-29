function onEvent(name,value1,value2)	
	if name == "dialogue" then
		--debugPrint(value1)
		makeLuaText("d", value1, 1000, 150, 500)
		addLuaText("d")
		setTextSize('d', 50)
		if value2 == 'bf' then
			setTextColor('d', '46B6FF')
		elseif value2 == 'abyss' then
			setTextColor('d', 'FF4646')
		elseif value2 == 'rx' then
			setTextColor('d', '53f569')
		elseif value2 == 'rx2' then
			setTextColor('d', 'fc2b3c')
			cameraShake("game", 0.05, stepCrochet*0.002)
		elseif value2 == 'none' then
			setTextColor('d', '53f569')
			doTweenAlpha('quemiho', 'd', 0, 3, 'linear')
		elseif value2 == 'db' then
			setTextColor('d', '6963ff')
		elseif value2 == 'fire' then
			setTextColor('d', 'ff7f24')
                elseif value2 == 'four' then
			setTextColor('d', '0026FF')
		elseif value2 == 'white' then
			setTextColor('d', 'FFFFFF')
                elseif value2 == 'gelatin' then
			setTextColor('d', '00FF21')
                elseif value2 == 'flower' then
			setTextColor('d', 'FF00DC')
				elseif value2 == 'six' then
			setTextColor('d', '04a9c9')
		end
		--is lua fiile was made by dangerbuttz, aswell as everything lua related in this mod cuz glaxbybeam sucksz!!!!
	end	
end