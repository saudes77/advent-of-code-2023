require_relative 'card_organizer'
require_relative 'scratch_card'

class PartTwo
  def initialize(input)
    @input = input
  end

  def solve
    cards = @input.map do |card_string|
      ScratchCard.new(card_string)
    end
    CardOrganizer.new(cards).calculate_total_cards
  end
end
