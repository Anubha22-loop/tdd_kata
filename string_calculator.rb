class StringCalculator
  def add(numbers = '')
    return 0 if numbers.empty?
    return numbers.to_i unless numbers.include?(',')
    number_arr = numbers.split(',')
    number_arr[0].to_i + number_arr[-1].to_i
  end
end