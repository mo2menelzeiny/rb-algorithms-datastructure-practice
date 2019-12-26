# Validate BST: Implement a function to check if a binary tree is a
# binary search tree.

# @param [Hash{Integer -> Array<Numeric>}] tree
# @param [Numeric] root
def validate_bst(tree, root)
  result = true
  return [root, result] if tree[root].empty?

  unless tree[root][0].nil?
    left, bool = validate_bst(tree, tree[root][0])
    result &= (left <= root) && bool
  end

  unless tree[root][1].nil?
    right, bool = validate_bst(tree, tree[root][1])
    result &= (right > root) && bool
  end

  [root, result]
end


tree = { 10 => [5, 12],
         5 => [3, 6],
         12 => [nil, 15],
         3 => [],
         6 => [],
         15 => [] }

puts validate_bst(tree, 10)


tree = { 10 => [5, 1],
         5 => [3, 6],
         1 => [nil, 15],
         3 => [],
         6 => [],
         15 => [] }

puts validate_bst(tree, 10)