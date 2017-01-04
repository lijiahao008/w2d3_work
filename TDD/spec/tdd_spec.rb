require "rspec"
require "tdd"

describe "#my_uniq" do
  it "should return uniq array" do
    arr = [1,2,1,3,3]
    expect(arr.my_uniq).to eq([1,2,3])
  end

  it "should not modify the orignal array" do
    arr = [1,2,1,3,3]
    arr_old = arr.dup
    arr.my_uniq
    expect(arr).to eq(arr_old)
  end
end

describe "#two_sum" do
  it "should return pairs that sum to zero" do
    arr = [-1, 0, 2, -2, 1]
    expect(arr.two_sum).to eq([[0,4],[2,3]])
  end

  it "should return empty array if no matches" do
    arr = [1,2,3,4,5]
    expect(arr.two_sum).to eq([])
  end

  it "should not have sums of same elements twice" do
    arr = [-1, 0, 2, -2, 1]
    expect(arr.two_sum).to_not include([1,1])
  end

  it "smaller first elements come first" do
    output = [-1, 0, 2, -2, 1].two_sum
    first_numbers = output.map{|e,_| e}
    expect(first_numbers.sort).to eq(first_numbers)
  end

  it "smaller second elements come first" do
    output = [-1,1,1,8,-8].two_sum
    first_numbers = output.map{|a,b| a+b}
    expect(first_numbers.sort).to eq(first_numbers)
  end
end

describe "#transpose" do
  it "transposes a matrix" do
    matrix = [ [0, 1, 2],
              [3, 4, 5],
              [6, 7, 8]]

    result = [[0, 3, 6],
              [1, 4, 7],
              [2, 5, 8]]
    expect(matrix.my_transpose).to eq(result)

  end

  it "transposes a rectangle matrix" do
    matrix = [ [0, 1, 2],
              [3, 4, 5],
              [6, 7, 8],
              [9,10,11]]

    result = [[0, 3, 6, 9],
              [1, 4, 7, 10],
              [2, 5, 8, 11]]
    expect(matrix.my_transpose).to eq(result)

  end

  it "should not modify the original matrix" do
    matrix = [ [0, 1, 2],
              [3, 4, 5],
              [6, 7, 8]]

    old_matrix = [ [0, 1, 2],
              [3, 4, 5],
              [6, 7, 8]]

    result = matrix.my_transpose

    expect(matrix).to eq(old_matrix)
  end
end


describe "#stock_picker" do
  it "should return the index of the best buy and sell times" do
    stocks = [2, 4, 9, 20, 6]
    expect(stock_picker(stocks)).to eq([0, 3])
  end

  it "the first number should be smaller then the second" do
    stocks = [2, 4, 9, 20, 6]
    result = stock_picker(stocks)
    expect(result[0] < result[1]).to be true

  end

end


describe "Game" do
  subject(:game) { Game.new }

  
  describe "#move" do
    it "moves a piece" do
      game.move(0, 1)
      expect(game.towers[0].length).to eq(2)
      expect(game.towers[1].length).to eq(1)
    end

    it "won't move a piece if the start pile is empty" do
      expect{ game.move(1, 2) }.to raise_error("start pile is empty")
    end

    it "won't move a piece if the target top piece is smaller" do
      game.towers = [[1], [2, 3], []]
      expect{ game.move(1, 0) }.to raise_error("target pile has smaller piece")
    end

  end

  describe "#won?" do
    it "return true if user won" do
      game.towers = [[], [], [1, 2, 3]]
      expect(game.won?).to be true
    end

    it "return false if all piece are on the first tower" do
      game.towers = [[1, 2, 3], [], []]
      expect(game.won?).to be false
    end

    it "return false if the other towers are not complete" do
      game.towers = [[1], [2, 3], []]
      expect(game.won?).to be false
    end

  end
end
