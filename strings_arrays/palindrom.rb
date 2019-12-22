# frozen_string_literal: true


# Palindrome Permutation: Given a string, write a function to check if it is a permutation of
# a palindrome. A palindrome is a word or phrase that is the same forwards and backwards. A
# permutation is a rearrangement of letters. The palindrome does not need to be limited to just
# dictionary words.

# @param [String] value
def is_palindrome(value)
  counts = {}
  (0..value.length - 1).each do |i|
    if value[i] != ' '
      if counts[value[i]]
        counts[value[i]] += 1
      else
        counts[value[i]] = 1
      end
    end
  end
  odd = 0
  counts.keys.each do |i|
    odd += 1 if counts[i].odd?
  end
  odd < 2
end

# @param[Numeric] bitv
# @param[Numeric] idx
def toggle_bit(bitv, idx)
  mask = 1 << idx
  if (bitv & mask).zero?
    bitv |= mask
  else
    bitv &= ~mask
  end
  bitv
end

# @param[String] value
def is_palindrome_bin(value)
  bitv = 0
  (0..value.length - 1).each do |i|
    bitv = toggle_bit(bitv, value[i].ord - 97) if value[i] != ' '
  end

  bitv.zero? || (bitv & (bitv - 1)).zero?
end

puts is_palindrome('abaaba zza')
puts is_palindrome_bin('abaaba zza')
