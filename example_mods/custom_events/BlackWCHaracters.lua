function onCreate()
      addCharacterToList('firey-wihy_white')
	addCharacterToList('coiny-wihy_white')
precacheImage('firey-wihy_white')
precacheImage('coiny-wihy_white')
precacheImage('black')
end

function onEvent(name, value1, value2)
      if name == 'BlackWCHaracters' then
                    setProperty('black.visible', true);
                    triggerEvent('Change Character', 'dad', 'firey-wihy_white');
                    triggerEvent('Change Character', 'bf', 'coiny-wihy_white')

end
end