
class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def is_flush?
    @cards.all? {|card| card.suit == cards.first.suit}
  end

  def is_straight?
    values = @cards.map { |card| card.value }
    values.sort.each_with_index do |value, index|
      next if index == values.length - 1
      return false unless values[index + 1] - 1 == value
    end
    true
  end

  def return_pairs
    result = Hash.new { |h, k| h[k] = [] }
    cards.each do |card|
      result[card.value] << card.value
    end
    result.select { |k, v| v.length >= 2 }.values
  end

end
