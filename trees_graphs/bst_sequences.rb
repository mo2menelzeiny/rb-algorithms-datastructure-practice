# BST Sequences: A binary search tree was created by traversing through an array from left to right
# and inserting each element. Given a binary search tree with distinct elements, print all possible
# arrays that could have led to this tree.
#
#
# @param [Array] first
# @param [Array] second
# @param [Array] prefix
def weave(first, second, prefix)
  results = []
  return results + [prefix + first + second] if first.empty? || second.empty?

  weave(first[1..-1], second, prefix + [first[0]]) + weave(first, second[1..-1], prefix + [second[0]])
end

# @param [Hash<Array>] tree
# @param [Numeric] node
def bst_sequence(tree, node)
  results = []
  prefix = []
  return results.push([]) if node.nil? # Empty list of sequences

  left_list = bst_sequence(tree, tree[node][0])
  right_list = bst_sequence(tree, tree[node][1])

  prefix.append(node)

  left_list.each do |left|
    right_list.each do |right|
      results += weave(left, right, prefix)
    end
  end
  results
end

tree = { 1 => [nil, nil],
         2 => [1, 3],
         3 => [nil, nil] }

r = bst_sequence(tree, 2)
puts r
