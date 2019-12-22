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
    if list_a.nil? && list_b.nil? && value.nonzero? && !tail.nil?
      tail.next = LinkedNode.new(1)
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

head_c = list_c = LinkedNode.new(9)
list_c = list_c.next = LinkedNode.new(7)
list_c.next = LinkedNode.new(8)

head_d = list_d = LinkedNode.new(6)
list_d = list_d.next = LinkedNode.new(8)
list_d.next = LinkedNode.new(5)

# sum_lists(head_c, head_d)

# @param[LinkedNode] list_a
# @param[LinkedNode] list_b
# @param[Numeric] curry
def sum_lists_recursive(list_a, list_b, curry)
  return if list_a.nil? && list_b.nil? && curry.zero?

  value = 0
  value += list_a.value unless list_a.nil?
  value += list_b.value unless list_b.nil?
  result = LinkedNode.new((value >= 10 ? value / 10 : value) + curry)
  result.next = sum_lists_recursive((list_a.nil? ? nil : list_a.next),
                                    (list_b.nil? ? nil : list_b.next),
                                    (value >= 10 ? value % 10 : 0))
  result
end

sum_lists_recursive(head_c, head_d, 0)
