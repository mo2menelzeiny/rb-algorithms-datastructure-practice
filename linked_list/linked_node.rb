# Node class
class LinkedNode
  # @return [LinkedNode]
  attr_accessor :prev

  # @return [LinkedNode]
  attr_accessor :next


  # @return [LinkedNode]
  attr_accessor :value

  # @param[Object] value
  def initialize(value, prev = nil, nxt = nil)
    # @type[Object]
    @value = value
    # @type[LinkedNode]
    @prev = prev
    # @type[LinkedNode]
    @next = nxt
  end
end
