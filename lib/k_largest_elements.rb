require_relative 'heap'

def k_largest_elements(array, k)
  sorted = []
  heapy = BinaryMinHeap.new

    array.each do |num|
      heapy.push(num)
    end
    # p heapy.store
    until heapy.count == 0
      sorted.unshift(heapy.extract)
    end

    sorted[0...k]
end
