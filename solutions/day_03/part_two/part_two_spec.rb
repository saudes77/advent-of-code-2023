require "pry"
require_relative "part_two"

describe "Part 2" do
  let(:input) do
    [
      "467..114..",
      "...*......",
      "..35..633.",
      "......#...",
      "617*......",
      ".....+.58.",
      "..592.....",
      "......755.",
      "...$.*....",
      ".664.598.."
    ]
  end

  it "gives the correct answer" do
    part_two = PartTwo.new(input)
    expect(part_two.solve).to eq(467835)
  end
end
