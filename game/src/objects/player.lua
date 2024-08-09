player = { x = 50,y = 384,w = 48,h = 48, speed = 480 }
shoottimer = 0
player.xscale = 1
player.gravity = 0
player.weight = 1400
canJump = false
currentFrame = 1
onGround = false
function loadPlayerSounds()
    jump = love.audio.newSource("assets/audio/jump.mp3", "static")
end
function loadPlayerImages()
    player.images = {}
    player.images.idle = love.graphics.newImage("assets/image/gsidle.png")
    player.images.jump = love.graphics.newImage("assets/image/gsjump.png")
    player.images.walk = {}
    bulletimage = love.graphics.newImage("assets/image/bullet.png")
    for i=1,2 do
        table.insert(player.images.walk, love.graphics.newImage("assets/image/gswalk" .. i .. ".png"))
    end
    player.image = player.images.idle
end
function playerFilter(item, other)
    if     other.isBullet   then return 'cross'
    elseif other.isWall   then return 'slide'
    elseif other.isSemiSolid and player.y + player.h <= other.y then return 'slide'
    elseif other.isSemiSolid then return 'cross'
    elseif other.isExit   then return 'touch'
    elseif other.isSpring then return 'bounce'
    end
end

function pJump()
    if canJump then
        jump:play()
        canJump = false
        onGround = false
        player.gravity = -800
    end
end
function updatePlayer(dt)
    shoottimer = shoottimer - 40 * dt
    local dx, dy = 0, 0
    if input.right then
        player.xscale = 1
        dx = player.speed * dt
    elseif input.left then
        player.xscale = -1
        dx = -player.speed * dt
    end
    if onGround == false then
        player.gravity = player.gravity + player.weight * dt
        canJump = false
    elseif onGround == true then
        canJump = true
    end
    dy = dy + player.gravity * dt
    function player:checkIfOnGround(ny, na, ne)
        if ny < 0 and (na or ne) then onGround = true else onGround = false end
    end
    if canJump == true then
        if dx ~= 0 then
            player.image = player.images.walk
        else
            player.image = player.images.idle
        end
    else
        player.image = player.images.jump
    end
    if dx ~= 0 or dy ~= 0 then
        player.x, player.y, cols, cols_len = world:move(player, player.x + dx, player.y + dy, playerFilter)
    end
    
    for i=1, cols_len do
        local col = cols[i]
        player:checkIfOnGround(col.normal.y, col.other.isWall, (col.other.isSemiSolid and player.y + player.h <= col.other.y))
    end
    currentFrame = currentFrame + 10 * dt
    if currentFrame > 3 then
        currentFrame = 1
    end
end

function drawPlayer()
    if player.image == player.images.walk then
        love.graphics.draw(player.image[math.floor(currentFrame)], player.x + 24 - 24 * player.xscale, player.y, 0, 3 * player.xscale, 3)
    else
        love.graphics.draw(player.image, player.x + 24 - 24 * player.xscale, player.y, 0, 3 * player.xscale, 3)
    end
end
  
return player