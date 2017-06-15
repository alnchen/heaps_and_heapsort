class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
  end

  def count
  end

  def extract
  end

  def peek
    @store[0]
  end

  def push(val)
  end

  public
  def self.child_indices(len, parent_index)
    # 2i + 1 & 2i + 2
  end

  def self.parent_index(child_index)
    # (i-1)/2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end
