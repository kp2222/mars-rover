class Plateau
  attr_accessor :x_limit, :y_limit

  def initialize(x,y)
    @x_limit, @y_limit = x,y
  end

  def within_bounds?(x,y)
     (0..x_limit).include?(x) && (0..y_limit).include?(y) 
  end
end
