quest1intro = {}
quest1intro.finished = false
quest1intro.load = function()
    video = love.graphics.newVideo("/assets/video/quest1.ogv")
end
quest1intro.play = function()
    if quest1intro.finished == false then
        video:play()
        love.graphics.draw(video, 160, 0)
        if video:tell() >= 6 then
            quest1intro.finished = true
            video:release()
            level = "goxiosunderground"
        end
    end
end
return quest1intro