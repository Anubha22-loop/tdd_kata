class StringCalculator

  DEFAULT_DELIMITER = ','

  def initialize(numbers = '')
    @numbers = numbers
  end

  def add
    return 0 if @numbers.empty?
    raise_error_negative_present
    number_arr.reject { |n| n > 1000 }.sum
  end

  private

  def raise_error_negative_present
    negative_nums = number_arr.select{ |n| n.negative?}
    raise StandardError, "Negative numbers not allowed: #{negative_nums.join(', ')}" unless negative_nums.empty?
  end

  def number_arr
    delimeter_arr = get_delimiters
    numbers_str = @numbers.gsub('\n', DEFAULT_DELIMITER)
    delimeter_arr.each do |delimeter|
      numbers_str = numbers_str.gsub(delimeter, DEFAULT_DELIMITER)
    end
    numbers_str.split(DEFAULT_DELIMITER).map {|n| n.to_i}
  end

  def get_delimiters
    return [DEFAULT_DELIMITER] unless @numbers.start_with?('//')
    @numbers[2] == '[' ? @numbers.scan(/\[(.*?)\]/).flatten : [@numbers[2]]
  end
end