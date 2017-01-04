require_relative "card"
class Deck
  attr_reader :deck

  SUITES = [:heart, :diamond, :club, :spade]
  VALUES = (1..13).to_a

  def initialize
    @deck = []
    populate_deck
  end


  def populate_deck
    SUITES.each do |suite|
      VALUES.each do |value|
         @deck << Card.new(value,suite)
      end
    end
  end

  def draw_cards(n = 1) # return array of n cards from top of deck
    raise "not enough cards" if deck.length < n
    @deck.shift(n)
  end

  def shuffle!
    @deck.shuffle!
  end
end
