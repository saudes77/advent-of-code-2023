require_relative "part_one/part_one"
require_relative "part_two/part_two"
require 'pry'

input_array = []

File.open("/workspaces/advent-of-code-2023/solutions/day_03/input.txt", "r") do |file|
  input_array = file.readlines
end

part_one = PartOne.new(input_array)
puts "Part 1 solution: #{part_one.solve}"

# part_two = PartTwo.new(input_array)
# puts "Part 2 solution: #{part_two.solve}"