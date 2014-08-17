module( "ResourceDefinitions", package.seeall )

local defs = { }

function ResourceDefinitions:set( name, definition )
  defs[name] = definition
end

function ResourceDefinitions:setDefinitions( definitions )
  for name, definition in pairs( definitions ) do
    self:set( name, definition )
  end
end

function ResourceDefinitions:get( name )
  return defs[name]
end

function ResourceDefinitions:remove( name )
  defs[name] = nil
end

