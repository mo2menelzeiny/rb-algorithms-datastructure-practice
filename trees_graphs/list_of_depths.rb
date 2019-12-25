# @param [Hash<Array>] tree
# @param [Array] visited
# @param [String] root
# @param [Numeric] level
# @param [Array<Array>] list
def build_list(tree, visited, list, root, level)
  list[level] = [] unless tree[root].empty? || list[level].is_a?(Array)
  tree[root].each do |i|
    unless visited.include? i
      visited << i
      list[level] << build_list(tree, visited, list, i, level + 1)
    end
  end

  root
end

# @param [Hash<Array>] tree
# # @param [String] root
def list_of_depths(tree, root)
  list = [[root]]
  visited = [root]
  build_list(tree, visited, list, root, 1)
  list
end

tree = {
    'A' => ['B', 'C'],
    'B' => ['D', 'E'],
    'C' => ['F', 'G'],
    'D' => ['H'],
    'E' => [],
    'F' => [],
    'G' => [],
    'H' => []
}

puts list_of_depths(tree, 'A')

tree = {
    'A' => ['B', 'C'],
    'B' => [],
    'C' => []
}

puts list_of_depths(tree, 'A')