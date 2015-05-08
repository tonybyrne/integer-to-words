require 'rspec'
require_relative 'integer_to_words'

def expect_words(i, words)
  expect(i.to_words).to eql words
end

describe 'interger to words' do

  cases = {
        1 => 'one',
        2 => 'two',
        -5 => 'minus five',
        0 => 'zero',
        19 => 'nineteen',
        20 => 'twenty',
        30 => 'thirty',
        40 => 'forty',
        50 => 'fifty',
        60 => 'sixty',
        70 => 'seventy',
        80 => 'eighty',
        90 => 'ninety',
        73 => 'seventy-three',
        99 => 'ninety-nine',
        100 => 'one hundred',
        105 => 'one hundred and five',
        205 => 'two hundred and five',
        255 => 'two hundred and fifty-five',
        999 => 'nine hundred and ninety-nine',
        1000 => 'one thousand',
        1001 => 'one thousand and one',
        1051 => 'one thousand and fifty-one',
        1851 => 'one thousand, eight hundred and fifty-one',
        2000 => 'two thousand',
        2100 => 'two thousand, one hundred',
        10000 => 'ten thousand',
        300000 => 'three hundred thousand',
        333000 => 'three hundred and thirty-three thousand',
        1317 => 'one thousand, three hundred and seventeen',
        333111 => 'three hundred and thirty-three thousand, one hundred and eleven',
        1000000 => 'one million',
        1000005 => 'one million and five',
        1333111 => 'one million, three hundred and thirty-three thousand, one hundred and eleven',
        34617273 => 'thirty-four million, six hundred and seventeen thousand, two hundred and seventy-three',
        312493948 => 'three hundred and twelve million, four hundred and ninety-three thousand, nine hundred and forty-eight',
        1312493948 => 'one billion, three hundred and twelve million, four hundred and ninety-three thousand, nine hundred and forty-eight'
      }

  cases.each_pair do |integer, words|
    it "#{integer} --> #{words}" do
      expect_words(integer, words)
    end
  end

end
