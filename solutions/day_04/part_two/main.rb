require_relative 'part_two'
require 'pry'

input_array = []

File.open('/workspaces/advent-of-code-2023/solutions/day_04/input.txt', 'r') do |file|
  input_array = file.readlines
end

part_two = PartTwo.new(input_array)
puts "Part 2 solution: #{part_two.solve}"
