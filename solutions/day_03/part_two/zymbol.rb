class Zymbol
  attr_accessor :row_index, :column_index, :character, :adjacent_parts

  def initialize(row, column, character)
    @row_index = row
    @column_index = column
    @character = character
    @adjacent_parts = []
  end

  def coordinates
    [row_index, column_index]
  end

  def calculate_adjacent(parts)
    parts.each { |part| adjacent_parts << part if part.adjacent?(*coordinates) }
  end

  def star?
    character == "*"
  end

  def gear?
    star? && adjacent_parts.length == 2
  end

  def gear_ratio
    return unless gear?

    adjacent_parts.first.number.to_i * adjacent_parts.last.number.to_i
  end
end
