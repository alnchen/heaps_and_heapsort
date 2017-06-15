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
    val = @store[0]
    @store[0] = @store[-1]
    @store.pop
    BinaryMinHeap.heapify_down(@store, 0, &prc)
    val
  end

  def peek
    @store[0]
  end

  def push(val)
    @store << val
    #until parent < val, keep swapping with parent
    BinaryMinHeap.heapify_up(@store, @store.length - 1, @prc)
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

    left = child_indices(len, parent_idx)[0]
    right = child_indices(len, parent_idx)[1]

    children = []
    children << array[left] if left
    children << array[right] if right

    if children.all? { |child| prc.call(array[parent_idx], child) <= 0 }
      return array
    end



    #
    # children_idx = BinaryMinHeap.child_indices(len, parent_idx)
    # children = children_idx.map {|idx| array[idx]}

    child_idx = nil
    if children.length == 1
      child_idx = left
    else
      # p 'hit else'
      child_idx = prc.call(children[0], children[1]) < 0 ? left : right
    end

    if prc.call(array[parent_idx], array[child_idx]) <= 0
      return array
    else
      array[parent_idx], array[child_idx] = array[child_idx], array[parent_idx]
    end

    BinaryMinHeap.heapify_down(array, child_idx, len, &prc)

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
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    return array if child_idx == 0

    parent_idx = BinaryMinHeap.parent_index(child_idx)
    child = array[child_idx]
    parent = array[parent_idx]

    if prc.call(parent, child) < 0
      return array
    else
      array[child_idx], array[parent_idx] = array[parent_idx], array[child_idx]
      BinaryMinHeap.heapify_up(array, parent_idx, len, &prc)
    end
  end
end
