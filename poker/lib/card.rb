class Card
  attr_reader :value,:suite
  def initialize(value,suite)
    @value = value
    @suite = suite

  end

  def to_s
    suite.to_s + " " + value.to_s
  end
end
