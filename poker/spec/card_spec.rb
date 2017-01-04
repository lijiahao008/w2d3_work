require "rspec"
require "card"

describe "Card" do
  subject(:card) { Card.new(2,:heart) }

  describe "#initialize" do
    it "should create a card and set value and suit" do
      expect(card.value).to eq(2)
      expect(card.suit).to eq(:heart)
    end
  end

  describe "to_s" do
    it "is good"
  end
end
