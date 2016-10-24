# Luis Loya
# This script generates a pov-ray landscape using the Midpoint Displacement Algorithm
require 'pry'
require 'RMagick'
include Magick

$map = Hash.new(0)

def prompt(*args)
    STDERR.puts(*args)
    gets
end

def squares(x1,y1,x2,y2, dh, roughness)
  random_z = lambda { rand() }
  dx = x2 - x1
  dy = y2 - y1
  cx = x1+dx/2
  cy = y1+dy/2
  d2 = dh/2
  

  return nil if (dx < 2) 
  
  $map[[cx,cy]] = ($map[[x1,y1]] + $map[[x2,y2]] + $map[[x1,y2]] + $map[[x2,y1]])/4 + dh*random_z.call - d2  
  $map[[cx,y1]] = ($map[[x1,y1]] + $map[[x2,y1]])/2 + dh*random_z.call - d2 if $map[[cx,y1]] == 0
  $map[[cx,y2]] = ($map[[x1,y2]] + $map[[x2,y2]])/2 + dh*random_z.call - d2 if $map[[cx,y2]] == 0
  $map[[x1,cy]] = ($map[[x1,y1]] + $map[[x1,y2]])/2 + dh*random_z.call - d2 if $map[[x1,cy]] == 0
  $map[[x2,cy]] = ($map[[x2,y1]] + $map[[x2,y2]])/2 + dh*random_z.call - d2 if $map[[x2,cy]] == 0

  nh = dh/roughness
  
  squares(x1, y1, cx, cy, nh, roughness);
  squares(cx, y1, x2, cy, nh, roughness);
  squares(x1, cy, cx, y2, nh, roughness);
  squares(cx, cy, x2, y2, nh, roughness);
  
end

def normalize(width, height, normal)  
  max_value = 0
  0.upto(width) do |x|
    0.upto(height) do |y|
      max_value = $map[[x,y]] if $map[[x,y]] > max_value
    end
  end
  
  0.upto(width) do |x|
    0.upto(height) do |y|
       $map[[x,y]] = $map[[x,y]]/max_value * normal
       $map[[x,y]] = $map[[x,y]].to_i
    end
  end
end


def print_map_array(width, height)
  0.upto(width) do |x|
    print " #{x}[ "
    0.upto(height) do |y|
      printf " %8.3f, " % $map[[x,y]]
    end
    print " ]\n"
  end
end

def print_pov
  puts '#include "colors.inc"'
  puts '#include "stones.inc"'
  puts '#include "textures.inc"'
  puts '#include "shapes.inc"'
  puts '#include "glass.inc"'
  puts '#include "metals.inc"'
  puts '#include "woods.inc"'
  puts '#declare c1 = texture { T_Stone1 scale 2 }'
  puts '#declare Dist=80.0;'
  puts 'light_source {< -50, 25, -50> color White'
  puts '     fade_distance Dist fade_power 2'
  puts '}'
  puts 'light_source {< 50, 10,  -4> color Gray30'
  puts '     fade_distance Dist fade_power 2'
  puts '}'
  puts 'light_source {< 0, 100,  0> color Gray30'
  puts '     fade_distance Dist fade_power 2'
  puts '}'
  puts 'camera { location <3, 10, -25> look_at  <0,0,0> }'
  puts 'mesh {'
  squares.each do |s|
    t1_v1 = s.ltop
    t1_v2 = s.lbottom
    t1_v3 = s.rtop
  
    t2_v1 = t1_v2
    t2_v2 = t1_v3
    t2_v3 = s.rbottom
    puts "triangle{<%5.5f,%5.5f,%5.5f>,<%5.5f,%5.5f,%5.5f>,<%5.5f,%5.5f,%5.5f> texture {c1}}" % [t1_v1.x, t1_v1.y, t1_v1.z, t1_v2.x, t1_v2.y, t1_v2.z, t1_v3.x, t1_v3.y, t1_v3.z]
    puts "triangle{<%5.5f,%5.5f,%5.5f>,<%5.5f,%5.5f,%5.5f>,<%5.5f,%5.5f,%5.5f> texture {c1}}" % [t2_v1.x, t2_v1.y, t2_v1.z, t2_v2.x, t2_v2.y, t2_v2.z, t2_v3.x, t2_v3.y, t2_v3.z]
  end
  puts '}'
end

width = prompt "Field size (n^2): "
roug = prompt "Roughness (2): "

width = width.to_i
height = width

$map[[0,0]] = 0
$map[[0,height]] = 0
$map[[width,0]] = 0
$map[[width,height]] = 0

squares(0, 0, width, height, 1, roug.to_i)

puts ""
puts "Random Values: "
print_map_array(width, height)

puts ""
puts "Normalized Values (0 to 255)"
normalize(width,height,255)

print_map_array(width, height)


img = Image.new(width, height)

q = Array.new                           # Create an array of pixels one

width.times do                     # row long
    q << Magick::Pixel.new(0,0,0,0)
end

height.times do |y|                # Store pixels a row at a time
    width.times do |x|             # Build a row of pixels
        q[x].red   = QuantumRange * $map[[x,y]]
        q[x].green = QuantumRange * $map[[x,y]]
        q[x].blue  = QuantumRange * $map[[x,y]]
    end
    img.store_pixels(0, y, width, 1, q)
end

img.write('fractal.png')
