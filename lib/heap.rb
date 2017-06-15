class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    @prc = prc || Proc.new { |el1, el2| el1 <=> el2 }
  end

  def count
    @store.length
  end

  def extract

  end

  def peek
    @store[0]
  end

  def push(val)
    @store << val
    #until parent < val, keep swapping with parent
  end

  public
  def self.child_indices(len, parent_index)
    children = []
    (1..2).each do |i|
      children << ((2 * parent_index) + i)
    end
    children.select {|idx| idx < len}
    # 2i + 1 & 2i + 2

  end

  def self.parent_index(child_index)
    # (i-1)/2
    raise 'root has no parent' if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)

  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end
