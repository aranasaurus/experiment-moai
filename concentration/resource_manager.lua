module( "ResourceManager", package.seeall )

ASSETS_PATH = 'assets/'

local cache = { }

function ResourceManager:get( name )
  if ( not self:loaded( name ) ) then
    self:load( name )
  end

  return cache[name]
end

function ResourceManager:loaded( name )
  return cache[name] ~= nil
end

function ResourceManager:load( name )
  print( "Loading " .. name .. "..." )
  local resourceDef = ResourceDefinitions:get( name )
  if not resourceDef then
    print( "ERROR: Missing resource definition for " .. name )
    cache[name] = nil
    return nil
  end

  local resource
  if resourceDef.type == RESOURCE_TYPE.image then
    resource = self:loadImage( resourceDef )
  elseif resourceDef.type == RESOURCE_TYPE.tiled_image then
    resource = self:loadTiledImage( resourceDef )
  elseif resourceDef.type == RESOURCE_TYPE.font then
    resource = self:loadFont( resourceDef )
  elseif resourceDef.type == RESOURCE_TYPE.sound then
    resource = self:loadSound( resourceDef )
  end

  cache[name] = resource
  print( "Loaded " .. name )
end

function ResourceManager:unload( name )
  cache[name] = nil
end

function ResourceManager:loadImage( definition )
  local coords = definition.coords

  if not coords then
    local halfWidth = definition.width / 2
    local halfHeight = definition.height / 2
    coords = { -halfWidth, -halfHeight, halfWidth, halfHeight }
  end

  return self:loadGfxQuad2D( definition.fileName, coords )
end

function ResourceManager:loadGfxQuad2D( fileName, coords )
  local filePath = ASSETS_PATH .. fileName
  local image = MOAIGfxQuad2D.new()

  image:setTexture( filePath )
  image:setRect( unpack( coords ) )

  return image
end

function ResourceManager:loadTiledImage( definition )
  local tiledImage = MOAITileDeck2D.new()
  local filePath = ASSETS_PATH .. definition.fileName
  print( "Loading tiled image from: " .. filePath )

  tiledImage:setTexture( filePath )
  tiledImage:setSize( unpack( definition.tileMapSize ) )

  return tiledImage
end

function ResourceManager:loadFont( definition )
  local font = MOAIFont.new()
  local filePath = ASSETS_PATH .. definition.fileName

  font:loadFromTTF( filePath, definition.glyphs, definition.fontSize, definition.dpi )

  return font
end

function ResourceManager:loadSound( definition )
  local sound = MOAIUntzSound.new()
  local filePath = ASSETS_PATH .. definition.fileName

  sound.load( filePath )
  sound:setVolume( definition.volume )
  sound:setLooping( definition.loop )

  return sound
end

