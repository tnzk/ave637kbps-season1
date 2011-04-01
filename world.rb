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
    files = Dir::entries(map_name).find_all{|s| /\.map$/ =~ s}
    @depth.times do |z|
      field = open("#{map_name}/#{z}.map").read
      field.split("\n").each_with_index do |arr, y|
        arr.split(',').each_with_index do |s, x|
          self[x,y,z] = [:nothing, :sea, :ground][s.to_i]
        end
      end
    end
  end
  def show_slice(n)
    s = ''
    @height.times do |y|
      @width.times do |x|
        s << self[x,y,n].to_s
      end
      s << "\n"
    end
    s
  end
end
