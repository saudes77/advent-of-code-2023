class ScratchCard
  attr_reader :winning_numbers, :my_numbers

  def initialize(scratch_card_string)
    winning_string, my_string = scratch_card_string.split('|')
    @winning_numbers = winning_string.split(' ')
    @my_numbers = my_string.split(' ')
  end

  def winner_count
    @winner_count ||= winning_numbers.intersection(my_numbers).count
  end

  def worth
    return 0 if winner_count.zero?

    2 ** (winner_count - 1)
  end
end
