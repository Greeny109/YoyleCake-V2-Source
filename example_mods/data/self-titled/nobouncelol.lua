function onUpdatePost()
 setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 1) / -0.75 + 1)
 setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 1) / -0.55 + 1)
 if downscroll then
   setProperty("iconP1.y", -50 + (getProperty("iconP1.scale.y") * 75))
   setProperty("iconP2.y", -50 + (getProperty("iconP2.scale.y") * 75))
 else
   setProperty("iconP1.y", 500 + (getProperty("iconP1.scale.y") * 75))
   setProperty("iconP2.y", 500 + (getProperty("iconP2.scale.y") * 75))
 end
end

local gfSpeed = 1;

function onBeatHit()

	if (curBeat % gfSpeed == 0) then
		if curBeat % (gfSpeed * 2) == 0 then
			setProperty('iconP1.scale.x', 0.0 );
			setProperty('iconP1.scale.y', 0.0 );
			setProperty('iconP2.scale.x', 0.0 );
			setProperty('iconP2.scale.y', 0.0 );

			setProperty('iconP1.angle', 0);
			setProperty('iconP2.angle', 0);
		else
			setProperty('iconP1.scale.x', 0.0 );
			setProperty('iconP1.scale.y', 0.0 );
			setProperty('iconP2.scale.x', 0.0 );
			setProperty('iconP2.scale.y', 0.0 );

			setProperty('iconP2.angle', 0);
			setProperty('iconP1.angle', 0);
		end

	end

end

function onUpdate()

    if (getProperty('iconP1.angle') >= 0) then
	    if ('iconP1.angle' ~= 0) then
    	    setProperty('iconP1.angle', getProperty('iconP1.angle')-1);
    	end
    else
        if ('iconP1.angle' ~= 0) then
    	    setProperty('iconP1.angle', getProperty('iconP1.angle')+1);
    	end
    end

    if (getProperty('iconP2.angle') >= 0) then
	    if ('iconP2.angle' ~= 0) then
    	    setProperty('iconP2.angle', getProperty('iconP2.angle')-1);
    	end
    else
        if ('iconP2.angle' ~= 0) then
    	    setProperty('iconP2.angle', getProperty('iconP2.angle')+1);
    	end
    end

end