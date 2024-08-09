semisolids = {}
semisolidimage = love.graphics.newImage("assets/image/cloud3.png")
function addSemisolid(x,y,w,h)
    local semisolid = {x=x,y=y,w=w,h=h, isSemiSolid = true}
    semisolids[#semisolids+1] = semisolid
    world:add(semisolid, x,y,w,h)
end
  
function drawSemisolid()
    for _,semisolid in ipairs(semisolids) do
        love.graphics.draw(semisolidimage, semisolid.x, semisolid.y, 0, 3, 3)
    end
end