class Array

  def my_uniq
    result = []
    self.each do |el|
      result << el unless result.include?(el)
    end
    result
  end

  def two_sum
    result = []
    self.each_with_index do |el_one,idx_one|
      self.each_with_index do |el_two,idx_two|
        if el_one + el_two == 0
          result << [idx_one,idx_two] unless idx_one >= idx_two
        end
      end
    end
    result
  end

  def my_transpose
    result = Array.new(self.first.length) {Array.new}

    self.each do |line|
      line.each_with_index do |cell,idx|
        result[idx] << cell
      end
    end

    result
  end


end

def stock_picker(stocks)
  stocks.combination(2)
  .to_a.max {|a,b| a[1]-a[0] <=> b[1]-b[0]}.map {|a| stocks.index(a)}
end

class Game
  attr_accessor :towers
  def initialize
    @towers = [[1, 2, 3], [], []]
  end

  def move(start, target)
    raise "start pile is empty" if towers[start].empty?
    unless towers[target].empty?
      if towers[target].first < towers[start].first
        raise "target pile has smaller piece"
      end
    end

    towers[target].unshift(towers[start].shift)
  end

  def won?
    towers[1] == [1, 2, 3] || towers[2] == [1, 2, 3]
  end

end
