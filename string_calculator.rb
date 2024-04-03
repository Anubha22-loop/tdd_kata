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
    @numbers.gsub('\n', delimiter).split(delimiter).map {|n| n.to_i}
  end

  def delimiter
    if @numbers.start_with?('//')
      if @numbers[2,1] == '['
        return @numbers.match(/\/\/\[(.*?)\]/)[1]
      else
        return @numbers[2,1]
      end
    end
    DEFAULT_DELIMITER
  end
end