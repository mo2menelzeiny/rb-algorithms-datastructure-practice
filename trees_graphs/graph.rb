# @!attribute value
#   @return [Object]
# @!attribute children
#   @return [Array<GraphNode>]
class GraphNode
  attr_accessor :value, :children

  def initialize(value = nil, children = [])
    @value = value
    @children = children
  end
end

# @!attribute nodes
#   @return [Array<GraphNode>]
class Graph
  attr_accessor :nodes

  def initialize(nodes = [])
    @nodes = nodes
  end
end

l3 = [GraphNode.new('F')]
l2 = [GraphNode.new('C'), GraphNode.new('D', l3), GraphNode.new('E')]
l1 = [GraphNode.new('B', l2)]
l0 = [GraphNode.new('A', l1)]

graph = Graph.new(l0)

