# Successor: Write an algorithm to find the "next" node (i.e., in-order successor) of a given node in a
# binary search tree. You may assume that each node has a link to its parent.

# @param [Hash{String -> Array<String>}] tree
# @param [Hash{String -> String}] parents
# @param [String] node
def find_successor(tree, parents, node)
  right = tree[node][1]
  if right.nil?
    current = node
    parent = parents[current]
    while !parent.nil? && tree[parent][0] != current
      current = parent
      parent = parents[parent]
    end
    parent
  else
    # right sub tree root doesnt have left sub tree
    return right unless tree[right][0].nil?

    current = right
    current = tree[current][0] until tree[current][0].nil?
    current
  end
end

tree = { 'A' => ['B', 'C'],
         'B' => ['D', 'E'],
         'C' => ['F', 'G'],
         'D' => [nil, nil],
         'E' => [nil, nil],
         'F' => [nil, nil],
         'G' => [nil, nil] }

parents = { 'A' => nil,
            'B' => 'A',
            'C' => 'A',
            'D' => 'B',
            'E' => 'B',
            'F' => 'C',
            'G' => 'C' }

puts find_successor(tree, parents, 'A')
puts find_successor(tree, parents, 'B')
puts find_successor(tree, parents, 'E')
puts find_successor(tree, parents, 'F')