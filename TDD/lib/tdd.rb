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
