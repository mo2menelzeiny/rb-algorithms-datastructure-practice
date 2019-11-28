require_relative './linked_node'
# Palindrome: Implement a function to check if a linked list is a palindrome.

# @param[LinkedNode] list
def is_palindrome(list)
  length = 0
  char_count = {}
  curr = list
  until curr.nil?
    if char_count[curr.value].nil?
      char_count[curr.value] = 1
    else
      char_count[curr.value] += 1
    end
    length += 1
    curr = curr.next
  end
  odd = 0
  char_count.each_value do |val|
    odd += 1 if val.odd?
  end
  odd < 2
end

head_a = list_a = LinkedNode.new('b')
list_a = list_a.next = LinkedNode.new('a')
list_a = list_a.next = LinkedNode.new('a')
list_a.next = LinkedNode.new('b')

puts is_palindrome(head_a)

head_b = list_b = LinkedNode.new('b')
list_b = list_b.next = LinkedNode.new('b')
list_b = list_b.next = LinkedNode.new('a')
list_b.next = LinkedNode.new('b')

puts is_palindrome(head_b)