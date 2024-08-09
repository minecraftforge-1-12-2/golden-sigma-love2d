wall = {}
wallimage = love.graphics.newImage("assets/image/groundgoxio.png")
function addWall(x,y,w,h)
    local wall = {x=x,y=y,w=w,h=h, isWall = true}
    walls[#walls+1] = wall
    world:add(wall, x,y,w,h)
end
  
function drawWalls()
    for _,wall in ipairs(walls) do
        love.graphics.draw(wallimage, wall.x, wall.y, 0, 3, 3)
    end
end