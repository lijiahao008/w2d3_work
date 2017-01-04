require "rspec"
require "hand"
require "card"

def card_maker(value_suit_array)
  cards = []
  value_suit_array.each do |value, suit|
    cards << double("card", value: value, suit: suit)
  end
  cards
end

describe "Hand" do
  subject(:hand) { Hand.new }


  describe "#is_straight?" do
    it "should return true if a hand is straight" do
      cards = card_maker( [[1, :heart], [2, :heart], [3, :heart], [4, :heart], [5, :heart]])
      # cards = [Card.new(1, :heart), Card.new(2, :heart), Card.new(3, :heart),Card.new(4, :heart), Card.new(5, :club)]
      hand.cards = cards
      expect(hand.is_straight?).to be(true)
    end

    it "should return false if a hand is not straight" do
      cards = [Card.new(10, :heart), Card.new(2, :heart), Card.new(3, :heart),Card.new(4, :heart), Card.new(5, :club)]
      hand.cards = cards
      expect(hand.is_straight?).to be(false)
    end
  end

  describe "#is_flush?" do
    it "should return true if a hand is flush" do
      cards = [Card.new(1, :heart), Card.new(2, :heart), Card.new(3, :heart),Card.new(4, :heart), Card.new(9, :heart)]
      hand.cards = cards
      expect(hand.is_flush?).to be(true)
    end

    it "should return false if a hand is not flush" do
      cards = [Card.new(10, :heart), Card.new(2, :heart), Card.new(3, :heart),Card.new(4, :heart), Card.new(5, :club)]
      hand.cards = cards
      expect(hand.is_flush?).to be(false)
    end
  end

  describe "#return_pairs" do
    it "should return two pairs" do
      cards = [double("card", value: 1), double("card", value: 1), double("card", value: 3),double("card", value: 3), double("card", value: 9)]
      hand.cards = cards
      expect(hand.return_pairs).to eq([[1, 1], [3, 3]])
    end

    it "should return empty array if there is no matches" do
      cards = [Card.new(10, :heart), Card.new(2, :heart), Card.new(3, :heart),Card.new(4, :heart), Card.new(5, :club)]
      hand.cards = cards
      expect(hand.return_pairs).to be_empty
    end

    it "should return three pairs" do
      cards = [Card.new(10, :heart), Card.new(10, :club), Card.new(10, :spade),Card.new(4, :heart), Card.new(5, :club)]
      hand.cards = cards
      expect(hand.return_pairs).to eq([[10,10,10]])
    end
  end
end
