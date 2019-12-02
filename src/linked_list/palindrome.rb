require_relative './linked_node'
# Palindrome: Implement a function to check if a linked list is a palindrome.

# @param[LinkedNode] node
def is_palindrome_recursive(node, length)
  return [node, true] if node.nil? || length <= 0

  return [node.next, true] if length == 1

  rnode, status = is_palindrome_recursive(node.next, length - 2)

  return [rnode, status] if !status || rnode.nil?

  [rnode.next, (node.value == rnode.value)]
end

# @param[LinkedNode] node
def is_palindrome_reverse(node)
  reversed = reverse_list(node)
  until node.nil? || reversed.nil?
    return false if node.value != reversed.value

    node = node.next
    reversed = reversed.next
  end

  node.nil? && reversed.nil?
end

# @param[LinkedNode] list
def reverse_list(list)
  head = nil
  curr = list
  until curr.nil?
    new = LinkedNode.new(curr.value)
    new.next = head
    head = new
    curr = curr.next
  end
  head
end



head_a = list_a = LinkedNode.new('b')
list_a = list_a.next = LinkedNode.new('a')
list_a = list_a.next = LinkedNode.new('a')
list_a.next = LinkedNode.new('b')

_, res = is_palindrome_recursive(head_a, 4)
puts res
puts is_palindrome_reverse(head_a)

head_b = list_b = LinkedNode.new('b')
list_b = list_b.next = LinkedNode.new('b')
list_b = list_b.next = LinkedNode.new('a')
list_b.next = LinkedNode.new('b')

_, res = is_palindrome_recursive(head_b, 4)
puts res
puts is_palindrome_reverse(head_b)


head_c = list_c = LinkedNode.new('1')
list_c = list_c.next = LinkedNode.new('0')
list_c.next = LinkedNode.new('0')

_, res = is_palindrome_recursive(head_c, 3)
puts res
puts is_palindrome_reverse(head_c)
