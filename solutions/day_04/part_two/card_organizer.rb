class CardOrganizer
  def initialize(scratch_cards)
    @original_cards = scratch_cards
    @copied_cards = []
  end

  def find_cards_by_range(range)
    @original_cards.filter { |card| range.include? card.card_number }
  end

  def calculate_total_cards
    determine_winnings(@original_cards)
    @original_cards.count + @copied_cards.count
  end

  def determine_winnings(cards)
    cards.each do |card|
      next unless card.winner_count.positive?

      cards_won_range = (card.card_number + 1)..(card.card_number + card.winner_count)
      cards_won = find_cards_by_range(cards_won_range)
      @copied_cards += cards_won
      determine_winnings(cards_won)
    end
  end
end
