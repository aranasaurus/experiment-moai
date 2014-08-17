require 'resource_manager'
require 'resource_definitions'

WORLD_RESOLUTION = {
  x = 320,
  y = 480
}

SCREEN_RESOLUTION = {
  x = 2 * WORLD_RESOLUTION.x,
  y = 2 * WORLD_RESOLUTION.y
}

RESOURCE_TYPE = {
  image = 1,
  tiled_image = 2,
  font = 3,
  sound = 4,
}

-- Window set up
MOAISim.openWindow( "Concentration", SCREEN_RESOLUTION.x, SCREEN_RESOLUTION.y )

-- Viewport set up
viewport = MOAIViewport.new()
viewport:setSize( SCREEN_RESOLUTION.x, SCREEN_RESOLUTION.y )
viewport:setScale( WORLD_RESOLUTION.x, WORLD_RESOLUTION.y )

require 'game'

function mainLoop()
  Game:start()
end

gameThread = MOAICoroutine.new()
gameThread:run( mainLoop )

