require_relative "part_one"

describe "Part 1" do
  let(:input) do
    [
      "1abc2",
      "pqr3stu8vwx",
      "a1b2c3d4e5f",
      "treb7uchet",
    ]
  end

  it "gives the correct answer" do
    part_one = PartOne.new(input)
    expect(part_one.solve).to eq(142)
  end
end
