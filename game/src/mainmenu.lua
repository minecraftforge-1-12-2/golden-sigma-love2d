--main menu
mainmenu = {}
mainmenu.load = function()
	titlescreen = love.graphics.newImage("/assets/image/titlescreen.png")
	title = love.graphics.newImage("/assets/image/title.png")
    mainmenu.music = love.audio.newSource("/assets/audio/mainmenu.mp3", "stream")
	mainmenu.music:setLooping(true)
    mainmenu.music:play()
end
mainmenu.draw = function()
	love.graphics.draw(titlescreen, 160, 0, 0, 2, 2)
	love.graphics.draw(title, 180, 100, 0, 2.5, 2)
end

return mainmenu
