class Integer

  LOOKUP = {
      0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine', 10 => 'ten',
      11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen', 20 => 'twenty',
      30 => 'thirty', 40 => 'forty', 50 => 'fifty', 60 => 'sixty', 70 => 'seventy', 80 => 'eighty', 90 => 'ninety'
  }

  SCALES = {
      100 => 'hundred', 1000 => 'thousand', 10**6 => 'million', 10**9 => 'billion'
  }

  def to_words
    return negate_to_words if negative?
    return LOOKUP[self] if LOOKUP[self]
    dividends.each do |i|
      next if i > self
      remainder = self % i
      return (remainder > 0) ? to_words_with_remainder(remainder) : to_words_with_scale(i)
    end
  end

  def dividends
    SCALES.merge(LOOKUP).keys.sort.reverse
  end

  private

  def negate_to_words
    "minus #{(self.abs).to_words}"
  end

  def to_words_with_scale(i)
    "#{(self / i).to_words} #{SCALES[i]}"
  end

  def to_words_with_remainder(remainder)
    [(self - remainder), remainder].map(&:to_words).join(separator(remainder))
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
