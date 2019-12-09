require_relative './linked_node'

# @param[LinkedNode] list
def detect_loop(list)
  curr = list
  nodes_map = {}
  until curr.nil?
    if nodes_map[curr.__id__].nil?
      nodes_map[curr.__id__] = curr
    else
      return curr
    end
    curr = curr.next
  end
end

head_a = list_a = LinkedNode.new('1')
list_a = list_a.next = LinkedNode.new('2')
list_a = loop_head = list_a.next = LinkedNode.new('3')
list_a = list_a.next = LinkedNode.new('4')
list_a = list_a.next = LinkedNode.new('5')
list_a = list_a.next = LinkedNode.new('6')
list_a = list_a.next = loop_head

puts detect_loop(head_a)
