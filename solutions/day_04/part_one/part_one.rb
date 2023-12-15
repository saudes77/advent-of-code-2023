require_relative 'scratch_card'

class PartOne
  def initialize(input)
    @input = input
  end

  def solve
    @input.map do |card_string|
      ScratchCard.new(card_string.split(':').last).worth
    end.sum
  end
end
