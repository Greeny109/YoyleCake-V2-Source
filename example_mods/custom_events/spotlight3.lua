function onCreate()
      addCharacterToList('mtn_dew_ii_dark')
	addCharacterToList('mephone_dark')
      addCharacterToList('mtn-dew-ii')
	addCharacterToList('mephone')

end
function onEvent(name, value1, value2)
      if name == 'spotlight3' then
            triggerEvent('Change Character', 'bf', 'mtn-dew-ii')
            triggerEvent('Change Character', 'dad', 'mephone')
            setProperty('bg_dark.visible', true); 
            setProperty('spotlight1.visible', false);
            setProperty('spotlight2.visible', false);  	 		 	  
            setProperty('spotlight3.visible', true);  	 		 	
      end
end