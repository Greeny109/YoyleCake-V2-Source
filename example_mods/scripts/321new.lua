function onCountdownTick(swagCounter)

    if songName ~= 'Self Titled' then

    if swagCounter == 0 then  -- Ready
 
        playSound('intro3YC', 2)
    
    end

    if swagCounter == 1 then  -- Ready
 
        playSound('intro2YC', 2)
    
    end
    
    if swagCounter == 2 then -- Set

        playSound('intro1YC', 2)

    end
    
    if swagCounter == 3 then -- GO

        playSound('introGoYC', 2)

    end
end

    if songName == 'Self Titled' then

        if swagCounter == 0 then  -- Ready
 
            playSound('intro3OG', 2)

        end
    
        if swagCounter == 1 then  -- Ready
     
            playSound('intro2OG', 2)
        
        end
        
        if swagCounter == 2 then -- Set
    
            playSound('intro1OG', 2)
    
        end
        
        if swagCounter == 3 then -- GO
    
            playSound('introGoOG', 2)
    
    end
end
end
