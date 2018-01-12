level = require("level")
orb = require("orb")
player = require("player")

function love.load()
  -- love.graphics.print("Hello World!", 400, 300)
  -- sphere = love.graphics.newImage("img/sphere.png")

  love.physics.setMeter(64)
  world = love.physics.newWorld(0, 9.81*64, true)

  -- love.graphics.setColor(255,255,255)
  love.graphics.setBackgroundColor(104,136,248)
  love.window.setMode(2560, 1600, {fullscreen=true})

  level.load()
  player.load()
  orb.load()

  -- platform.width = love.graphics.getWidth()
  -- platform.height = love.graphics.getHeight()
  -- platform.x = 0
  -- platform.y = platform.height*3/4
  --
  -- player.x = love.graphics.getWidth()/2
  -- player.y = platform.y-64
  -- player.img = love.graphics.newImage('img/sphere.png')
  -- player.height = player.img:getWidth()
  -- player.width = player.img:getWidth()
  -- player.ground = platform.y-16
  -- player.y_velocity = 10
  -- player.jump_height = -200
  -- player.gravity = -600
  -- player.angle = 0
  --

  -- -- player settings
  -- player.speed = 400
  -- player.acceleration = 200
  -- player.max_speed = 1000

  -- -- ground
  -- objects.ground = {}
  -- objects.ground.body = love.physics.newBody(world, 650/2, 650-50/2)
  -- objects.ground.shape = love.physics.newRectangleShape(650, 50)
  -- objects.ground.fixture = love.physics.newFixture(objects.ground.body, objects.ground.shape)
  --
  -- -- ball
  -- objects.ball = {}
  -- objects.ball.body = love.physics.newBody(world, 650/2, 650/2, "dynamic")
  -- objects.ball.shape = love.physics.newCircleShape(20)
  -- objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape)
  -- objects.ball.fixture:setRestitution(0.3)



  -- _, _, flags = love.window.getMode()
  -- screenWidth, screenHeight = love.window.getDesktopDimensions()
  --
  -- canvasHeight = screenWidth*9/16
  -- love.graphics.setMode(screenWidth, canvasHeight, true, true, 2)

end

function love.draw()
  level.draw()
  player.draw()
  orb.draw()

  -- love.graphics.print(("display %d: %d x %d"):format(flags.display, screenWidth, screenHeight), 4, 10)

  -- love.physics.newCircleShape(platform.x+40, platform.y-40, 5)
  -- love.graphics.rectangle('fill', platform.x, platform.y, platform.width, platform.height)
  -- love.graphics.polygon('fill', platform.x+200, platform.y, platform.x+300, platform.y-100, platform.x+400, platform.y)
  -- love.graphics.draw(player.img, player.x, player.y, player.angle, 1, 1, player.width/2, player.height/2)
  -- love.graphics.rectangle('fill', player.x, player.y, 1, 1)

  -- love.graphics.setColor(72, 160, 14)
  -- love.graphics.polygon("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints()))
  --
  -- love.graphics.setColor(193, 47, 14)
  -- love.graphics.circle("fill", objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius())

end

function love.update(dt)
  world:update(dt)

  -- level.update(dt)
  player.update(dt)
  orb.update(dt)


  if love.keyboard.isDown('r') then
    orb.reset()
    player.reset()
  end
  -- if love.keyboard.isDown("right") then
  --   objects.ball.body:applyForce(400, 0)
  -- elseif love.keyboard.isDown("left") then
  --   objects.ball.body:applyForce(-400, 0)
  -- elseif love.keyboard.isDown("up") then
  --   objects.ball.body:setPosition(650/2, 650/2)
  --   objects.ball.body:setLinearVelocity(0,0)
  -- end


  -- movement
  -- if love.keyboard.isDown('d') or love.keyboard.isDown('right') then
  --   if player.x < (love.graphics.getWidth() - player.img:getWidth()/2) then
  --     player.x = player.x + (player.speed * dt)
  --     if player.speed < player.max_speed then
  --       player.speed = player.speed + (player.acceleration * dt)
  --     end
  --
  --     player.angle = (player.angle + dt*(player.speed/100)) % (2*math.pi)
  --   end
  -- elseif love.keyboard.isDown('a') or love.keyboard.isDown('left') then
  --   if player.x > player.img:getWidth()/2 then
  --     player.x = player.x - (player.speed * dt)
  --     if player.speed < player.max_speed then
  --       player.speed = player.speed + (player.acceleration * dt)
  --     end
  --
  --     player.angle = (player.angle - dt*(player.speed/100)) % (2*math.pi)
  --   end
  -- else
  --   player.speed = 400
  -- end
  --
  -- -- jump
  -- if love.keyboard.isDown('space') or love.keyboard.isDown('up') then
  --   if player.y_velocity == 0 then
  --     player.y_velocity = player.jump_height
  --   end
  -- end
  --
  -- -- jump physics
  -- if player.y_velocity ~= 0 then
  --   player.y = player.y + player.y_velocity*2 * dt
  --   player.y_velocity = player.y_velocity - (player.gravity * dt)
  -- end
  --
  -- -- collision physics
  -- if player.y > player.ground then
  --   player.y_velocity = 0
  --   player.y = player.ground
  -- end

end
