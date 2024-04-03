class StringCalculator

  DEFAULT_DELIMITER = ','

  def initialize(numbers = '')
    @numbers = numbers
  end

  def add
    return 0 if @numbers.empty?
    raise_error_negative_present
    number_arr.sum
  end

  private

  def raise_error_negative_present
    negative_nums = number_arr.select{ |n| n.negative?}
    raise StandardError, "Negative numbers not allowed: #{negative_nums.join(', ')}" unless negative_nums.empty?
  end

  def number_arr
    @numbers.gsub('\n', delimiter).split(delimiter).map {|n| n.to_i}
  end

  def delimiter
    @numbers[0,2] == '//' ? @numbers[2,1] : DEFAULT_DELIMITER
  end
end