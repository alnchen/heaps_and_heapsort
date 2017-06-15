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
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    parent = array[parent_idx]

    children_idx = BinaryMinHeap.child_indices(len, parent_idx)
    children = children_idx.map {|idx| array[idx]}

    # child_idx = nil
    if children.length == 1
      child_idx = children_idx[0]
    else
      child_idx = prc.call(children[0], children[1]) < 0 ? children_idx[0] : children_idx[1]
    end

    if prc.call(array[parent_idx], array[child_idx])

    # array.each_with_index do |el, idx|
    #     child_indices = BinaryMinHeap.child_indices(len, idx)
    #     # child_indices.each do |child_idx|
    #     #   if prc.call(array[idx], array[child_idx]) > 0
    #     #     array[idx], array[child_idx] = array[child_idx], array[idx]
    #     #   end
    #     # end
    #     if child_indices.length == 1
    #       if prc.call(array[idx], array[child_indices[0]]) > 0
    #         array[idx], array[child_indices[0]] = array[child_indices[0]], array[idx]
    #       end
    #     else
    #       lower_val_idx = prc.call(array[child_indices[0]], array[child_indices[1]]) <= 0 ? child_indices[0] : child_indices[1]
    #       if prc.call(array[idx], array[lower_val_idx]) > 0
    #         array[idx], array[lower_val_idx] = array[lower_val_idx], array[idx]
    #       end
    #     end
    # end
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)

  end
end
