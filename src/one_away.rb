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
  counts = {}
  count_char(counts, s1)
  count_char(counts, s2)
  # TODO: complete algorithm
end


is_one_away('haha', 'hah')

