require File.dirname(__FILE__) + '/linked_list'
# Remove Dups: Write code to remove duplicates from an unsorted linked list.
# @param[LinkedList] list
def remove_dups(list)
  current = list.head
  until current.next.nil?
    compare = current.next
    until compare.next.nil?
      if compare.value == current.value
        # remove duplicate
        befr = compare.prev
        aftr = compare.next
        befr.next = aftr
        aftr.prev = befr
      end
      compare = compare.next
    end
    current = current.next
  end
end


root_node = LinkedNode.new(0)
list = LinkedList.new(root_node, root_node)
list.append_to_tail(1)
list.append_to_tail(2)
list.append_to_tail(2)
list.append_to_tail(3)
list.append_to_tail(4)
list.append_to_tail(4)

remove_dups(list)