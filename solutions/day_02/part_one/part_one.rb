require_relative "game"

class PartOne
  def initialize(input)
    @input = input
  end

  def solve
    possible_ids = []

    @input.each do |game_string|
      game = Game.new(game_string)
      possible_ids << game.id if game.possible?
    end

    possible_ids.sum
  end
end
