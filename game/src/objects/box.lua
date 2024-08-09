function drawBox(box)
	love.graphics.rectangle("fill", box.x, box.y, box.w, box.h)
	love.graphics.rectangle("line", box.x, box.y, box.w, box.h)
end