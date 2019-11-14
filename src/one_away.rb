# frozen_string_literal: true

# One Away: There are three types of edits that can be performed on strings: insert a character,
# remove a character, or replace a character. Given two strings, write a function to check if they are
# one edit (or zero edits) away.
#

# @param[Hash] counts
# @param[String] string
def count_char(counts, string)
  (0...string.length).each do |i|
    if counts[string[i]]
      counts[string[i]] += 1
    else
      counts[string[i]] = 1
    end
  end
end

# @param[String] s1
# @param[String] s2
def is_one_away(s1, s2)
  false if s1.length != s2.length || ((s1.length - s2.length).abs != 1)
  counts1 = {}
  counts2 = {}
  count_char(counts1, s1)
  count_char(counts2, s2)
  not_found = 0
  counts1.each { |key, val| not_found += 1 if val != counts2[key] }
  (s1.length == s2.length && not_found == 1) || ((s1.length - s2.length).abs == 1 && not_found == 1)
end

puts is_one_away('haha', 'hahv')
puts is_one_away('haha', 'hah')
puts is_one_away('haha', 'ha')
puts is_one_away('haha', 'zhza')
puts is_one_away('haha', 'zhzazz')
puts is_one_away('haha', 'zaha')
