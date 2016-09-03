require_relative "../lib/rover"

describe Rover do

  describe "Initializing rover " do
    it "should set the initial location and heading" do
      rover = Rover.new 0, 0, "N", [5,5]
      
      expect(rover.x).to eql 0
      expect(rover.y).to eql 0
      expect(rover.heading).to eql "N"
    end
  end

  describe "Rover commands" do
    before(:each) do
      @rover = Rover.new 2, 2, "N", [5,5]
    end

    describe "Move commands" do
      it "when current heading is 'north'" do
        @rover.move
        
        expect(@rover.x).to eql 2
        expect(@rover.y).to eql 3
      end
      it "when current heading is 'south'" do
        @rover.heading = "S"
        @rover.move
        
        expect(@rover.x).to eql 2
        expect(@rover.y).to eql 1
      end
      it "when current heading is 'east'" do
        @rover.heading = "E"
        @rover.move
        
        expect(@rover.x).to eql 3
        expect(@rover.y).to eql 2
      end
      it "when current heading is 'west'" do
        @rover.heading = "W"
        @rover.move
        
        expect(@rover.x).to eql 1
        expect(@rover.y).to eql 2
      end

      describe "plateau boundaries" do

        it "should not cross plateau boundaries" do
          rover = Rover.new 5, 5, "N", [5,5]
          rover.move

          expect(rover.y).to eql 5

          rover = Rover.new 0, 5, "W", [5,5]
          rover.move

          expect(rover.x).to eql 0
        end
        
      end
      
    end

    describe "Turn commands" do
      it "when current heading is 'north'" do
        @rover.heading = "N"
        @rover.turn "L"

        expect(@rover.heading).to eql "W"

        @rover.heading = "N"
        @rover.turn "R"

        expect(@rover.heading).to eql "E"
      end
      it "when current heading is 'south'" do
        @rover.heading = "S"
        @rover.turn "L"

        expect(@rover.heading).to eql "E"

        @rover.heading = "S"
        @rover.turn "R"

        expect(@rover.heading).to eql "W"
      end

      it "when current heading is 'east'" do
        @rover.heading = "E"
        @rover.turn "L"

        expect(@rover.heading).to eql "N"

        @rover.heading = "E"
        @rover.turn "R"

        expect(@rover.heading).to eql "S"
      end

      it "when current heading is 'west'" do
        @rover.heading = "W"
        @rover.turn "L"

        expect(@rover.heading).to eql "S"

        @rover.heading = "W"
        @rover.turn "R"

        expect(@rover.heading).to eql "N"
      end
    end
    
    
  end
  
end
