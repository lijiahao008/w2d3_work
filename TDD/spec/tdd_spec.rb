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

  it "transposes a rectange matrix" do
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


describe ""
