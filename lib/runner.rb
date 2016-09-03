require_relative "./rover"


def read_input
  input = ""
  # read until a non empty line
  loop do
    input = ARGF.gets.chomp
    break unless input.empty?
  end 
  input
end


plateau_boundary = read_input.split.collect(&:to_i)

puts "boundary  #{plateau_boundary}"

while !ARGF.eof
  rover_position = read_input.split
  puts "initial rover position #{rover_position}"
  
  rover = Rover.new(rover_position[0].to_i,rover_position[1].to_i, rover_position[2], plateau_boundary)

  instructions = read_input.scan(/\w/)

  puts "instructions #{instructions}"

  instructions.each do |instruction|
    rover.execute instruction
  end

  puts rover.describe_status
  
end




