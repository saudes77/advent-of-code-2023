require "active_support"
require "active_support/core_ext"
require_relative "part_number"

class EngineSchematic
  DIGITS = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"].freeze
  NON_SYMBOLS = [".", *DIGITS].freeze


  def initialize(input)
    @schematic = input.map { |line| line.strip.split("") }
    @symbol_coordinates = []
    locate_symbols
    @part_numbers = []
    locate_part_numbers
  end

  def valid_part_numbers
    @part_numbers.filter{ |part| part.valid?(@symbol_coordinates) }.map(&:number)
  end

private

  def locate_symbols
    @schematic.each_with_index do |line, row_index|
      line.each_with_index do |character, column_index|
        next if NON_SYMBOLS.include?(character)

        @symbol_coordinates << [row_index, column_index]
      end
    end
  end

  def locate_part_numbers
    part_number = nil
    @schematic.each_with_index do |line, row_index|
      line.each_with_index do |character, column_index|
        if DIGITS.include?(character) && part_number.nil?
          # this is the start of a number
          part_number = PartNumber.new
          part_number.row_index = row_index
          part_number.column_start_index = column_index
          part_number.column_end_index = column_index
          part_number.number = character
        elsif DIGITS.include?(character)
          part_number.number += character
          part_number.column_end_index = column_index
        elsif part_number.present?
          # this is the end of a number
          @part_numbers << part_number
          part_number = nil
        end
      end

      if part_number.present?
        # this is the end of a number
        @part_numbers << part_number
        part_number = nil
      end
    end
  end
end
