goxiosunderground = {}

goxiosunderground.load = function()
    levelmus = love.audio.newSource("/assets/audio/goxiosunderground.mp3", "stream")
end

goxiosunderground.start = function ()
    levelmus:play()
    
    if not world then
        world = bump.newWorld(48)
    end
    if not playerexists then
        player.x, player.y = 48 * 8 + 24, 48 * 9
        world:add(player, player.x, player.y, player.w, player.h)
        playerexists = true
    end
    if not wallexists then
        map = {
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {1,0,0,0,0,0,0,0,2,2,2,2,2,2,2,0},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {1,1,1,0,0,0,0,2,2,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1.0,1.0,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
    }

    for i,v in ipairs(map) do
        for j,w in ipairs(v) do
            if w == 1 then
                addWall((j-1)*48, (i-1)*48, 48,48)
            elseif w == 2 then
                addSemisolid((j-1)*48, (i-1)*48, 48,48)
            end
        end
    end
        wallexists = true
    end
end
return goxiosunderground