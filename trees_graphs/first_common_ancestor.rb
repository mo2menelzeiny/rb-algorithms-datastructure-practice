# First Common Ancestor: Design an algorithm and write code to find the first common ancestor
# of two nodes in a binary tree. Avoid storing additional nodes in a data structure.
# NOTE: This is not necessarily a binary search tree.

# @param [Hash{String -> Array<String>}] tree
# @param [Hash{String -> String}] parents
# @param [String] node1
# @param [String] node2
def common_ancestor(parents, node1, node2)
  l1 = get_node_level(parents, node1)
  l2 = get_node_level(parents, node2)

  min_level = [l1, l2].min

  p1 = get_parents_by_level(parents, node1, l1 - min_level)
  p2 = get_parents_by_level(parents, node2, l2 - min_level)

  min_level.downto(0).each do
    break if p1 == p2

    p1 = parents[p1.to_sym]
    p2 = parents[p2.to_sym]
  end

  p1 == p2 ? p1 : nil
end

# @param [Hash{Symbol -> String}] parents
# @param [String] node
# @return [Numeric]
def get_node_level(parents, node)
  count = 0
  curr = node
  until curr.nil?
    count += 1
    curr = parents[curr.to_sym]
  end
  count
end

# @param [Hash<String>] parents
# @param [String] node
# @param [Numeric] level
# @return [String]
def get_parents_by_level(parents, node, level)
  p = parents[node.to_sym]
  (1..level).each { |_| p = parents[p.to_sym] }
  p
end

parents = { A: nil,
            B: 'A',
            C: 'A',
            D: 'B',
            E: 'B',
            F: 'C',
            G: 'C' }

puts common_ancestor(parents, 'D', 'G')
puts common_ancestor(parents, 'G', 'D')
puts common_ancestor(parents, 'D', 'E')
puts common_ancestor(parents, 'D', 'C')