require_relative "heap"

class Array
  def heap_sort!
    # sorted = []
    heapy = BinaryMinHeap.new
    length.times do
      heapy.push(self.shift)
    end
    until heapy.store.count == 0 do
      self.push(heapy.extract)
      # self.push(sorted[i])
    end
  end
end
