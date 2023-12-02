require_relative "digit_finder"

class PartTwo
  def initialize(input)
    @input = input
  end

  def solve
    recovered_values.sum
  end

  def recovered_values
    @input.map do |calibration_string|
      DigitFinder.new(calibration_string).result
    end
  end
end
