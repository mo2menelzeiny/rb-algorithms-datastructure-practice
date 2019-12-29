# @param [Array<String>] projs
# @param [Array<Array>] deps
# @return [Hash<Array>] graph
def build_graph(projs, deps)
  # @type [Hash<Array>] graph
  graph = {}
  projs.each do |p|
    graph[p] = []
    deps.each do |d|
      graph[p].push(d[0]) if d[1] == p
    end
  end
  graph
end

# @param [Array<String>] projs
# @param [Array<Array>] deps
# @return [Array] output
def build_order(projs, deps)
  graph = build_graph(projs, deps)
  output = []
  while output.length != projs.length
    projs.each do |p|
      next if output.include?(p)

      dps = graph[p]
      if dps.empty?
        output.push(p)
      else
        full = false
        dps.each do |dp|
          full = output.include?(dp)
        end
        output.push(p) if full
      end
    end
  end
  output
end

projects = %w[A B C D E F]
dependencies = [%w[A D], %w[F B], %w[B D], %w[F A], %w[D C]]

puts "\n" + build_order(projects, dependencies).to_s
projects = %w[A B C D E F G]
dependencies = [%w[F A], %w[F B], %w[F C], %w[A E], %w[C A], %w[B A], %w[D G], %w[B E]]

puts "\n" + build_order(projects, dependencies).to_s
