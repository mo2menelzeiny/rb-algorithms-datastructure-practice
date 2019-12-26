# Check Balanced: Implement a function to check if a binary tree is balanced. For the purposes of
# this question, a balanced tree is defined to be a tree such that the heights of the two subtrees of any
# node never differ by more than one.

# @param [Hash<Array>] tree
# @param [String] root
def check_nodes(tree, root, height)
  return height if tree[root].empty?

  check_nodes(tree, tree[root][0], height + 1)
end

# @param [Hash<Array>] tree
# @param [String] root
def check_balanced(tree, root)
  left = check_nodes(tree, tree[root][0], 1)
  right = check_nodes(tree, tree[root][1], 1)
  result = (left - right).abs
  result <= 1
end

tree = {
    'A' => ['B', 'C'],
    'B' => ['D', 'E'],
    'C' => ['F', 'G'],
    'D' => ['H'],
    'E' => [],
    'F' => [],
    'G' => [],
    'H' => ['F']
}

puts check_balanced(tree, 'A')

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

puts check_balanced(tree, 'A')

tree = {
    'A' => ['B', 'C'],
    'B' => [],
    'C' => [],
}

puts check_balanced(tree, 'A')
