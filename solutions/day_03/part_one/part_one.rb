require_relative "engine_schematic"

class PartOne
  def initialize(input)
    @input = input
  end

  def solve
    EngineSchematic.new(@input).valid_part_numbers.map(&:to_i).sum
  end
end
