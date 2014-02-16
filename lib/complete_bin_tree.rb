module DataStructure
  class CompleteBinaryTree
    def initialize(*args)
      if args.empty?
        @data = []
      else
        @data = args.to_a
      end
    end
    
    def <<(value)
      @data << value
    end
    
    def root
      @data.first
    end
    
    def left_index(i)
      raise ArgumentError if i < 0
      2 * i + 1
    end
    
    def right_index(i)
      raise ArgumentError if i < 0
      2 * i + 2
    end
    
    def parent_index(i)
      raise ArgumentError if i < 1
      (i + 1) / 2 - 1
    end
    
    def children(i)
      [@data[left_index(i)], @data[right_index(i)]]
    end
    
    def left(i)
      @data[left_index(i)]
    end
    
    def right(i)
      @data[right_index(i)]
    end
    
    def parent(i)
      @data[parent_index(i)]
    end
  end
end