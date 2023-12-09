require_relative "engine_schematic"

class PartTwo
  def initialize(input)
    @input = input
  end

  def solve
    EngineSchematic.new(@input).gears.map(&:gear_ratio).sum
  end
end
