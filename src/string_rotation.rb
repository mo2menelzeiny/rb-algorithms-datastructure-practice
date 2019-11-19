#
# String Rotation:Assumeyou have a method isSubstringwhich checks if oneword is a substring
# of another. Given two strings, sl and s2, write code to check if s2 is a rotation of sl using only one
# call to isSubstring (e.g., "waterbottle" is a rotation of"erbottlewat").

# @param[String] str1
# @param[String] str2
def is_rotated?(str1, str2)
  str1 <<= str1
  str1.include? str2
end

puts is_rotated?('waterbottle', 'erbottlewat')
