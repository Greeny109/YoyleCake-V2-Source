function onCreate()
      addCharacterToList('firey-wihy')
	addCharacterToList('coiny-wihy')
precacheImage('firey-wihy')
precacheImage('coiny-wihy')
precacheImage('black')
end

function onEvent(name, value1, value2)
      if name == 'BlackWCHaractersOff' then
                    setProperty('black.visible', false);
                    triggerEvent('Change Character', 'dad', 'firey-wihy');
                    triggerEvent('Change Character', 'bf', 'coiny-wihy')

end
end