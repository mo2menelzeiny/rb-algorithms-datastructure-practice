require_relative './linked_node'
# Partition: Write code to partition a linked list around a value x, such that all nodes less than x come
# before all nodes greater than or equal to x. If x is contained within the list, the values of x only need
# to be after the elements less than x (see below). The partition element x can appear anywhere in the
# "right partition"; it does not need to appear between the left and right partitions.

# @param[LinkedNode] list_head
def partition(list_head, pivot)
  current = list_head
  p_runner = LinkedNode.new(0, nil, list_head) # temp node to mark partition runner
  until current.next.nil?
    if current.value < pivot
      p_runner = p_runner.next
      # swap
      temp = current.value
      current.value = p_runner.value
      p_runner.value = temp
    end
    current = current.next
  end
  temp = current.value
  current.value = p_runner.next.value
  p_runner.next.value = temp
end

# @param[LinkedNode] prev
# @param[Object] value
def append_to_node(prev, value)
  prev.next = LinkedNode.new(value, prev, nil)
end

# @param[LinkedNode] root
def print_list(root)
  curr = root
  until curr.nil?
    print curr.value.to_s + ' '
    curr = curr.next
  end
  puts
end

l0 = LinkedNode.new(3)
l1 = append_to_node(l0, 5)
l2 = append_to_node(l1, 8)
l3 = append_to_node(l2, 5)
l4 = append_to_node(l3, 10)
l5 = append_to_node(l4, 2)
append_to_node(l5, 1)

print_list(l0)
partition(l0, 5)
print_list(l0)
