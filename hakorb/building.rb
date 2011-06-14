class Building < MapBase
  attr_reader :name
  def initialize(name)
    @name = name.to_s ? name : 'default'
  end
end
