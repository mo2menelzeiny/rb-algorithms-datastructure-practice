require_relative './linked_list'

# Return Kth to Last: Implement an algorithm to find the kth to last element of a singly linked list.
# @param[LinkedList] list
# @param[Numeric] mark
def k_to_last(list, mark)
  current = runner = list.head
  n = 0
  until runner.next.nil? || n == mark - 1
    runner = runner.next
    n += 1
  end

  until runner.next.nil?
    current = current.next
    runner = runner.next
  end

  current
end

root_node = LinkedNode.new(0)
list = LinkedList.new(root_node, root_node)
list.append_to_tail(1)
list.append_to_tail(2)
list.append_to_tail(3)
list.append_to_tail(4)

k_to_last(list, 3)
k_to_last(list, 7)
k_to_last(list, 0)
