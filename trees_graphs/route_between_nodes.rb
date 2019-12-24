# Route Between Nodes: Given a directed graph, design an algorithm to find out whether there is a
# route between two nodes.
def find_path(graph, source, target)
  queue = []
  marked = []
  queue.append(source)
  marked.append(source)

  until queue.empty?
    node = queue.shift
    return true if node == target

    # @type [Array] children
    children = graph[node]
    children.each do |child|
      unless marked.include?(child)
        queue.append(child)
        marked.append(child)
      end
    end
  end

  false
end

graph = { 'A' => ['B', 'C'], 'B' => [], 'C' => ['E'], 'E' => [] }
puts find_path(graph, 'A', 'E')
puts find_path(graph, 'B', 'Z')
puts find_path(graph, 'C', 'E')
