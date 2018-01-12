local level = {}
level.ground = {}

local function load()
  width, height, _ = love.window.getMode()

  groundHeight = height/9

  -- physics body anchor is middle
  level.ground.body = love.physics.newBody(world, width/2, height-groundHeight/2)
  level.ground.shape = love.physics.newRectangleShape(width, groundHeight)
  level.ground.fixture = love.physics.newFixture(level.ground.body, level.ground.shape)

  level.mountain = {}
  level.mountain.body = love.physics.newBody(world, width*3/4, height-groundHeight)
  vertices = {0, 0, 50, -50, 100, 0}
  level.mountain.shape = love.physics.newPolygonShape(vertices)
  level.mountain.fixture = love.physics.newFixture(level.mountain.body, level.mountain.shape)


  level.block = {}
  level.block.body = love.physics.newBody(world, width*1/4, height-groundHeight-25)
  level.block.shape = love.physics.newRectangleShape(50,50)
  level.block.fixture = love.physics.newFixture(level.block.body, level.block.shape)
end

local function draw()
  love.graphics.setColor(72, 160, 14)
  love.graphics.polygon("fill", level.ground.body:getWorldPoints(level.ground.shape:getPoints()))
  love.graphics.polygon("fill", level.block.body:getWorldPoints(level.block.shape:getPoints()))

  love.graphics.setColor(0,0,0)
  love.graphics.print(level.mountain.body:getWorldPoints(level.mountain.shape:getPoints()), 8, 20)
  love.graphics.print(vertices, 8, 40)
  love.graphics.polygon("fill", level.mountain.body:getWorldPoints(level.mountain.shape:getPoints()))
end

local function update(dt)
end

level.load = load
level.draw = draw
level.update = update

return level
