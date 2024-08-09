--input
local joysticks = love.joystick.getJoysticks()
joystick = joysticks[1]
keyboard = {}
gamepad = {}
mouse = {}
--function love.keypressed(key)
--	keyboard.key = key
--end
--function love.mousepressed(x, y, button)
--	if playerexists then
--		if button == 1 and shoottimer <= 0 then
--			shoot(player.x + 24, player.y + 12, angle)
--		end
--	end
--end
function love.gamepadpressed(joystick, button)
	gamepad.button = button
	if playerexists then
		if (button == "x" or button == "rightshoulder") and shoottimer <= 0 then
			shoot(player.x + 24, player.y + 12, angle)
		end
	end
end
love.graphics.setDefaultFilter("nearest", "nearest")
input = {}



wallexists = false
player_exists = false
level = "mainmenu"
walls = {}
mainmenu = require "src.mainmenu"
--quest1intro = require "src.events.quest1intro"
goxiosunderground = require "src.worlds.goxiosunderground"
function love.load()
	mainmenu.load()
	--quest1intro.load()
	goxiosunderground.load()
	Object = require "classic"
	bump = require "bump"
    require "src.objects.player"
    require "src.objects.wall"
	require "src.objects.box"
	require "src.objects.bullet"
	require "src.objects.semisolid"
	loadPlayerSounds()
	loadPlayerImages()
end
function love.update(dt)
	--input.start = keyboard.key == "return"
	--input.left = love.keyboard.isDown("a")
	--input.right = love.keyboard.isDown("d")
	--input.up = love.keyboard.isDown("w")
	--input.down = love.keyboard.isDown("s")
	--input.jump = love.keyboard.isDown("space")
	--mouse_x, mouse_y = love.mouse.getPosition()
	if joystick then
		input.start = (gamepad.button == "start") --or keyboard.key == "return"
		input.left = (joystick:isGamepadDown("dpleft")) --or love.keyboard.isDown("a")
		input.right = (joystick:isGamepadDown("dpright")) --or love.keyboard.isDown("d")
		input.up = (joystick:isGamepadDown("dpup")) --or love.keyboard.isDown("w")
		input.down = (joystick:isGamepadDown("dpdown")) --or love.keyboard.isDown("s")
		input.jump = (joystick:isGamepadDown("a")) --or love.keyboard.isDown("space")
		mouse_x, mouse_y = (joystick:getAxis(3)) * 100  + 480, (joystick:getAxis(4)) * 100 + 270
	end
	if input.jump then
		pJump()
	end
	
	--print(mouse_x, mouse_y)
	angle = math.atan2(mouse_y - 270 + 24, mouse_x - 480 + 24 )
	if input.start then
		if level == "mainmenu" then
			mainmenu.music:stop()
			mainmenu = false
			level = "goxiosunderground"
		end
	end
	--goxiosunderground
	if level == "goxiosunderground" then 
		goxiosunderground.start()
	end
	cols_len = 0
	if playerexists then
  		updatePlayer(dt)
		updatebullet(dt)
	end
end

function love.draw()
	if level == "mainmenu" then
		mainmenu.draw()
	end
	if level == "quest1intro" then
		--quest1intro.play()
	end
	if playerexists then
		love.graphics.translate(-player.x + 480 - 24, -player.y + 270 - 24)
		if wallexists then
			drawSemisolid()
			drawWalls()
		end
			
		drawPlayer()
		drawbullet()
		love.graphics.circle('line', mouse_x + player.x - 480 + 24, mouse_y + player.y - 270 + 24, 2)
		--love.graphics.line(player.x + 24, player.y + 24, mouse_x + player.x - 480 + 24, mouse_y + player.y - 270 + 24)
	end
end