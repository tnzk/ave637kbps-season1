class MapBase
  def initialize( type = :sea)
    @type = type
  end
  def to_s
    {:sea => '~', :ground => '_', :nothing => '.'}[@type]
  end
end
