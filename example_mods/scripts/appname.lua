function onUpdate()

    setPropertyFromClass('lime.app.Application', 'current.window.title', 'FNF: Yoylecake Central - '..getProperty('curSong'), getProperty('curDifficulty'))

    if inGameOver then
        setPropertyFromClass('lime.app.Application', 'current.window.title', 'FNF: Yoylecake Central - You are dead bro')
    end
end

function onDestroy()

    setPropertyFromClass('lime.app.Application', 'current.window.title', 'FNF: Yoylecake Central')

end