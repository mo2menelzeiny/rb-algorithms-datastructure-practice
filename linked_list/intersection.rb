require_relative './linked_node'

# @param[LinkedNode] list_a
# @param[LinkedNode] list_b
def has_intersection(list_a, list_b)
  node_a = list_a
  node_b = list_b

  until node_a.next.nil? && node_b.next.nil?
    node_a = node_a.next if node_a.next
    node_b = node_b.next if node_b.next
  end

  node_a if node_a == node_b
end

# @param[LinkedNode] node_a
# @param[LinkedNode] node_b
# @return [LinkedNode, Boolean]
def has_intersection_recursive(node_a, node_b)
  return node_a == node_b ? node_a : nil if !node_a.next && !node_b.next

  next_a = node_a
  next_b = node_b
  next_a = node_a.next if next_a.next
  next_b = node_b.next if next_b.next
  has_intersection_recursive(next_a, next_b)
end

head_a = list_a = LinkedNode.new('1')
list_a = list_a.next = LinkedNode.new('3')

head_b = list_b = LinkedNode.new('5')
list_b = list_b.next = LinkedNode.new('6')
list_b = list_b.next = LinkedNode.new('7')

list_a = list_b = list_a.next = list_b.next = LinkedNode.new('11')
list_a = list_b = list_a.next = list_b.next = LinkedNode.new('12')

puts has_intersection(head_a, head_b)
puts has_intersection_recursive(head_a, head_b)

head_c = list_c = LinkedNode.new('3')
list_c = list_c.next = LinkedNode.new('1')
list_c = list_c.next = LinkedNode.new('5')
list_c = list_c.next = LinkedNode.new('9')

head_d = list_d = LinkedNode.new('4')
list_d = list_d.next = LinkedNode.new('6')

list_c = list_d = list_c.next = list_d.next = LinkedNode.new('7')
list_c = list_d = list_c.next = list_d.next = LinkedNode.new('2')
list_c = list_d = list_c.next = list_d.next = LinkedNode.new('1')

puts has_intersection(head_c, head_d)
puts has_intersection_recursive(head_c, head_d)


head_e = list_e = LinkedNode.new('1')
list_e = list_e.next = LinkedNode.new('1')
list_e = list_e.next = LinkedNode.new('1')

head_f = list_f = LinkedNode.new('1')
list_f = list_f.next = LinkedNode.new('1')

puts has_intersection(head_e, head_f)
puts has_intersection_recursive(head_e, head_f)