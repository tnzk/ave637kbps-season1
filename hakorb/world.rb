class World
  attr_reader :width, :height, :depth, :name
  def initialize( x = 10, y = 10, z = 10)
    @name = 'default'
    @width  = x
    @height = y
    @depth  = z
    @chips = Array.new(x){ Array.new(y) { Array.new(z) }}
  end

  def [](x,y,z)
    if x >= @width or y >= @height or z >= @depth
      nil
    else
      @chips[x][y][z]
    end
  end

  def []=(x,y,z,v)
    if x >= @width or y >= @height or z >= @depth
      nil
    else
      @chips[x][y][z] = v
    end
  end

  def load(map_name)
    open(map_name) do |f|
      @name = f.gets.chomp
      field = f.read
      field.split("\n").each_with_index do |arr, y|
        arr.split(',').each_with_index do |s, x|
          @depth.times do |z|
            h = s.to_i
            type = :nothing
            type = :ground if z <= h
            type = :sea if s == 's'
            self[x,y,z] = MapBase.new(type)
          end
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
