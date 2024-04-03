class StringCalculator

  DEFAULT_DELIMITER = ','

  def initialize(numbers = '')
    @numbers = numbers
  end

  def add
    return 0 if @numbers.empty?
    number_arr.sum
  end

  def number_arr
    @numbers.gsub('\n', delimiter).split(delimiter).map {|n| n.to_i}
  end

  def delimiter
    @numbers[0,2] == '//' ? @numbers[2,1] : DEFAULT_DELIMITER
  end
end