# frozen_string_literal: true

# SinglyLinkedList
class SinglyLinkedList
  # @type[SinglyLinkedList]
  @next = nil
  # @type[SinglyLinkedList]
  @head = nil
  # @type[SinglyLinkedList]
  @tail = nil

  # @return [SinglyLinkedList]
  attr_accessor :next

  # @param[Object] value
  def initialize(value)
    # @type[Object]
    @value = value
  end

  # @param[Object]
  def append_to_tail(value)
    self.next = self.next.next until self.next.nil?
    self.next = SinglyLinkedList.new(value)
  end
end

node = SinglyLinkedList.new(0)
node = node.append_to_tail(1)
node = node.append_to_tail(2)
print head
