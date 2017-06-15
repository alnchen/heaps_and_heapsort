require_relative "heap"

class Array
  def heap_sort!
    sorted = []
    # heapy = BinaryMinHeap.new
    map do |num|
      # heapy.push(num)
    end
    until heapy.count == 0
      sorted.push(heapy.extract)
    end
    sorted
  end
end
