require_relative './linked_node'
# Palindrome: Implement a function to check if a linked list is a palindrome.

# @param[LinkedNode] node
def is_palindrome(node, length)
  return [node, true] if node.nil? || length <= 0

  return [node.next, true] if length == 1

  rnode, status = is_palindrome(node.next, length - 2)

  return [rnode, status] if !status || rnode.nil?

  [rnode.next, (node.value == rnode.value)]
end

head_a = list_a = LinkedNode.new('b')
list_a = list_a.next = LinkedNode.new('a')
list_a = list_a.next = LinkedNode.new('a')
list_a.next = LinkedNode.new('b')

puts is_palindrome(head_a, 4)

head_b = list_b = LinkedNode.new('b')
list_b = list_b.next = LinkedNode.new('b')
list_b = list_b.next = LinkedNode.new('a')
list_b.next = LinkedNode.new('b')

puts is_palindrome(head_b, 4)


head_c = list_c = LinkedNode.new('1')
list_c = list_c.next = LinkedNode.new('0')
list_c.next = LinkedNode.new('0')

puts is_palindrome(head_c, 3)