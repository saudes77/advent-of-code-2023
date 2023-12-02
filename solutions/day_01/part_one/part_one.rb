class PartOne
  DIGITS = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"].freeze

  def initialize(input)
    @input = input
  end

  def solve
    recovered_values.sum
  end

  def recovered_values
    @input.map do |calibration_string|
      digit_array = digits_only(calibration_string)
      "#{digit_array.first}#{digit_array.last}".to_i
    end
  end

  def digits_only(string)
    string.split("").filter { |character| DIGITS.include?(character)}
  end
end
