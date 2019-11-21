require File.dirname(__FILE__) + '/linked_node'

# List class
class LinkedList
  # @return [LinkedNode]
  attr_accessor :head
  # @return [LinkedNode]
  attr_accessor :tail

  # @param[LinkedNode] head
  # @param[LinkedNode] tail
  def initialize(head = nil, tail = nil)
    # @type[LinkedNode]
    @head = head
    # @type[LinkedNode]
    @tail = tail
  end

  # @param[Object] value
  # @return[LinkedNode]
  def append_to_tail(value)
    @tail.next = LinkedNode.new(value, @tail, nil)
    @tail = @tail.next
  end

  # @return[LinkedNode]
  def remove_from_tail
    @tail.prev.next = nil
    @tail = @tail.prev
  end
end

root_node = LinkedNode.new(0)
list = LinkedList.new(root_node, root_node)

list.append_to_tail(1)
list.append_to_tail(2)
list.append_to_tail(3)
list.remove_from_tail
