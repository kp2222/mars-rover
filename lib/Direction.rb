module Direction

  def self.directions_mapping
    {
      "S" => South,
      "E" => East,
      "W" => West,
      "N" => North
    }
  end
  
  def self.from_s(direction_code)
    directions_mapping[direction_code].new
  end

  class Base
    # Just a container for common direction related functionality

    def turn(turn_direction)
      if(turn_direction == "L")
        turn_left
      else
        turn_right
      end
    end

    def code
      Direction.directions_mapping.invert[self.class]
    end
  end
  
  class South < Base
    def move(x,y)
      return x, y-1
    end

    def turn_left
      East.new
    end

    def turn_right
      West.new
    end
  end

  class North < Base
    def move(x,y)
      return x, y+1
    end

    def turn_left
      West.new
    end

    def turn_right
     East.new
    end

    
  end

  class East < Base
    def move(x,y)
      return x+1, y
    end

    def turn_left
      North.new
    end

    def turn_right
     South.new
    end
  end

  class West < Base
    def move(x,y)
      return x-1, y
    end

    def turn_left
      South.new
    end

    def turn_right
      North.new
    end
  end
  
end
