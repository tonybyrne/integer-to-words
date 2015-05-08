class VersionOne
  def number_to_string(n)
    zero_to_twenty = %w(zero one two three four five six seven eight nine ten
                    eleven twelve thirteen fourteen fifteen sixteen
                    seventeen eighteen nineteen twenty)
    twenty_to_ninety = %w(twenty thirty fourty fifty sixty seventy eighty ninety)
    return "minus #{number_to_string(-n)}" if n < 0
    return zero_to_twenty[n] if n < 20
    return "#{twenty_to_ninety[n / 10 - 2]}" if n < 100 && n % 10 == 0
    return "#{twenty_to_ninety[n / 10 - 2]}-#{zero_to_twenty[n % 10]}" if n < 100
    return "#{number_to_string(n / 100)} hundred" if n < 1000 && n % 100 == 0
    return "#{number_to_string(n / 100)} hundred and #{number_to_string(n % 100)}" if n < 1000

    scales = %w(thousand million billion trillion quadrillion quintillion)
    scales.each_with_index do |name, exp|
      exp1 = 1000**(exp + 1)
      exp2 = 1000**(exp + 2)
      return "#{number_to_string(n / exp1)} #{name}" if n < exp2 && n % exp1 == 0
      return "#{number_to_string(n / exp1)} #{name} and #{number_to_string(n % exp1)}" if n < exp1 + 100
      return "#{number_to_string(n / exp1)} #{name}, #{number_to_string(n % exp1)}" if n < exp2
    end
  end

end
