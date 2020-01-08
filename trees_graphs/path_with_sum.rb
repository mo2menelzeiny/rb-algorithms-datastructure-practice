# Paths with Sum: You are given a binary tree in which each node contains an integer value (which
# might be positive or negative). Design an algorithm to count the number of paths that sum to a
# given value. The path does not need to start or end at the root or a leaf, but it must go downwards
# (traveling only from parent nodes to child nodes).

# @param [Hash<Array>] tree
# @param [Numeric] target
# @return [Numeric]
def calculate_all_paths(tree, target)
  queue = []
  queue.append(1)
  paths = 0
  sum = 0
  until queue.empty?
    root = queue.shift
    next if tree[root][0] > target

    sum = tree[root][0]
    sub_queue = []
    sub_queue += tree[root][1]
    until sub_queue.empty?
      node = sub_queue.shift
      if tree[node][0] + sum == target
        paths += 1
      elsif tree[node][0] + sum < target && !tree[node][1].empty?
        sum += tree[node][0]
        sub_queue += tree[node][1]
      end
    end
    queue += tree[root][1]
  end
  paths
end


# Tree representation hash map is [value, [left node key, right node key]]
# root is always key 1
tree = { 1 => [1, [2, 3]],
         2 => [2, [4, 5]],
         3 => [1, [6, 7]],
         4 => [1, []],
         5 => [2, []],
         6 => [1, []],
         7 => [1, []] }

puts calculate_all_paths(tree, 3)