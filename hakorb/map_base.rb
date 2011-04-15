class MapBase
  def initialize( type = :sea)
    @type = type
  end
  def chip
    { sea: 2, ground: 0, nothing: 1}[@type]
  end
  def to_s
    {:sea => '~', :ground => '_', :nothing => '.'}[@type]
  end
end
