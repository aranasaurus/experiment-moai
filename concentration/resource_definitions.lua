module( "ResourceDefinitions", package.seeall )

local defs = { }

function ResourceDefinitions:set( name, definition )
  defs[name] = definition
end

function ResourceDefinitions:get( name )
  return defs[name]
end

function ResourceDefinitions:remove( name )
  defs[name] = nil
end

