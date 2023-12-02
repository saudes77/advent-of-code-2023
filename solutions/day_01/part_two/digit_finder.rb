class DigitFinder
  DIGIT_MAP = {
    "0" => "0",
    "1" => "1",
    "2" => "2",
    "3" => "3",
    "4" => "4",
    "5" => "5",
    "6" => "6",
    "7" => "7",
    "8" => "8",
    "9" => "9",
    "zero" => "0",
    "one" => "1",
    "two" => "2",
    "three" => "3",
    "four" => "4",
    "five" => "5",
    "six" => "6",
    "seven" => "7",
    "eight" => "8",
    "nine" => "9"
  }.freeze

  def initialize(string)
    @string = string.downcase
    @first_digit = nil
    @last_digit = nil
    @first_digit_index = nil
    @last_digit_index = nil
  end

  def result
    parse_digits
    "#{@first_digit}#{@last_digit}".to_i
  end

  def parse_digits
    DIGIT_MAP.each do |key, value|
      first_index = @string.index(key)
      last_index = @string.rindex(key)
      update_first(first_index, value)
      update_last(last_index, value)
    end
  end

  def update_first(index, digit)
    return if index.nil?

    if @first_digit_index.nil? || index < @first_digit_index
      @first_digit_index = index
      @first_digit = digit
    end
  end

  def update_last(index, digit)
    return if index.nil?

    if @last_digit_index.nil? || index > @last_digit_index
      @last_digit_index = index
      @last_digit = digit
    end
  end
end
