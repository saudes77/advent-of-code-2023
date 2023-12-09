class PartNumber
  attr_accessor :number, :row_index, :column_start_index, :column_end_index

  def adjacent?(row, column)
    row_range = (row_index - 1)..(row_index + 1)
    column_range = (column_start_index - 1)..(column_end_index + 1)

    row_range.include?(row) && column_range.include?(column)
  end

  def valid?(symbols)
    symbols.any? { |symbol| adjacent?(*symbol.coordinates) }
  end
end
