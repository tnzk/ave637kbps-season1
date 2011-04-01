class World
  def initialize( x = 10, y = 10, z = 10)
    @chips = Array.new(x){ Array.new(y) { Array.new(z) }}
  end
  def [](x,y,z)
    @chips[x][y][z]
  end
  def []=(x,y,z,v)
    @chips[x][y][z] = v
  end
end
