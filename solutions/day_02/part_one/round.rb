class Round
  def initialize(info_string)
    @dice_groupings = {
      red: 0,
      green: 0,
      blue: 0
    }
    info_string.split(",").each do |grouping_string|
      amount, color = grouping_string.strip.split(" ")
      @dice_groupings[color.to_sym] += amount.to_i
    end
  end

  def possible?(red:, green:, blue:)
    return false if @dice_groupings[:red] > red
    return false if @dice_groupings[:green] > green
    return false if @dice_groupings[:blue] > blue

    true
  end
end
