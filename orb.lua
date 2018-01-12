local orb = {}

local function load()
  orb.body = love.physics.newBody(world, 650, 650/2, "dynamic")
  orb.shape = love.physics.newCircleShape(20)
  orb.fixture = love.physics.newFixture(orb.body, orb.shape)
  orb.fixture:setRestitution(0.3)
end

local function draw()
  love.graphics.setColor(193, 47, 14)
  love.graphics.circle("fill", orb.body:getX(), orb.body:getY(), orb.shape:getRadius())
end

local function update(dt)

end

local function reset()
  orb.body:setPosition(650, 650/2)
  orb.body:setLinearVelocity(0,0)
end

orb.load = load
orb.draw = draw
orb.update = update
orb.reset = reset

return orb
