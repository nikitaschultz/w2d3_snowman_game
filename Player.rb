class Player

  attr_reader :name
  attr_accessor :lives

  def initialize(name)
    @name = name
    @lives = 6
  end

end
