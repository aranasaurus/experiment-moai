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
  sound = 4
}

-- Window set up
MOAISim.openWindow( "Concentration", SCREEN_RESOLUTION.x, SCREEN_RESOLUTION.y )

-- Viewport set up
viewport = MOAIViewport.new()
viewport:setSize( SCREEN_RESOLUTION.x, SCREEN_RESOLUTION.y )
viewport:setScale( WORLD_RESOLUTION.x, WORLD_RESOLUTION.y )

layer = MOAILayer2D.new()
layer:setViewport( viewport )

imageGfx = MOAIGfxQuad2D.new()
imageGfx:setTexture( 'assets/tile_back.png' )
imageGfx:setRect( -31, -31, 31, 31 )

imageProp = MOAIProp2D.new()
imageProp:setDeck( imageGfx )
imageProp:setLoc( 0, 0 )

layer:insertProp( imageProp )

renderTable = { layer }
MOAIRenderMgr.setRenderTable( renderTable )
