require "rspec"
require "deck"



describe "Deck" do
  subject(:deck) { Deck.new }

  describe "#initialize" do
    it "should return 52 cards" do
      expect(deck.deck.length).to eq(52)
    end

    it "all cards should be unique" do
      card_strings = deck.deck.map {|card| card.to_s}
      expect(card_strings.uniq).to eq(card_strings)
    end

    it "initializes with 4 suites" do
      suites = deck.deck.map { |card| card.suite }
      expect(suites.uniq).to match([:heart, :diamond, :club, :spade])
    end

    it "initialized with correct values" do
      values = deck.deck.map { |card| card.value }
      expect(values).to all(be < 14).and all(be > 0)
    end
  end

  describe "#draw_cards" do
    it "should return an array of card objects" do
      expect(deck.draw_cards(5)).to all(an_instance_of(Card))
    end

    it "should remove the card from the deck" do
      card = deck.draw_cards(1)
      expect(deck.deck).to_not include(card[0])
    end

    it "throws error when deck is out of cards" do
      expect {deck.draw_cards(1000)}.to raise_error("not enough cards")
    end
  end

  describe "#shuffle!" do
    it "should shuffle the cards and modify original deck" do
      old_deck = deck.deck.dup
      deck.shuffle!
      expect(deck.deck).to_not eq(old_deck)
    end
  end







end
