require_relative "part_one"
require "pry"

describe "Part 1" do
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
    part_one = PartOne.new(input)
    expect(part_one.solve).to eq(4361)
  end

  context "a symbol separates two part numbers" do
    let(:input) do
      [
        "467..114..",
        "...*......",
        "..35..633.",
        "......#...",
        "617*......",
        ".....+.58.",
        "..592.....",
        ".....*755.",
        "..........",
        ".664$598.."
      ]
    end
  
    it "gives the correct answer" do
      part_one = PartOne.new(input)
      expect(part_one.solve).to eq(4361)
    end
  end

  context "a number goes all the way to the end of a line" do
    let(:input) do
      [
        "467..114..",
        "...*......",
        "..35...633",
        "......#...",
        "617*......",
        ".....-.58.",
        "..592.....",
        "......755.",
        "...$.*....",
        ".664.598.."
      ]
    end
  
    it "gives the correct answer" do
      part_one = PartOne.new(input)
      expect(part_one.solve).to eq(4361)
    end
  end

  context "different symbols are used" do
    let(:input) do
      [
        "467..114..",
        "...%......",
        "..35..633.",
        "......&...",
        "617@......",
        ".....+.58.",
        "..592.....",
        "......755.",
        "...=./....",
        ".664.598.."
      ]
    end
  
    it "gives the correct answer" do
      part_one = PartOne.new(input)
      expect(part_one.solve).to eq(4361)
    end
  end

  context "zeroes are used" do
    let(:input) do
      [
        "460..114..",
        "...*......",
        "..35..603.",
        "......#...",
        "617*......",
        ".....+.58.",
        "..592.....",
        "......755.",
        "...$.*....",
        ".664.098.."
      ]
    end
  
    it "gives the correct answer" do
      part_one = PartOne.new(input)
      expect(part_one.solve).to eq(3824)
    end
  end

  context "single digits are used" do
    let(:input) do
      [
        "467..114..",
        "...*......",
        "...5..633.",
        "......#...",
        "617*......",
        ".....+.58.",
        "..592.....",
        "......755.",
        "...$.*....",
        ".664..9..."
      ]
    end
  
    it "gives the correct answer" do
      part_one = PartOne.new(input)
      expect(part_one.solve).to eq(3742)
    end
  end
end
