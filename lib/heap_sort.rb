require_relative "heap"

class Array
  def heap_sort!
    sorted = []
    heapy = BinaryMinHeap.new
    each do |num|
      heapy.push(num)
    end
    length.times do |i|
      sorted.push(heapy.extract)
      self[i] = sorted[i]
    end
  end
end
