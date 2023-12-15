require_relative 'part_one'
require 'pry'

input_array = []

File.open('/workspaces/advent-of-code-2023/solutions/day_04/input.txt', 'r') do |file|
  input_array = file.readlines
end

part_one = PartOne.new(input_array)
puts "Part 1 solution: #{part_one.solve}"
