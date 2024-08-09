bullets = {}
function shoot(x, y, angle)
    shootsfx = love.audio.newSource("assets/audio/shoot.mp3", "static")
    shootsfx:play()
    shoottimer = 14
    local bullet = {x = x,y = y,angle = angle, isBullet = true}
    bullets[#bullets+1] = bullet
    world:add(bullet, bullet.x,bullet.y,23,13)
    bullet.my = math.sin(bullet.angle)
    bullet.mx = math.cos(bullet.angle)
    exists = true
end
function updatebullet(dt)
    for _,bullet in ipairs(bullets) do

        bullet.x, bullet.y = bullet.x + bullet.mx * 500 * dt, bullet.y + bullet.my * 500 * dt -- world:move(bullet, bullet.x + bullet.mx * 100 * dt, bullet.y + bullet.my * 100 * dt)
    end
end
function drawbullet()
    for _,bullet in ipairs(bullets) do
        love.graphics.draw(bulletimage, bullet.x, bullet.y + 12 - 12 * bullet.my, bullet.angle, 3, 3, 8, 8)
    end
end