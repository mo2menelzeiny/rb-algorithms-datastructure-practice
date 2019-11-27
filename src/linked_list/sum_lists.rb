require_relative './linked_node'
# Sum Lists: You have two numbers represented by a linked list, where each node contains a single
# digit. The digits are stored in reverse order, such that the 1 's digit is at the head of the list. Write a
# function that adds the two numbers and returns the sum as a linked list.

# @param[LinkedNode] list_a
# @param[LinkedNode] list_b
def sum_lists(list_a, list_b)
  value = 0
  # @type [LinkedNode] head
  # @type [LinkedNode] tail
  head = tail = nil
  until list_a.nil? && list_b.nil?
    list_a, value = incr_add(list_a, value)
    list_b, value = incr_add(list_b, value)
    result = LinkedNode.new(value % 10)
    value = value >= 10 ? 1 : 0
    if head.nil?
      head = tail = result
    elsif !tail.nil?
      tail.next = result
      tail = result
    end
  end
  head
end

# @param[LinkedNode] node
# @param[Numeric] value
def incr_add(node, value)
  unless node.nil?
    value += node.value
    node = node.next
  end
  [node, value]
end

head_a = list_a = LinkedNode.new(7)
list_a = list_a.next = LinkedNode.new(1)
list_a.next = LinkedNode.new(6)

head_b = list_b = LinkedNode.new(5)
list_b = list_b.next = LinkedNode.new(9)
list_b = list_b.next = LinkedNode.new(2)
list_b.next = LinkedNode.new(2)

sum_lists(head_a, head_b)


