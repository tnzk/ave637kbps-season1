$: << ENV['PWD']
require 'map_base'
class World
  def initialize( x = 10, y = 10, z = 10)
    @width  = x
    @height = y
    @depth  = z
    @chips = Array.new(x){ Array.new(y) { Array.new(z) }}
  end

  def [](x,y,z)
    @chips[x][y][z]
  end

  def []=(x,y,z,v)
    @chips[x][y][z] = v
  end

  def load(map_name)
    field = open(map_name).read
    field.split("\n").each_with_index do |arr, y|
      arr.split(',').each_with_index do |s, x|
        @depth.times do |z|
          type = :nothing
          h = s.to_i
          type = :ground if z <= h
          type = :sea if h == 0
          self[x,y,z] = MapBase.new(type)
        end
      end
    end
  end

  def show_slice(n)
    s = ''
    @height.times do |y|
      @width.times { |x| s << self[x,y,n].to_s }
      s << "\n"
    end
    s
  end
end
