require_relative "../lib/plateau"

describe Plateau do
  subject {Plateau.new 5,5}

  it "should tell if a given location is within it's bounds" do
    expect(subject.within_bounds?(0,0)).to eql true
    expect(subject.within_bounds?(5,6)).to eql false
  end
end
