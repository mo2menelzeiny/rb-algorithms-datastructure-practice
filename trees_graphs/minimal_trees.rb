# @param [Array] arr
# @param [Hash] graph
# @return [Numeric]
def build_minimal_bst(arr, graph)
  return nil if arr.empty?

  mid = (arr.length / 2)
  root = arr[mid]
  graph[root] = []
  graph[root].append(build_minimal_bst(arr[0...mid], graph))
  graph[root].append(build_minimal_bst(arr[mid + 1...arr.length], graph))
  root
end

arr = [0, 1, 2, 3, 4, 5]
graph = {}
puts build_minimal_bst(arr, graph)