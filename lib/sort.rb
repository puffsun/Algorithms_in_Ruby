
module Algorithms::Sort

  def self.bubble_sort(ary)
    raise ArgumentError unless ary
    loop do
      swapped = false
      0.upto(ary.size-2) do |i|
        if ary[i] > ary[i+1]
          ary[i], ary[i+1] = ary[i+1], ary[i]
          swapped = true
        end
      end
      break unless swapped
    end
    ary
  end

  def self.selection_sort(ary)
    raise ArgumentError unless ary
    (ary.size-1).times do |i|
      min_index = i
      (i+1).upto(ary.size-1) do |j|
        min_index = j if ary[j] < ary[min_index]
      end
      ary[i], ary[min_index] = ary[min_index], ary[i]
    end
    ary
  end

  def self.insertion_sort(ary)
    raise ArgumentError unless ary
    for i in 1..ary.size-1 do
      n = i
      while n >= 1 and ary[n] < ary[n-1] do
        ary[n], ary[n-1] = ary[n-1], ary[n]
      end
      n -= 1
    end
    ary
  end

  def self.bucket_sort(ary, n, buckets, m)
    raise ArgumentError unless ary
    for j in 0...m
      buckets[j] = 0
    end
    for i in 0...n
      buckets[ary[i]] += 1
    end
    i = 0
    for j in 0...m
      0.upto(buckets[j]) do
        ary[i] = j
        i += 1
      end
    end
  end

  def self.heap_sort(ary)
    heap_sort!(ary.clone)
  end

  def self.heap_sort!(ary)
    build_max_heap(ary)
    (ary.size - 1).downto(1) do |i|
      ary[0], ary[i] = ary[i], ary[0]
      max_heapify(ary, i, 0)
    end
    ary
  end

  private

  def self.build_max_heap(ary)
    (ary.size/2 - 1).downto(0) do |i|
      max_heapify(ary, ary.size, i)
    end
    ary
  end

  def self.max_heapify(ary, size, i)
    l = 2*i + 1
    r = 2*i + 2
    if l < size and ary[l] > ary[i]
      largest = l
    else
      largest = i
    end

    if r < size and ary[r] > ary[largest]
      largest = r
    end
    if (largest != i)
      ary[i], ary[largest] = ary[largest], ary[i]
      max_heapify(ary, size, largest)
    end
  end

  public

  def self.quick_sort(ary)
    return ary if ary.size < 2
    pivot = ary.pop
    low, high = ary.partition { |e| e < pivot }
    quick_sort(low) + [pivot] + quick_sort(high)
  end

  def self.merge_sort(ary)
    return ary if ary.size < 2
    ary1 = ary.slice!(ary.size/2...ary.size)
    merge(merge_sort(ary), merge_sort(ary1))
  end

  private
  def self.merge(ary1, ary2)
    sorted = []
    until ary1.empty or ary2.empty?
      ary1.first < ary2.first ? sorted << ary1.shift : sorted << ary2.shift
    end
    sorted + ary1 + ary2
  end
end
