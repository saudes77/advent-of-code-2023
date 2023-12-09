require "active_support"
require "active_support/core_ext"
require_relative "part_number"
require_relative "zymbol"

class EngineSchematic
  DIGITS = ("0".."9").to_a.freeze
  NON_SYMBOLS = [".", *DIGITS].freeze


  def initialize(input)
    @schematic = input.map { |line| line.strip.split("") }
    @symbols = []
    locate_symbols
    @part_numbers = []
    locate_part_numbers
  end

  def valid_part_numbers
    @part_numbers.filter{ |part| part.valid?(@symbols) }.map(&:number)
  end

  def gears
    @gears ||= @symbols.filter do |symbol|
      next false unless symbol.star?

      symbol.calculate_adjacent(@part_numbers)
      symbol.gear?
    end
  end

private

  def locate_symbols
    @schematic.each_with_index do |line, row_index|
      line.each_with_index do |character, column_index|
        next if NON_SYMBOLS.include?(character)

        @symbols << Zymbol.new(row_index, column_index, character)
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
