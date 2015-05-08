class Integer
  def to_words
    SpellableInteger.new(self).to_s
  end
end

class SpellableInteger

  NAMED = {
      0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine', 10 => 'ten',
      11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen', 20 => 'twenty',
      30 => 'thirty', 40 => 'forty', 50 => 'fifty', 60 => 'sixty', 70 => 'seventy', 80 => 'eighty', 90 => 'ninety'
  }

  SCALES = {
      100 => 'hundred', 1000 => 'thousand', 10**6 => 'million', 10**9 => 'billion'
  }

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def to_s
    return negate_to_words if value < 0
    return NAMED[value] if NAMED[value]
    scale = find_scale
    lwords, remainder = scale ? words_for_scale(scale) : words
    join_with_remainder(lwords, remainder)
  end

  private

  def negate_to_words
    "minus #{(value.abs).to_words}"
  end

  def find_scale
    max_divisor_from(SCALES)
  end

  def max_named_integer
    max_divisor_from(NAMED)
  end

  def max_divisor_from(l)
    l.keys.reject{|i| i > value}.sort.last
  end

  def words_for_scale(scale)
    qty = value / scale
    remainder = value % scale
    left = "#{qty.to_words} #{SCALES[scale]}"
    return left, remainder
  end

  def words
    remainder = value % max_named_integer
    left = (value - remainder).to_words
    return left, remainder
  end

  def join_with_remainder(left, remainder)
    return (remainder > 0) ? [left, remainder.to_words].join(separator(remainder)) : left
  end

  def separator(remainder)
    if remainder < 10 && value < 100
      '-'
    elsif remainder < 100
      ' and '
    else
      ', '
    end
  end

end
