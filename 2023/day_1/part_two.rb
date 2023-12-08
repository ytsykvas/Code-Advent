# frozen_string_literal: true

input = File.read('./puzzle_input.txt').split("\n")

words_to_digits = {
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9',
  '1' => '1',
  '2' => '2',
  '3' => '3',
  '4' => '4',
  '5' => '5',
  '6' => '6',
  '7' => '7',
  '8' => '8',
  '9' => '9',
  '0' => '0'
}

words = words_to_digits.keys
reversed_words = words.map(&:reverse)

sub_sum = []
input.each do |string|
  digits = string.scan(/(#{words.join('|')})/)
  first = digits.first.nil? ? '' : words_to_digits[digits.first.first]

  digits = string.reverse.scan(/(#{reversed_words.join('|')})/)
  last = digits.first.nil? ? '' : words_to_digits[digits.first.first.reverse]
  sub_sum << (first + last).to_i
end

p sub_sum.sum
# 55429