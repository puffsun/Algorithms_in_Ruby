module DataStructure
  class Heap < CompleteBinaryTree
    attr_accessor :data
    
    def initialize(*args, &block)
      if block_given?
        @relation = block
      else
        @relation = Proc.new {|parent, children| parent >= children}
      end
    end
    
    def self.max_heap(*args)
      new(*args) {|p, c| p >= c}
    end
    
    def self.min_heap(*args)
      new(*args) {|p, c| p <= c}
    end
    
    def relation(parent, child)
      @relation.call(@data[parent], @data[child])
    end
    
    def heapify!
      (@data.size/2).downto(0) do |i|
        heapify(i)
      end
    end
    
    def heapify(i)
      left = left_index(i)
      left = nil if left >= @data.size
      
      right = right_index(i)
      right = nil if right >= @data.size
      
      largest = [i, left, right].compact.sort{|x, y| relation(x, y) ? -1 : 1}.first
      if largest != i
        @data[i], @data[largest] = @data[largest], @data[i]
        heapify(largest)
      end
    end
    
    def shift
      if @data.size > 0
        result = @data.shift
        return result if @data.size.zero?
        @data.unshift(@data.pop)
        heapify(0)
      end
    end
    
    def insert(value)
      @data.push(value)
      child = @data.size - 1
      parent = parent_index(child)
      
      while parent >= 0 and !relation(parent, child)
        @data[child], @data[parent] = @data[parent], @data[child]
        child = parent
        parent = parent_index(child)
      end
      self
    end
    
    def length
      @data.size
    end
    
    alias :size :length
    
    def empty?
      @data.empty?
    end
    
    def to_a
      @data
    end
  end
end