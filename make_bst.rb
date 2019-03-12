# frozen_string_literal: true

require './btree_node.rb'

def make_bst(arr)
  make_bst_helper(arr, 0, arr.size - 1)
end

def make_bst_helper(arr, start, last)
  return nil if start > last

  mid = (start + last) / 2
  node = BtreeNode.new
  node.value = arr[mid]
  node.left = make_bst_helper(arr, start, mid - 1)
  node.right = make_bst_helper(arr, mid + 1, last)

  node
end

arr = [2, 4, 6, 8, 10, 20]

p make_bst(arr)
