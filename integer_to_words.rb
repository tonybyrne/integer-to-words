class Integer

  NAMED_LOOKUP = {
      0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine', 10 => 'ten',
      11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen', 20 => 'twenty',
      30 => 'thirty', 40 => 'forty', 50 => 'fifty', 60 => 'sixty', 70 => 'seventy', 80 => 'eighty', 90 => 'ninety'
  }

  SCALES = {
      100 => 'hundred', 1000 => 'thousand', 10**6 => 'million', 10**9 => 'billion'
  }

  def to_words
    return negate_to_words if negative?
    return NAMED_LOOKUP[self] if NAMED_LOOKUP[self]
    (i = extract_scale) ? words_with_scale(i) : words_without_scale
  end

  private

  def words_without_scale
    remainder = self % max_named_integer
    return join_with_remainder((self - remainder).to_words, remainder)
  end

  def words_with_scale(i)
    qty = self / i
    remainder = self % i
    return join_with_remainder("#{qty.to_words} #{SCALES[i]}", remainder)
  end

  def join_with_remainder(left, remainder)
    right = remainder.to_words
    return (remainder > 0) ? [left, right].join(separator(remainder)) : left
  end

  def max_named_integer
    NAMED_LOOKUP.keys.reject { |i| i > self }.sort.last
  end

  def extract_scale
    SCALES.keys.reject { |i| i > self }.sort.last
  end

  def negate_to_words
    "minus #{(self.abs).to_words}"
  end

  def separator(remainder)
    if remainder < 10 && self < 100
      '-'
    elsif remainder < 100
      ' and '
    else
      ', '
    end
  end

  def negative?
    self < 0
  end

end
