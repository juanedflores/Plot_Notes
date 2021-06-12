pico-8 cartridge // http://www.pico-8.com
version 30
__lua__

radius=40
vertices=0
max_vertices=6
t=0

function _draw()
  cls()
  rectfill(0,0,127,127,7)

  -- connect vertices with lines
  for angle=0, vertices do 
    if (angle>0 and angle < vertices) then
      line(cos(angle/vertices)*radius+63, sin(angle/vertices)*radius+63,
      cos((angle-1)/vertices)*radius+63, sin((angle-1)/vertices)*radius+63, 0)
    end

    -- draw last line when distance is <= 1 away from last vertex
    if (angle>=vertices-1 and angle<=vertices) then
      line(cos(angle/vertices)*radius+63, sin(angle/vertices)*radius+63,
      cos((0)/vertices)*radius+63, sin((0)/vertices)*radius+63, 0)
    end
  end

  -- draw vertices
  for angle=0, vertices do
    circfill(cos(angle/vertices)*radius+63, sin(angle/vertices)*radius+63, 2, 8)
  end

  -- draw midpoint
  pset(63, 63, 0)

  -- fluctuate number of vertices using sin()
  -- vertices = (sin(t) * (max_vertices-1)/2) + (max_vertices-1)/2 + 1
  vertices=6

  t+=0.004
end
