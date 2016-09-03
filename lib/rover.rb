require_relative "../lib/plateau"
class Rover
  attr_accessor :x, :y, :heading, :plateau_boundary

  def initialize(x,y,heading, plateau_boundary)
    @x, @y, @heading, @plateau_boundary= x, y, heading
    @plateau = Plateau.new(*plateau_boundary)
  end

  def move
    new_location = calculate_new_location x, y
    @x, @y = new_location  if @plateau.within_bounds?(*new_location)
  end

  def calculate_new_location(x, y)
    case @heading
    when "N"
      y += 1 
    when "S"
      y -= 1 
    when "E"
      x += 1 
    when "W"
      x -= 1 
    end
    return x, y
  end

  def within_plateau_boundary?(x,y)
   (0..@plateau_boundary.first).include?(x) && (0..@plateau_boundary.last).include?(y) 
  end

  def turn(direction)
    case @heading
    when "N"
      if direction == "L"
        @heading = "W"
      else
        @heading = "E"
      end
    when "S"
      if direction == "L"
        @heading = "E"
      else
        @heading = "W"
      end
    when "W"
      if direction == "L"
        @heading = "S"
      else
        @heading = "N"
      end
    when "E"
      if direction == "L"
        @heading = "N"
      else
        @heading = "S"
      end
    end
  end

  def execute(instruction)
    if instruction == "M"
      self.move
    else
      self.turn(instruction)
    end
  end

  def describe_status
    "x: #{@x} y: #{@y} #{@heading}"
  end
  
end
