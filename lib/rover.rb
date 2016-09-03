require_relative "../lib/plateau"
require_relative "../lib/direction"

class Rover
  attr_accessor :x, :y, :heading, :direction

  def initialize(x,y,heading, plateau_boundary)
    @x, @y = x, y
    @direction = Direction.from_s heading
    @plateau = Plateau.new(*plateau_boundary)
  end

  def move
    new_location = @direction.move x, y
    @x, @y = new_location  if @plateau.within_bounds?(*new_location)
  end


  def turn(turn_direction)
    @direction = @direction.turn(turn_direction)
  end


  def execute(instruction)
    if instruction == "M"
      self.move
    else
      self.turn(instruction)
    end
  end

  def describe_status
    "x: #{@x} y: #{@y} heading: #{heading}"
  end

  def heading=(new_heading)
    @direction = Direction.from_s(new_heading)
  end

  def heading
    @direction.code
  end
end
