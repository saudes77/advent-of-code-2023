require_relative "round"

class Game

  attr_reader :id

  def initialize(info_string)
    label, round_info = info_string.split(":")
    @id = label.delete_prefix("Game ").to_i
    @rounds = round_info.split(";").map { |round_string| Round.new(round_string) }
    @red_dice_available = 12
    @green_dice_available = 13
    @blue_dice_available = 14
  end

  def possible?
    @rounds.all? do |round|
      round.possible?(red: @red_dice_available, green: @green_dice_available, blue: @blue_dice_available)
    end
  end

  def min_reds
    @rounds.map(&:min_reds).max
  end

  def min_greens
    @rounds.map(&:min_greens).max
  end

  def min_blues
    @rounds.map(&:min_blues).max
  end

  def power
    min_reds * min_greens * min_blues
  end
end
