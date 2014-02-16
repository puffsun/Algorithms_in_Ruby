
module Algorithms::Search

  def self.binary_search(ary, val)
    # ary should have been sorted
    mid = ary.size / 2
    if ary[mid] == val
      return mid
    elsif val < ary[mid]
      return binary_search(ary.slice(0...mid))
    else
      return binary_search(ary.slice(mid+1 ... ary.size))
    end
  end

  def self.dfs(source)
    raise ArgumentError unless source
    source.visited = true
    source.adjs.each do |a|
      dfs(a) if !a.visited?
    end
  end

  def self.bfs(source)
    raise ArgumentError unless source
    queue = [source]
    until queue.empty? do
      node = queue.shift
      node.visited = true
      anode.adjs.each do |a|
        unless a.visited?
          a.visited = true
          queue << a
        end
      end
    end
  end

  class TreeNode
    attr_reader :id
    attr_accessor :visited, :adjs

    def initialize(id, adjs=[])
      @visited = false
      @id = id
      @adjs = adjs
    end

    def visited?
      visited
    end
  end
end
