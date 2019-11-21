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
    @tail = @tail.prev
  end

  # @param[Object] target
  # @param[Object] value
  # @return [LinkedNode]
  def insert_at(target, value)
    current = @head
    current = current.next until current.next.nil? || current.value == target
    if current == @tail
      current.next = LinkedNode.new(value, current, nil)
      @tail = current.next
    else
      current.next = LinkedNode.new(value, current, current.next)
      current.next.next.prev = current.next
    end
  end

  # @param[Object] target
  # @return [LinkedNode]
  def delete_at(target)
    current = @head
    current = current.next until current.next.nil? || current.value == target
    return current if current == @tail

    if current.next == @tail
      current.next = nil
      @tail = current
    else
      current.next = current.next.next
      current.next.prev = current
    end
  end
end

root_node = LinkedNode.new(0)
list = LinkedList.new(root_node, root_node)

list.append_to_tail(1)
list.append_to_tail(2)
list.append_to_tail(4)
list.insert_at(2, 3)
list.insert_at(22, 5)
list.remove_from_tail
list.delete_at 4
