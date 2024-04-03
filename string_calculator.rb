class StringCalculator

  def initialize(numbers = '')
    @numbers = numbers
  end

  def add
    return 0 if @numbers.empty?
    number_arr.sum
  end

  def number_arr
    @numbers.gsub('\n', ',').split(',').map {|n| n.to_i}
  end
end