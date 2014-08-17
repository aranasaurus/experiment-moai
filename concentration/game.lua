module( "Game", package.seeall )
GRID_COLS = 5
GRID_ROWS = 4
GRID_TILE_WIDTH = 62
GRID_TILE_HEIGHT = 62
BACK_TILE = 1

local resource_definitions = {
  tiles = {
    type = RESOURCE_TYPE.tiled_image,
    fileName = 'tiles.png',
    tileMapSize = {6, 2},
  },
}

function Game:start()
  self:initialize()
end

function Game:initialize()
  self.layer = MOAILayer2D.new()
  self.layer:setViewport( viewport )

  MOAIRenderMgr.setRenderTable( { self.layer } )
  ResourceDefinitions:setDefinitions( resource_definitions )
  self:initializeTiles()
end

function Game:initializeTiles()
  local grid = MOAIGrid.new()
  grid:setSize( GRID_COLS, GRID_ROWS, GRID_TILE_WIDTH, GRID_TILE_HEIGHT )

  grid:setRow( 1, BACK_TILE, BACK_TILE, BACK_TILE, BACK_TILE, BACK_TILE )
  grid:setRow( 2, BACK_TILE, BACK_TILE, BACK_TILE, BACK_TILE, BACK_TILE )
  grid:setRow( 3, BACK_TILE, BACK_TILE, BACK_TILE, BACK_TILE, BACK_TILE )
  grid:setRow( 4, BACK_TILE, BACK_TILE, BACK_TILE, BACK_TILE, BACK_TILE )

  self.tiles = {}
  self.tiles.grid = grid
  self.tiles.tileset = ResourceManager:get( 'tiles' )

  self.tiles.prop = MOAIProp2D.new()
  self.tiles.prop:setDeck( self.tiles.tileset )
  self.tiles.prop:setGrid( self.tiles.grid )
  self.tiles.prop:setLoc( -GRID_COLS/2 * GRID_TILE_WIDTH, -GRID_ROWS/2 * GRID_TILE_HEIGHT )
  self.layer:insertProp( self.tiles.prop )
end

