class ScratchCard
  attr_reader :card_number, :winning_numbers, :my_numbers

  def initialize(scratch_card_string)
    scratch_card_string.delete_prefix!('Card ')
    number_string, card_data = scratch_card_string.split(':')
    @card_number = number_string.to_i
    winning_string, my_string = card_data.split('|')
    @winning_numbers = winning_string.split(' ')
    @my_numbers = my_string.split(' ')
  end

  def winner_count
    @winner_count ||= winning_numbers.intersection(my_numbers).count
  end
end
