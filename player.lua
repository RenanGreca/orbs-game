local player = {}

local function load()
  player.body = love.physics.newBody(world, 300, 200, "dynamic")
  player.shape = love.physics.newRectangleShape(32, 32)
  player.fixture = love.physics.newFixture(player.body, player.shape)
end

local function draw()
  love.graphics.setColor(185, 70, 176)
  love.graphics.polygon("fill", player.body:getWorldPoints(player.shape:getPoints()))
end

local function update(dt)
  if love.keyboard.isDown("right") then
    player.body:applyForce(400, 0)
  elseif love.keyboard.isDown("left") then
    player.body:applyForce(-400, 0)
  elseif love.keyboard.isDown("up") then
    player.body:applyForce(0, -1000)
  end
end

local function reset()
  player.body:setPosition(300, 200)
  player.body:setLinearVelocity(0,0)
end

player.load = load
player.draw = draw
player.update = update
player.reset = reset

return player
