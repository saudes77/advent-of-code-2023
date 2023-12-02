require_relative "part_two"

describe "Part 2" do
  let(:input) do
    [
      "two1nine",
      "eightwothree",
      "abcone2threexyz",
      "xtwone3four",
      "4nineeightseven2",
      "zoneight234",
      "7pqrstsixteen",
    ]
  end

  it "gives the correct answer" do
    part_two = PartTwo.new(input)
    expect(part_two.solve).to eq(281)
  end
end
