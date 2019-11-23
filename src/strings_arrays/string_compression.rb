# frozen_string_literal: false

#
# String Compression: Implement a method to perform basic string compression using the counts
# of repeated characters. For example, the string aabcccccaaa would become a2blc5a3. If the
# "compressed" string would not become smaller than the original string, your method should return
# the original string. You can assume the string has only uppercase and lowercase letters (a - z).

# @param[String] string
def compress_string(string)
  str = ''
  start = 0
  (0..string.length).each do |i|
    next if string[start] == string[i]

    str << string[start] << (i - start).to_s
    start = i
  end
end

compress_string('aabcccccaaa')
