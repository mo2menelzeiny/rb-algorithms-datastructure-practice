require_relative './linked_node'
# Delete Middle Node: Implement an algorithm to delete a node in the middle (i.e., any node but
# the first and last node, not necessarily the exact middle) of a singly linked list, given only access to
# that node.
#
# @param[LinkedNode] node
def delete_middle_node(node)
  false if node.next.nil?

  nxt = node.next
  node.value = nxt.value
  node.next = nxt.next
  true
end

def append_to_tail(root, value)
  root.next = LinkedNode.new(value)
end

root = LinkedNode.new(0)
l1 = append_to_tail(root, 1)
l2 = append_to_tail(l1, 2)
l3 = append_to_tail(l2, 3)
l4 = append_to_tail(l3, 4)

delete_middle_node(l2)
root
