class StringCalculator
  def add(numbers = '')
    return 0 if numbers.empty?
    return numbers.to_i unless numbers.include?(',')
    number_arr = numbers.split(',').map {|n| n.to_i}
    number_arr[0] + number_arr[-1]
  end
end