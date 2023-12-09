require_relative "game"

class PartTwo
  def initialize(input)
    @input = input
  end

  def solve
    @input.map do |game_string|
      Game.new(game_string).power
    end.sum
  end
end
